using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.EntityModel;
using Tag4s.Data;

namespace Tag4s.Models
{
    public class ContractModel
    {
        public User Customer { get; set; }
        public UserContract Contract { get; set; }
        public IEnumerable<UserContractUri> ContractUris { get; set; }
    }
}