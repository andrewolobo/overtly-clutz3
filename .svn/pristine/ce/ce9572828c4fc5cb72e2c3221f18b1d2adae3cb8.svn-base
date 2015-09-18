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
    public class ApplicationController : BaseController
    {
        //
        // GET: /Application/

        public ActionResult Index()
        {
            var applications = db.Applications;
            return View(applications.ToList());
        }

        public ActionResult Edit(string language)
        {
            var application = db.Applications.FirstOrDefault(row => row.Description == language);
            if (application == null)
            {
                return HttpNotFound();
            }
            return View(application);
        }

        [HttpPost]
        public ActionResult Edit(Application application)
        {
            if (ModelState.IsValid)
            {
                db.Entry(application).State = EntityState.Modified;
                db.SaveChanges();
                return BreadCrum.RedirectToPreviousAction(Session, ControllerName);
            }
            return View(application);
        }

    }
}
