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
    
    public partial class PersonSetting
    {
        public System.Guid Id { get; set; }
        public string ItemKey { get; set; }
        public string ItemValue { get; set; }
        public System.Guid PersonId { get; set; }
    
        public virtual Person Person { get; set; }
    }
}
