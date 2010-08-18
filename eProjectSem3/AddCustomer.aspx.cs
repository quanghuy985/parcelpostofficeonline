using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Mail;

public partial class AddCustomer : System.Web.UI.Page
{

    CustomerBL cusBL=new CustomerBL();


    protected void Page_Load(object sender, EventArgs e)
    {
        txtUsername.Text = Request.QueryString["UserName"];
    }

    private void sendMail()
    {
        MailMessage message = new MailMessage();
        message.From = new MailAddress("@gmail.com");
        message.To.Add(new MailAddress(txtEmail.Text));
        message.Subject = "You registed successful!";
        message.Body = "To day" + DateTime.Now.ToShortDateString();

        SmtpClient smtp = new SmtpClient();
        smtp.EnableSsl = true;

        smtp.Send(message);
    }
    protected void Label6_Click(object sender, EventArgs e)
    {
        //if (cusBL.CheckExistCustomer(txtUsername.Text).Rows.Count ==1)
        //{
        //    lblMss.Text = "User existed !";
        //    lblMss.Focus();
        //}
        //else if(cusBL.CheckExistCustomer(txtUsername.Text).Rows.Count ==0)
        //{

            cusBL.AddCustomer(txtUsername.Text, txtPassword.Text, txtFullname.Text, txtAddress.Text, txtEmail.Text);
            sendMail();
            Response.Redirect("Loading.aspx");
        //}
    }
}
