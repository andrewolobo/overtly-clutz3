using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Tag4s.Data
{
    [MetadataType(typeof(UserPasswordMetaData))]
    public partial class UserPassword
    {
        
    }

    public class UserPasswordMetaData
    {
        [Required(ErrorMessage = "!")]
        public string Password { get; set; }
        //[Required(ErrorMessage = "!")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "!")]
        [DataType(DataType.EmailAddress, ErrorMessage = "!")]
        public string EmailAddress { get; set; }

    }
}
