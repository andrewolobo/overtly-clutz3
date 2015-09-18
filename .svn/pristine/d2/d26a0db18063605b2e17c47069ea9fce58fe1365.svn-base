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
    public class RuleParameterController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        //
        // GET: /RuleParameter/

        public ActionResult Index()
        {
            return View(db.RuleParameters.ToList());
        }

        //
        // GET: /RuleParameter/Details/5

        public ActionResult Details(Guid id)
        {
            RuleParameter ruleparameter = db.RuleParameters.Find(id);
            if (ruleparameter == null)
            {
                return HttpNotFound();
            }
            return View(ruleparameter);
        }

        //
        // GET: /RuleParameter/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /RuleParameter/Create

        [HttpPost]
        public ActionResult Create(RuleParameter ruleparameter)
        {
            if (ModelState.IsValid)
            {
                ruleparameter.Id = Guid.NewGuid();
                db.RuleParameters.Add(ruleparameter);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            return View(ruleparameter);
        }

        //
        // GET: /RuleParameter/Edit/5

        public ActionResult Edit(Guid id)
        {
            RuleParameter ruleparameter = db.RuleParameters.Find(id);
            if (ruleparameter == null)
            {
                return HttpNotFound();
            }
            return View(ruleparameter);
        }

        //
        // POST: /RuleParameter/Edit/5

        [HttpPost]
        public ActionResult Edit(RuleParameter ruleparameter)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ruleparameter).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            return View(ruleparameter);
        }

        //
        // GET: /RuleParameter/Delete/5

        public ActionResult Delete(Guid id)
        {
            RuleParameter ruleparameter = db.RuleParameters.Find(id);
            if (ruleparameter == null)
            {
                return HttpNotFound();
            }
            return View(ruleparameter);
        }

        //
        // POST: /RuleParameter/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            RuleParameter ruleparameter = db.RuleParameters.Find(id);
            db.RuleParameters.Remove(ruleparameter);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}