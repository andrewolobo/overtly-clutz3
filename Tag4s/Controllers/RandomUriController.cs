using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    public class RandomUriController : BaseController
    {
        //
        // GET: /RandomUri/

        public ActionResult Index()
        {
            var randomuris = db.RandomUris.Include(r => r.UserContractUri);
            return View(randomuris.ToList());
        }

        //
        // GET: /RandomUri/Details/5

        public ActionResult Details(Guid id )
        {
            RandomUri randomuri = db.RandomUris.Find(id);
            if (randomuri == null)
            {
                return HttpNotFound();
            }
            return View(randomuri);
        }

        //
        // GET: /RandomUri/Create

        public ActionResult Create(Guid? contractUriId)
        {
            if (contractUriId.HasValue)
            {
                ViewBag.UserContractUriId = new SelectList(db.UserContractUris, "Id", "Uri", contractUriId);
                var model = new RandomUri()
                {
                    UserContractUriId = contractUriId.Value
                };
                return View(model);
            }
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //
        // POST: /RandomUri/Create

        [HttpPost]
        public ActionResult Create(RandomUri randomuri, Guid contractUriId)
        {
            ViewBag.ContractUriId = contractUriId;
            var contractUri = db.UserContractUris.SingleOrDefault(row => row.Id == contractUriId);
            ViewBag.ContractUri = contractUri;
            if (ModelState.IsValid)
            {
                randomuri.Id = Guid.NewGuid();
                db.RandomUris.Add(randomuri);
                try
                {
                    db.SaveChanges();
                }
                catch (DbEntityValidationException ex)
                {
                }
                //return RedirectToAction("Edit", "ContractUri", new { Id = contractUriId, contractId = contractUri.Id });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.UserContractUriId = new SelectList(db.UserContractUris.Where(row => row.Id == contractUriId), "Id", "Uri", randomuri.UserContractUriId);
            return View(randomuri);
        }

        //
        // GET: /RandomUri/Edit/5

        public ActionResult Edit(Guid id )
        {
            RandomUri randomuri = db.RandomUris.Find(id);
            if (randomuri == null)
            {
                return HttpNotFound();
            }
            ViewBag.UserContractUriId = new SelectList(db.UserContractUris.Where(row => row.Id == randomuri.UserContractUriId), "Id", "Uri", randomuri.UserContractUriId);
            return View(randomuri);
        }

        //
        // POST: /RandomUri/Edit/5

        [HttpPost]
        public ActionResult Edit(RandomUri randomuri)
        {
            if (ModelState.IsValid)
            {
                db.Entry(randomuri).State = EntityState.Modified;
                db.SaveChanges();
                //return RedirectToAction("Edit", "ContractUri", new { Id = randomuri.UserContractUriId, contractId = randomuri.UserContractUri.UserContractId });
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            ViewBag.UserContractUriId = new SelectList(db.UserContractUris.Where(row => row.Id == randomuri.UserContractUriId), "Id", "Uri", randomuri.UserContractUriId);
            return View(randomuri);
        }

        //
        // GET: /RandomUri/Delete/5

        public ActionResult Delete(Guid id )
        {
            RandomUri randomuri = db.RandomUris.Find(id);
            if (randomuri == null)
            {
                return HttpNotFound();
            }
            return View(randomuri);
        }

        //
        // POST: /RandomUri/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            RandomUri randomuri = db.RandomUris.Find(id);
            db.RandomUris.Remove(randomuri);
            db.SaveChanges();
            var contractUri = db.UserContractUris.SingleOrDefault(row => row.Id == randomuri.UserContractUriId);
            //return RedirectToAction("Edit", "ContractUri", new { Id = randomuri.UserContractUriId, contractId = contractUri.Id });
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

        //protected override void Dispose(bool disposing)
        //{
        //    db.Dispose();
        //    base.Dispose(disposing);
        //}
    }
}