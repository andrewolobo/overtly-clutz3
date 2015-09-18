using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    public class UserContractUriController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();
        private IQueryable<UserContractUri> Model()
        {
            var userContractUri = db.UserContractUris.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userContractId:
                    userContractUri = userContractUri.Where(row => row.UserContractId == Filter.Id);
                    break;
            }
            return userContractUri;
        }
             
        //
        // GET: /UserContractUri/

        public ActionResult Index()
        {
            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userContractId:
                    ViewBag.UserContract = db.UserContracts.Find(Filter.Id);
                    break;
            }
            //var usercontracturis = db.UserContractUris.Include(u => u.UserContract);
            return View(Model());
        }

        //
        // GET: /UserContractUri/Details/5

        public ActionResult Details(Guid id)
        {
            UserContractUri usercontracturi = db.UserContractUris.Find(id);
            if (usercontracturi == null)
            {
                return HttpNotFound();
            }
            return View(usercontracturi);
        }

        //
        // GET: /UserContractUri/Create

        public ActionResult Create(Guid? userContractId)
        {

            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", userContractId);
            return View();
        }

        //
        // POST: /UserContractUri/Create

        [HttpPost]
        public ActionResult Create(UserContractUri usercontracturi)
        {
            if (ModelState.IsValid)
            {
                usercontracturi.Id = Guid.NewGuid();
                db.UserContractUris.Add(usercontracturi);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", usercontracturi.UserContractId);
            return View(usercontracturi);
        }

        //
        // GET: /UserContractUri/Edit/5

        public ActionResult Edit(Guid id)
        {
            UserContractUri usercontracturi = db.UserContractUris.Find(id);
            if (usercontracturi == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", usercontracturi.UserContractId);
            return View(usercontracturi);
        }

        //
        // POST: /UserContractUri/Edit/5

        [HttpPost]
        public ActionResult Edit(UserContractUri usercontracturi)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usercontracturi).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", usercontracturi.UserContractId);
            return View(usercontracturi);
        }

        //
        // GET: /UserContractUri/Delete/5

        public ActionResult Delete(Guid id)
        {
            UserContractUri usercontracturi = db.UserContractUris.Find(id);
            if (usercontracturi == null)
            {
                return HttpNotFound();
            }
            return View(usercontracturi);
        }

        //
        // POST: /UserContractUri/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            UserContractUri usercontracturi = db.UserContractUris.Find(id);
            db.UserContractUris.Remove(usercontracturi);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}