using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Adminstrator_ServiceDetail : System.Web.UI.Page
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
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            lbUserName.Text = Session["User"].ToString();
        }
        ServiceBL service = new ServiceBL();
        DataTable dt = new DataTable();
        dt = service.getServiceDetailByID(Convert.ToInt32(Request.QueryString["serviceDetailID"].ToString()));
        lbServiceDetail.Text = dt.Rows[0].ItemArray[0].ToString();
        ddlServiceID.SelectedIndex = Convert.ToInt32(dt.Rows[0].ItemArray[1].ToString()) - 1;
        txtServiceDetailName.Text = dt.Rows[0].ItemArray[2].ToString();
        txtDesciption.Text = dt.Rows[0].ItemArray[3].ToString();
        txtPrice.Text = dt.Rows[0].ItemArray[4].ToString();
        imageServiceDetail.ImageUrl = "~/images/" + dt.Rows[0].ItemArray[5].ToString();
        lbImage.Text = dt.Rows[0].ItemArray[5].ToString();
        lbAdmin.Text = dt.Rows[0].ItemArray[6].ToString();
        int index = 0;
        if (dt.Rows[0].ItemArray[7].ToString().Equals("True"))
        {
            index = 0;
        }
        else
        {
            index = 1;
        }
        ddlStatus.SelectedIndex = index;
    }
    protected void btSubmit_Click(object sender, EventArgs e)
    {
        ServiceBL service = new ServiceBL();
        bool result;
        string Image;
        if (fileUpLoad.FileName == "")
        {
            Image = lbImage.Text;
        }
        else
        {
            String strUpload = Server.MapPath(@"~/images/" + fileUpLoad.FileName);
            fileUpLoad.SaveAs(strUpload);
            Image = fileUpLoad.FileName;
        }
        result = service.updateServiceDetail(Convert.ToInt32(lbServiceDetail.Text), Convert.ToInt32(ddlServiceID.SelectedValue), txtServiceDetailName.Text, txtDesciption.Text, Convert.ToDecimal(txtPrice.Text), Image, lbUserName.Text, Convert.ToInt32(ddlStatus.SelectedValue));
        if (result)
        {
            lbOutput.Text = "Successfull";
        }
        else
        {
            lbOutput.Text = "Server is updating. Please try in the next time.";
        }
    }
    protected void btCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ServiceDetailManage.aspx");
    }
}
