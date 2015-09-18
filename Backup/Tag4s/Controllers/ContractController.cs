using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kendo.Mvc.Extensions;
using Tag4s.Data;
using Tag4s.Filters;
using Tag4s.Helpers;
using Tag4s.Models;


namespace Tag4s.Controllers
{


    public class ContractController : BaseController
    {
        //
        // GET: /Contract/

        public ActionResult Edit(Guid? id, Guid? userId)
        {
            ViewData["selectedTab"] = (int)0;

            var model = new UserContract();


            if ((id.HasValue) && (id != Guid.Empty))
            {
                model = db.UserContracts.FirstOrDefault(c => c.Id == id.Value);
                ViewBag.Contract = new SelectList(db.Contracts, "Id", "Name", model.Contract.Id);
                //ViewBag.ContractType = new SelectList(db.ContractTypes, "Id", "Name", model.Contract.ContractType);
            }
            else
            {
                var user = db.Users.First(u => u.Id == userId.Value);
                model.User = user;
                model.Actief = false;
                model.StartDate = DateTime.Now;
                model.EndDate = model.StartDate.AddDays(1);

                model.eId = Utilities.GetRandomSalt(5);
                model.ContractId = new Guid("18a77083-3b99-4ef9-8fbc-93a3e64009d0");
                //ViewBag.ContractType = new SelectList(db.ContractTypes, "Id", "Name", model.Contract.ContractType);
            }

            return View(model);
        }

        //
        // POST: /Contract/Create

        [HttpPost]
        public ActionResult Edit(Guid? id, Guid? userId, FormCollection collection, UserContract userContract)
        {
            //Save Action
            //If id == null then insert
            try
            {
                ViewData["selectedTab"] = int.Parse(collection.GetValue("selectedTab").AttemptedValue);
                collection.Remove("selectedTab");
                var addNewUserContract = !id.HasValue || (id == Guid.Empty);
                if (ModelState.IsValid)
                {
                    if (!addNewUserContract)
                    {
                        if (!userContract.eId.HasValue())
                        {
                            userContract.eId = Utilities.GetRandomSalt(5);
                        }
                        db.Entry(userContract).State = EntityState.Modified;

                        db.SaveChanges();
                        return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
                        //return RedirectToAction("Edit", new { id = model.Id, userId = model.UserId });
                        //return View(model);
                    }
                    else
                    {
                        userContract.Id = Guid.NewGuid();
                        if (!userContract.eId.HasValue())
                        {
                            userContract.eId = Utilities.GetRandomSalt(5);
                        }
                        db.UserContracts.Add(userContract);
                        db.SaveChanges();

                        return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
                        //return RedirectToAction("Edit", new { id = model.Id, userId = model.UserId });
                    }
                }
            }
            catch (Exception ex)
            {
                //return RedirectToAction("Edit", new { id = Guid.Empty, userId = userId });
            }
            var user = db.Users.Find(userContract.UserId);
            userContract.User = user;

            return View(userContract);

            //ViewBag.Contract = new SelectList(db.Contracts, "Id", "Name", userContract.Contract);
            //return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }


        //
        // GET: /Contract/Delete/5

        public ActionResult Delete(Guid id, Guid userId)
        {
            //Try to delete and then return to base screen.

            var contract = db.UserContracts.FirstOrDefault(c => c.Id == id);

            if (contract == null)
            {
                //return RedirectToAction("Edit", "User", new { id = userId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            return View(contract);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(UserContract userContract, FormCollection collection)
        {
            try
            {
                var contract = db.UserContracts.FirstOrDefault(c => c.Id == userContract.Id);
                if (contract != null)
                {
                    db.UserContracts.Remove(contract);
                    db.SaveChanges();
                }
                //return RedirectToAction("Edit", "User", new { id = userContract.UserId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }
            catch (Exception ex)
            {
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

        }

        //private string GenerateRandomString()
        //{
        //    string strchar = "abcdefghijklmnopqrstuvwxyz0123456789#+@&$ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        //    string str = "";
        //    Random rnd = new Random();
        //    for (int i = 0; i <= 5; i++)
        //    {
        //        int iRandom = rnd.Next(0, strchar.Length - 1);
        //        str += strchar.Substring(iRandom, 1);
        //    }
        //    return str;
        //}
    }
}