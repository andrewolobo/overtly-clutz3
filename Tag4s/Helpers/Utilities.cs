using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Linq.Expressions;
using System.Security.Cryptography;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.SessionState;
using DotComClub.Helpers;
using Tag4s.Data;
using System.IO;
using Tag4s.ViewModel;
using Tag4s.Helpers;

namespace Tag4s.Helpers
{
    public static class Utilities
    {

        public static bool AllowRights(customImages icon, string action, string controller, object routevalues, HttpSessionStateBase session = null)
        {
            if (session == null) session = new HttpSessionStateWrapper(HttpContext.Current.Session);
            if (IsAdministrator(session)) return true;

            var user = session["AuthenticatedUser"] as User;

            var serviceUser = session["AuthenticatedUser"] as User;

                var values = HtmlHelper.AnonymousObjectToHtmlAttributes(routevalues);
                var vid = values.SingleOrDefault(v => v.Key.Equals("id"));
            Guid id = Guid.Empty;
            if (vid.Value != null)
            {
                Guid.TryParse(vid.Value.ToString(), out id);
            }
            using (var db = new Tag4sEntities())
            {
                //user = db.Person.Find(user.Id);
                //writable?
                if (icon != customImages.Details && icon != customImages.Pdf && icon != customImages.Person && icon!= customImages.Print && icon!= customImages.Tooltip)
                {
                    //player can't write anything besides email
                    if (IsKlant(session))
                    {
                        //if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "emailitem")
                        //{
                        //    if (id != Guid.Empty)
                        //        return user.EmailItems.Any(row => row.Id == id);
                        //    return true;
                        //}

                        //if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "mediaitem")
                        //{
                        //    if (id != Guid.Empty)
                        //        return user.MediaItems.Any(row => row.Id == id);
                        //    return true;
                        //}

                        //if (!string.IsNullOrWhiteSpace(action) && action == "AddRecipientToEmail")
                        //{
                        //    return true;
                        //}

                        
                        return true;
                    }

                    //mediaitems only for owner
                    //if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "mediaitem")
                    //{
                    //    if (id != Guid.Empty)
                    //    return user.MediaItems.Any(row => row.Id == id);
                    //}


                }
                    //readable?
                    if (icon == customImages.Details || icon == customImages.Tooltip || icon == customImages.Pdf || icon == customImages.Person || icon== customImages.Print)
                    {
                        //player can't read anything besides emailfolder, emailitem, person(where owner), agenda, 
                        if (IsKlant(session))
                        {
                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "emailitem")
                            {
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "mediaitem")
                            {
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "User")
                            {
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "agendaitem")
                            {
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "training")
                            {
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "match")
                            {
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "evaluation")
                            {
                                //is there a personId in the routevalues?
                                if (values.ContainsKey("personId"))
                                {
                                    var personId = values.SingleOrDefault(v => v.Key.Equals("personId"));
                                    //if (user.Id.ToString() != personId.Value.ToString())
                                    //    return false;
                                }
                                
                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "asphoto")
                            {
                                //is there a personId in the routevalues?
                                if (values.ContainsKey("personId"))
                                {
                                    var personId = values.SingleOrDefault(v => v.Key.Equals("personId"));
                                    //if (user.Id.ToString() != personId.Value.ToString())
                                    //    return false;
                                }

                                return true;
                            }

                            if (!string.IsNullOrWhiteSpace(controller) && controller.ToLower() == "statistics")
                            {
                                return true;
                            }


                            return false;
                        }



                    }

                
            }
            return true;
        }

        public static Guid UserRoleKlant()
        {
            return new Guid("5bb450d1-5beb-4a4c-9101-8195eb48c8a3");
        }

        public static Guid UserRoleReseller()
        {
            return new Guid("825f66a9-46d5-4d01-82ac-859b554c847e");
        }

        public static Guid UserRoleAdministrator()
        {
            return new Guid("ad7d7648-367e-4ca5-802e-ba65a88bf2f4");
        }

        public static Guid UserRoleDepartment()
        {
            return new Guid("8247cfea-4ae6-4908-910a-cdafc383775b");
        }

        public static bool IsKlant(HttpSessionStateBase session)
        {
            return IsRole(session, "klant");
        }

        public static bool IsAdministrator(HttpSessionStateBase session)
        {
            return IsRole(session, "administrator") || IsRole(session, "backdoor");
        }

        public static bool IsReseller(HttpSessionStateBase session)
        {
            return IsRole(session, "reseller") || IsRole(session, "backdoor");
        }

