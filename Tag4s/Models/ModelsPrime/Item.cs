using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Tag4s.Models.ModelsPrime
{
    public class Item: LogFields
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public String item_name { get; set; }
        public ItemType item_type { get; set; }
        public Category category { get; set; }
        /*public Int32 item_price { get; set; }*/
        public PriceModelcs price { get; set; }
    }
    public class Category
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public String category_name { get; set; }
    }
    public class ItemType
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Key]
        public Guid id { get; set; }
        public String type_name { get; set; }
    }
}