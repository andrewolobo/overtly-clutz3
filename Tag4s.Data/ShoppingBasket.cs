//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Tag4s.Data
{
    using System;
    using System.Collections.Generic;
    
    public partial class ShoppingBasket
    {
        public System.Guid Id { get; set; }
        public System.Guid UserContractId { get; set; }
        public double Price { get; set; }
        public string TransactionId { get; set; }
    
        public virtual UserContract UserContract { get; set; }
    }
}
