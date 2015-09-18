using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Drawing;
using System.Linq;
using System.Web.Mvc;
using Kendo.Mvc.Extensions;
using Tag4s.Data;
using Tag4s.Filters;
using Tag4s.Helpers;
using System.Data.Objects;
using System.Data.Entity.Validation;
using Tag4s.Models;
using Tag4s.ViewModel;

namespace Tag4s.Controllers
{
    [HandleError]
    //[Authorize]
    [AllowAnonymous]
    public class HomeController : BaseController
    {
        [AuthorizationFilter(Roles = "Administrator,Backdoor,Klant,Reseller,Beheerder,Afdeling")]
        public ActionResult Index(Guid? id)
        {
            if (User!=null && User.IsKlant) return RedirectToAction("Dashboard");

            if (!id.HasValue)
            {
                if (User != null)
                {
                    id = User.Id;
                }
            }
            var translation = TranslationDictionary;
            if (id.HasValue)
            {
                ViewBag.NumberOfAdministrators = string.Format("{0} administrators".TranslateString(ref translation),
                    db.Users.Where(u => u.UserRole.Name.Equals("Administrator")).Count());
                ViewBag.NumberOfResellers = string.Format("{0} resellers".TranslateString(ref translation),
                    db.Users.Where(u => u.UserRole.Name.Equals("Reseller")).Count());
                ViewBag.NumberOfOwnCustomers = string.Format("{0} own customers".TranslateString(ref translation),
                    db.Users.Where(u => u.UserRole.Name.Equals("Klant") && u.User2.Id.Equals(id.Value)).Count());
                ViewBag.NumberOfCustomers = string.Format("{0} customers".TranslateString(ref translation),
                    db.Users.Where(u => u.UserRole.Name.Equals("Klant")).Count());
                ViewBag.NumberOfDepartments = string.Format("{0} departments".TranslateString(ref translation),
                    db.Users.Where(u => u.UserRole.Name.Equals("Afdeling")&& u.User2.Id.Equals(id.Value)).Count());
                ViewBag.NumberOfActiveContracts = string.Format("{0} QR codes".TranslateString(ref translation),
                    db.UserContracts.Where(c => c.UserId == User.Id).Count());

            }

            ViewBag.Message = "Welkom bij TagForce";
            return View();
        }

        [AuthorizationFilter(Roles = "Administrator,Backdoor,Klant,Reseller,Beheerder,Afdeling")]
        public ActionResult Lookups()
        {
            ViewBag.Message = "Welkom bij TagForce";

            return View();
        }

        [AuthorizationFilter(Roles = "Administrator,Backdoor,Klant,Reseller,Beheerder,Afdeling")]
        public ActionResult Statistics()
        {
            ViewBag.Message = "Welkom bij TagForce";

            return View();
        }

        [AuthorizationFilter(Roles = "Administrator,Backdoor,Klant,Reseller,Beheerder,Afdeling")]
        public ActionResult About()
        {
            return View();
        }

        //[AllowAnonymous]
        //public ActionResult ResetPassword()
        //{
        //    return View();
        //}

        //[AllowAnonymous]
        //[HttpPost]
        //public ActionResult ResetPassword(FormCollection collection)
        //{
        //    //string oldPass = collection["oPass"];
        //    //string newPass = collection["nPass"];
        //    //string newPassConfirm = collection["nPassConfirm"];
        //    //ServiceUser currentUser = Session["userInfo"] as ServiceUser;
        //    //string sourceSite = Request.ServerVariables["SERVER_NAME"];


        //    //if (newPass == newPassConfirm)
        //    //{
        //    //    using (var ssoService = new SsoClient())
        //    //    {
        //    //        try
        //    //        {
        //    //            var returnUser = ssoService.ResetPassword(currentUser.License, currentUser.UserName, sourceSite,
        //    //                oldPass, newPass);
        //    //            Utilities.SessionUserUpdate(Session, returnUser);
        //    //            if (string.IsNullOrWhiteSpace(currentUser.EmailAddress))
        //    //            {
        //    //                return RedirectToAction("UpdateSso", "Home");
        //    //            }
        //    //            else
        //    //            {
        //    //                return RedirectToAction("Index", "Home");
        //    //            }
        //    //        }
        //    //        finally
        //    //        {
        //    //            ssoService.Close();
        //    //        }
        //    //    }
        //    //}
        //    //else
        //    //{
        //    //    return View();
        //    //}
        //    return View("Index");
        //}

        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult ForgotPassword(FormCollection collection)
        {
            string userName = collection["nUser"];
            string eMail = collection["eAdd"];
            //string sourceSite = Request.ServerVariables["SERVER_NAME"];
            var isValid = true;
            if (string.IsNullOrEmpty(userName))
            {
                ModelState.AddModelError("nUser", "!");
                isValid = false;
            }
            if (string.IsNullOrEmpty(eMail))
            {
                ModelState.AddModelError("eAdd", "!");
                isValid = false;
            }

            if (!isValid)
            {
                return View();
            }
            
            var userPassword = db.UserPasswords.SingleOrDefault(row => row.UserName == userName && row.EmailAddress == eMail);
            if (userPassword == null)
            {
                isValid = false;
                var translation = TranslationDictionary;
                ViewBag.ForgotPasswordErrMessage = "Invalid user name or email address!".TranslateString(ref translation);
            }

            if (!isValid)
            {
                return View();
            }

            userPassword.Password = Utilities.GetRandomSalt(8);
            userPassword.IsReset = true;
            db.SaveChanges();

            ClientTools.SendConfirmationMail(Session["Language"] as string, userPassword.Id);

            ViewBag.ForgotPasswordErrMessage = "";
            return RedirectToAction("LogIn");
        }

