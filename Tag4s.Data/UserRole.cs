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
    
    public partial class UserRole
    {
        public UserRole()
        {
            this.Users = new HashSet<User>();
        }
    
        public System.Guid Id { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<User> Users { get; set; }
    }
}
