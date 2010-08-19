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
using System.Net;

public partial class Adminstrator_FeedBackManage : System.Web.UI.Page
{
    FeedBackBL objFeed = new FeedBackBL();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.Count == 0)
        {
            Response.Redirect("Default.aspx");
        }
        else
        {
            lbUserName.Text = Session["User"].ToString();
        }
        if (!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        gvFeedBack.DataSource = objFeed.getAllFeedBack();

        gvFeedBack.DataBind();
    }
    [System.Web.Services.WebMethod]
    public static bool sendmail(string id, string email, string body)
    {
        FeedBackBL obj = new FeedBackBL();
        MailBL objMail = new MailBL();
        if (obj.sendfeedback(Convert.ToInt32(id), body) > 0)
        {
            objMail.sendEmail(email, "Reply From PostOffice Online", body);

            return true;
        }
        else
        {
            return false;
        }



    }
    public void Lock(object sender, CommandEventArgs e)
    {
        string acc=e.CommandArgument.ToString();
        if (objFeed.LockAccount(acc) > 0)
        {
            if (objFeed.DeleteFeedBackByCusName(acc) > 0)
            {
                bind();
                lbReturn.Text = "Lock Successfull !";
            }
            else
            {
                lbReturn.Text = "Unsuccess";
            }
        }
        else
        {
            lbReturn.Text = "Error";
        }
    }
    public void Delete(object sender, CommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        if (objFeed.DeleteFeedBack(Convert.ToInt32(id)) > 0)
        {
            bind();
            lbReturn.Text = "Delete Successfull !";
        }
        else
        {
            lbReturn.Text = "Unsuccess";
        }
    }
}
