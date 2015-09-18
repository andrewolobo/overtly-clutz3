using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tag4s.Data
{

    //for controller scaffolding, comment the WHOLE class
    public partial class Tag4sEntities
    {
        public Tag4sEntities(string connectionString)
            : base(connectionString)
        {
        }

        private string _language;

        private Dictionary<string, string> _translationDictionary;

        /// <summary>
        /// 
        /// </summary>
        public Dictionary<string, string> TranslationDictionary(string language, string controller, string action)
        {
            if (_language != language)
            {
                //We need to take it from TranslationWithType, this is a VIEW but a VIEW is pre-compiled and readonly formward
                //So it is a lot quicker than a normal query

                //Our Key is based on the following
                //Generic Types => Generic.key
                //Entity Types => Entity.key
                //View Types => View.key
                //MenuItem Types => MenuItem.key
                //MenuGroup Types => MenuGroup.key

                //We do this because we want to PREVENT duplicate keys into the dictionary 
                //Since withing an Entity, View and Generic we could have the same metadata.propertyName and we still want this
                //data to be available within the single dictionary to prevent multiple translation viewbags which is the only
                //alternative option I can think of for now.

                //We need to take Generic, Entity and View for a full dictionary
                //Still to be added(do) is to take the menuItem and menuGroup for the building of the menu translated

                var translationset = TranslationWithTypes.Where(row =>
                    //Selection of All records needed 
                    //All Generic Rows
                    row.Type.Equals("Generic") ||
                        //All Entity Rows
                    (row.Type.Equals("Entity") &&
                        (row.Entity.Equals(action == "Register" ? "User" : controller)/* || (action=="Register" && row.Entity.Equals("User"))*/)
                    ) ||
                        //All View Rows
                    (
                        row.Type.Equals("View") &&
                            row.Entity.Equals(controller) && row.View.Equals(action)
                    )
                );

                //Finaly set the filter on the language and set the dictionary
                if (language.Equals("EN"))

                    _translationDictionary = translationset.Where(row => row.EN != null)
                        .ToDictionary(key => key.KeyName, key => key.EN);
                if (language.Equals("NL"))
                    _translationDictionary = translationset.Where(row => row.NL != null)
                        .ToDictionary(key => key.KeyName, key => key.NL);
                if (language.Equals("DE"))
                    _translationDictionary = translationset.Where(row => row.DE != null)
                        .ToDictionary(key => key.KeyName, key => key.DE);

                _language = language;
            }
            return _translationDictionary;

        }


        private Dictionary<string, string> _tooltipDictionary;

        /// <summary>
        /// 
        /// </summary>
        public Dictionary<string, string> TooltipDictionary(string language, string controller, string action)
        {
            if (_language != language)
            {
                //We need to take it from TranslationWithType, this is a VIEW but a VIEW is pre-compiled and readonly formward
                //So it is a lot quicker than a normal query

                //Our Key is based on the following
                //Generic Types => Generic.key
                //Entity Types => Entity.key
                //View Types => View.key
                //MenuItem Types => MenuItem.key
                //MenuGroup Types => MenuGroup.key

                //We do this because we want to PREVENT duplicate keys into the dictionary 
                //Since withing an Entity, View and Generic we could have the same metadata.propertyName and we still want this
                //data to be available within the single dictionary to prevent multiple translation viewbags which is the only
                //alternative option I can think of for now.

                //We need to take Generic, Entity and View for a full dictionary
                //Still to be added(do) is to take the menuItem and menuGroup for the building of the menu translated

                var tooltipset = TooltipWithTypes.Where(row =>
                    //Selection of All records needed 
                    //All Generic Rows
                    row.Type.Equals("Generic") ||
                        //All Entity Rows
                    (row.Type.Equals("Entity") &&
                        row.Entity.Equals(action=="Register"?"User":controller)
                    ) ||
                        //All View Rows
                    (
                        row.Type.Equals("View") &&
                            row.Entity.Equals(controller) && row.View.Equals(action)
                    )
                );

                //Finaly set the filter on the language and set the dictionary
                if (language.Equals("EN"))

                    _tooltipDictionary = tooltipset.Where(row => row.EN != null)
                        .ToDictionary(key => key.KeyName, key => key.EN);
                if (language.Equals("NL"))
                    _tooltipDictionary = tooltipset.Where(row => row.NL != null)
                        .ToDictionary(key => key.KeyName, key => key.NL);
                if (language.Equals("DE"))
                    _tooltipDictionary = tooltipset.Where(row => row.DE != null)
                        .ToDictionary(key => key.KeyName, key => key.DE);

                _language = language;
            }
            return _tooltipDictionary;

        }

        //should not be here anyway
        //public DbSet<Exam> Exams { get; set; }
    }
}
