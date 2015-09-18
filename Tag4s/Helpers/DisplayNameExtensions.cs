using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Mvc;
using Tag4s.Data;

namespace Tag4s.Helpers
{
    public static class DisplayNameExtensions
    {

        public static string Language = "NL";

        public static string TranslateString(this string key, ref Dictionary<string, string> translationdictionary)
        {
            if (!TranslationExists(String.Format("{0}.{1}", TranslationTypes.Generic.ToString(), key), key, ref translationdictionary))
            {
                //Call the insert routine to the DB and add to the current _dictionary
                InsertTranslationGeneric(key, key, ref translationdictionary);
            }

            //Defaults to Generic
            return LookupTranslation(String.Format("{0}.{1}", TranslationTypes.Generic.ToString(), key), key, ref translationdictionary).ToString();

        }

        //public static MvcHtmlString DisplayNameTranslatedFor<TModel, TValue>(this HtmlHelper<IEnumerable<TModel>> html, Expression<Func<TModel, TValue>> expression,
        //    ref Dictionary<string,string> translationdictionary, Volley.Data.TranslationTypes translationtype)
        //{
        //    //First get the original display name (basicly this is a copy of the code used inside the original DisplayNameFor
        //    var name = ExpressionHelper.GetExpressionText(expression);
        //    name = html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
        //    var metadata = ModelMetadataProviders.Current.GetMetadataForProperty(() => Activator.CreateInstance<TModel>(), typeof(TModel), name);

        //    //Now let's look up the value inside the translationdictionary we do this based on the composed KEY
        //    return LookupTranslation(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName), metadata.DisplayName, ref translationdictionary);
        //}


        //This function is only to be used for development to insert records into the database !!!
        public static MvcHtmlString DisplayNameTranslatedFor<TModel, TValue>(this HtmlHelper<IEnumerable<TModel>> html, Expression<Func<TModel, TValue>> expression,
            ref Dictionary<string, string> translationdictionary, Data.TranslationTypes translationtype, string controllername, string actionname)
        {
            //First get the original display name (basicly this is a copy of the code used inside the original DisplayNameFor
            var name = ExpressionHelper.GetExpressionText(expression);
            //name = html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
            var metadata = ModelMetadataProviders.Current.GetMetadataForProperty(() => Activator.CreateInstance<TModel>(), typeof(TModel), name);

            if (!TranslationExists(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName), metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary))
            {
                //Call the insert routine to the DB and add to the current _dictionary
                if (translationtype == Data.TranslationTypes.Entity)
                {
                    InsertTranslationEntity(metadata.PropertyName, metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary, controllername);
                }
                if (translationtype == Data.TranslationTypes.View)
                {
                    InsertTranslationView(metadata.PropertyName, metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary, controllername, actionname);
                }
            }

