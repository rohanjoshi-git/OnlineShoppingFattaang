using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BusinessObjects;
using System.Net.Mail; // for MailMessage and MailAddress
using System.Configuration;

namespace FattaangOnlineShopping
{
    public static class EmailEngine
    {

        public static void SendEmail(string recipientEmail, string subject, string body)

        {
            // type used in a using statement must be implicitly convertible to 'System.IDisposable'            
            using (MailMessage mailMessage = new MailMessage())
            {
                mailMessage.From = new MailAddress(ConfigurationManager.AppSettings["UserName"]);
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                mailMessage.To.Add(new MailAddress(recipientEmail));

                SmtpClient smtp = new SmtpClient();
                smtp.Host = ConfigurationManager.AppSettings["Host"];
                smtp.EnableSsl = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableSsl"]);

                System.Net.NetworkCredential networkCred = new System.Net.NetworkCredential();
                networkCred.UserName = ConfigurationManager.AppSettings["UserName"];
                networkCred.Password = ConfigurationManager.AppSettings["Password"];

                smtp.UseDefaultCredentials = true;
                smtp.Credentials = networkCred;
                smtp.Port = int.Parse(ConfigurationManager.AppSettings["Port"]);

                smtp.Send(mailMessage);
            }
        }

    }
}