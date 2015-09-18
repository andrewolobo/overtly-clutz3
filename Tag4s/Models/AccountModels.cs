//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using Tag4s.Data;
//using System.Web.Mvc;
//using System.ComponentModel.DataAnnotations;

//namespace Tag4s.Models
//{
//    public class BaseClass
//    {
//        protected Tag4sEntities pe = new Tag4sEntities();
//    }

//    public class LogOnModel
//    {
//        [Required]
//        [Display(Name = "User name")]
//        public string UserName { get; set; }

//        [Required]
//        [DataType(DataType.Password)]
//        [Display(Name = "Password")]
//        public string Password { get; set; }

//        [Display(Name = "Remember me?")]
//        public bool RememberMe { get; set; }
//    }

//    public class AppUser : BaseClass
//    {
//        public User user;

//        public bool ValidateUser(string un, string pwd)
//        {
//            user = (from u in pe.Users.Include("UserPassword").Include("UserRole") where u.UserPassword.UserName.Equals(un) && u.UserPassword.Password.Equals(pwd) select u).FirstOrDefault();
//            if (user != null)
//                return true;
//            else
//                return false;
//        }

//        public void SetUserSession()
//        {
//            HttpContext.Current.Session.Add("user", user);
//        }

//        public void SignOut()
//        {
//            HttpContext.Current.Session.Remove("user");
//        }
//    }

//    public class AnonymousUserAuthorizeAttribute : AuthorizeAttribute
//    {
//        protected override bool AuthorizeCore(HttpContextBase httpContext)
//        {
//            if (HttpContext.Current.Session["user"] != null)
//                return false;
//            else
//                return true;
//        }

//        public override void OnAuthorization(AuthorizationContext filterContext)
//        {
//            base.OnAuthorization(filterContext);
//            if (filterContext.Result is HttpUnauthorizedResult)
//            {
//                filterContext.Result = new RedirectResult("~/Home/Index");
//            }
//        }
//    }

//    public class UserAuthorizeAttribute : AuthorizeAttribute
//    {
//        protected override bool AuthorizeCore(HttpContextBase httpContext)
//        {
//            if (HttpContext.Current.Session["user"] != null)
//                return true;
//            else
//                return false;
//        }

//        public override void OnAuthorization(AuthorizationContext filterContext)
//        {
//            base.OnAuthorization(filterContext);
//            if (filterContext.Result is HttpUnauthorizedResult)
//            {
//                filterContext.Result = new RedirectResult("~/Home/Index");
//            }
//        }
//    }

//    public class AdminAuthorizeAttribute : AuthorizeAttribute
//    {
//        protected override bool AuthorizeCore(HttpContextBase httpContext)
//        {
//            if (HttpContext.Current.Session["user"] != null)
//                return ((User)HttpContext.Current.Session["user"]).IsAdmin;
//            else
//                return false;
//        }

//        public override void OnAuthorization(AuthorizationContext filterContext)
//        {
//            base.OnAuthorization(filterContext);
//            if (filterContext.Result is HttpUnauthorizedResult)
//            {
//                filterContext.Result = new RedirectResult("~/Home/Index");
//            }
//        }
//    }

//    public class ResellerAuthorizeAttribute : AuthorizeAttribute
//    {
//        protected override bool AuthorizeCore(HttpContextBase httpContext)
//        {
//            if (HttpContext.Current.Session["user"] != null)
//                return ((User)HttpContext.Current.Session["user"]).IsReseller;
//            else
//                return false;
//        }

//        public override void OnAuthorization(AuthorizationContext filterContext)
//        {
//            base.OnAuthorization(filterContext);
//            if (filterContext.Result is HttpUnauthorizedResult)
//            {
//                filterContext.Result = new RedirectResult("~/Home/Index");
//            }
//        }
//    }

//    public class KlantAuthorizeAttribute : AuthorizeAttribute
//    {
//        protected override bool AuthorizeCore(HttpContextBase httpContext)
//        {
//            if (HttpContext.Current.Session["user"] != null)
//                return ((User)HttpContext.Current.Session["user"]).IsKlant;
//            else
//                return false;
//        }

//        public override void OnAuthorization(AuthorizationContext filterContext)
//        {
//            base.OnAuthorization(filterContext);
//            if (filterContext.Result is HttpUnauthorizedResult)
//            {
//                filterContext.Result = new RedirectResult("~/Home/Index");
//            }
//        }
//    }

//}