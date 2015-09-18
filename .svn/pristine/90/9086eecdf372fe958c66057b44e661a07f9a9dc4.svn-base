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
    public class PersonController : BaseController
    {
        //private Tag4sEntities db = new Tag4sEntities();

        //
        // GET: /Person/

       
        public ActionResult Index()
        {
            var person = db.Person.Include(p => p.Country).Include(p => p.Gender).Include(p => p.Nationality);
            return View(person);
        }

        //
        // GET: /Person/Details/5

        public ActionResult Details(Guid id)
        {
            Person person = db.Person.Find(id);
            if (person == null)
            {
                return HttpNotFound();
            }
            return View(person);
        }

        //
        // GET: /Person/Create

        public ActionResult Create()
        {
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name");
            ViewBag.GenderId = new SelectList(db.Genders, "Id", "Name");
            ViewBag.NationalityId = new SelectList(db.Nationalities, "Id", "Name");
            return View();
        }

        //
        // POST: /Person/Create

        [HttpPost]
        public ActionResult Create(Person person)
        {
            if (ModelState.IsValid)
            {
                person.Id = Guid.NewGuid();
                db.Person.Add(person);
                db.SaveChanges();
                //return RedirectToAction("Index");
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);

            }

            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name", person.CountryId);
            ViewBag.GenderId = new SelectList(db.Genders, "Id", "Name", person.GenderId);
            ViewBag.NationalityId = new SelectList(db.Nationalities, "Id", "Name", person.NationalityId);
            return View(person);
        }

        //
        // GET: /Person/Edit/5

        public ActionResult Edit(Guid id)
        {
            Person person = db.Person.Find(id);
            if (person == null)
            {
                return HttpNotFound();
            }
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name", person.CountryId);
            ViewBag.GenderId = new SelectList(db.Genders, "Id", "Name", person.GenderId);
            ViewBag.NationalityId = new SelectList(db.Nationalities, "Id", "Name", person.NationalityId);
            return View(person);
        }

        //
        // POST: /Person/Edit/5

        [HttpPost]
        public ActionResult Edit(Person person)
        {
            if (ModelState.IsValid)
            {
                db.Entry(person).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName); ;
            }
            ViewBag.CountryId = new SelectList(db.Countries, "Id", "Name", person.CountryId);
            ViewBag.GenderId = new SelectList(db.Genders, "Id", "Name", person.GenderId);
            ViewBag.NationalityId = new SelectList(db.Nationalities, "Id", "Name", person.NationalityId);
            return View(person);
        }

        //
        // GET: /Person/Delete/5

        public ActionResult Delete(Guid id)
        {
            Person person = db.Person.Find(id);
            if (person == null)
            {
                return HttpNotFound();
            }
            return View(person);
        }

        //
        // POST: /Person/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(Guid id)
        {
            Person person = db.Person.Find(id);
            db.Person.Remove(person);
            db.SaveChanges();
            return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
        }

    }
}