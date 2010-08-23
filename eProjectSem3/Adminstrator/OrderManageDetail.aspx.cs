using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Adminstrator_OrderManageDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        OrderManageBL order = new OrderManageBL();
       
        int status = Convert.ToInt32(Session["status"].ToString());
        DataTable dt = new DataTable();
        dt = order.viewOrderByBranch(Session["district"].ToString(), Session["city"].ToString(), Convert.ToInt32(Session["status"].ToString()));
        gvOrderManageDetail.DataSource = order.viewOrderByBranch(Session["district"].ToString(), Session["city"].ToString(), Convert.ToInt32(Session["status"].ToString()));
        gvOrderManageDetail.DataBind();
      }
    public void lbtSelectCommand(Object sender, CommandEventArgs e)
    {
        Response.Redirect("UpdateOrder.aspx?orderDetailID=" + e.CommandArgument.ToString());
    }
}
