using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Adminstrator_OrderManage : System.Web.UI.Page
{
    string district = null;
    string city = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGrid();
        }
       
    }
    public void bindGrid()
    {
        DataTable dt = new DataTable();
        AdminBL admin = new AdminBL();
        OrderManageBL order = new OrderManageBL();
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string empUserName = Session["User"].ToString();
            if (admin.isAdmin(empUserName))
            {
                Response.Redirect("revenue.aspx");
            }
            else
            {

                dt = order.getBranchForEmployee(empUserName);
                if (dt.Rows.Count != 0)
                {
                    district = dt.Rows[0].ItemArray[0].ToString();
                    city = dt.Rows[0].ItemArray[1].ToString();
                    Session["district"] = district;
                    Session["city"] = city;
                    DataTable dtOrderAvailable = new DataTable();
                    dtOrderAvailable = order.viewOrderByBranch(district, city, 0);
                    lbSumOrderAvailable.Text = dtOrderAvailable.Rows.Count.ToString();
                    DataTable dtOrderNeedConfirm = new DataTable();
                    dtOrderNeedConfirm = order.viewOrderByBranch(district, city, 1);
                    lbSumOrderNeedConfirm.Text = dtOrderNeedConfirm.Rows.Count.ToString();
                    DataTable dtOrderSending = new DataTable();
                    dtOrderSending = order.viewOrderByBranch(district, city, 2);
                    lbSumOrderSending.Text = dtOrderSending.Rows.Count.ToString();
                    DataTable dtOrderDelivery = new DataTable();
                    dtOrderDelivery = order.viewOrderByBranch(district, city, 3);
                    lbSumOrderDelivery.Text = dtOrderDelivery.Rows.Count.ToString();
                    DataTable dtOrderDeny = new DataTable();
                    dtOrderDeny = order.viewOrderByBranch(district, city, 4);
                    lbSumOrderDeny.Text = dtOrderDeny.Rows.Count.ToString();
                }
            }
        }
    }
    public void lbtSumOrderAvailableComand(object sender,CommandEventArgs e)
    {
       
        Session["status"] = "0";
        Response.Redirect("OrderManageDetail.aspx");
       
    }
    public void lbtSumOrderNeedConfirmComand(object sender, CommandEventArgs e)
    {
        Session["status"] = "1";
        Response.Redirect("OrderManageDetail.aspx");
    }
    public void lbSumOrderSendingComand(object sender, CommandEventArgs e)
    {
        Session["status"] = "2";
        Response.Redirect("OrderManageDetail.aspx");
    }
    public void lbSumOrderDeliveryComand(object sender, CommandEventArgs e)
    {
        Session["status"] = "3";
        Response.Redirect("OrderManageDetail.aspx");
    }
    public void lbSumOrderDenyComand(object sender, CommandEventArgs e)
    {
        Session["status"] = "4";
        Response.Redirect("OrderManageDetail.aspx");
    }
}
