using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Tag4s.Data
{
    [MetadataType(typeof(UserMetaData))]
    public partial class User
    {
        public string FullName
        {
            get
            {
                return Organisation??String.Format("{0} {1} {2} {3}", Title, Firstname, Prefix,Lastname).Trim();
            }
        }

        public string ContactFullName
        {
            get { return String.Format("{0} {1} {2} {3}", Title, Firstname, Prefix, Lastname).Trim(); }
        }

        public bool IsAdmin
        {
            get
            {
                if (UserRole == null) return false;
                return (UserRole.Name.Equals("Administrator"));
            }
        }

        public bool IsReseller
        {
            get
            {
                if (UserRole == null) return false;
                return UserRole.Name.Equals("Reseller");
            }
        }

        public bool IsDepartment
        {
            get
            {
                if (UserRole == null) return false;
                return UserRole.Name.Equals("Afdeling");
            }
        }

        public bool IsKlant
        {
            get
            {
                if (UserRole == null) return false;
                return UserRole.Name.Equals("Klant");
            }
        }

        public List<UserContract> AllContracts()
        {
            return UserContracts.ToList().Union(User1.ToList().SelectMany(row => row.AllContracts())).ToList();
        }

        
    }

    public class UserMetaData
    {
        [Required(ErrorMessage = "!")]
        public string Firstname { get; set; }
        [Required(ErrorMessage = "!")]
        public string Lastname { get; set; }
        [Required(ErrorMessage = "!")]
        [DataType(DataType.EmailAddress, ErrorMessage = "!")]
        public string EmailAddress { get; set; }
        [Required(ErrorMessage = "!")]
        public System.Guid UserRoleId { get; set; }

        //[Required(ErrorMessage = "!")]
        public System.Guid ReselerId { get; set; }
        [Required(ErrorMessage = "!")]
        public string eId { get; set; }

        [Required(ErrorMessage = "!")]
        public string Street { get; set; }
        [Required(ErrorMessage = "!")]
        public string HouseNumber { get; set; }
        [Required(ErrorMessage = "!")]
        public string City { get; set; }
        [Required(ErrorMessage = "!")]
        public string ZipCode { get; set; }

    }
}
