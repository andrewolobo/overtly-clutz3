using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Kendo.Mvc.Extensions;
using Kendo.Mvc.UI;
using Tag4s.Data;
using Tag4s.Filters;
using Tag4s.Helpers;

namespace Tag4s.Controllers
{
    public class TranslationController : BaseController
    {
        [AllowAnonymous]
        public ActionResult SetLanguage(string language)
        {
            Session["Language"] = language;
            DisplayNameExtensions.Language = language;
            if (Request.UrlReferrer != null)
            {
                return Redirect(Request.UrlReferrer.ToString());
            }
            return RedirectToAction("Index", "Home");
        }

        //
        // GET: /Translation/

        public ActionResult Index()
        {
            return View(db.Translations.ToList());
        }

        [AllowAnonymous]
        public ActionResult _SelectBatchEditing_AJAX([DataSourceRequest]DataSourceRequest request, ViewFilterKeys? filterKey, Guid? filterId)
        {
            //return View(new GridModel(ScriptModel().ToList()));
            if (filterKey.HasValue)
            {
                Filter.Key = filterKey.Value;
                Filter.Id = filterId.Value;
            }

            var results = db.Translations.ToDataSourceResult(request);

            var result = new EFJsonResult()
            {
                Data = results,
                JsonRequestBehavior = JsonRequestBehavior.AllowGet,
                MaxSerializationDepth = 2,
                ContentType = null,
                ContentEncoding = null
            };
            return result;

            //return Json(ScriptModel().ToList().ToDataSourceResult(request),JsonRequestBehavior.AllowGet);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        //[Grid(SerializationDepth = 5)]KENDOTEL
        [AllowAnonymous]
        public ActionResult _SaveBatchEditing_AJAX([DataSourceRequest]DataSourceRequest request, [Bind(Prefix = "inserted")]IEnumerable<Translation> insertedItems,
             [Bind(Prefix = "models")]IEnumerable<Translation> updatedItems,
             [Bind(Prefix = "deleted")]IEnumerable<Translation> deletedItems, ViewFilterKeys? filterKey, Guid? filterId)
        {
            if (filterKey.HasValue)
            {
                Filter.Key = filterKey.Value;
                Filter.Id = filterId.Value;
            }
            if (insertedItems != null)
            {
                foreach (var item in insertedItems)
                {
                    db.Translations.Add(item);
                }
            }
            if (updatedItems != null)
            {
                foreach (var item in updatedItems)
                {

                    //this below should work, however there will be fields missing, so we do it the other way
                    //db.Entry(item).State = EntityState.Modified;

                    var dItem = db.Translations.Find(item.Id);
                    if (dItem != null)
                    {
                        dItem.Name = item.Name;
                        dItem.Entity = item.Entity;
                        dItem.TranslationTypeId = item.TranslationTypeId;
                        dItem.View = item.View;
                        dItem.EN = item.EN;
                        dItem.NL = item.NL;
                        dItem.DE = item.DE;
                    }
                }
            }
            if (deletedItems != null)
            {
                foreach (var item in deletedItems)
                {
                    db.Translations.Remove(item);
                }
            }
            db.SaveChanges();
            //return View(new GridModel(ScriptModel()));
            return Json(updatedItems.ToList().ToDataSourceResult(request, ModelState), JsonRequestBehavior.AllowGet);
        }
        
    }
}