            //Now let's look up the value inside the translationdictionary we do this based on the composed KEY
            return LookupTranslation(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName), metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary);
        }

        //public static MvcHtmlString DisplayNameTranslatedFor<TModel, TValue>(this HtmlHelper<TModel> html, Expression<Func<TModel, TValue>> expression, ref Dictionary<string, string> translationdictionary, Volley.Data.TranslationTypes translationtype)
        //{
        //    //First get the original display name (basicly this is a copy of the code used inside the original DisplayNameFor
        //    var name = ExpressionHelper.GetExpressionText(expression);
        //    name = html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
        //    var metadata = ModelMetadataProviders.Current.GetMetadataForProperty(() => Activator.CreateInstance<TModel>(), typeof(TModel), name);

        //    //Now let's look up the value inside the translationdictionary we do this based on the composed KEY
        //    return LookupTranslation(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName), metadata.DisplayName, ref translationdictionary);
        //}

        //This function should only be used during development to fill the database with values
        public static MvcHtmlString DisplayNameTranslatedFor<TModel, TValue>(this HtmlHelper<TModel> html, Expression<Func<TModel, TValue>> expression, ref Dictionary<string, string> translationdictionary, TranslationTypes translationtype, string controllername, string actionname)
        {
            //First get the original display name (basicly this is a copy of the code used inside the original DisplayNameFor
            var name = ExpressionHelper.GetExpressionText(expression);
            //name = html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
            var metadata = ModelMetadataProviders.Current.GetMetadataForProperty(() => Activator.CreateInstance<TModel>(), typeof(TModel), name);

            if (!TranslationExists(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName), metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary))
            {
                //Call the insert routine to the DB and add to the current _dictionary
                if (translationtype == Data.TranslationTypes.Entity)
                {
                    InsertTranslationEntity(metadata.PropertyName, metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary, controllername);
                }
                if (translationtype == Data.TranslationTypes.View)
                {
                    InsertTranslationView(metadata.PropertyName, metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary, controllername, actionname);
                }
            }


            using (var tooltipSEntities = new Tag4sEntities())
            {
                var tooltipDictionary = tooltipSEntities.TooltipDictionary(Language, controllername, actionname);
                if (
                    !TooltipExists(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName),
                        metadata.DisplayName ?? metadata.PropertyName, ref tooltipDictionary))
                {
                    //Call the insert routine to the DB and add to the current _dictionary
                    if (translationtype == Data.TranslationTypes.Entity)
                    {
                        InsertTooltipEntity(metadata.PropertyName, "", ref tooltipDictionary, controllername);
                    }
                    if (translationtype == Data.TranslationTypes.View)
                    {
                        InsertTooltipView(metadata.PropertyName, "", ref tooltipDictionary, controllername, actionname);
                    }
                }
                var tooltip = LookupTooltip(
                    String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName),
                    metadata.DisplayName ?? metadata.PropertyName, ref tooltipDictionary);

                //Now let's look up the value inside the translationdictionary we do this based on the composed KEY
                var translation =
                    LookupTranslation(String.Format("{0}.{1}", translationtype.ToString(), metadata.PropertyName),
                        metadata.DisplayName ?? metadata.PropertyName, ref translationdictionary, tooltip);

                return translation;
            }
        }

        //public static MvcHtmlString DisplayNameTranslatedFor(this HtmlHelper html, string expression, string key, ref Dictionary<string,string> translationdictionary)
        //{
        //    //Defaults to Generic
        //    return LookupTranslation(String.Format("{0}.{1}", Volley.Data.TranslationTypes.Generic.ToString(), key), key, ref translationdictionary);
        //}

        //This function should only be used in development to add records to the database
        public static MvcHtmlString DisplayNameTranslatedFor(this HtmlHelper html, string expression, string key, string safevalue, ref Dictionary<string, string> translationdictionary)
        {
            var aExpression = expression;
            if (expression == "User") aExpression = "Entity";
            if (!TranslationExists(String.Format("{0}.{1}", string.IsNullOrEmpty(aExpression)?Data.TranslationTypes.Generic.ToString():aExpression, key), safevalue, ref translationdictionary))
            {
                //Call the insert routine to the DB and add to the current _dictionary
                if (String.IsNullOrEmpty(expression))
                {
                    InsertTranslationGeneric(key, safevalue, ref translationdictionary);
                }
                else
                {
                    InsertTranslationEntity(key, safevalue, ref translationdictionary, expression);
                }
            }

            if (string.IsNullOrEmpty(expression))
            {
                //Defaults to Generic
                return LookupTranslation(String.Format("{0}.{1}", Data.TranslationTypes.Generic.ToString(), key),
                    safevalue, ref translationdictionary);
            }
            else
            {
                using (var tooltipSEntities = new Tag4sEntities())
                {
                    var tooltipDictionary = tooltipSEntities.TooltipDictionary(Language, expression, "");
                    if (
                        !TooltipExists(String.Format("{0}.{1}", Data.TranslationTypes.Entity, key),
                            safevalue, ref tooltipDictionary))
                    {
                        //Call the insert routine to the DB and add to the current _dictionary
                            InsertTooltipEntity(key, "", ref tooltipDictionary, expression);
                    }
                    var tooltip = LookupTooltip(
                        String.Format("{0}.{1}", Data.TranslationTypes.Entity, key),
                        safevalue, ref tooltipDictionary);

                    //Now let's look up the value inside the translationdictionary we do this based on the composed KEY
                    var translation =
                        LookupTranslation(String.Format("{0}.{1}", Data.TranslationTypes.Entity, key),
                            safevalue, ref translationdictionary, tooltip);

                    return translation;
                }
                
            }
        }


        private static MvcHtmlString LookupTranslation(string key, string value, ref Dictionary<string, string> translationDictionary, string tooltip = null)
        {
            //Our Key is based on the following
            //Generic Types => Generic.key
            //Entity Types => Entity.key
            //View Types => View.key
            //MenuItem Types => MenuItem.key
            //MenuGroup Types => MenuGroup.key

            string returnValue = value;
            if (translationDictionary != null)
            {
                if (translationDictionary.ContainsKey(key))
                    returnValue = translationDictionary[key];
            }
            if (string.IsNullOrEmpty(tooltip)) 
                return new MvcHtmlString(returnValue);
            var result = string.Format("<span title='{1}'>{0}</span>", returnValue, tooltip);
            return new MvcHtmlString(result);
        }

        private static bool TranslationExists(string key, string value, ref Dictionary<string, string> translationDictionary)
        {
            if (translationDictionary != null)
                return translationDictionary.ContainsKey(key);
            return false;
        }

        //Routine to add records to the database and update the current _dictionary
        private static void InsertTranslationView(string key, string value, ref Dictionary<string, string> translationDictionary, string controllerName, string actionName)
        {
            var db = new Tag4sEntities();
            //Lookup Generic Entity
            var ViewType = db.TranslationTypes.FirstOrDefault(t => t.Name.Equals(TranslationTypes.View.ToString()));
            if (ViewType != null)
            {   
                var ViewItem = db.Translations.FirstOrDefault(t => t.Name.Equals(key) && t.TranslationTypeId.Equals(ViewType.Id) && t.Entity == controllerName && t.View == actionName);
                if (ViewItem != null)
                {
                    //Key exists but not for the selected languages
                    if (String.IsNullOrEmpty(ViewItem.EN))
                        ViewItem.EN = String.Format("!!!.{0}", value);
                    if (string.IsNullOrEmpty(ViewItem.NL))
                        ViewItem.NL = String.Format("!!!.{0}", value);
                    if (string.IsNullOrEmpty(ViewItem.DE))
                        ViewItem.DE = String.Format("!!!.{0}", value);
                }
                else
                {
                    //Add New
                    ViewItem = new Translation();
                    ViewItem.Id = Guid.NewGuid();
                    ViewItem.Name = key;
                    ViewItem.Entity = controllerName;
                    ViewItem.View = actionName;
                    ViewItem.EN = String.Format("!!!.{0}", value);
                    ViewItem.NL = String.Format("!!!.{0}", value);
                    ViewItem.DE = String.Format("!!!.{0}", value);
                    ViewItem.TranslationType = ViewType;
                    db.Translations.Add(ViewItem);
                }
                db.SaveChanges();
                //Now add to the dictionary since there it doesn't exist
                translationDictionary.Add(String.Format("{0}.{1}", TranslationTypes.View.ToString(), key), value);
                db.Dispose();
            }
        }

        private static void InsertTranslationEntity(string key, string value, ref Dictionary<string, string> translationDictionary, string controllerName)
        {
            var db = new Tag4sEntities();
            //Lookup Generic Entity
            var entity = TranslationTypes.Entity.ToString();
            var EntityType = db.TranslationTypes.FirstOrDefault(t => t.Name.Equals(entity));
            if (EntityType != null)
            {
                var EntityItem = db.Translations.FirstOrDefault(t => t.Name.Equals(key) && t.TranslationTypeId.Equals(EntityType.Id) && t.Entity == controllerName);
                if (EntityItem != null)
                {
                    //Key exists but not for the selected languages
                    if (String.IsNullOrEmpty(EntityItem.EN))
                        EntityItem.EN = String.Format("!!!.{0}", value);
                    if (string.IsNullOrEmpty(EntityItem.NL))
                        EntityItem.NL = String.Format("!!!.{0}", value);
                    if (string.IsNullOrEmpty(EntityItem.DE))
                        EntityItem.DE = String.Format("!!!.{0}", value);
                }
                else
                {
                    //Add New
                    EntityItem = new Translation();
                    EntityItem.Id = Guid.NewGuid();
                    EntityItem.Name = key;
                    EntityItem.Entity = controllerName;
                    EntityItem.EN = String.Format("!!!.{0}", value);
                    EntityItem.NL = String.Format("!!!.{0}", value);
                    EntityItem.DE = String.Format("!!!.{0}", value);
                    EntityItem.TranslationType = EntityType;
                    db.Translations.Add(EntityItem);
                }
                db.SaveChanges();
                //Now add to the dictionary since there it doesn't exist
                translationDictionary.Add(String.Format("{0}.{1}", TranslationTypes.Entity.ToString(), key), value);
                db.Dispose();
            }
        }

        private static void InsertTranslationGeneric(string key, string value, ref Dictionary<string, string> translationDictionary)
        {
            var db = new Tag4sEntities();
            //Lookup Generic Entity
            var generic = TranslationTypes.Generic.ToString();
            var GenericType = db.TranslationTypes.FirstOrDefault(t => t.Name.Equals(generic));
            if (GenericType != null)
            {
                var GenericItem = db.Translations.FirstOrDefault(t => t.Name.Equals(key) && t.TranslationTypeId.Equals(GenericType.Id));
                if (GenericItem != null)
                {
                    //Key exists but not for the selected languages
                    if (String.IsNullOrEmpty(GenericItem.EN))
                        GenericItem.EN = String.Format("!!!.{0}", value);
                    if (string.IsNullOrEmpty(GenericItem.NL))
                        GenericItem.NL = String.Format("!!!.{0}", value);
                    if (string.IsNullOrEmpty(GenericItem.DE))
                        GenericItem.DE = String.Format("!!!.{0}", value);
                }
                else
                {
                    //Add New
                    GenericItem = new Translation();
                    GenericItem.Id = Guid.NewGuid();
                    GenericItem.Name = key;
                    GenericItem.EN = String.Format("!!!.{0}", value);
                    GenericItem.NL = String.Format("!!!.{0}", value);
                    GenericItem.DE = String.Format("!!!.{0}", value);
                    GenericItem.TranslationType = GenericType;
                    db.Translations.Add(GenericItem);
                }
                db.SaveChanges();
                //Now add to the dictionary since there it doesn't exist
                translationDictionary.Add(String.Format("{0}.{1}", TranslationTypes.Generic.ToString(), key), value);
                db.Dispose();
            }
        }


        private static string LookupTooltip(string key, string value, ref Dictionary<string, string> tooltipDictionary)
        {
            //Our Key is based on the following
            //Generic Types => Generic.key
            //Entity Types => Entity.key
            //View Types => View.key
            //MenuItem Types => MenuItem.key
            //MenuGroup Types => MenuGroup.key

            string returnValue = value;
            if (tooltipDictionary != null)
            {
                if (tooltipDictionary.ContainsKey(key))
                    returnValue = tooltipDictionary[key];
            }
            return returnValue;
        }

        private static bool TooltipExists(string key, string value, ref Dictionary<string, string> tooltipDictionary)
        {
            if (tooltipDictionary != null)
                return tooltipDictionary.ContainsKey(key);
            return false;
        }

        //Routine to add records to the database and update the current _dictionary
        private static void InsertTooltipView(string key, string value, ref Dictionary<string, string> tooltipDictionary, string controllerName, string actionName)
        {
            var db = new Tag4sEntities();
            //Lookup Generic Entity
            var ViewType = db.TranslationTypes.FirstOrDefault(t => t.Name.Equals(TranslationTypes.View.ToString()));
            if (ViewType != null)
            {
                var ViewItem = db.Tooltips.FirstOrDefault(t => t.Name.Equals(key) && t.TranslationTypeId.Equals(ViewType.Id) && t.Entity == controllerName && t.View == actionName);
                if (ViewItem != null)
                {
                    //Key exists but not for the selected languages
                    if (String.IsNullOrEmpty(ViewItem.EN))
                        ViewItem.EN = String.Format("{0}", value);
                    if (string.IsNullOrEmpty(ViewItem.NL))
                        ViewItem.NL = String.Format("{0}", value);
                    if (string.IsNullOrEmpty(ViewItem.DE))
                        ViewItem.DE = String.Format("{0}", value);
                }
                else
                {
                    //Add New
                    ViewItem = new Tooltip();
                    ViewItem.Id = Guid.NewGuid();
                    ViewItem.Name = key;
                    ViewItem.Entity = controllerName;
                    ViewItem.View = actionName;
                    ViewItem.EN = String.Format("{0}", value);
                    ViewItem.NL = String.Format("{0}", value);
                    ViewItem.DE = String.Format("{0}", value);
                    ViewItem.TranslationType = ViewType;
                    db.Tooltips.Add(ViewItem);
                }
                db.SaveChanges();
                //Now add to the dictionary since there it doesn't exist
                tooltipDictionary.Add(String.Format("{0}.{1}", TranslationTypes.View.ToString(), key), value);
                db.Dispose();
            }
        }

        private static void InsertTooltipEntity(string key, string value, ref Dictionary<string, string> tooltipDictionary, string controllerName)
        {
            var db = new Tag4sEntities();
            //Lookup Generic Entity
            var entity = TranslationTypes.Entity.ToString();
            var EntityType = db.TranslationTypes.FirstOrDefault(t => t.Name.Equals(entity));
            if (EntityType != null)
            {
                var EntityItem = db.Tooltips.FirstOrDefault(t => t.Name.Equals(key) && t.TranslationTypeId.Equals(EntityType.Id) && t.Entity == controllerName);
                if (EntityItem != null)
                {
                    //Key exists but not for the selected languages
                    if (String.IsNullOrEmpty(EntityItem.EN))
                        EntityItem.EN = String.Format("{0}", value);
                    if (string.IsNullOrEmpty(EntityItem.NL))
                        EntityItem.NL = String.Format("{0}", value);
                    if (string.IsNullOrEmpty(EntityItem.DE))
                        EntityItem.DE = String.Format("{0}", value);
                }
                else
                {
                    //Add New
                    EntityItem = new Tooltip();
                    EntityItem.Id = Guid.NewGuid();
                    EntityItem.Name = key;
                    EntityItem.Entity = controllerName;
                    EntityItem.EN = String.Format("{0}", value);
                    EntityItem.NL = String.Format("{0}", value);
                    EntityItem.DE = String.Format("{0}", value);
                    EntityItem.TranslationType = EntityType;
                    db.Tooltips.Add(EntityItem);
                }
                db.SaveChanges();
                //Now add to the dictionary since there it doesn't exist
                tooltipDictionary.Add(String.Format("{0}.{1}", TranslationTypes.Entity.ToString(), key), value);
                db.Dispose();
            }
        }

        private static void InsertTooltipGeneric(string key, string value, ref Dictionary<string, string> tooltipDictionary)
        {
            var db = new Tag4sEntities();
            //Lookup Generic Entity
            var generic = TranslationTypes.Generic.ToString();
            var GenericType = db.TranslationTypes.FirstOrDefault(t => t.Name.Equals(generic));
            if (GenericType != null)
            {
                var GenericItem = db.Tooltips.FirstOrDefault(t => t.Name.Equals(key) && t.TranslationTypeId.Equals(GenericType.Id));
                if (GenericItem != null)
                {
                    //Key exists but not for the selected languages
                    if (String.IsNullOrEmpty(GenericItem.EN))
                        GenericItem.EN = String.Format("{0}", value);
                    if (string.IsNullOrEmpty(GenericItem.NL))
                        GenericItem.NL = String.Format("{0}", value);
                    if (string.IsNullOrEmpty(GenericItem.DE))
                        GenericItem.DE = String.Format("{0}", value);
                }
                else
                {
                    //Add New
                    GenericItem = new Tooltip();
                    GenericItem.Id = Guid.NewGuid();
                    GenericItem.Name = key;
                    GenericItem.EN = String.Format("{0}", value);
                    GenericItem.NL = String.Format("{0}", value);
                    GenericItem.DE = String.Format("{0}", value);
                    GenericItem.TranslationType = GenericType;
                    db.Tooltips.Add(GenericItem);
                }
                db.SaveChanges();
                //Now add to the dictionary since there it doesn't exist
                tooltipDictionary.Add(String.Format("{0}.{1}", TranslationTypes.Generic.ToString(), key), value);
                db.Dispose();
            }
        }
        
    }
}