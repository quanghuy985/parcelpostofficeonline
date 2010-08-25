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

    protected void btSubmit_Click(object sender, EventArgs e)
    {
        ServiceBL service = new ServiceBL();
        string Image = null;
        if (fileUpLoad.FileName == "")
        {
            Image = null;
        }
        else
        {
            String strUpload = Server.MapPath(@"~/images/" + fileUpLoad.FileName);
            fileUpLoad.SaveAs(strUpload);
            Image = fileUpLoad.FileName;
        }
        bool result = service.InsertServiceDetail(Convert.ToInt32(ddlServiceID.SelectedValue), txtServiceDetailName.Text, txtServiceDescription.Text, Convert.ToDecimal(txtPrice.Text), Image, Convert.ToInt32(ddlStatus.SelectedValue), Session["User"].ToString());
        if (result)
        {
            lbOutput.Text = "Successfull!";
        }
        else
        {
            lbOutput.Text = "Server is updating, please try in the next time";
        }
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Home.aspx");
    }
}
