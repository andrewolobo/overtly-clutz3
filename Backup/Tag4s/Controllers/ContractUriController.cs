using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.EntityModel;
using System.Web.Mvc;
using Tag4s.Controllers;
using Tag4s.Data;
using System.IO;
using System.Text;
using Tag4s.Models;
using Tag4s.Helpers;
//using Telerik.Web.Mvc.UI;
using System.Data.Objects;

namespace Tag4s.Controllers
{
    //[KlantAuthorizeAttribute]
    public class ContractUriController : BaseController
    {

        //
        // GET: /ContractUri/
        public ActionResult Index(Guid? id)
        {
            //var model = db.Users.Where(u => u.Id != null);
            if (id == null)
            {
                return View();
            }
            else
            {
                var contract = db.UserContractUris.FirstOrDefault(c => c.Id == id);
                var parameters = db.UserContractRedirects.Where(c => c.UserContractUri == id).ToList();

                var model = new ContractUriModel
                {
                    Contract = contract,
                    Parameters = parameters
                };

                return View(model);
            }
        }

        public ActionResult Edit(Guid? id, Guid? contractId)
        {
            ViewData["selectedTab"] = (int)0;
            if (id.HasValue)
            {
                if (id != Guid.Empty)
                    return View(db.UserContractUris.FirstOrDefault(c => c.Id == id.Value));
                else
                {
                    var contract = db.UserContracts.FirstOrDefault(u => u.Id == contractId.Value);
                    var model = new UserContractUri();
                    model.UserContract = contract;
                    model.Enabled = true;
                    return View(model);
                }
            }
            else
            {
                var contract = db.UserContracts.First(u => u.Id == contractId.Value);
                var model = new UserContractUri();
                model.UserContract = contract;
                model.Enabled = true;
                return View(model);
            }
        } 

        //
        // POST: /Contract/Create

        [HttpPost]
        public ActionResult Edit(Guid? id, Guid? contractId, FormCollection collection, UserContractUri modelUri)
        {
            //Save Action
            //If id == null then insert
            if (!ModelState.IsValid)
            {
                return View(modelUri);
            }
            try
            {
                ViewData["selectedTab"] = int.Parse(collection.GetValue("selectedTab").AttemptedValue);
                collection.Remove("selectedTab");
                bool addNewUserContractUri = false;
                if (id.HasValue)
                {
                    if (id.Value == Guid.Empty)
                        addNewUserContractUri = true;
                }
                else
                    addNewUserContractUri = true;

                if (!addNewUserContractUri)
                {
                    var model = db.UserContractUris.FirstOrDefault(u => u.Id == id);
                    model.Enabled = modelUri.Actief;
                    model.Name = modelUri.Name;
                    model.Uri = modelUri.Uri;
                    model.RandomFunction = modelUri.RandomFunction;

                    db.SaveChanges();
                    return View(model);
                }
                else
                {
                    UserContractUri model = new UserContractUri();
                    var contract = db.UserContracts.First(c => c.Id == contractId);
                    model.Id = Guid.NewGuid();
                    model.UserContractId = contract.Id;
                    model.Enabled = modelUri.Actief;
                    model.Name = modelUri.Name;
                    model.Uri = modelUri.Uri;
                    model.RandomFunction = modelUri.RandomFunction;

                    db.UserContractUris.Add(model);
                    db.SaveChanges();
                    //return RedirectToAction("Edit", new {id = model.Id, contractId = model.UserContractId});
                    //return RedirectToAction("Edit", "Contract", new { id = contract.Id, userId = contract.UserId });
                    return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

                }
            }
            catch(Exception ex)
            {
                //return RedirectToAction("Edit", new { id = Guid.Empty, contractId = contractId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }
        }


        public ActionResult Delete(Guid id, Guid contractId)
        {
            //Try to delete and then return to base screen.

            var contract = db.UserContracts.FirstOrDefault(c => c.Id == contractId);

            var contractUri = db.UserContractUris.FirstOrDefault(c => c.Id == id);
            if (contractUri == null)
            {
                //return RedirectToAction("Edit", "Contract", new { id = contractId, userId = contract.UserId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            return View(contractUri);

            
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(UserContractUri userContractUri, FormCollection collection)
        {
            try
            {
                var contract = db.UserContractUris.FirstOrDefault(c => c.Id == userContractUri.Id);
                var redirectId = contract.UserContract.Id;
                var redirectUserId = contract.UserContract.User.Id;
                if (contract != null)
                {
                    db.UserContractUris.Remove(contract);
                    db.SaveChanges();
                }
                //return RedirectToAction("Edit", "Contract", new { id = redirectId, userId = redirectUserId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }
            catch (Exception ex)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

        }
    }
}
