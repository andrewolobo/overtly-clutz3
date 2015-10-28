using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Tag4s.Models.ModelsPrime
{
    public class LogFields
    {
        public DateTime? updated { get; set; }
        public DateTime? created { get; set; }
        public User created_by { get; set; }
        public User updated_by { get; set; }
        [Timestamp]
        public Byte[] updatedTimstamp { get; set; }
    }
}