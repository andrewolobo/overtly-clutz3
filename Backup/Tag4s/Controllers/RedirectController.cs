using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    /// <summary>
    /// 
    /// </summary>
    [AllowAnonymous]
    public class RedirectController : BaseController
    {
        //
        // GET: /Redirect/
        

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Index(Guid? id)
        {
            var userAgent = FillRedirectType(Request.Browser);

            //We are not allowed to call this page without parameters
            if (!id.HasValue)
                return RedirectToAction(RuleEngine.ActionForbidden, "Website", null);

            //We need to go and find the contract information
            var contract = db.UserContracts.FirstOrDefault(c => c.Id == id.Value/* && c.Enabled != false*/);
            
            //The contract doesn't exist or isn't available
            if (contract == null)
                return RedirectToAction(RuleEngine.ActionNoLongerAvailable, "Website", null);
   
            //There are no rules defined so we redirect to the base uri
            string destinationUri = contract.Uri;
            var contractUris = contract.UserContractUris.Where(c => c.Enabled != false);

            var user = db.Users.Find(contract.User.Id);
            if (user.Credit < 1)
            {
                Response.Redirect("http://www.tag4s.com", true);
                
            }

            var uris = contractUris.ToList();
            bool activeRedirect = false;
            foreach (var uri in uris)
            {
                if (!activeRedirect)
                {
                    //Run the ruleengine
                    Helpers.RuleEngine.ValidateUri(uri, Request.Browser);
                    if (uri.RuleActive)
                    {
                        activeRedirect = true;
                        destinationUri = uri.CalculatedUri;
                        //write a logrecord and then do the actual redirect
                        
                        //Here we need to know if we need to use this page and set the frame info in the view
                        //or just do a plain redirect!
                        //write clicks off
                        if ((user.Credit??0) >= 0)
                        {
                            WriteLog(userAgent, destinationUri, contract, uri, uri.UserContractRedirects.FirstOrDefault(row => row.RuleActive));
                            if (contract.Contract.ContractType.Name != "Free")
                            {
                                user.Credit = user.Credit - 1;
                                //also, clearup the contract 
                                contract.Pay();
                                db.SaveChanges();
                            }
                            Response.Redirect(destinationUri, true);
                        }

                    }
                }
            }
            if (!activeRedirect)
            {
                //write a logrecord and then do the actual redirect 

                WriteLog(userAgent, destinationUri, contract);
                //Here we need to now if we need to use this page and set the frame info in the view
                //or just do a plain redirect!
                if (contract.Contract.ContractType.Name != "Free")
                {
                    user.Credit = user.Credit - 1;
                    //also, clearup the contract 
                    contract.Pay();
                    db.SaveChanges();
                }

                Response.Redirect(destinationUri, true);
            }

            return View();
        }

        private Dictionary<string, string> FillRedirectType(HttpBrowserCapabilitiesBase browser)
        {
            var result = new Dictionary<string, string>();
            if (browser.IsMobileDevice)
            {
                //can use also browser.MobileDeviceManufacturer
                var screenHeight = browser.ScreenPixelsHeight;
                var screenWidth = browser.ScreenPixelsWidth;

                //create the the scaling code for the html5 plugin accordingly, on $ready
            }
            var properties = db.RedirectTypes.ToList();
            foreach (var property in properties)
            {
                //find the browser property if any
                var browserProperty = browser.GetType().GetProperty(property.Name);
                if (browserProperty != null)
                {
                    var broserValue = browserProperty.GetValue(browser, null);
                    if (broserValue != null)
                    {
                        var stringValue = broserValue.ToString();
                        var value =
                            db.RedirectTypeValues.SingleOrDefault(
                                row => row.RedirectTypeId == property.Id && row.Name == stringValue);
                        if (value == null)
                        {
                            value = new RedirectTypeValue
                                {
                                    Id = Guid.NewGuid(),
                                    Name = stringValue,
                                    RedirectTypeId = property.Id
                                };
                            db.RedirectTypeValues.Add(value);
                            db.SaveChanges();
                        }
                        result.Add(property.Name, stringValue);
                    }
                }
            }
            return result;

        }

        private void WriteLog(Dictionary<string, string> userAgent, string resultUri, UserContract userContract, UserContractUri userContractUri = null,
                              UserContractRedirect userContractRedirect = null)
        {
            var host = Request.UserHostAddress;
            var userContractLog = new UserContractLog
                {
                    Id = Guid.NewGuid(),
                    DateTime = DateTime.Now,
                    Host = host,
                    ResultUri = resultUri,
                    UserContractId = userContract.Id,
                    UserAgent = userAgent.Aggregate("", (current, key) => current + string.Format("{0}:{1};", key.Key, key.Value))
                };

            if (userContractUri != null)
            {
                userContractLog.UserContractUri = userContractUri.Id;
            }

            if (userContractRedirect != null)
            {
                userContractLog.UserContractRedirect = userContractRedirect.Id;
            }

            db.UserContractLogs.Add(userContractLog);
            db.SaveChanges();

        }



    }
}
