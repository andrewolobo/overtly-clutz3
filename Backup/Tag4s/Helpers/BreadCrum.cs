using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace Tag4s.Helpers
{
    //We need the following
    //Controller
    //Action
    //RouteValues (we will use the following pattern controller/action/id?filtering&Grid-Order&Grid-Filter)
    //If no grid order exists use ~ 
    //If no grid filter exists use ~ 
    //If new controller + action = identical then update grid order and grid filter
    //Grid-orderBy=Name-desc~Dexterities.Count-asc&Grid-filter=Teams.Count~eq~0
    public static class BreadCrum
    {
        //Server side of this static helper
        public static Dictionary<int, BreadCrumItem> GetInstance(HttpSessionStateBase session)
        {
            if (session["breadcrum"] == null)
                session.Add("breadcrum", new Dictionary<int, BreadCrumItem>());
            return session["breadcrum"] as Dictionary<int, BreadCrumItem>;
        }

        public static BreadCrumItem PreviousActionItem(HttpSessionStateBase session)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 1)//TIBI BREADCRUMB
                return breadcrumCollection[breadcrumCollection.Count - 1];
            else if (breadcrumCollection.Count == 1)
                return breadcrumCollection[1];
            else
                return null;
        }

        public static RedirectToRouteResult RedirectToPreviousAction(HttpSessionStateBase session, string controllername)
        {
            var previousItem = BreadCrum.PreviousActionItem(session);
            if (previousItem == null)
            {
                RouteValueDictionary routevalues = BreadCrum.ControllerRouteValues(session, "Index");
                routevalues.Add("controller", controllername);
                routevalues.Add("action", "Index");
                return new RedirectToRouteResult(routevalues);
            }
            else
            {
                RouteValueDictionary routevalues = BreadCrum.ControllerRouteValues(session, previousItem.Controller, previousItem.Action);
                routevalues.Add("controller", previousItem.Controller);
                routevalues.Add("action", previousItem.Action);
                return new RedirectToRouteResult(routevalues);
            }
        }

        public static void RemoveLast(HttpSessionStateBase session)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 0)
                breadcrumCollection.Remove(breadcrumCollection.Count);

            session["breadcrum"] = breadcrumCollection;
        }

        public static Dictionary<int, BreadCrumItem> Initialize(ref System.Web.Routing.RequestContext requestContext)
        {
            //If no object exists we need to create it
            if (requestContext.HttpContext.Session["breadcrum"] == null)
                requestContext.HttpContext.Session.Add("breadcrum", new Dictionary<int, BreadCrumItem>());

            //If we are on the home controller we can reset the breadcrum
            if (requestContext.RouteData.Values["controller"].ToString().Equals("Home"))
            {
                if (!requestContext.RouteData.Values["action"].ToString().Equals("Resellers") &&
                    !requestContext.RouteData.Values["action"].ToString().Equals("Administrators") &&
                    !requestContext.RouteData.Values["action"].ToString().Equals("Customers") &&
                    !requestContext.RouteData.Values["action"].ToString().Equals("OwnCustomers") &&
                    !requestContext.RouteData.Values["action"].ToString().Equals("Departments") &&
                    !requestContext.RouteData.Values["action"].ToString().Equals("Dashboard") 
                    )
                {
                    if ((requestContext.HttpContext.Session["breadcrum"] as Dictionary<int, BreadCrumItem>).Count > 0)
                    {
                        requestContext.HttpContext.Session.Remove("breadcrum");
                        requestContext.HttpContext.Session.Add("breadcrum", new Dictionary<int, BreadCrumItem>());
                    }

                    return requestContext.HttpContext.Session["breadcrum"] as Dictionary<int, BreadCrumItem>;
                }
            }


            if (IsServiceRequest(ref requestContext))
            {
                return requestContext.HttpContext.Session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            }


            //Now comes the real functionality
            var breadcrumCollection = requestContext.HttpContext.Session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            int collectionCount = breadcrumCollection.Count;
            bool updateBreadCrum = false;
            BreadCrumItem breadcrumItem = new BreadCrumItem();

            if (breadcrumCollection.ContainsKey(collectionCount))
            {
                breadcrumItem = breadcrumCollection[collectionCount];
                if (breadcrumItem.Controller.Equals(requestContext.RouteData.Values["controller"].ToString()) &&
                    breadcrumItem.Action.Equals(requestContext.RouteData.Values["action"].ToString()))
                    updateBreadCrum = true;

            }
            string key = string.Empty;
            if (requestContext.RouteData.Values.ContainsKey("id"))
                key = requestContext.RouteData.Values["id"].ToString();
            if (!updateBreadCrum)
            {
                breadcrumItem = new BreadCrumItem
                {
                    Controller = requestContext.RouteData.Values["controller"].ToString(),
                    Action = requestContext.RouteData.Values["action"].ToString(),
                    Name = requestContext.RouteData.Values["controller"].ToString(),
                    Key = key
                };
            }

            //And now we need to add if exists the QueryString Parameters
            if (requestContext.HttpContext.Request.QueryString.AllKeys.Length > 0)
            {
                foreach (var parameter in requestContext.HttpContext.Request.QueryString.AllKeys)
                {
                    string parametervalue = requestContext.HttpContext.Request.QueryString[parameter];
                    if (!breadcrumItem.RouteValues.ContainsKey(parameter))
                        breadcrumItem.RouteValues.Add(parameter, parametervalue);
                    else
                        breadcrumItem.RouteValues[parameter] = parametervalue;
                }
            }

            if (!updateBreadCrum)
            {
                //Are we jumping back (did we click on an existing breadcrumItem ?
                var oldItems = breadcrumCollection.Where(c => c.Value.Action == breadcrumItem.Action && c.Value.Controller == breadcrumItem.Controller && c.Value.Key == breadcrumItem.Key);
                if (oldItems.Count() > 0)
                {
                    int referencekey = oldItems.First().Key;
                    if (referencekey < collectionCount)
                    {
                        for (int i = referencekey + 1; i <= collectionCount; i++)
                        {
                            breadcrumCollection.Remove(i);
                        }
                    }
                }
                else
                {
                    collectionCount++;
                    breadcrumCollection.Add(collectionCount, breadcrumItem);
                }
            }
            else
                breadcrumCollection[collectionCount] = breadcrumItem;

            //Store the updated breadcrumCollection
            requestContext.HttpContext.Session["breadcrum"] = breadcrumCollection;
            return requestContext.HttpContext.Session["breadcrum"] as Dictionary<int, BreadCrumItem>;
        }

        public static bool IsServiceRequest(ref System.Web.Routing.RequestContext requestContext)
        {
            if (requestContext.RouteData.Values["action"].ToString().Equals("AsPhoto"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["action"].ToString().Equals("DisplayAsPdf"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["action"].ToString().Equals("DisplayToPdf"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["action"].ToString().Contains("_AJAX"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["action"].ToString().Equals("SetLanguage"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["action"].ToString().Equals("Csv"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["controller"].ToString().Equals("Qr"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["action"].ToString().Equals("Search") && requestContext.RouteData.Values["controller"].ToString().Equals("Person"))
            {
                return true;
            }
            if (requestContext.RouteData.Values["controller"].ToString().Equals("UserContract"))
            {
                var action = requestContext.RouteData.Values["action"].ToString();
                if (action != "Index" && action != "Edit" && action != "Details" && action != "Create" &&
                    action != "Display")
                    return true;
            }
            return false;
        }
        public static RouteValueDictionary ControllerRouteValues(HttpSessionStateBase session, string action)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 1)
            {
                var controller = breadcrumCollection[breadcrumCollection.Count].Controller;
                var items = breadcrumCollection.Where(c => c.Value.Controller.Equals(controller) && c.Value.Action.Equals(action));
                if (items.Count() > 0)
                {
                    if (items.First().Value.RouteValues.Count > 0)
                    {
                        RouteValueDictionary dictionary = new RouteValueDictionary();
                        if (!string.IsNullOrEmpty(items.First().Value.Key))
                            dictionary.Add("id", Guid.Parse(items.First().Value.Key));
                        foreach (var item in items.First().Value.RouteValues)
                        {
                            dictionary.Add(item.Key, item.Value);
                        }
                        return dictionary;
                    }
                    else
                        if (!string.IsNullOrEmpty(items.First().Value.Key))
                        {
                            RouteValueDictionary dictionary = new RouteValueDictionary();
                            dictionary.Add("id", items.First().Value.Key);
                            return dictionary;
                        }
                        else
                            return null;
                }
                else
                    return null;
            }
            else
                return null;
        }

        public static RouteValueDictionary ControllerRouteValues(HttpSessionStateBase session, string controller, string action)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 1)
            {
                var items = breadcrumCollection.Where(c => c.Value.Controller.Equals(controller) && c.Value.Action.Equals(action));
                if (items.First().Value.RouteValues.Count > 0)
                {
                    RouteValueDictionary dictionary = new RouteValueDictionary();
                    if (!string.IsNullOrEmpty(items.First().Value.Key))
                        dictionary.Add("id", Guid.Parse(items.First().Value.Key));
                    foreach (var item in items.First().Value.RouteValues)
                    {
                        dictionary.Add(item.Key, item.Value);
                    }
                    return dictionary;
                }
                else
                    if (!string.IsNullOrEmpty(items.First().Value.Key))
                    {
                        RouteValueDictionary dictionary = new RouteValueDictionary();
                        dictionary.Add("id", items.First().Value.Key);
                        return dictionary;
                    }
                    else
                        return new RouteValueDictionary();
            }
            else
                return new RouteValueDictionary();
        }

        //Client side of this static helper
        public static string RenderItem(BreadCrumItem item, string text = "")
        {
            //<a href="/Phase/Edit/da90ccf2-a3c6-4a38-a188-a8ec82997c68?<additionalroutevalues>&Grid-Order&Grid-Filter">Edit</a>
            string linkdata = string.Empty;
            string baseLink = "<a href=\"{0}\">{1}</a>";
            string pathLink = "/{0}/{1}";

            //Build up the base of the link
            linkdata = string.Format(pathLink, item.Controller, item.Action);
            //Add Key if it is supplied
            if (!string.IsNullOrEmpty(item.Key))
                linkdata = string.Format("{0}/{1}", linkdata, item.Key);
            //Add QueryParamters if exist
            if (item.RouteValues.Count > 0)
            {
                linkdata = string.Format("{0}?", linkdata);
                foreach (var routevalue in item.RouteValues)
                {
                    if (!linkdata.EndsWith("?"))
                        linkdata = string.Format("{0}&", linkdata);
                    linkdata = string.Format("{0}{1}={2}", linkdata, routevalue.Key, routevalue.Value);
                }
            }
            return string.Format(baseLink, linkdata, string.IsNullOrEmpty(text) ? item.Name : text);
        }

        public static MvcHtmlString Render(Dictionary<int, BreadCrumItem> breadcrum)
        {
            string template = "{0}";
            string path = string.Empty;
            if (breadcrum.Count > 0)
            {
                path = path + "<ul class=\"breadcrumbs clearfix\"><li>You are here:</li>";
                foreach (var breadcrumitem in breadcrum.OrderBy(b => b.Key))
                {
                    path = string.Format("<li class=\"separator icon_small_arrow right_white\">{0}<li>{1}</li>", path, RenderItem(breadcrumitem.Value));
                }
                path = path + "</ul>";
            }
            else
                return new MvcHtmlString("");

            return new MvcHtmlString(string.Format(template, path));
        }

        public static MvcHtmlString ActionLinkController(string text, HttpSessionStateBase session)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 1)
            {
                var controller = breadcrumCollection[breadcrumCollection.Count].Controller;
                var items = breadcrumCollection.Where(c => c.Value.Controller.Equals(controller)).OrderBy(c => c.Key);
                if (items.Count() > 1)
                {
                    return new MvcHtmlString(RenderItem(items.First().Value, text));
                }
                else
                    return new MvcHtmlString("");
            }
            else
                return new MvcHtmlString("");
        }

        public static MvcHtmlString ActionLinkStepBack(string text, HttpSessionStateBase session)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 1)
            {
                return new MvcHtmlString(RenderItem(breadcrumCollection[breadcrumCollection.Count - 1], text));
            }
            else
                return new MvcHtmlString("");
        }

        public static MvcHtmlString ActionLinkStepBack(HttpSessionStateBase session, ref Dictionary<string, string> translationdictionary)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 1)
            {
                var result =
                    RenderItem(breadcrumCollection[breadcrumCollection.Count - 1],
                               string.Format("back to {0}".TranslateString(ref translationdictionary),
                                             breadcrumCollection[breadcrumCollection.Count - 1].Name))
                        .Replace("<a href", "<a class='step_back' href");
                return new MvcHtmlString(result);
            }
            else
                return new MvcHtmlString("");
        }

        public static void SetName(string name, HttpSessionStateBase session)
        {
            var breadcrumCollection = session["breadcrum"] as Dictionary<int, BreadCrumItem>;
            if (breadcrumCollection.Count > 0)
            {
                breadcrumCollection[breadcrumCollection.Count].Name = name;
                session.Remove("breadcrum");
                session.Add("breadcrum", breadcrumCollection);
            }
        }

        internal static void CleanUp(ref System.Web.Routing.RequestContext requestContext)
        {
            requestContext.HttpContext.Session.Remove("breadcrum");
            requestContext.HttpContext.Session.Add("breadcrum", new Dictionary<int, BreadCrumItem>());
        }
    }

    public class BreadCrumItem
    {
        //<a href="/Phase/Edit/da90ccf2-a3c6-4a38-a188-a8ec82997c68?<additionalroutevalues>&Grid-Order&Grid-Filter">Edit</a>
        //The Key can be in the RouteValues or in the params section
        public string Name { get; set; }
        public string Controller { get; set; }
        public string Action { get; set; }
        public string Key { get; set; }
        public Dictionary<string, string> RouteValues { get; set; }
        public bool Visible { get; set; }

        public BreadCrumItem()
        {
            //Initialize 
            RouteValues = new Dictionary<string, string>();
            Key = String.Empty;
        }
    }
}