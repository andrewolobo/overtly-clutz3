using System;
using System.Linq;
using System.Web;
using Tag4s.Data;

namespace DotComClub.Helpers
{
    public class CookieHelper
    {

        public static string CookieName = "Tag4sCookie";

        public static void SetCookie(User user, int cookieExpireDate = 30)
        {
            var myCookie = new HttpCookie(CookieName);
            myCookie["UserName"] = user.Lastname;
            //myCookie["License"] = user.;
            myCookie.Expires = DateTime.Now.AddDays(cookieExpireDate);
            HttpContext.Current.Response.Cookies.Add(myCookie);
        }
    }
}