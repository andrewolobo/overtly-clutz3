using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Controllers;
using TargetPay.Payment;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{

    public class TargetPayController : BaseController
    {

        //
        // GET: /TargetPay/

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(Guid id)
        {

            var user = db.Users.Find(id);
            var returnUrl = Session["ReturnUrl"] as string;
            if (string.IsNullOrWhiteSpace(returnUrl))
            {
                //return RedirectToAction("Index", "Home");
                var defaultReturnUrl = ReadAppSetting("ReturnUrl");
                returnUrl = defaultReturnUrl;
            }
            if (user != null)
            {
                //remove not paid products for this user
                var invoices =
                    db.Invoices.Where(row => (row.TransactionId == null || (row.Paid??false)) && row.UserId == user.Id);
                foreach (var p in invoices)
                {
                    db.Invoices.Remove(p);
                }
                db.SaveChanges();

                var clickAmountStrings = ConfigurationManager.AppSettings["ClickAmounts"];
                var clickAmounts = clickAmountStrings.Split(',');
                var clickPrice = ConfigurationManager.AppSettings["ClickPrice"];

                ViewBag.ClickAmounts = clickAmounts;
                ViewBag.ClickPrice = clickPrice;

                ViewBag.IdealBanks = GetBanks();

                ViewBag.UserId = user.Id;

                ViewBag.NoHeader = true;
            }
            else
            {
                if (!String.IsNullOrWhiteSpace(returnUrl))
                    return Redirect(returnUrl);
            }
            return View();
        }

        public ActionResult PayProduct(Guid licenseTypeId, Guid userId, string returnUrl)
        {
            var contract = db.Contracts.SingleOrDefault(row => row.ContractTypeId == licenseTypeId);
            Session["ReturnUrl"] = returnUrl;
            var newUserContract = new UserContract()
            {
                Id = Guid.NewGuid(),
                ContractId = contract.Id,
                UserId = userId,
                StartDate = DateTime.Now,
                EndDate = DateTime.Now.AddYears(-1),
                Name = contract.Name
            };
            db.UserContracts.Add(newUserContract);
            db.SaveChanges();

            return RedirectToAction("Index", new { licenseId = newUserContract.Id }); //check if UserContract.Id is still needed
        }

        public ActionResult RenewProduct(Guid userContractId, Guid userId, string returnUrl)
        {
            var usertContract = db.UserContracts.SingleOrDefault(row => row.Id == userContractId && row.UserId == userId);
            Session["ReturnUrl"] = returnUrl;
            if (usertContract != null)
            {
                usertContract.StartDate = DateTime.Now;
                usertContract.EndDate = DateTime.Now.AddYears(-1);
                db.SaveChanges();
            }

            return RedirectToAction("Index", new { licenseId = userContractId }); //check if userContractId is still needed
        }


        public ActionResult Pay(FormCollection collection)
        {
            var userId = collection.GetValue("UserId").AttemptedValue;
            var user = db.Users.Find(new Guid(userId));

            //var targetPayId = Session["TargetPayId"] as string;
            var targetPayId = ConfigurationManager.AppSettings["TargetPayId"];
            if (string.IsNullOrWhiteSpace(targetPayId))
            {
                //Session["TargetPayId"] = product.LicenseType.Application.Description;
            }


            var bankId = collection.GetValue("BankId").AttemptedValue;
            var clickAmounts = collection.GetValue("ClickAmounts").AttemptedValue;
            var clickPrice = collection.GetValue("ClickPrice").AttemptedValue;

            var amount = decimal.Parse(clickAmounts)*decimal.Parse(clickPrice);

            var translation = TranslationDictionary;
            try
            {
                var transactionId = StartPayment(amount, string.Format("QRedits for {0}".TranslateString(ref translation), user.FullName), bankId);
                var invoice = new Invoice()
                {
                    Id = Guid.NewGuid(),
                    Date = DateTime.Now,
                    Amount = amount,
                    TransactionId = transactionId,
                    UserId = user.Id,
                    Number = int.Parse(DateTime.Now.ToString("yyMMddhhmm")),
                    Quantity = int.Parse(clickAmounts),
                    VAT = amount * 21 / 121

                };
                db.Invoices.Add(invoice);
                db.SaveChanges();

                //var returnUrl = Session["ReturnUrl"] as string;
                //if (!String.IsNullOrWhiteSpace(returnUrl))
                //    return Redirect(returnUrl);
                return RedirectToAction("Index", "Home");
            }
            catch (Exception ex)
            {
                return RedirectToAction("PaymentDone",new {error=ex.Message});
                
            }


        }

        public ActionResult IdealCheckHandler(string transaction_id)
        {
            try
            {
                var result = Handle(transaction_id);
                if (result)
                {
                    var userContract = db.UserContracts.SingleOrDefault(row => row.TransactionId == transaction_id);
                    if (userContract != null)
                    {
                        userContract.StartDate = DateTime.Now;
                        userContract.EndDate = userContract.StartDate.AddYears(1);
                        db.SaveChanges();
                    }
                }

            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            return null;
        }

        public ActionResult PaymentDone(string trxid, string error, string ec)
        {
            try
            {
                if (!string.IsNullOrEmpty(error))
                {
                    ViewBag.ErrorMessage = error;
                    return View();
                }
                var result = Handle(trxid);
                if (result)
                {
                    var invoice = db.Invoices.SingleOrDefault(row => row.TransactionId == trxid);
                    if (invoice != null)
                    {
                        var user = db.Users.Find(invoice.UserId);
                        var userPassword = Session["UserPassword"] as UserPassword;
                        user.Credit = (user.Credit??0) + invoice.Quantity;
                        invoice.Paid = true;
                        db.SaveChanges();

                        var siteEmail = ReadAppSetting("SiteEmailAddress");

                        var translation = TranslationDictionary;
                        ClientTools.SendProductOrderedMail(Session["Language"] as string, userPassword.Id,invoice.Id);

                    }
                    //Send E-mail utility needs to be implemented
                    //ClientTools.SendProductOrderedMail(product.UserId, product.Id);
                }
                else
                {
                    ViewBag.ErrorMessage = ec??"Betaling niet vooltooid";
                }
                //var returnUrl = Session["ReturnUrl"] as string;
                //if (!String.IsNullOrWhiteSpace(returnUrl))
                //    return Redirect(returnUrl);

            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            //ViewBag.NoHeader = true;
            return View();
        }

        ///
        /// This is implemented in the BaseController
        /// 
        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}



        #region TargetPay
        private Dictionary<string, string> GetBanks()
        {
            //Retrieve the banks that support iDEAL (in testmode)
            IdealBanks idealBanks = new IdealBanks();

            //Populate the dropdownlist.
            return idealBanks.Banks.ToDictionary(row => row.Name, row => row.Id);
        }

        private string StartPayment(decimal amount, string description, string bankId)
        {
            //var targetPayId = Session["TargetPayId"] as string;
            var targetPayId = ConfigurationManager.AppSettings["TargetPayId"];
            var targetPayReturn = ConfigurationManager.AppSettings["TargetPayReturn"];
            //Refer the customer to the iDEAL environment of the selected bank.
            IdealStart idealStart = new IdealStart(targetPayId, bankId, amount * 100, description, targetPayReturn);
            if (idealStart.IsOk)
            {
                this.Response.Redirect(idealStart.Url, true);
            }
            else
            {
                //show error
                var error = "Error code: " + idealStart.Error.Code + ", message: " + idealStart.Error.Message;
                throw new Exception(error);
            }

            return idealStart.TransactionId;
        }


        private bool Handle(string transactionId)
        {
            var targetPayId = ConfigurationManager.AppSettings["TargetPayId"];
            //var targetPayId = Session["TargetPayId"] as string;
            var targetPayReturn = ConfigurationManager.AppSettings["TargetPayReturn"];
            //Check the payment (in testmode)
            IdealCheck idealCheck = new IdealCheck(targetPayId, transactionId);

            if (!idealCheck.IsOk)
            {
                //show error
                var error = "Error code: " + idealCheck.Error.Code + ", message: " + idealCheck.Error.Message;
                throw new Exception(error);

            }
            if (idealCheck.Payed)
            {
                /*************
                 * Payment succeeded, handle appropriately
                 ************/
                return true;
            }
            return false;
        }


        #endregion



    }
    
    public class TargetPayOldController : BaseController
    {

        //
        // GET: /TargetPay/

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Index(Guid LicenseId)
        {

            var userContract = db.UserContracts.SingleOrDefault(row=> row.Id == LicenseId);
            var returnUrl = Session["ReturnUrl"] as string;
            if (string.IsNullOrWhiteSpace(returnUrl))
            {
                //return RedirectToAction("Index", "Home");
                var defaultReturnUrl = ReadAppSetting("ReturnUrl");
                returnUrl = defaultReturnUrl;
                Session["ReturnUrl"] = returnUrl;
            }
            if (userContract != null)
            {
                //remove not paid products for this user
                var userContracts =
                    db.UserContracts.Where(row => (row.TransactionId == null) && row.UserId == userContract.UserId && row.Id != userContract.Id);
                foreach (var p in userContracts)
                {
                    db.UserContracts.Remove(p);
                }
                db.SaveChanges();

                ViewBag.Amount = userContract.Contract.Price;

                if (!userContract.Contract.Price.HasValue)
                {
                    userContract.StartDate = DateTime.Now;
                    userContract.EndDate = userContract.StartDate.AddYears(1);
                    userContract.TransactionId = userContract.StartDate.ToString();
                    db.SaveChanges();
                    //if (!String.IsNullOrWhiteSpace(returnUrl))
                        return Redirect(returnUrl);
                }

                ViewBag.IdealBanks = GetBanks();

                ViewBag.ProductId = userContract.Id;

                ViewBag.NoHeader = true;
            }
            else
            {
                if (!String.IsNullOrWhiteSpace(returnUrl))
                    return Redirect(returnUrl);                
            }
            return View();
        }

        public ActionResult PayProduct(Guid licenseTypeId, Guid userId, string returnUrl)
        {
            var contract = db.Contracts.SingleOrDefault(row => row.ContractTypeId == licenseTypeId);
            Session["ReturnUrl"] = returnUrl;
            var newUserContract = new UserContract()
            {
                Id = Guid.NewGuid(),
                ContractId = contract.Id,
                UserId = userId,
                StartDate =  DateTime.Now,
                EndDate =  DateTime.Now.AddYears(-1),
                Name =  contract.Name
            };
            db.UserContracts.Add(newUserContract);
            db.SaveChanges();

            return RedirectToAction("Index", new { licenseId = newUserContract.Id }); //check if UserContract.Id is still needed
        }

        public ActionResult RenewProduct(Guid userContractId, Guid userId, string returnUrl)
        {
            var usertContract = db.UserContracts.SingleOrDefault(row => row.Id == userContractId && row.UserId == userId);
            Session["ReturnUrl"] = returnUrl;
            if (usertContract != null)
            {
                usertContract.StartDate = DateTime.Now;
                usertContract.EndDate = DateTime.Now.AddYears(-1);
                db.SaveChanges();
            }

            return RedirectToAction("Index", new { licenseId = userContractId }); //check if userContractId is still needed
        }


        public ActionResult Pay(FormCollection collection)
        {
            var userContractId = collection.GetValue("ProductId").AttemptedValue;
            var userContract = db.UserContracts.SingleOrDefault(row => row.Id == new Guid(userContractId));

            //var targetPayId = Session["TargetPayId"] as string;
            var targetPayId = ConfigurationManager.AppSettings["TargetPayId"];
            if (string.IsNullOrWhiteSpace(targetPayId))
            {
                //Session["TargetPayId"] = product.LicenseType.Application.Description;
            }

            
            var bankId = collection.GetValue("BankId").AttemptedValue;
            var amount = collection.GetValue("Amount").AttemptedValue;
            var transactionId = StartPayment(decimal.Parse(amount), string.Format("Aankoop {0} licentie", userContract.Contract.Name), bankId);

            if (userContract != null)
            {
                userContract.TransactionId = transactionId;
                db.SaveChanges();
            }

            //var returnUrl = Session["ReturnUrl"] as string;
            //if (!String.IsNullOrWhiteSpace(returnUrl))
            //    return Redirect(returnUrl);
            return RedirectToAction("Index", "Home");

        }

        public ActionResult IdealCheckHandler(string transaction_id)
        {
            try
            {
                var result = Handle(transaction_id);
                if (result)
                {
                    var userContract = db.UserContracts.SingleOrDefault(row => row.TransactionId == transaction_id);
                    if (userContract != null)
                    {
                        userContract.StartDate = DateTime.Now;
                        userContract.EndDate = userContract.StartDate.AddYears(1);
                        db.SaveChanges();
                    }
                }

            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            return null;
        }

        public ActionResult PaymentDone(string trxid, string ec = null)
        {
            try
            {
                var result = Handle(trxid);
                if (result)
                {
                    var userContract = db.UserContracts.SingleOrDefault(row => row.TransactionId == trxid);
                    if (userContract != null)
                    {
                        userContract.StartDate = DateTime.Now;
                        userContract.EndDate = userContract.StartDate.AddYears(1);
                        var price = userContract.Contract.Price ?? 0;
                        decimal vat = 19;

                        var invoice = new Invoice()
                        {
                            Id = new Guid(),
                            UserId = userContract.UserId,
                            Date = DateTime.Now,
                            Amount = price,
                            VAT = vat,
                        };
                        db.Invoices.Add(invoice);

                        var invoiceLine = new InvoiceLine()
                        {
                            InvoiceId = invoice.Id,
                            UserContractId = userContract.Id,
                            Amount = price,
                            VAT = vat,
                        };
                        db.InvoiceLines.Add(invoiceLine);
                        var siteEmail = ReadAppSetting("SiteEmailAddress");
                        db.SaveChanges();

                        ClientTools.SendProductOrderedMail(Session["Language"] as string, userContract.UserId, invoice.Id);

                    }
                    //Send E-mail utility needs to be implemented
                    //ClientTools.SendProductOrderedMail(product.UserId, product.Id);
                }
                else
                {
                    ViewBag.ErrorMessage = "Betaling niet vooltooid";
                }
                //var returnUrl = Session["ReturnUrl"] as string;
                //if (!String.IsNullOrWhiteSpace(returnUrl))
                //    return Redirect(returnUrl);

            }
            catch (Exception ex)
            {
                ViewBag.ErrorMessage = ex.Message;
            }
            ViewBag.NoHeader = true;
            return View();
        }

        ///
        /// This is implemented in the BaseController
        /// 
        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}


        
        #region TargetPay
        private Dictionary<string, string> GetBanks()
        {
            //Retrieve the banks that support iDEAL (in testmode)
            IdealBanks idealBanks = new IdealBanks();

            //Populate the dropdownlist.
            return idealBanks.Banks.ToDictionary(row => row.Name, row => row.Id);
        }

        private string StartPayment(decimal amount, string description, string bankId)
        {
            //var targetPayId = Session["TargetPayId"] as string;
            var targetPayId = ConfigurationManager.AppSettings["TargetPayId"];
            var targetPayReturn = ConfigurationManager.AppSettings["TargetPayReturn"];
            //Refer the customer to the iDEAL environment of the selected bank.
            IdealStart idealStart = new IdealStart(targetPayId, bankId, amount*100, description, targetPayReturn);
            if (idealStart.IsOk)
            {
                this.Response.Redirect(idealStart.Url, true);
            }
            else
            {
                //show error
                var error = "Error code: " + idealStart.Error.Code + ", message: " + idealStart.Error.Message;
                throw new Exception(error);
            }

            return idealStart.TransactionId;
        }


        private bool Handle(string transactionId)
        {
            var targetPayId = ConfigurationManager.AppSettings["TargetPayId"];
            //var targetPayId = Session["TargetPayId"] as string;
            var targetPayReturn = ConfigurationManager.AppSettings["TargetPayReturn"];
            //Check the payment (in testmode)
            IdealCheck idealCheck = new IdealCheck(targetPayId, transactionId);

            if (!idealCheck.IsOk)
            {
                //show error
                var error = "Error code: " + idealCheck.Error.Code + ", message: " + idealCheck.Error.Message;
                throw new Exception(error);
                
            }
            if (idealCheck.Payed)
            {
                /*************
                 * Payment succeeded, handle appropriately
                 ************/
                return true;
            }
            return false;
        }


        #endregion

    

    }
}
