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
    public class UserContractLogController : BaseController
    {

        //
        // GET: /UserContractLog/

        public ActionResult Index()
        {
            var usercontractlogs = db.UserContractLogs.Include(u => u.UserContract).Include(u => u.UserContractRedirect1).Include(u => u.UserContractUri1);
            return View(usercontractlogs.ToList());
        }

        //
        // GET: /UserContractLog/Details/5

        public ActionResult Details(Guid id)
        {
            UserContractLog usercontractlog = db.UserContractLogs.Find(id);
            if (usercontractlog == null)
            {
                return HttpNotFound();
            }
            return View(usercontractlog);
        }

        //
        // GET: /UserContractLog/Create

        public ActionResult Create()
        {
            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri");
            ViewBag.UserContractRedirect = new SelectList(db.UserContractRedirects, "Id", "UserAgent");
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri");
            return View();
        }

        //
        // POST: /UserContractLog/Create

        [HttpPost]
        public ActionResult Create(UserContractLog usercontractlog)
        {
            if (ModelState.IsValid)
            {
                usercontractlog.Id = Guid.NewGuid();
                db.UserContractLogs.Add(usercontractlog);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", usercontractlog.UserContractId);
            ViewBag.UserContractRedirect = new SelectList(db.UserContractRedirects, "Id", "UserAgent", usercontractlog.UserContractRedirect);
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", usercontractlog.UserContractUri);
            return View(usercontractlog);
        }

        //
        // GET: /UserContractLog/Edit/5

        public ActionResult Edit(Guid id)
        {
            UserContractLog usercontractlog = db.UserContractLogs.Find(id);
            if (usercontractlog == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", usercontractlog.UserContractId);
            ViewBag.UserContractRedirect = new SelectList(db.UserContractRedirects, "Id", "UserAgent", usercontractlog.UserContractRedirect);
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", usercontractlog.UserContractUri);
            return View(usercontractlog);
        }

        //
        // POST: /UserContractLog/Edit/5

        [HttpPost]
        public ActionResult Edit(UserContractLog usercontractlog)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usercontractlog).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.UserContractId = new SelectList(db.UserContracts, "Id", "Uri", usercontractlog.UserContractId);
            ViewBag.UserContractRedirect = new SelectList(db.UserContractRedirects, "Id", "UserAgent", usercontractlog.UserContractRedirect);
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", usercontractlog.UserContractUri);
            return View(usercontractlog);
        }

        //
        // GET: /UserContractLog/Delete/5

        public ActionResult Delete(Guid id)
        {
            UserContractLog usercontractlog = db.UserContractLogs.Find(id);
            if (usercontractlog == null)
            {
                return HttpNotFound();
            }
            return View(usercontractlog);
        }

        //
        // POST: /UserContractLog/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            UserContractLog usercontractlog = db.UserContractLogs.Find(id);
            db.UserContractLogs.Remove(usercontractlog);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}