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
using System.Net.Mail;
public partial class eProjectSem3_ResumePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void sendMail(string Email, string Password)
    {
        MailMessage message = new MailMessage();
        message.From = new MailAddress("@gmail.com");
        message.To.Add(new MailAddress(Email));
        message.Subject = "Hey! Man";
        message.Body = "Password Tài khoản:" + txtUserName.Text + " là :" + Password ;
        SmtpClient client = new SmtpClient();
        client.EnableSsl = true;
        client.Send(message);
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        CustomerBL cus = new CustomerBL();
        DataTable dtTable = new DataTable();
        dtTable = cus.ResumePassword(txtUserName.Text);
        string Password;
        string Email;
        //if (dtTable.Rows.Count == 0)
        //{
        //    lbError.Text = "Sai tên Tài khoản! Vui lòng nhập lại hoặc đăng ký tài khoản này";

        //}
        //else
        //{
        //    Password = dtTable.Rows[0].ItemArray[1];
        //    Email = dtTable.Rows[0].ItemArray[4];
        //    sendMail(Email , Password);

        //}

    }
}
