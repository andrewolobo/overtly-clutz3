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
    public class InvoiceController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        //
        // GET: /Invoice/

        public ActionResult Index()
        {
            var invoices = db.Invoices.Include(i => i.User);
            return View(invoices.ToList());
        }

        //
        // GET: /Invoice/Details/5

        public ActionResult Details(Guid id )
        {
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        //
        // GET: /Invoice/Create

        public ActionResult Create()
        {
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname");
            return View();
        }

        //
        // POST: /Invoice/Create

        [HttpPost]
        public ActionResult Create(Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                invoice.Id = Guid.NewGuid();
                db.Invoices.Add(invoice);
                db.SaveChanges();
                BreadCrum.RedirectToPreviousAction(Session, ControllerName);
                //return RedirectToAction("Index");
            }

            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname", invoice.UserId);
            return View(invoice);
        }

        //
        // GET: /Invoice/Edit/5

        public ActionResult Edit(Guid id)
        {
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname", invoice.UserId);
            return View(invoice);
        }

        //
        // POST: /Invoice/Edit/5

        [HttpPost]
        public ActionResult Edit(Invoice invoice)
        {
            if (ModelState.IsValid)
            {
                db.Entry(invoice).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.UserId = new SelectList(db.Users, "Id", "Firstname", invoice.UserId);
            return View(invoice);
        }

        //
        // GET: /Invoice/Delete/5

        public ActionResult Delete(Guid id)
        {
            Invoice invoice = db.Invoices.Find(id);
            if (invoice == null)
            {
                return HttpNotFound();
            }
            return View(invoice);
        }

        //
        // POST: /Invoice/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Invoice invoice = db.Invoices.Find(id);
            db.Invoices.Remove(invoice);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}