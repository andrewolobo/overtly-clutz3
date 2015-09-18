using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.EntityModel;
using Tag4s.Data;

namespace Tag4s.Models
{
    public class CustomerModel
    {
        public User Customer { get; set; }
        public IEnumerable<UserContract> Contracts { get; set; }
    }
}