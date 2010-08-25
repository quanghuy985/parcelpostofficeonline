using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Adminstrator_UpdateOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindGrid();
        }
    }
    public void bindGrid()
    {
        lbEmpUserName.Text = Session["User"].ToString();
        DataTable dt = new DataTable();
        OrderManageBL order = new OrderManageBL();
        dt = order.viewOrderByID(Convert.ToInt32(Request.QueryString["orderDetailID"].ToString()));
        lbOrderDetailID.Text = Request.QueryString["orderDetailID"].ToString();
        lbCustomerName.Text = dt.Rows[0].ItemArray[0].ToString();
        lbServiceDetailName.Text = dt.Rows[0].ItemArray[17].ToString();
        lbParcelPostName.Text = dt.Rows[0].ItemArray[16].ToString();
        lbParcelFromAddress.Text = dt.Rows[0].ItemArray[4].ToString();
        lbParcelFromDistrict.Text = dt.Rows[0].ItemArray[3].ToString();
        lbParcelFromCity.Text = dt.Rows[0].ItemArray[5].ToString();
        lbDiscountName.Text = dt.Rows[0].ItemArray[1].ToString();
        lbParcelToAddress.Text = dt.Rows[0].ItemArray[6].ToString();
        lbParcelToDistrict.Text = dt.Rows[0].ItemArray[7].ToString();
        lbParcelToCity.Text = dt.Rows[0].ItemArray[8].ToString();
        txtWeight.Text = dt.Rows[0].ItemArray[9].ToString();
        txtAdditionalFee.Text = dt.Rows[0].ItemArray[10].ToString();
        txtDiscount.Text = dt.Rows[0].ItemArray[11].ToString();
        lbTotalAmount.Text = dt.Rows[0].ItemArray[12].ToString();
        lbDateOrder.Text = dt.Rows[0].ItemArray[13].ToString();
        lbDateTreat.Text = dt.Rows[0].ItemArray[14].ToString();
        ddlStatus.SelectedIndex = Convert.ToInt32(dt.Rows[0].ItemArray[15].ToString());
        lbParcelPostPrice.Text = dt.Rows[0].ItemArray[18].ToString();
        lbOrderID.Text = dt.Rows[0].ItemArray[19].ToString();
        if (Session["status"].ToString().Equals("0"))
        {
            
            ddlStatus.Items[2].Enabled = false;
            ddlStatus.Items[3].Enabled = false;
        }
        else
            if (Session["status"].ToString().Equals("1"))
            {
                ddlStatus.Enabled = false;

            }
            else if (Session["status"].ToString().Equals("2"))
            {
                txtDiscount.Enabled = false;
                txtAdditionalFee.Enabled = false;
                txtWeight.Enabled = false;
                ddlStatus.Items[0].Enabled = false;
                ddlStatus.Items[1].Enabled = false;
            }
            else if (Session["status"].ToString().Equals("3"))
            {
                txtDiscount.Enabled = false;
                txtAdditionalFee.Enabled = false;
                txtWeight.Enabled = false;
                ddlStatus.Enabled = false;
                
            }
            else if (Session["status"].ToString().Equals("4"))
            {
                txtDiscount.Enabled = false;
                txtAdditionalFee.Enabled = false;
                txtWeight.Enabled = false;
                ddlStatus.Enabled = false;
                
            }
    }
    [System.Web.Services.WebMethod]
    public static String btSubmitClick(string parcelWeight, string status, string addFee, string discountPrice, string orderDetailID, string orderID, string empUserName, string totalAmount)
    {
        OrderManageBL order = new OrderManageBL();
        bool result = order.UpdateOrderParcel(Convert.ToInt32(orderDetailID), Convert.ToDecimal(parcelWeight), Convert.ToDecimal(addFee), Convert.ToDecimal(discountPrice), Convert.ToDecimal(totalAmount), Convert.ToInt32(status), Convert.ToInt32(orderID), empUserName);
        if (result == true)
        {
            return "Successful";
        }
        else
        {
            return "System is updating! Please try in the next time";
        }
    }
    [System.Web.Services.WebMethod]
    public static String txtWeightChanged(string parcelWeight, string parcelPostPrice, string addFee, string discountPrice)
    {
        int result = Convert.ToInt32(parcelWeight) * Convert.ToInt32(parcelPostPrice) + Convert.ToInt32(addFee) - Convert.ToInt32(discountPrice);
        return result.ToString();

    }
 
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("OrderManageDetail.aspx");
    }
}