        public static bool IsDepartment(HttpSessionStateBase session)
        {
            return IsRole(session, "afdeling") || IsRole(session, "backdoor");
        }

        public static bool IsRole(HttpSessionStateBase session, string role)
        {
            var selectedRole = session["AuthenticatedRolesSelected"] as UserRole;
            if (selectedRole!=null)
            {
                return selectedRole.Name.ToLower().Contains(role.ToLower());
            }

            var user = session["AuthenticatedUser"] as User;
            if (user != null)
            {
                return user.UserRole.Name.ToLower().Contains(role.ToLower());
            }
            return false;
        }

        //public static ServiceUser ServiceUser(HttpSessionStateBase session)
        //{
        //    return (session["AuthenticatedUser"] as ServiceUser) ?? new ServiceUser();
        //}

        public static User ApplicationUser(HttpSessionStateBase session)
        {
            return (session["AuthenticatedUser"] as User) ?? new User();
        }

        public static bool SessionUserUpdate(HttpSessionStateBase session, User returnUser)
        {
            session.Replace("AuthenticatedUserKey", returnUser.Id);
            session.Replace("AuthenticatedGroupKey", returnUser.UserRole.Name);
            session.Replace("AuthenticatedUserName", returnUser.Lastname);
            session.Replace("AuthenticatedUser", returnUser);
            CookieHelper.SetCookie(returnUser);
            return true;
        }

        public static IEnumerable<T> GetEnumValues<T>()
        {
            return Enum.GetValues(typeof(T)).Cast<T>();
        }

        public static MvcHtmlString CheckBoxField(ViewModel.CheckBox checkBox)
        {
            string checkbox = "<input type=\"checkbox\" name=\"" + checkBox.Name + "\" value=\"{0}\" {1} />";
            string selected = checkBox.Assigned ? "checked=\"checked\"" : "";
            return new MvcHtmlString(string.Format(checkbox, checkBox.Id.ToString(), selected));
        }

        public static MvcHtmlString CheckBoxField(string name, string id, string assigned)
        {
            string checkbox = "<input type=\"checkbox\" name=\"" + name + "\" value=\"{0}\" {1} />";
            string selected = bool.Parse(assigned) ? "checked=\"checked\"" : "";
            return new MvcHtmlString(string.Format(checkbox, id, selected));
        }

        public static MvcHtmlString ActionImageNavigation(string controller, object routevalues, params customImages[] icons)
        {
            string navigation = "<div class=\"command_icons clearfix\">{0}</div>";
            //string navigation = "{0}";
            if (icons.Count() == 0)
            {
                icons = new[] { /*customImages.Details,*/ customImages.Edit, customImages.Delete };
            }
            var result = "";
            foreach (var icon in icons)
            {
                if (!AllowRights(icon,null,controller,routevalues)) continue;
                //result = result +
                //         string.Format("<li>{0}</li>",
                //                       ActionImage(icon, icon.ToString(), controller, routevalues).ToString());
                result = result +
                         string.Format("{0}",
                                       ActionImage(icon, icon.ToString(), controller, routevalues).ToString());
            }
            return new MvcHtmlString(string.Format(navigation, result));
        }

        public static MvcHtmlString ActionImage(customImages image, string action, string controller, object routevalues, string toolTip = null)
        {
            //What do whe want to display ????
            //<a href="/{controller}/{action}/{id=optional}?{parameters}" style="text-decoration:none;">
            //  <img src="{imageref}" alt="imagename" title="imagename" />
            //</a>
            if (!AllowRights(image, action,controller,routevalues)) return new MvcHtmlString("");
            var hreftag = CreateLink(action, controller, routevalues, image, toolTip);
            //var imagetag = CreateImage(image);
            hreftag = hreftag.Replace("[data]", "");
            hreftag = hreftag.Replace("[custom_class]", image.ToString());
            return new MvcHtmlString(hreftag);
        }

        public static MvcHtmlString ActionImageClientEvent(string id, customImages image, string clientEvent, string clientCode, string url = "#", string toolTip = null)
        {
            if (!AllowRights(image,id,null,null)) return new MvcHtmlString("");
            var hreftag = CreateLinkClientEvent(id, clientEvent, clientCode, image, url, toolTip);
            //var imagetag = CreateImage(image);
            hreftag = hreftag.Replace("[data]", "");
            hreftag = hreftag.Replace("[custom_class]", image.ToString());
            return new MvcHtmlString(hreftag);
        }


