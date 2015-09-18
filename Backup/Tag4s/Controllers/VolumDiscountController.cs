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
    public class VolumDiscountController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();
        private IQueryable<VolumDiscount> Model()
        {
            var volumDiscount = db.VolumDiscounts.AsQueryable();

            switch (Filter.Key)
            {
                case Filters.ViewFilterKeys.contractId:
                    volumDiscount = volumDiscount.Where(row => row.ContractId == Filter.Id);
                    ViewBag.ContractId = Filter.Id;
                    break;
            }

            return volumDiscount;
        }
        //
        // GET: /VolumDiscount/

        public ActionResult Index()
        {
            var volumdiscounts = db.VolumDiscounts.Include(v => v.Contract);
            return View(Model());
        }

        //
        // GET: /VolumDiscount/Details/5

        public ActionResult Details(Guid id)
        {
            VolumDiscount volumdiscount = db.VolumDiscounts.Find(id);
            if (volumdiscount == null)
            {
                return HttpNotFound();
            }
            return View(volumdiscount);
        }

        //
        // GET: /VolumDiscount/Create

        public ActionResult Create(Guid? contractId)
        {
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", contractId);
            return View();
        }

        //
        // POST: /VolumDiscount/Create

        [HttpPost]
        public ActionResult Create(VolumDiscount volumdiscount)
        {
            if (ModelState.IsValid)
            {
                volumdiscount.Id = Guid.NewGuid();
                db.VolumDiscounts.Add(volumdiscount);
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }

            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", volumdiscount.ContractId);
            return View(volumdiscount);
        }

        //
        // GET: /VolumDiscount/Edit/5

        public ActionResult Edit(Guid id)
        {
            VolumDiscount volumdiscount = db.VolumDiscounts.Find(id);
            if (volumdiscount == null)
            {
                return HttpNotFound();
            }
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", volumdiscount.ContractId);
            return View(volumdiscount);
        }

        //
        // POST: /VolumDiscount/Edit/5

        [HttpPost]
        public ActionResult Edit(VolumDiscount volumdiscount)
        {
            if (ModelState.IsValid)
            {
                db.Entry(volumdiscount).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.ContractId = new SelectList(db.Contracts, "Id", "Name", volumdiscount.ContractId);
            return View(volumdiscount);
        }

        //
        // GET: /VolumDiscount/Delete/5

        public ActionResult Delete(Guid id)
        {
            VolumDiscount volumdiscount = db.VolumDiscounts.Find(id);
            if (volumdiscount == null)
            {
                return HttpNotFound();
            }
            return View(volumdiscount);
        }

        //
        // POST: /VolumDiscount/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            VolumDiscount volumdiscount = db.VolumDiscounts.Find(id);
            db.VolumDiscounts.Remove(volumdiscount);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}