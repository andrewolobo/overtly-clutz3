using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Models;
using Tag4s.Filters;
using Tag4s.Data;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    //[AdminAuthorizeAttribute]
    [AuthorizationFilter(Roles = "Administrator,Beheerder")]
    public class WebsiteController : BaseController
    {
        //
        // GET: /Website/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Forbidden()
        {
            return View();
        }

        public ActionResult NotAvailable()
        {
            return View();
        }


    }
}