        public static MvcHtmlString ActionImageWithText(string text, customImages image, string action, string controller, object routevalues, bool wrapDiv = true, string customClass ="", string toolTip=null)
        {
            if (!AllowRights(image, action, controller, routevalues)) return new MvcHtmlString("");

            string navigation = "<div class=\"command_icons clearfix\">{0}</div>";
            if (!wrapDiv)
            {
                navigation = "{0}";
            }
            var hreftag = CreateLink(action, controller, routevalues, image, toolTip);
            //var imagetag = CreateImage(image);
            var data = string.Format("<span style=\"top: 4px; position: relative;white-space: nowrap; margin-left:24px;vertical-align:middle;\">{0}&nbsp;</span>", text);
            hreftag = hreftag.Replace("[data]", data);
            hreftag = hreftag.Replace("[custom_class]", image.ToString() + " " + customClass);
            return new MvcHtmlString(string.Format(navigation, hreftag));
        }

        public static MvcHtmlString ActionImageWithTextClientEvent(string id, string text, customImages image, string clientEvent, string clientCode, string url = "#", string toolTip = null)
        {
            if (!AllowRights(image, id, null, null)) return new MvcHtmlString("");
            string navigation = "<div class=\"command_icons clearfix\">{0}</div>";
            var hreftag = CreateLinkClientEvent(id, clientEvent, clientCode, image, url, toolTip);
            //var imagetag = CreateImage(image);
            var data = string.Format("<span style=\"top: 4px; position: relative;white-space: nowrap; margin-left:24px;vertical-align:middle;\">{0}&nbsp;</span>", text);
            hreftag = hreftag.Replace("[data]", data);
            hreftag = hreftag.Replace("[custom_class]", image.ToString());
            return new MvcHtmlString(string.Format(navigation, hreftag));
        }

        private static string CreateLinkClientEvent(string id, string clientEvent, string clientCode, customImages image, string url = "#", string toolTip = null)
        {
            //<a href="/{controller}/{action}/{id=optional}?{parameters}" style="text-decoration:none;">{0}</a>":
            string href = "<a id=\"{4}\" class=\"command_icon [custom_class]\" title=\"{1}\" href=\"{0}\" style=\"display:block;text-decoration:none;\" {2}=\"{3}\">[data]</a>";
            return string.Format(href, url, toolTip??image.ToString(), clientEvent,clientCode, id);
        }

        private static string CreateLink(string action, string controller, object routevalues, customImages image, string toolTip = null)
        {
            //<a href="/{controller}/{action}/{id=optional}?{parameters}" style="text-decoration:none;">{0}</a>":
            string href = "<a class=\"command_icon [custom_class]\" title=\"{1}\" href=\"{0}\" style=\"display:block;text-decoration:none;\">[data]</a>";
            var values = HtmlHelper.AnonymousObjectToHtmlAttributes(routevalues);
            var id = values.SingleOrDefault(v => v.Key.Equals("id"));
            var parameters = values.Where(v => !v.Key.Equals("id") && !v.Key.Equals("filterkey") && !v.Key.Equals("filterid"));

            //Base Route
            string route = string.Format("/{0}/{1}", controller, action);
            //Added Id
            if (values.ContainsKey("id"))
                route = string.Format("{0}/{1}", route, id.Value.ToString());
            //Add parameters 
            if (parameters.Count() > 0)
            {
                route = string.Format("{0}?", route);
                foreach (var parameter in parameters)
                {
                    if (!route.EndsWith("?"))
                        route = string.Format("{0}&", route);
                    route = string.Format("{0}{1}={2}", route, parameter.Key, parameter.Value.ToString());
                }
            }
            if (values.ContainsKey("filterkey"))
            {
                //We need to add the filterkey = id
                var thekey = values.SingleOrDefault(v => v.Key.Equals("filterkey")).Value.ToString();
                if (!thekey.Equals("nofilter"))
                {
                    var theid = values.SingleOrDefault(v => v.Key.Equals("filterid")).Value.ToString();
                    string filterroute = string.Format("{0}={1}", thekey, theid);
                    if (!route.Contains(filterroute))
                    {
                        if (!route.Contains("?"))
                            route = string.Format("{0}?{1}", route, filterroute);
                        else
                            route = string.Format("{0}&{1}", route, filterroute);
                    }
                }
            }
            return string.Format(href, route, toolTip??image.ToString());
        }

