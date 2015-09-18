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
    public class UserContractLogModel
    {
        public List<UserContractLog> UserContractLogs { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public Guid UserId { get; set; }
        public Guid? UserContractId { get; set; }

        public UserContractLogModel()
        {
           
        }
    }
}