using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
public partial class Adminstrator_Default : System.Web.UI.Page
{
    AdminBL AB = new AdminBL();
    EmployeeManageBL employee = new EmployeeManageBL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = new DataTable();
        dt = employee.isEmployee(txtUserName.Text,txtPassword.Text);

        if (AB.isAdmin(txtUserName.Text))
        {
            int intAdmin = 0;
            intAdmin = AB.Login(txtUserName.Text, txtPassword.Text);
            if (intAdmin > 0)
            {
                Session["User"] = txtUserName.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbError.Text = "Invalid Username or Password!";
            }
            
        }
        else 
        if (dt.Rows.Count != 0)
        {
            bool x = Convert.ToBoolean(dt.Rows[0].ItemArray[8].ToString());
            if (x)
            {
                Session["User"] = txtUserName.Text;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lbError.Text = "Your Account have been locked! please contact your admin";
            }
        }
        else
        {
            lbError.Text = "Invalid Username or Password! please contact your admin to get password";
        }

    }
}
