using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adminstrator_ServiceDetailManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AdminBL admin = new AdminBL();
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string empUserName = Session["User"].ToString();
            if (admin.isAdmin(empUserName))
            {
                
            }
            else
            {
                string message = "You haven't permission to use this function";
                Response.Redirect("message.aspx?message=" + message);
            }
        }

    }
    public void btSelectComand(object sender, CommandEventArgs e)
    {
     //   Response.Redirect("ServiceDetail.aspx?serviceDetailID="+e.CommandArgument.ToString());
        Response.Redirect("Home.aspx");
    }
    protected void gvServiceDetail_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
