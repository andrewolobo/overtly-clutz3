using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Tag4s.Helpers
{
    public static class BoolUtility
    {
        public static IEnumerable<SelectListItem> SelectList(bool? selected, string defaultText = null, string defaultTrue = "True", string defaultFalse = "False", string defaultValue = null)
        {
            var list = new List<SelectListItem>
        {
            new SelectListItem {Text = defaultTrue, Value = "True", Selected = (selected.HasValue && selected.Value) || (!selected.HasValue && defaultValue == "True")},
            new SelectListItem {Text = defaultFalse, Value = "False", Selected = (selected.HasValue && !selected.Value) || (!selected.HasValue && defaultValue == "False")}
        };

            if (defaultText != null)
            {
                list.Insert(0, new SelectListItem
                {
                    Text = defaultText,
                    Value = string.Empty
                });
            }

            return list;
        }
    }
}