        [AllowAnonymous]
        public ActionResult ForgotPasswordLanding()
        {
            return View();
        }


        [AllowAnonymous]
        public ActionResult LogIn()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult LogIn(FormCollection collection)
        {
            string userName = collection["UserName"];
            string password = collection["Password"];
            // string licenseName = collection["License"];
            //string sourceSite = Request.ServerVariables["SERVER_NAME"];


            var errMsg = new ErrorMessage(string.Empty);

            var userPassword =
                db.UserPasswords.SingleOrDefault(row => (row.Password == password) && (row.UserName == userName) && !(row.IsDisabled??false));
            if (userPassword != null)
            {
                Utilities.SessionUserUpdate(Session, userPassword.User);
                Session.Replace("AuthenticatedUser", userPassword.User);
                Session.Replace("AuthenticatedRoles", new List<UserRole>() {userPassword.User.UserRole});
                Session["AuthenticatedRolesSelected"] = userPassword.User.UserRole;
                Session["IsAccountAdmin"] = userPassword.IsAccountAdmin as bool?;
                Session.Replace("UserPassword", userPassword);

                foreach (var userContract in userPassword.User.UserContracts)
                {
                    userContract.Pay();
                }
                try
                {
                    db.SaveChanges();
                }
                catch (DbEntityValidationException ex)
                {
                }

                if (userPassword.IsReset == true)
                {
                    return RedirectToAction("PassResetForm", "Home", userPassword);
                }
            }
            else
            {
                //db.TranslationDictionary(Session["Language"] as string).SafeValue("Login failed!", "!!!Login failed!");
                errMsg.Value = "!!! Login Failed!";
                Session.Replace(ErrorMessage.Name, errMsg);
                return View();
            }

            return RedirectToAction("Index", "Home");
        }

        [AuthorizationFilter(Roles = "Administrator,Backdoor,Klant,Reseller,Beheerder,Afdeling")]
        public ActionResult PassResetForm(UserPassword userPassword)
        {
            return View(userPassword);
        }

