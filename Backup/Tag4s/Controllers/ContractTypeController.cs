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
    public class ContractTypeController : BaseController
    {

        //
        // GET: /ContractType/

        public ActionResult Index()
        {
            return View(db.ContractTypes.ToList());
        }

        //
        // GET: /ContractType/Details/5

        public ActionResult Details(Guid id)
        {
            ContractType contracttype = db.ContractTypes.Find(id);
            if (contracttype == null)
            {
                return HttpNotFound();
            }
            return View(contracttype);
        }

        //
        // GET: /ContractType/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /ContractType/Create

        [HttpPost]
        public ActionResult Create(ContractType contracttype)
        {
            if (ModelState.IsValid)
            {
                contracttype.Id = Guid.NewGuid();
                db.ContractTypes.Add(contracttype);
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            return View(contracttype);
        }

        //
        // GET: /ContractType/Edit/5

        public ActionResult Edit(Guid id)
        {
            ContractType contracttype = db.ContractTypes.Find(id);
            if (contracttype == null)
            {
                return HttpNotFound();
            }
            return View(contracttype);
        }

        //
        // POST: /ContractType/Edit/5

        [HttpPost]
        public ActionResult Edit(ContractType contracttype)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contracttype).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            return View(contracttype);
        }

        //
        // GET: /ContractType/Delete/5

        public ActionResult Delete(Guid id)
        {
            ContractType contracttype = db.ContractTypes.Find(id);
            if (contracttype == null)
            {
                return HttpNotFound();
            }
            return View(contracttype);
        }

        //
        // POST: /ContractType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            ContractType contracttype = db.ContractTypes.Find(id);
            db.ContractTypes.Remove(contracttype);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}
    }
}