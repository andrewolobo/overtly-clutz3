using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    public class PriceController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        //
        // GET: /Contract/

        public ActionResult Index()
        {
            var contracts = db.Contracts;
            return View(contracts.ToList());
        }

        //
        // GET: /Contract/Details/5

        public ActionResult Details(Guid id)
        {
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            return View(contract);
        }

        //
        // GET: /Contract/Create

        public ActionResult Create()
        {
            ViewBag.ContractTypeId = new SelectList(db.ContractTypes, "Id", "Name");
            return View();
        }

        //
        // POST: /Contract/Create

        [HttpPost]
        public ActionResult Create(Contract contract)
        {
            if (ModelState.IsValid)
            {
                contract.Id = Guid.NewGuid();
                db.Contracts.Add(contract);
                db.SaveChanges();
                BreadCrum.RedirectToPreviousAction(Session, ControllerName);
                return RedirectToAction("Index");
            }

            ViewBag.ContractTypeId = new SelectList(db.ContractTypes, "Id", "Name", contract.ContractTypeId);
            return View(contract);
        }

        //
        // GET: /Contract/Edit/5

        public ActionResult Edit(Guid id)
        {
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            ViewBag.ContractTypeId = new SelectList(db.ContractTypes, "Id", "Name", contract.ContractTypeId);
            return View(contract);
        }

        //
        // POST: /Contract/Edit/5

        [HttpPost]
        public ActionResult Edit(Contract contract)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.ContractTypeId = new SelectList(db.ContractTypes, "Id", "Name", contract.ContractTypeId);
            return View(contract);
        }

        //
        // GET: /Contract/Delete/5

        public ActionResult Delete(Guid id)
        {
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            return View(contract);
        }

        //
        // POST: /Contract/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Contract contract = db.Contracts.Find(id);
            db.Contracts.Remove(contract);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}
