using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.Security;
using Tag4s.Data;

namespace Tag4s.Helpers
{
    public static class ClientExtensions
    {
        public static string EncodeString(this string value)
        {
            //return value;
            if (value.Length > 100) return value;
            return MachineKey.Encode(Encoding.ASCII.GetBytes(value), MachineKeyProtection.All);
        }

        public static string DecodeString(this string value)
        {
            //return value;
            if (value.Length < 100) return value;
            byte[] decodedPassword = MachineKey.Decode(value, MachineKeyProtection.All);
            string password = System.Text.Encoding.UTF8.GetString(decodedPassword);
            return password;
        }
    }

    public class ClientTools
    {

        protected static bool SendMailMessage(MailMessage mail)
        {
            using (var smtp = new SmtpClient("mail.euroitc.com"))
            {
                smtp.Credentials = new System.Net.NetworkCredential("dotcom@euroitc.com", "eur@com");
                mail.IsBodyHtml = true;
                mail.BodyEncoding = System.Text.Encoding.GetEncoding("utf-8");

                System.Net.Mail.AlternateView plainView = System.Net.Mail.AlternateView.CreateAlternateViewFromString
                    (System.Text.RegularExpressions.Regex.Replace(mail.Body, @"<(.|\n)*?>", string.Empty), null,
                        "text/plain");
                System.Net.Mail.AlternateView htmlView =
                    System.Net.Mail.AlternateView.CreateAlternateViewFromString(mail.Body, null, "text/html");
                mail.AlternateViews.Add(plainView);
                mail.AlternateViews.Add(htmlView);

                smtp.Send(mail);
                return true;
            }
        }


        ///Password Reset confirmation Mail
        public static bool SendConfirmationMail(string language, Guid? uId, bool sendBcc = true)
        {
            Tag4sEntities db = new Tag4sEntities();
            var user = db.UserPasswords.Find(uId);
            var message = new MailMessage();
            //var verifyUrl = System.Web.HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + "/User/PasswordReset";

            if (String.IsNullOrWhiteSpace(user.EmailAddress)) return false;

            var systemEmailAddress =
                db.Applications.FirstOrDefault().SystemEmailAddress;
            message.From = new System.Net.Mail.MailAddress(systemEmailAddress);
            message.To.Add(new System.Net.Mail.MailAddress(user.EmailAddress));
            if (sendBcc)
            {
                message.Bcc.Add(new System.Net.Mail.MailAddress(systemEmailAddress));
            }

            string password = user.Password;

            message.Subject = db.Applications.Single(r => r.Description == language).TemplateUserForgotPasswordSubject;

            string messageBody = db.Applications.Single(r => r.Description == language).TemplateUserForgotPassword;
            messageBody = messageBody.Replace("[volledige naam]", user.FullName);
            messageBody = messageBody.Replace("[Wachtwoord]", password);
            messageBody = messageBody.Replace("[wachtwoord]", password);
            messageBody = messageBody.Replace("[Gebruikersnaam]", user.UserName);
            messageBody = messageBody.Replace("[Bedrijfsnaam]", user.User.Organisation);
            messageBody = messageBody.Replace("[Emailadres]", systemEmailAddress);

            message.Body = messageBody;
            //message.Body = "<html><head><meta content=\"text/html;charset=utf-8\" /></head><body><p>Dear " + user.RealName
            //       + ", </p><p>An account has been created with the following details:</p>"
            //       + "<p>User: " + user.UserName + "<br>Password: " + user.Password + "<br>License: " + user.License.Name
            //       + "<br>You will be promted to change your random password at your first login.</p><div>Best regards,</div><div>Someone</div><p>Do not forward "
            //       + "this email.</p></body></html>";

            SendMailMessage(message);
            return true;
        }

        ///New User confirmation Mail
        public static bool SendUserRegisteredMail(string language, Guid? uId, bool sendBcc = true)
        {
            Tag4sEntities db = new Tag4sEntities();
            var user = db.UserPasswords.Find(uId);

            if (String.IsNullOrWhiteSpace(user.EmailAddress)) return false;

            var message = new MailMessage();
            var systemEmailAddress =
                db.Applications.Single(r => r.Description == language).SystemEmailAddress;
            message.From = new System.Net.Mail.MailAddress(systemEmailAddress);
            message.To.Add(new System.Net.Mail.MailAddress(user.EmailAddress));
            if (sendBcc)
            {
                message.Bcc.Add(new System.Net.Mail.MailAddress(systemEmailAddress));
            }
            string password = user.Password.DecodeString();

            message.Subject = db.Applications.Single(r => r.Description == language).TemplateUserRegisteredSubject;

            string messageBody = db.Applications.Single(r => r.Description == language).TemplateUserRegistered;
            messageBody = messageBody.Replace("[volledige naam]", user.FullName);
            messageBody = messageBody.Replace("[Wachtwoord]", password);
            messageBody = messageBody.Replace("[Gebruikersnaam]", user.UserName);
            messageBody = messageBody.Replace("[Bedrijfsnaam]", user.User.Organisation);
            messageBody = messageBody.Replace("[Emailadres]", systemEmailAddress);

            message.Body = messageBody;

            SendMailMessage(message);
            return true;
        }

        ///New Product confirmation Mail
        public static bool SendProductOrderedMail(string language, Guid? uId, Guid? pId)
        {
            Tag4sEntities db = new Tag4sEntities();
            var user = db.UserPasswords.Find(uId);
            var invoice = db.Invoices.Find(pId) ??
                          user.User.Invoices.OrderByDescending(row => row.Date).FirstOrDefault();
            if (invoice == null) invoice = new Invoice();

            if (String.IsNullOrWhiteSpace(user.EmailAddress)) return false;

            var message = new MailMessage();

            var systemEmailAddress =
                db.Applications.Single(r => r.Description == language).SystemEmailAddress;
            message.From = new System.Net.Mail.MailAddress(systemEmailAddress);
            message.To.Add(new System.Net.Mail.MailAddress(user.EmailAddress));
            message.Bcc.Add(new System.Net.Mail.MailAddress(systemEmailAddress));

            message.Subject = db.Applications.Single(r => r.Description == language).TemplateProductOrderedSubject;

            string messageBody = db.Applications.Single(r => r.Description == language).TemplateProductOrdered;
            messageBody = messageBody.Replace("[volledige naam]", user.FullName);
            messageBody = messageBody.Replace("[LaatsteFaktuur]", invoice.Amount.ToString());
            messageBody = messageBody.Replace("[Crediet]", user.User.Credit.ToString());
            messageBody = messageBody.Replace("[Bedrijfsnaam]", user.User.Organisation);
            messageBody = messageBody.Replace("[Emailadres]", systemEmailAddress);

            message.Body = messageBody;

            SendMailMessage(message);
            return true;
        }
    }
}