        [HttpPost]
        [AuthorizationFilter(Roles = "Administrator,Backdoor,Klant,Reseller,Beheerder,Afdeling")]
        public ActionResult PassResetForm(UserPassword userPassword, FormCollection collection)
        {
            //if (ModelState.IsValid)
            //{
                string newPass = collection["nPass"];
                string newPassConfirm = collection["nPassConfirm"];

                if (newPass == newPassConfirm)
                {
                    userPassword.Password = newPass;
                    userPassword.IsReset = false;
                    db.Entry(userPassword).State = EntityState.Modified;
                    try
                    {
                        db.SaveChanges();
                    }
                    catch (Exception e)
                    {
                        throw e;
                    }
                    return RedirectToAction("Index", "Home");
                }
            //}

            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        public ActionResult LogOff()
        {
            Session.Clear();
            return RedirectToAction("Index");
        }

        [AllowAnonymous]
        public ActionResult Register()
        {
            var defaultContractId = ReadAppSetting("DefaultContractId");
            if (string.IsNullOrWhiteSpace(defaultContractId))
            {
                return RedirectToAction("Index", "Home");
            }
            var contractId = new Guid(defaultContractId);
            var contract = db.Contracts.SingleOrDefault(row => row.Id.Equals(contractId));

            var defaultResellerId = ReadAppSetting("DefaultResellerId");
            if (string.IsNullOrWhiteSpace(defaultResellerId))
            {
                return RedirectToAction("Index", "Home");
            }
            var resellerId = new Guid(defaultResellerId);
            var reseller = db.Users.SingleOrDefault(row => row.Id.Equals(resellerId));

            var user = new User();
            var userContract = new UserContract();

            user.Id = Guid.NewGuid();
            user.UserRole = db.UserRoles.SingleOrDefault(row => row.Name.Equals("Klant"));
            user.ReselerId = resellerId;
            user.eId = Utilities.GetRandomSalt(5);

            userContract.Id = Guid.NewGuid();
            userContract.eId = Utilities.GetRandomSalt(6);
            userContract.UserId = user.Id;
            userContract.User = user;
            userContract.User.UserRoleId = user.UserRole.Id;
            userContract.User.UserRole = user.UserRole;
            userContract.Contract = contract;
            userContract.ContractId = userContract.Contract.Id;
            userContract.Actief = true;
            userContract.StartDate = DateTime.Now;
            userContract.EndDate = DateTime.Now.AddMonths(1);
            userContract.Name = userContract.Contract.Name;


            return View(userContract);
        }

        [AllowAnonymous]
        [HttpPost]
        public ActionResult Register(FormCollection collection, UserContract userContract)
        {
            try
            {
                var translation = TranslationDictionary;
                if (!ModelState.IsValid)
                {
                    return View(userContract);
                }

                var valid = true;
                if (collection["Password"] != collection["PasswordConfirm"] || string.IsNullOrEmpty(collection["Password"]))
                {
                    ModelState.AddModelError("User.UserPassword.Password", "!");
                    valid = false;
                }

                //if (string.IsNullOrEmpty(collection["UserName"]))
                //{
                //    ModelState.AddModelError("User.UserPassword.UserName", "!");
                //    valid = false;
                //}

                if (string.IsNullOrEmpty(userContract.User.Firstname))
                {
                    ModelState.AddModelError("User.FirstName", "!");
                    valid = false;
                }

                if (string.IsNullOrEmpty(userContract.User.Lastname))
                {
                    ModelState.AddModelError("User.LastName", "!");
                    valid = false;
                }

                if (string.IsNullOrEmpty(userContract.User.EmailAddress))
                {
                    ModelState.AddModelError("User.EmailAddress", "!");
                    valid = false;
                }

                if (string.IsNullOrEmpty(userContract.Uri))
                {
                    ModelState.AddModelError("Uri", "!");
                    valid = false;
                }

                if (!valid)
                    return View(userContract);

                if (userContract.Contract == null)
                {
                    var contract = db.Contracts.SingleOrDefault(row => row.Id.Equals(userContract.ContractId));
                    userContract.Contract = contract;
                }


                if (!userContract.eId.HasValue())
                {
                    userContract.eId = Utilities.GetRandomSalt(5);
                }
                if (userContract.User.UserRole == null)
                {
                    var role = db.UserRoles.SingleOrDefault(row => row.Id.Equals(userContract.User.UserRoleId));
                    userContract.User.UserRole = role;
                }

                var password = collection["Password"];
                var userName = userContract.User.EmailAddress;//collection["UserName"];
                var userPassword = db.UserPasswords.SingleOrDefault(row => row.UserName == userName);
                if (userPassword != null)
                {
                    ModelState.AddModelError("","User already exists".TranslateString(ref translation));
                    return View();
                }
                userPassword = new UserPassword()
                {
                    Id = Guid.NewGuid(),
                    Password = password,
                    UserName = userContract.User.EmailAddress,//userName,
                    FullName = userContract.User.ContactFullName,
                    UserId = userContract.UserId,
                    IsAccountAdmin = true,
                    IsReset = false,
                    EmailAddress = userContract.User.EmailAddress
                };
                userContract.User.UserPasswords.Add(userPassword);

                if (userContract.Id == Guid.Empty)
                {
                    userContract.Id = Guid.NewGuid();
                }
                db.UserContracts.Add(userContract);
                db.SaveChanges();
                db.UserContracts.Remove(userContract);
                db.SaveChanges();
                ClientTools.SendUserRegisteredMail("NL", userPassword.Id);

                return RedirectToAction("LogIn");
            }
            catch (DbEntityValidationException ex)
            {
                ModelState.AddModelError("", ex);
                return View(userContract);
                throw ex;
            }
        }

        //private string GenerateRandomString(int length)
        //{
        //    string strchar = "abcdefghijklmnopqrstuvwxyz0123456789#+@&$ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        //    string str = "";
        //    Random rnd = new Random();
        //    for (int i = 0; i < length; i++)
        //    {
        //        int iRandom = rnd.Next(0, strchar.Length - 1);
        //        str += strchar.Substring(iRandom, 1);
        //    }
        //    return str;
        //}

        [AuthorizationFilter(Roles = "Administrator")]
        public ActionResult Resellers(Guid? userId)
        {
            if (userId == null)
            {
                if (User != null)
                {
                    userId = User.Id;
                }
            }

            var resellers = db.Users.Include("User1").Where(u => u.UserRole.Name.Equals("Reseller"));

            var model = new AdministratorModel
            {
                Resellers = resellers,
            };
            ViewBag.OwnerId = userId;

            return View(model);
        }

        [AuthorizationFilter(Roles = "Administrator")]
        public ActionResult Administrators(Guid? userId)
        {
            if (userId == null)
            {
                if (User != null)
                {
                    userId = User.Id;
                }
            }

            var administrators = db.Users.Include("User1").Where(u => u.UserRole.Name.Equals("Administrator"));

            var model = new AdministratorModel
            {
                Administrators = administrators,
            };
            ViewBag.OwnerId = userId;

            return View(model);
        }


        [AuthorizationFilter(Roles = "Administrator,Reseller")]
        public ActionResult OwnCustomers(Guid? userId)
        {
            if (userId == null)
            {
                if (User != null)
                {
                    userId = User.Id;
                }
            }

            var customers =
                db.Users.Where(u => u.UserRole.Name.Equals("Klant") && u.User2.Id.Equals(userId.Value));

            var model = new AdministratorModel
            {
                Customers = customers,
            };
            ViewBag.OwnerId = userId;

            return View("Customers", model);
        }

        [AuthorizationFilter(Roles = "Administrator,Reseller")]
        public ActionResult Customers(Guid? userId)
        {
            var customers = db.Users.Include("User1").Where(u => u.UserRole.Name.Equals("Klant"));

            var model = new AdministratorModel
            {
                Customers = customers,
            };
            ViewBag.OwnerId = userId;
            ViewBag.Action = "Customers";
            ViewBag.Controller = "Administrator";
            return View(model);
        }

        [AuthorizationFilter(Roles = "Administrator,Reseller,Afdeling")]
        public ActionResult Departments(Guid? userId)
        {
            var departments = db.Users.Include("User1").Where(u => u.UserRole.Name.Equals("Afdeling") && u.User2.Id.Equals(userId.Value));

            var model = new AdministratorModel
            {
                Departments = departments,
            };
            ViewBag.OwnerId = userId;
            ViewBag.Action = "Customers";
            ViewBag.Controller = "Administrator";
            return View(model);
        }

        [AuthorizationFilter(Roles = "Administrator,Reseller")]
        public ActionResult Search(SearchModel model = null)
        {
            if (model == null)
            {
                model = new SearchModel();
            }

            return View(model);
        }

        [HttpPost, ActionName("Search")]
        [AuthorizationFilter(Roles = "Administrator,Reseller")]
        public ActionResult SearchResult(SearchModel model)
        {
            var translation = TranslationDictionary;
            if (ModelState.IsValid)
            {
                model.SearchResults = new List<SearchInfo>();

                var userSearchList =
                    User.User1.ToList().Where(
                        row =>
                            (row.Firstname??"").Contains(model.SearchText) || (row.EmailAddress??"").Contains(model.SearchText) ||
                            (row.Lastname??"").Contains(model.SearchText) ||
                            row.eId.Contains(model.SearchText));
                foreach (var user in userSearchList)
                {
                    var newSearchInfo = new SearchInfo()
                    {
                        Id = user.Id,
                        Display = string.Format("Customer {0}".TranslateString(ref translation),user.FullName),
                        Table = "User"
                    };
                    model.SearchResults.Add(newSearchInfo);
                }

                var userPasswordSearchList = User.UserPasswords.Where(row => row.UserName.Contains(model.SearchText));
                foreach (var userPassword in userPasswordSearchList)
                {
                    var newSearchInfo = new SearchInfo()
                    {
                        Id = userPassword.Id,
                        Display = string.Format("Account {0}".TranslateString(ref translation), userPassword.UserName),
                        Table = "UserPassword"
                    };
                    model.SearchResults.Add(newSearchInfo);
                }

                var contractSearchList =
                    User.UserContracts. Where(
                        row =>
                            row.Uri.Contains(model.SearchText) || row.StartDatum.Contains(model.SearchText));
                foreach (var contract in contractSearchList)
                {
                    var newSearchInfo = new SearchInfo()
                    {
                        Id = contract.Id,
                        Display = string.Format("Contract {0}".TranslateString(ref translation), contract.Uri),
                        Table = "Contract"
                    };
                    model.SearchResults.Add(newSearchInfo);
                }
                return View("Search", model);
            }
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        public ActionResult Contact()
        {

            return View();
        }

        public ActionResult Dashboard(Guid? userId)
        {
            if (User == null)
            {
                return RedirectToAction("Index");
            }
            ViewBag.userId = userId??User.Id;
            var user = User;
            if (userId.HasValue)
                user = db.Users.Find(userId);
            ViewBag.ThisUser = user;

            ViewBag.Recipes = db.ContractRecipes.Where(row => row.Active).OrderBy(row=>row.Position);

            return View(user.UserContracts.ToList());
        }

        public ActionResult HowItWorks()
        {

            return View();
        }

        public ActionResult Profile()
        {
            return View();
        }

        public ActionResult PROAccount()
        {
            return View();
        }
    }
}