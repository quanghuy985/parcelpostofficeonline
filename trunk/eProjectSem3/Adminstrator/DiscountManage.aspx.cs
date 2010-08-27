using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Adminstrator_DiscountManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindGid();
    }
    public void bindGid()
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
                Response.Redirect("Message.aspx?content=You don't have permission to use this function");
            }
        }
    }
    protected void btSubmit_Click(object sender, EventArgs e)
    {

        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        string Image = null;
        if (fileUpload.FileName == "")
        {
            Image = lbImage.Text;
        }
        else
        {
            String strUpload = Server.MapPath(@"~/images/" + fileUpload.FileName);
            fileUpload.SaveAs(strUpload);
            Image = fileUpload.FileName;
        }
        bool Result = discount.InsertDiscount(txtDiscountName.Text, txtDiscountBrief.Text, txtDiscountContent.Text, Image, Convert.ToDecimal(txtDiscountPrice.Text), Convert.ToInt32(ddlStatus.SelectedValue));
        if (Result)
        {
            lbOutput.Text = "Success";


        }
        else
        {
            lbOutput.Text = "Server is updating! Please try again in the next time";

        }
    }
}
