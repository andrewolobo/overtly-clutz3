using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using Newtonsoft.Json;

namespace Tag4s.Helpers
{
    public class EFJsonResult : JsonResult
    {
        private const string JsonRequest_GetNotAllowed =
            "This request has been blocked because sensitive information could be disclosed to third party web sites when this is used in a GET request. To allow GET requests, set JsonRequestBehavior to AllowGet.";

        public EFJsonResult()
        {
            MaxJsonLength = 1024000000;
            RecursionLimit = 10;
            MaxSerializationDepth = 1;
        }

        public int MaxJsonLength { get; set; }
        public int RecursionLimit { get; set; }
        public int MaxSerializationDepth { get; set; }

        public override void ExecuteResult(ControllerContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException("context");
            }

            if (JsonRequestBehavior == JsonRequestBehavior.DenyGet &&
                String.Equals(context.HttpContext.Request.HttpMethod, "GET", StringComparison.OrdinalIgnoreCase))
            {
                throw new InvalidOperationException(JsonRequest_GetNotAllowed);
            }

            var response = context.HttpContext.Response;

            if (!String.IsNullOrEmpty(ContentType))
            {
                response.ContentType = ContentType;
            }
            else
            {
                response.ContentType = "application/json";
            }

            if (ContentEncoding != null)
            {
                response.ContentEncoding = ContentEncoding;
            }

            if (Data != null)
            {

                var serializer = new JavaScriptSerializer
                    {
                        MaxJsonLength = MaxJsonLength,
                        RecursionLimit = RecursionLimit
                    };

                serializer.RegisterConverters(new List<EFJavaScriptConverter> {new EFJavaScriptConverter(MaxSerializationDepth)});

                response.Write(serializer.Serialize(Data));
            }
        }
    }
}