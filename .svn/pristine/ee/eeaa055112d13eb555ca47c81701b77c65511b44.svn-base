using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Tag4s.Data
{
    [MetadataType(typeof(RandomUriMetaData))]
    public partial class RandomUri
    {
    }

    public class RandomUriMetaData
    {
        [Required(ErrorMessage = "!")]
        [DataType(DataType.Url, ErrorMessage = "!")]
        [RegularExpression(@"((mailto\:|(news|(ht|f)tp(s?))\://){1}\S+)", ErrorMessage = "!")]
        public string Uri { get; set; }

        [Required(ErrorMessage = "!")]
        public decimal RandomParameter { get; set; }
    }

}

