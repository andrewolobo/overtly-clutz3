using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using Tag4s.Models.ModelsPrime;

namespace Tag4s.Models
{
    public class PriceModelcs :LogFields
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public Item item { get; set; }
    }
}