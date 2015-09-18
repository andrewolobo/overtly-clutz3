using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace Tag4s.Data
{
    [MetadataType(typeof(UserContractMetaData))]
    public partial class UserContract
    {
        public string StartDatum
        {
            get
            {
                return StartDate.ToString("dd-MM-yyyy");
            }
        }

        public string StopDatum
        {
            get
            {
                return EndDate.ToString("dd-MM-yyyy");
            }
        }

        public bool Actief
        {
            get
            {
                return Enabled.HasValue ? Enabled.Value : true;
            }
            set
            {
                Enabled = value;
            }
        }

        public string QRCode
        {
            get
            {
                //return String.Format("http://chart.apis.google.com/chart?cht=qr&chs=500x500&choe=UTF-8&chl={0}&chld=L%7C0", FullUri);
                return string.Format("/Qr/Index?qrUrl={0}", FullUri);
            }
        }

        public string FullUri
        {
            get
            {
                string padString = "0";
                char[] padArray = padString.ToCharArray();
                return String.Format("http://www.tag4s.com/q?id={0}", eId);
            }
        }


        public string Bitly
        {
            get
            {
                //IBitlyService s = new BitlyService("tag4s", "R_d09d4a9baa90cd37122d9903188a5f13");
                //string shortened;
                //StatusCode statuscode = s.Shorten(FullUri, out shortened);
                //if (statuscode == StatusCode.OK)
                //{
                //    return shortened;
                //}
                //else
                {
                    string padString = "0";
                    char[] padArray = padString.ToCharArray();
                    return String.Format("http://www.tag4s.com/id={0}", eId);
                }
            }
        }


        public void Pay()
        {
            if (!this.Actief) return;
            if (User.Credit > 0)
            {
                if (!Created.HasValue)
                {
                    Created = DateTime.Now;
                }
                var days = (decimal) (DateTime.Now.Date).Subtract(LastPaid ?? Created.Value).TotalDays;
                days = Math.Round(days);
                var ctg = new Guid("eba32a33-0f5e-4dfd-b979-0018ab7254e0");
                if (days > 0 && Contract.ContractType.Id == ctg)
                {
                    var price = (Contract.Price ?? 0)*days;
                    User.Credit = (User.Credit ?? 0) - decimal.ToInt16(price);
                }
                LastPaid = DateTime.Now.Date;
            }
        }
    }

    public class UserContractMetaData
    {
        [Required(ErrorMessage = "!")]
        public System.Guid ContractId { get; set; }
        [Required(ErrorMessage = "!")]
        public System.Guid UserId { get; set; }
        [Required(ErrorMessage = "!")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}")]
        public System.DateTime StartDate { get; set; }
        [Required(ErrorMessage = "!")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}")]
        public System.DateTime EndDate { get; set; }
        [Required(ErrorMessage = "!")]
        [DataType(DataType.Url, ErrorMessage = "!")]
        [RegularExpression(@"((mailto\:|(news|(ht|f)tp(s?))\://){1}\S+)", ErrorMessage = "!")]
        public string Uri { get; set; }
        public string Name { get; set; }
        public bool Enabled { get; set; }
        public string TransactionId { get; set; }
        [Required(ErrorMessage = "!")]
        public string eId { get; set; }
    }
}
