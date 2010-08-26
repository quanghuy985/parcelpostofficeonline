using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class eProjectSem3_eProjectSem3_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        CustomerBL cus = new CustomerBL();
        DataTable dtTableName = new DataTable();
        dtTableName = cus.CheckExistCustomer(txtUserName.Text);
        DataTable dtTableUser = new DataTable();
          if (dtTableName.Rows.Count == 0)
        {
            lbError.Text = "Wrong username! Please login again !";
            
        }
        else
        {
            
            dtTableUser = cus.CheckCustomerLogin(txtUserName.Text, txtPassword.Text);
            if (dtTableUser.Rows.Count == 0)
            {
                lbError.Text = "Wrong password !";
            }
            else
            {
                if (Convert.ToInt32(dtTableName.Rows[0].ItemArray[6]) == 0)
                {
                    lbError.Text = "Your account is not activated!";
                }
                else
                {
                   
                    Session["User"] = txtUserName.Text;

                    Response.Redirect("ParcelPostOfficeServiceDetail.aspx");


                }
            }
        }
    }
    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddCustomer.aspx?UserName=" + txtUserName.Text);
    }
    protected void lbtnforgetPassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("ResumePassword.aspx");
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtUserName.Text = "";
        txtPassword.Text = "";
    }

}

