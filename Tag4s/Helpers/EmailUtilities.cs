using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Net.Mail;
using System.Configuration;
using Tag4s;
using Tag4s.Data;

namespace Tag4s.Helpers
{
    public class EmailUtilities
    {
        protected static bool SendMailMessage(MailMessage mail)
        {
            using (var smtp = new SmtpClient("mail.euroitc.com"))
            {
                smtp.Credentials = new System.Net.NetworkCredential("tag4s@euroitc.com", "eur@com");

                mail.IsBodyHtml = true;
                mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");

                System.Net.Mail.AlternateView plainView = System.Net.Mail.AlternateView.CreateAlternateViewFromString
                    (System.Text.RegularExpressions.Regex.Replace(mail.Body, @"<(.|\n)*?>", string.Empty), null, "text/plain");
                System.Net.Mail.AlternateView htmlView = System.Net.Mail.AlternateView.CreateAlternateViewFromString(mail.Body, null, "text/html");
                mail.AlternateViews.Add(plainView);
                mail.AlternateViews.Add(htmlView);

                smtp.Send(mail);
                return true;
            }
        }

        // To Do: Add a From and To to the email;
        public static bool SendMail(string senderEmail, string recipientEmail, string messageTitle, string messageBody)
        {
            Tag4sEntities db = new Tag4sEntities();

            var message = new MailMessage();

            message.From = new System.Net.Mail.MailAddress(senderEmail);
            //TO DO: add multiple emails to Sender.
            message.To.Add(new System.Net.Mail.MailAddress(recipientEmail));

            message.Subject = messageTitle;
            message.Body = "<html><head><meta content=\"text/html;charset=utf-8\" /></head><body><p>" + messageBody + "</p></body></html>";

            SendMailMessage(message);
            return true;
        }
    }
}
