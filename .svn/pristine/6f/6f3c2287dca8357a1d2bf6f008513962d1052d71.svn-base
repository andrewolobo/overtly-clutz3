using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.EntityModel;
using Tag4s.Data;


namespace Tag4s.Models
{
    public class ResellerModel
    {
        public User Reseller { get; set; }
        public IEnumerable<User> Customers { get; set; }
        public IEnumerable<UserContract> Contracts { get; set; }
        public IEnumerable<UserContract> OwnContracts { get; set; }
    }
}