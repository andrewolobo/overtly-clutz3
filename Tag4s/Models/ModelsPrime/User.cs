using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Tag4s.Models.ModelsPrime
{
    public class User : LogFields
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public String first_name { get; set; }
        public String middle_name { get; set; }
        public String last_name { get; set; }
        public String username { get; set; }
        public String email_address { get; set; }
        public String password { get; set; }//THIS KEY WILL BE SALTED & ENCRYPTED//

    }
}