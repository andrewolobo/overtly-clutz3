using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Tag4s.Data;
using Tag4s.ViewModel;

namespace Tag4s.ViewModel
{
    public class RolePersonCheckBox : CheckBox
    {
        public RolePersonCheckBox(string name)
            : base(name)
        {

        }

        public Role Role { get; set; }
        public Person Person { get; set; }
    }
}