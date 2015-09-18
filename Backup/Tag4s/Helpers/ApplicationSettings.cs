using System;
using System.Collections.Generic;
using System.Configuration;
using System.Globalization;
using System.Linq;
using System.Web;

namespace Tag4s.Helpers
{
    public static class ApplicationSettings
    {
        public static int PagerInfoPageSize()
        {
            const int pagerInfoDefaultPageSize = 10;
            //string pageSize = ConfigurationManager.AppSettings["Grid.PageSize"].ToString(CultureInfo.InvariantCulture);
            string pageSize = "10";

            int ret = -1;
            bool succes = Int32.TryParse(pageSize, out ret);
            if (!succes) ret = pagerInfoDefaultPageSize;

            return ret;
        }

    }
}