using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        bindGidDiscount();
        bindGridAdvertising();
    }
    public void bindGidDiscount()
    {
        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        DataTable dt = new DataTable();
        dt = discount.view2Discount();
        lbDiscount1.Text = dt.Rows[0].ItemArray[1].ToString();
        lbDiscount2.Text = dt.Rows[1].ItemArray[1].ToString();
        lbDiscountID1.Text = dt.Rows[0].ItemArray[0].ToString();
        lbDiscountID2.Text = dt.Rows[1].ItemArray[0].ToString();
        string discountImageURL1 = "~/images/" + dt.Rows[0].ItemArray[4].ToString();
        string discountImageURL2 = "~/images/" + dt.Rows[1].ItemArray[4].ToString();
        ImageDiscount1.ImageUrl = discountImageURL1;
        ImageDiscount2.ImageUrl = discountImageURL2;
        lbPrice1.Text = dt.Rows[0].ItemArray[5].ToString() +"$";
        lbPrice2.Text = dt.Rows[1].ItemArray[5].ToString()+"$";
        if (Session["User"] == null)
        {
            LinkButton1.Visible = false;
        }
        else
        {
            lbluser.Text = Session["User"].ToString();
            LinkButton1.Visible = true;
        }
    }
    public void bindGridAdvertising()
    {

        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        DataTable dt = new DataTable();
        dt = discount.view2Advertising();
        lbAdvertising1.Text = dt.Rows[0].ItemArray[1].ToString();
        lbAdvertising2.Text = dt.Rows[1].ItemArray[1].ToString();
        lbAdvertisingURL1.Text = dt.Rows[0].ItemArray[5].ToString();
        lbAdvertisingURL2.Text = dt.Rows[1].ItemArray[5].ToString();
        string advertisingImageURL1 = "~/images/" + dt.Rows[0].ItemArray[4].ToString();
        ImageAdvertising1.ImageUrl = advertisingImageURL1;
        ImageAdvertising2.ImageUrl = "~/images/" + dt.Rows[1].ItemArray[4].ToString();
        lbContact1.Text = "8686868";
        lbContact2.Text = "8686868";
        
    }
    protected void lbtDiscount1_Click(object sender, EventArgs e)
    {
        Session["discountID"] = lbDiscountID1.Text;
        Response.Redirect("ParcelPostOfficeServiceDetail.aspx");
    }
    protected void lbtAdvertising1_Click(object sender, EventArgs e)
    {
        Response.Redirect(lbAdvertisingURL1.Text);
    }
    protected void lbtAdvertising2_Click(object sender, EventArgs e)
    {
        Response.Redirect(lbAdvertisingURL2.Text);
    }
    protected void lbtDiscount2_Click(object sender, EventArgs e)
    {
        Session["discountID"] = lbDiscountID2.Text;
        Response.Redirect("ParcelPostOfficeServiceDetail.aspx");
    }
    protected void log_out(object sender, CommandEventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
