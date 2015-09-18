using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.EntityModel;
using Tag4s.Data;
using Tag4s.ViewModel;

namespace Tag4s.Models
{
    public class SearchModel
    {
        public string SearchText { get; set; }
        public List<SearchInfo> SearchResults { get; set; }

        public SearchModel()
        {
            SearchResults = new List<SearchInfo>();
            SearchText = String.Empty;
        }
    }
}