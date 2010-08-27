using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class DiscountDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGridDiscount();
        }
    }
    public void bindGridDiscount()
    {
        
        DataTable dt = new DataTable();
        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        dt = discount.getDiscountByID(Convert.ToInt32(Request.QueryString["discountID"].ToString()));
        lbDiscountID.Text = dt.Rows[0].ItemArray[0].ToString();
        txtDiscountName.Text = dt.Rows[0].ItemArray[1].ToString();
        txtDiscountBrief.Text = dt.Rows[0].ItemArray[2].ToString();
        txtDiscountContent.Text = dt.Rows[0].ItemArray[3].ToString();
        lbImage.Text = dt.Rows[0].ItemArray[4].ToString();
        discountImage.ImageUrl = "~/images/" + dt.Rows[0].ItemArray[4].ToString();
        txtPrice.Text = dt.Rows[0].ItemArray[5].ToString();
        int index = 0;
        if (dt.Rows[0].ItemArray[6].ToString().Equals("True"))
        {
            index = 1;
        }
        else
        {
            index = 0;
        }
        ddlStatus.SelectedIndex = index;
    }
    protected void btSubmit_Click(object sender, EventArgs e)
    {
        string Image = null;
        bool result;
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
        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        result = discount.UpdateDiscountByID(Convert.ToInt32(lbDiscountID.Text), txtDiscountName.Text, txtDiscountBrief.Text, txtDiscountContent.Text, Image, Convert.ToDecimal(txtPrice.Text), Convert.ToInt32(ddlStatus.SelectedValue));
        if (result)
        {
            lbOutput.Text = "Success";
        }
        else
        {
            lbOutput.Text = "Server is updating, Please try in the next time";
        }
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("DiscountManage.aspx");
    }
}