        private static string CreateImage(customImages image)
        {
            //<img src="{imageref}" alt="imagename" title="imagename" />
            string imagetag = "<img class=\"social_icon\" src=\"{0}\" alt=\"{1}\", title=\"{1}\" class=\"dotcomicon\" />";
            return string.Format(imagetag, GetImageReference(image), image.ToString());
        }

        private static string GetImageReference(customImages image)
        {
            string baseRef = "/Images/";
            switch (image)
            {

                case customImages.Create:
                    return string.Format("{0}{1}", baseRef, "add_16x16.png");
                case customImages.Edit:
                    return string.Format("{0}{1}", baseRef, "edit16x16.gif");
                case customImages.Delete:
                    return string.Format("{0}{1}", baseRef, "Verwijderrood_prullenbakicon.png");
                case customImages.Save:
                    return string.Format("{0}{1}", baseRef, "accept_16x16.png");
                case customImages.Tooltip:
                    return string.Format("{0}{1}", baseRef, "tooltip.png");
                //case customImages.Pay:
                //    return string.Format("{0}{1}", baseRef, "edit16x16.gif");
                case customImages.Cancel:
                case customImages.Index:
                    return string.Format("{0}{1}", baseRef, "add_16x16.png");
                case customImages.Details:
                
                default:
                    return string.Format("{0}{1}", baseRef, "Bekijkenrood_oogicon.png");
            }
        }


        public static bool HasErrorFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression)
        {
            if (expression == null)
                throw new ArgumentNullException("expression");

            string modelName = htmlHelper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(ExpressionHelper.GetExpressionText(expression));
            if (!htmlHelper.ViewData.ModelState.ContainsKey(modelName))
                return false;

            ModelState modelState = htmlHelper.ViewData.ModelState[modelName];
            return modelState.Errors.Count > 0;
        }

        public static bool HasError<TModel>(this HtmlHelper<TModel> htmlHelper, string modelName)
        {
            if (string.IsNullOrEmpty(modelName))
                throw new ArgumentNullException("modelName");

            if (!htmlHelper.ViewData.ModelState.ContainsKey(modelName))
                return false;

            ModelState modelState = htmlHelper.ViewData.ModelState[modelName];
            return modelState.Errors.Count > 0;
        }

        public static MvcHtmlString GetErrorMessageFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression)
        {
            if (expression == null)
                throw new ArgumentNullException("expression");

            string modelName = htmlHelper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(ExpressionHelper.GetExpressionText(expression));
            if (!htmlHelper.ViewData.ModelState.ContainsKey(modelName))
                return new MvcHtmlString(null);

            ModelState modelState = htmlHelper.ViewData.ModelState[modelName];
            if (modelState.Errors.Count > 0)
            {
                return new MvcHtmlString(modelState.Errors.FirstOrDefault().ErrorMessage);
            }

            return new MvcHtmlString(null);
        }

        public static MvcHtmlString GetErrorMessage<TModel>(this HtmlHelper<TModel> htmlHelper, string modelName)
        {
            if (string.IsNullOrEmpty(modelName))
                throw new ArgumentNullException("modelName");

            if (!htmlHelper.ViewData.ModelState.ContainsKey(modelName))
                return new MvcHtmlString(null);

            ModelState modelState = htmlHelper.ViewData.ModelState[modelName];
            if (modelState.Errors.Count > 0)
            {
                return new MvcHtmlString(modelState.Errors.FirstOrDefault().ErrorMessage);
            }

            return new MvcHtmlString(null);
        }

        /// <summary>
        /// returns an int as a rating 
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string AsRating(this int value)
        {
            var result = "";
            for (var i=1; i<=value; i++)
            {
                result += "<img src='/images/bullet.png'>";
            }
            return result;
        }

        public static string GetRandomSalt(int? length)
        {
            const string strchar = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
            string str = "";
            var rnd = new Random();
            for (int i = 0; i < (length??15); i++)
            {
                int iRandom = rnd.Next(0, strchar.Length - 1);
                str += strchar.Substring(iRandom, 1);
            }
            return str;
        }

        public static Image ScaleImage(Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);
            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            return newImage;
        }
    }

    public enum customImages
    {
        Details,
        Create,
        Edit,
        Delete,
        Index,
        Save,
        Cancel,
        Tooltip,
        Wizard,
        Print,
        Pdf,
        Active,
        Inactive,
        Person,
        Pay,
        EmailRead,
        EmailUnread,
        EvaluationBullet,
        Share,
        Csv,
        Search
    }
}