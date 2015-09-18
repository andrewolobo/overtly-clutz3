using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Tag4s.Data
{
    public partial class Person
    {
        public string FullName
        {
            get { return string.Format("{0} {1}", NickName, LastName); }
        }

        public bool IsMentor()
        {
            return IsRole("mentor");
        }

        public bool IsAdministrator()
        {
            return IsRole("administrator") || IsRole("backdoor");
        }

        public bool IsRole(string role)
        {
            return Roles.Select(row => row.Name.ToLower()).Contains(role.ToLower());
        }

        public string ShortName
        {
            get { return string.Format("{0} {1}.", NickName, LastName.First()); }
        }

        public string DefaultRole
        {
            get
            {
                if (Roles == null) return "";
                var role = Roles.SingleOrDefault(row => row.Name == "Administrator");
                if (role != null) return role.Name;
                role = Roles.FirstOrDefault();
                if (role != null)
                    return role.Name;
                return "";
            }
        }

    }
}
