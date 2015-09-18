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
    public class UserContractRedirectController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        private IQueryable<UserContractRedirect> Model()
        {
            var userContractRedirect = db.UserContractRedirects.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.userContractUriId:
                    userContractRedirect = userContractRedirect.Where(row => row.UserContractUri == Filter.Id);
                    break;
            }

            return userContractRedirect;
        }

        //
        // GET: /UserContractRedirect/

        public ActionResult Index()
        {
            //var usercontractredirects = db.UserContractRedirects.Include(u => u.UserContractUri1).Include(u => u.Weekday);
            return View(Model());
        }

        //
        // GET: /UserContractRedirect/Details/5

        public ActionResult Details(Guid id)
        {
            UserContractRedirect usercontractredirect = db.UserContractRedirects.Find(id);
            if (usercontractredirect == null)
            {
                return HttpNotFound();
            }
            return View(usercontractredirect);
        }

        //
        // GET: /UserContractRedirect/Create

        public ActionResult Create(Guid? userContractUriId)
        {
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", userContractUriId);
            ViewBag.DayOfTheWeekValue = new SelectList(db.Weekdays, "Id", "Name");
            return View();
        }

        //
        // POST: /UserContractRedirect/Create

        [HttpPost]
        public ActionResult Create(UserContractRedirect usercontractredirect)
        {
            if (ModelState.IsValid)
            {
                usercontractredirect.Id = Guid.NewGuid();
                db.UserContractRedirects.Add(usercontractredirect);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", usercontractredirect.UserContractUri);
            ViewBag.DayOfTheWeekValue = new SelectList(db.Weekdays, "Id", "Name", usercontractredirect.DayOfTheWeekValue);
            return View(usercontractredirect);
        }

        //
        // GET: /UserContractRedirect/Edit/5

        public ActionResult Edit(Guid id)
        {
            UserContractRedirect usercontractredirect = db.UserContractRedirects.Find(id);
            if (usercontractredirect == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", usercontractredirect.UserContractUri);
            ViewBag.DayOfTheWeekValue = new SelectList(db.Weekdays, "Id", "Name", usercontractredirect.DayOfTheWeekValue);
            return View(usercontractredirect);
        }

        //
        // POST: /UserContractRedirect/Edit/5

        [HttpPost]
        public ActionResult Edit(UserContractRedirect usercontractredirect)
        {
            if (ModelState.IsValid)
            {
                db.Entry(usercontractredirect).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.UserContractUri = new SelectList(db.UserContractUris, "Id", "Uri", usercontractredirect.UserContractUri);
            ViewBag.DayOfTheWeekValue = new SelectList(db.Weekdays, "Id", "Name", usercontractredirect.DayOfTheWeekValue);
            return View(usercontractredirect);
        }

        //
        // GET: /UserContractRedirect/Delete/5

        public ActionResult Delete(Guid id)
        {
            UserContractRedirect usercontractredirect = db.UserContractRedirects.Find(id);
            if (usercontractredirect == null)
            {
                return HttpNotFound();
            }
            return View(usercontractredirect);
        }

        //
        // POST: /UserContractRedirect/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            UserContractRedirect usercontractredirect = db.UserContractRedirects.Find(id);
            db.UserContractRedirects.Remove(usercontractredirect);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}