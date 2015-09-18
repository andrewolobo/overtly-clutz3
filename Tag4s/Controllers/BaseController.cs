using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.SessionState;
using Tag4s.Filters;
using Tag4s.Data;
using Tag4s.Helpers;


namespace Tag4s.Controllers
{
    [HandleError]
    [AuthorizationFilter(Roles = "Administrator,Klant,Beheerder,Reseller,Afdeling")]
    [SessionState(SessionStateBehavior.Required)]
    public class BaseController : Controller
    {
        protected Tag4sEntities db = new Tag4sEntities();
        
        protected string ControllerName { get; set; }
        protected string ActionName { get; set; }
        protected Filters.ViewFilter Filter { get; set; }
        protected int GridPageSize = ApplicationSettings.PagerInfoPageSize();
        protected Dictionary<string, string> TranslationDictionary
        {
            get
            {
                return db.TranslationDictionary(Session["Language"] as string, this.ControllerName, this.ActionName);
            }
        }

        private User _user;

        public new User User
        {
            get
            {
                if (_user == null)
                {
                    if (Session["AuthenticatedUser"] != null)
                    {
                        _user = Session["AuthenticatedUser"] as User;
                    }
                    if (_user == null) return null;
                    _user = db.Users.Find(_user.Id);
                    //db.Entry(_user).State = EntityState.Detached;
                    //else
                    //{
                    //    _user = db.Person.Find(new Guid("8a441044-ceb8-4e4d-b273-3a2a1ee66761"));
                    //    Session.Add("AuthenticatedPerson", _user);
                    //}
                }
                return _user;
            }
        }

        protected void ClearUser()
        {
            db.Entry(_user).State = EntityState.Detached;
            _user = null;
        }

        protected override void Dispose(bool disposing)
        {
            if (db != null)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        protected void DetachItems<T>(IEnumerable<T> results) where T : class
        {
            foreach (var result in results)
            {
                db.Entry(result).State = EntityState.Detached;
            }

        }


        private ViewFilter InitializeFilter(ref System.Web.Routing.RequestContext requestContext)
        {
            var viewfilterkeys = Utilities.GetEnumValues<ViewFilterKeys>();
            var returnvalue = new ViewFilter { Key = Filters.ViewFilterKeys.nofilter, Id = Guid.Empty };
            foreach (var viewfilterkeyitem in viewfilterkeys)
            {
                if (requestContext.HttpContext.Request.QueryString.AllKeys.Contains(viewfilterkeyitem.ToString()))
                //if(!string.IsNullOrEmpty(requestContext.HttpContext.Request.Params[viewfilterkeyitem.ToString()]))
                {
                    returnvalue = new Filters.ViewFilter(ref db, viewfilterkeyitem, Guid.Parse(requestContext.HttpContext.Request.QueryString[viewfilterkeyitem.ToString()]));
                    break;
                }
            }
            if (requestContext.HttpContext.Request.QueryString.AllKeys.Contains("filterkey"))
            {
                ViewFilterKeys itemKey;
                Enum.TryParse(requestContext.HttpContext.Request.QueryString["filterkey"],true, out itemKey);
                returnvalue.Key = itemKey;
                returnvalue.Id = Guid.Parse(requestContext.HttpContext.Request.QueryString["filterid"]);
            }

            return returnvalue;
        }

        public string ReadAppSetting(string key)
        {
            var result = ConfigurationManager.AppSettings[key];
            return result;
        }

        protected override void Initialize(System.Web.Routing.RequestContext requestContext)
        {
            if (requestContext.HttpContext.Request["cleanupBreadCrumb"] == "True")
            {
                if (!BreadCrum.IsServiceRequest(ref requestContext))
                    BreadCrum.CleanUp(ref requestContext);
            }

            base.Initialize(requestContext);
            if (Session["AuthenticatedUser"] != null)
            {
                var user = Session["AuthenticatedUser"] as User;
                if (user != null)
                {
                    //db = new Tag4sEntities(user.DbConnection);
                    db = new Tag4sEntities();
                }
                ViewBag.User = User;
                ViewBag.UserPassword = Session["UserPassword"];

                var authenticatedRoles = Session["AuthenticatedRoles"] as List<UserRole>;
                var authenticatedRolesSelected = Session["AuthenticatedRolesSelected"] as UserRole;

                ViewBag.DefaultAuthenticatedRoleId = new SelectList(authenticatedRoles, "Id", "DisplayAs", authenticatedRolesSelected != null ? authenticatedRolesSelected.Id : Guid.Empty);
            }

            ViewBag.BreadCrum = BreadCrum.Initialize(ref requestContext);
            Filter = InitializeFilter(ref requestContext);
            ViewBag.Filter = Filter;

            this.ControllerName = requestContext.RouteData.Values["controller"].ToString();
            ViewBag.ControllerName = this.ControllerName;
            this.ActionName = requestContext.RouteData.Values["action"].ToString();
            ViewBag.ActionName = this.ActionName;

            if (Session["Language"] as string == null)
                Session["Language"] = "NL";

            //Translation ViewBag 
            if (db != null)
            {
                ViewBag.Translation = db.TranslationDictionary(Session["Language"] as string, this.ControllerName, this.ActionName);
            }

            ViewBag.IsMobile = IsMobile(requestContext.HttpContext.Request);
        }

        /// <summary>
        /// Usage:
        /// var u = new UrlHelper(this.ControllerContext.RequestContext);
        /// var returnUrl = GetReturnUrl("ReturnToQFEUrl", () => u.Action("Index", "QuestionnaireForm", null));
        /// </summary>
        public string GetReturnUrl(string key, Func<string> errorRedirect)
        {
            var returnUrl = Session.Pop(key);

            if (returnUrl == null) return errorRedirect.Invoke();
            if (string.IsNullOrEmpty(returnUrl.ToString())) return errorRedirect.Invoke(); ;

            return returnUrl.ToString();
        }

        public string RenderViewToString(string viewName, object model)
        {
            ViewData.Model = model;
            using (var sw = new StringWriter())
            {
                var viewResult = ViewEngines.Engines.FindPartialView(ControllerContext, viewName);
                var viewContext = new ViewContext(ControllerContext, viewResult.View, ViewData, TempData, sw);
                viewResult.View.Render(viewContext, sw);
                viewResult.ViewEngine.ReleaseView(ControllerContext, viewResult.View);
                return sw.GetStringBuilder().ToString();
            }
        }

        public string GetRootPath()
        {
            return Server.MapPath("~");
        }

        public Boolean IsMobile(HttpRequestBase rq)
        {
            var userAgent = rq.UserAgent;
            if ((userAgent.Contains("BlackBerry") || userAgent.Contains("iPhone") || userAgent.Contains("Android")) && (userAgent.Contains("Mobile"))) return true;
            else return false;
            
        }

        //public Boolean IsMobile(HttpRequestBase rq)
        //{
        //    var browser = rq.Browser;
        //    if (browser.IsMobileDevice) return true;
        //    else return false;
        //}

    }
}