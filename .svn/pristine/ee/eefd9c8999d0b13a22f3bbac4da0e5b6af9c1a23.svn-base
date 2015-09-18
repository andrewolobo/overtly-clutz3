using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;

namespace Tag4s.Controllers
{
    public class QController : Controller
    {
        //
        // GET: /Q/

        public ActionResult Index(string id)
        {
            //www.tag4s.com/q?aaaggg
            if (Request["id"] != null)
            {
                try
                {
                    string eId = Request["id"];
                    using (var db = new Tag4sEntities())
                    {
                        var userContract = db.UserContracts.FirstOrDefault(u => u.eId == eId);
                        if (userContract != null)
                        {
                            var redirectURI = "/redirect/index/{0}";
                            Response.Redirect(String.Format(redirectURI, userContract.Id.ToString()), true);
                        }
                    }
                }
                catch
                {
                }
            }

            return null;
        }
    }
}
