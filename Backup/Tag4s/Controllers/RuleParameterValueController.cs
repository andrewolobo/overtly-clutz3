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
    public class RuleParameterValueController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();
        private IQueryable<RuleParameterValue> Model()
        {
            var ruleParameterValue = db.RuleParameterValues.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.ruleParameterId:
                    ruleParameterValue = ruleParameterValue.Where(row => row.RuleParameterId == Filter.Id);
                    break;
            }

            return ruleParameterValue;
        }
        //
        // GET: /RuleParameterValue/

        public ActionResult Index()
        {
            //var ruleparametervalues = db.RuleParameterValues.Include(r => r.RuleParameter);
            return View(Model());
        }

        //
        // GET: /RuleParameterValue/Details/5

        public ActionResult Details(Guid id)
        {
            RuleParameterValue ruleparametervalue = db.RuleParameterValues.Find(id);
            if (ruleparametervalue == null)
            {
                return HttpNotFound();
            }
            return View(ruleparametervalue);
        }

        //
        // GET: /RuleParameterValue/Create

        public ActionResult Create(Guid? ruleParameterId)
        {
            ViewBag.RuleParameterId = new SelectList(db.RuleParameters, "Id", "Name", ruleParameterId);
            return View();
        }

        //
        // POST: /RuleParameterValue/Create

        [HttpPost]
        public ActionResult Create(RuleParameterValue ruleparametervalue)
        {
            if (ModelState.IsValid)
            {
                ruleparametervalue.Id = Guid.NewGuid();
                db.RuleParameterValues.Add(ruleparametervalue);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.RuleParameterId = new SelectList(db.RuleParameters, "Id", "Name", ruleparametervalue.RuleParameterId);
            return View(ruleparametervalue);
        }

        //
        // GET: /RuleParameterValue/Edit/5

        public ActionResult Edit(Guid id)
        {
            RuleParameterValue ruleparametervalue = db.RuleParameterValues.Find(id);
            if (ruleparametervalue == null)
            {
                return HttpNotFound();
            }
            ViewBag.RuleParameterId = new SelectList(db.RuleParameters, "Id", "Name", ruleparametervalue.RuleParameterId);
            return View(ruleparametervalue);
        }

        //
        // POST: /RuleParameterValue/Edit/5

        [HttpPost]
        public ActionResult Edit(RuleParameterValue ruleparametervalue)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ruleparametervalue).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.RuleParameterId = new SelectList(db.RuleParameters, "Id", "Name", ruleparametervalue.RuleParameterId);
            return View(ruleparametervalue);
        }

        //
        // GET: /RuleParameterValue/Delete/5

        public ActionResult Delete(Guid id)
        {
            RuleParameterValue ruleparametervalue = db.RuleParameterValues.Find(id);
            if (ruleparametervalue == null)
            {
                return HttpNotFound();
            }
            return View(ruleparametervalue);
        }

        //
        // POST: /RuleParameterValue/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            RuleParameterValue ruleparametervalue = db.RuleParameterValues.Find(id);
            db.RuleParameterValues.Remove(ruleparametervalue);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}