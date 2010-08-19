using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adminstrator_Default : System.Web.UI.Page
{
    AdminBL AB = new AdminBL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (AB.Login(txtUserName.Text, txtPassword.Text) > 0)
        {
            Session["User"] = txtUserName.Text;
            Response.Redirect("FeedBackManage.aspx");
        }
        else
        {
            Label1.Text = "Loi Roi day cu a";
        }

    }
}
