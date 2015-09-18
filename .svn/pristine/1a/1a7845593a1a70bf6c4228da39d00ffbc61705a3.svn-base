using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;

namespace Tag4s.Data
{
    [MetadataType(typeof(ApplicationMetaData))]
    public partial class Application
    {

        
    }

    public class ApplicationMetaData
    {
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string TemplateUserRegistered { get; set; }
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string TemplateUserForgotPassword { get; set; }
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string TemplateProductOrdered { get; set; }
    }
}
