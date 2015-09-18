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
    
    public partial class Invoice
    {
        public Invoice()
        {
            this.InvoiceLines = new HashSet<InvoiceLine>();
        }
    
        public System.Guid Id { get; set; }
        public System.Guid UserId { get; set; }
        public System.DateTime Date { get; set; }
        public decimal Amount { get; set; }
        public decimal VAT { get; set; }
        public int Number { get; set; }
        public string TransactionId { get; set; }
        public Nullable<bool> Paid { get; set; }
        public Nullable<int> Quantity { get; set; }
    
        public virtual ICollection<InvoiceLine> InvoiceLines { get; set; }
        public virtual User User { get; set; }
    }
}
