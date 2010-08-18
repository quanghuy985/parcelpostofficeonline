using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
/// <summary>
/// Summary description for MailBL
/// </summary>
public class MailBL
{
	public MailBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void sendEmail(string cusEmail, string subject, string Body)
    {
        MailMessage message = new MailMessage();
        message.From = new MailAddress("onlinepostofficewebmaster@gmail.com");
        message.To.Add(new MailAddress(cusEmail));
        message.Subject = subject;
        message.Body = "To day : " + DateTime.Now.ToLongDateString() + Body;
        SmtpClient client = new SmtpClient();
        client.EnableSsl = true;
        client.Send(message);
    }  
}
