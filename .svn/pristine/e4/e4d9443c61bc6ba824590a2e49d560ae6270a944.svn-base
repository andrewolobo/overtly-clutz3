using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tag4s.Filters
{
    public class AuthorizationFilter : AuthorizeAttribute
    {
        private class Http401Result : ActionResult
        {
            public override void ExecuteResult(ControllerContext context)
            {
                // Set the response code to 401.
                context.HttpContext.Response.StatusCode = 401;
                context.HttpContext.Response.Write("Session has expired. Please log in again!");
                context.HttpContext.Response.End();
            }
        }

        private const string LoginUrl = "~/Home/LogIn";

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            var session = httpContext.Session;
            if (session == null) return false;
            var authenticatedUserKey = session["AuthenticatedUserKey"];
            var authenticatedUserGroupKey = session["AuthenticatedGroupKey"] as string;
            return (authenticatedUserKey != null && Roles.Contains(authenticatedUserGroupKey));
        }

        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            base.OnAuthorization(filterContext);
            //if is unauthorized and request is ajax
            if (filterContext.Result is HttpUnauthorizedResult && filterContext.HttpContext.Request.IsAjaxRequest())
            {
                filterContext.Result = new RedirectResult(LoginUrl);
            }
        }

        protected override void HandleUnauthorizedRequest(AuthorizationContext context)
        {
            var request = context.RequestContext.HttpContext.Request;

            if (request.IsAjaxRequest())
            {
                context.Result = new Http401Result();
            }
            else
            {
                var session = context.RequestContext.HttpContext.Session;
                var authenticatedUserKey = session["AuthenticatedUserKey"];
                if (authenticatedUserKey != null)
                {
                    context.Result = new RedirectResult(request.UrlReferrer.ToString());
                }
                else
                {
                    context.Result = new RedirectResult(LoginUrl);

                }

            }
        }
    }
}