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
    public class RedirectTypeValueController : BaseController
    {
       // private Tag4sEntities db = new Tag4sEntities();
        private IQueryable<RedirectTypeValue> Model()
        {
            var redirectTypeValue = db.RedirectTypeValues.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.redirectTypeId:
                    redirectTypeValue = redirectTypeValue.Where(row => row.RedirectTypeId == Filter.Id);
                    break;
            }

            return redirectTypeValue;
        }
        //
        // GET: /RedirectTypeValue/

        public ActionResult Index()
        {
            //var redirecttypevalues = db.RedirectTypeValues.Include(r => r.RedirectType);
            return View(Model());
        }

        //
        // GET: /RedirectTypeValue/Details/5

        public ActionResult Details(Guid id)
        {
            RedirectTypeValue redirecttypevalue = db.RedirectTypeValues.Find(id);
            if (redirecttypevalue == null)
            {
                return HttpNotFound();
            }
            return View(redirecttypevalue);
        }

        //
        // GET: /RedirectTypeValue/Create

        public ActionResult Create(Guid? redirectTypeId)
        {
            ViewBag.RedirectTypeId = new SelectList(db.RedirectTypes, "Id", "Name", redirectTypeId);
            return View();
        }

        //
        // POST: /RedirectTypeValue/Create

        [HttpPost]
        public ActionResult Create(RedirectTypeValue redirecttypevalue)
        {
            if (ModelState.IsValid)
            {
                redirecttypevalue.Id = Guid.NewGuid();
                db.RedirectTypeValues.Add(redirecttypevalue);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.RedirectTypeId = new SelectList(db.RedirectTypes, "Id", "Name", redirecttypevalue.RedirectTypeId);
            return View(redirecttypevalue);
        }

        //
        // GET: /RedirectTypeValue/Edit/5

        public ActionResult Edit(Guid id)
        {
            RedirectTypeValue redirecttypevalue = db.RedirectTypeValues.Find(id);
            if (redirecttypevalue == null)
            {
                return HttpNotFound();
            }
            ViewBag.RedirectTypeId = new SelectList(db.RedirectTypes, "Id", "Name", redirecttypevalue.RedirectTypeId);
            return View(redirecttypevalue);
        }

        //
        // POST: /RedirectTypeValue/Edit/5

        [HttpPost]
        public ActionResult Edit(RedirectTypeValue redirecttypevalue)
        {
            if (ModelState.IsValid)
            {
                db.Entry(redirecttypevalue).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.RedirectTypeId = new SelectList(db.RedirectTypes, "Id", "Name", redirecttypevalue.RedirectTypeId);
            return View(redirecttypevalue);
        }

        //
        // GET: /RedirectTypeValue/Delete/5

        public ActionResult Delete(Guid id)
        {
            RedirectTypeValue redirecttypevalue = db.RedirectTypeValues.Find(id);
            if (redirecttypevalue == null)
            {
                return HttpNotFound();
            }
            return View(redirecttypevalue);
        }

        //
        // POST: /RedirectTypeValue/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            RedirectTypeValue redirecttypevalue = db.RedirectTypeValues.Find(id);
            db.RedirectTypeValues.Remove(redirecttypevalue);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}