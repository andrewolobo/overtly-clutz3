using System;
using System.Collections.Generic;
using System.Web.WebPages.Html;
using Tag4s.Data;

namespace Tag4s.Models
{
    /// <summary>
    /// 
    /// </summary>
    public class ContractRedirectParameterModel
    {
        /// <summary>
        /// 
        /// </summary>
        public ContractRedirectParameterModel()
        {
            //RuleParameterValues = new List<SelectListItem>();
            //RuleParameterValues.Add(new RuleParameterValue {Id = Guid.Empty, Name = ""});
        }
        /// <summary>
        /// 
        /// </summary>
        public RuleParameter RuleParameter { get; set; }

        /// <summary>
        /// 
        /// </summary>
        public List<SelectListItem> RuleParameterValues { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public RuleParameterValue SelectedValue { get; set; }
    }

}