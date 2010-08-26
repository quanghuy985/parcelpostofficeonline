using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adminstrator_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            LinkButton1.Visible = false;
        }
        else
        {
            lbUser.Text = Session["User"].ToString();
            LinkButton1.Visible = true;
        }
    }

    protected void Log_out(object sender, CommandEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
