using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Tag4s.Data
{
    [MetadataType(typeof(UserContractUriMetaData))]
    public partial class UserContractUri
    {
        public bool RuleActive { get; set; }

        public string CalculatedUri { get; set; }

        [UIHint("Boolean_icon")]
        public bool Actief
        {
            get
            {
                return Enabled;
            }
            set
            {
                Enabled = value;
            }
        }
    }

    public class UserContractUriMetaData
    {
        [Required(ErrorMessage = "!")]
        [DataType(DataType.Url, ErrorMessage = "!")]
        [RegularExpression(@"((mailto\:|(news|(ht|f)tp(s?))\://){1}\S+)", ErrorMessage = "!")]
        public string Uri { get; set; }
    }

}

