using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tag4s.Data;

namespace Tag4s.Filters
{
    public enum ViewFilterKeys
    {
        personid,
        genderid,
        nofilter,
        roleid,
        userContractUriId,
        userId,
        userContractId,
        redirectTypeId,
        ruleParameterId,
        contractId,
    }

    public class ViewFilter
    {
        public ViewFilterKeys Key { get; set; }
        public Guid Id { get; set; }
        public string Display { get; set; }

        public ViewFilter()
        {
        }

        public ViewFilter(ref Tag4sEntities db, ViewFilterKeys key, Guid id)
        {
            Key = key;
            Id = id;
            Display = GetDisplay(ref db, key, id);
        }

        private string GetDisplay(ref Tag4sEntities db, ViewFilterKeys key, Guid id)
        {
            switch (key)
            {
                case ViewFilterKeys.genderid:
                    return db.Genders.Find(id).Name;
                case ViewFilterKeys.nofilter:
                default:
                    return string.Empty;
            }
        }
    }
}