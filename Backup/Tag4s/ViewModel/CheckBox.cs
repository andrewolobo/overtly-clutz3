using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Tag4s.ViewModel
{
    public class CheckBox
    {
        public CheckBox(string name)
        {
            Name = name;
        }
        public string Name { get; set; }
        public Guid Id { get; set; }
        public string Display { get; set; }
        public bool Assigned { get; set; }
    }
}