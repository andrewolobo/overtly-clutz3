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
    public class RedirectTypeController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        //
        // GET: /RedirectType/

        public ActionResult Index()
        {
            return View(db.RedirectTypes.ToList());
        }

        //
        // GET: /RedirectType/Details/5

        public ActionResult Details(Guid id)
        {
            RedirectType redirecttype = db.RedirectTypes.Find(id);
            if (redirecttype == null)
            {
                return HttpNotFound();
            }
            return View(redirecttype);
        }

        //
        // GET: /RedirectType/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /RedirectType/Create

        [HttpPost]
        public ActionResult Create(RedirectType redirecttype)
        {
            if (ModelState.IsValid)
            {
                redirecttype.Id = Guid.NewGuid();
                db.RedirectTypes.Add(redirecttype);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            return View(redirecttype);
        }

        //
        // GET: /RedirectType/Edit/5

        public ActionResult Edit(Guid id)
        {
            RedirectType redirecttype = db.RedirectTypes.Find(id);
            if (redirecttype == null)
            {
                return HttpNotFound();
            }
            return View(redirecttype);
        }

        //
        // POST: /RedirectType/Edit/5

        [HttpPost]
        public ActionResult Edit(RedirectType redirecttype)
        {
            if (ModelState.IsValid)
            {
                db.Entry(redirecttype).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            return View(redirecttype);
        }

        //
        // GET: /RedirectType/Delete/5

        public ActionResult Delete(Guid id)
        {
            RedirectType redirecttype = db.RedirectTypes.Find(id);
            if (redirecttype == null)
            {
                return HttpNotFound();
            }
            return View(redirecttype);
        }

        //
        // POST: /RedirectType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            RedirectType redirecttype = db.RedirectTypes.Find(id);
            db.RedirectTypes.Remove(redirecttype);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}