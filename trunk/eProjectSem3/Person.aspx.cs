using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Person : System.Web.UI.Page
{
    CustomerBL CuBL = new CustomerBL();
    DataTable dtt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hideallpanel();
            Session["User"] = "quanghuy985";
        }
        
    }
    public void hideallpanel()
    {
        Panel4.Visible = false;
        Panel5.Visible = false;
        Panel3.Visible = false;

    }
    public void AccountInfomation()
    {
        DataTable dt = new DataTable();
        dt = CuBL.CheckExistCustomer(Session["User"].ToString());
        lbUser.Text = dt.Rows[0].ItemArray[0].ToString();
        txtFullname.Text = dt.Rows[0].ItemArray[2].ToString();
        txtAddress.Text = dt.Rows[0].ItemArray[3].ToString();
        txtEmailInfo.Text = dt.Rows[0].ItemArray[4].ToString();
    }
    public void bindAvailable(int i)
    {
        string username=Session["User"].ToString();
        dtt = CuBL.getOrderByCus(username, i);
        rptAvailable.DataSource = dtt;
        rptAvailable.DataBind();
    }
    public void bindPending()
    {
        string username = Session["User"].ToString();
        dtt = CuBL.getOrderByCus(username, 1);
        rptPending.DataSource = dtt;
        rptPending.DataBind();
    }
    //public void bindSending()
    //{
    //    string username = Session["User"].ToString();
    //    dtt = CuBL.getOrderByCus(username, 2);
    //    rptSending.DataSource = dtt;
    //    rptSending.DataBind();
    //}
    //public void bindDelivery()
    //{
    //    string username = Session["User"].ToString();
    //    dtt = CuBL.getOrderByCus(username, 3);
    //    rptDelivery.DataSource = dtt;
    //    rptDelivery.DataBind();
    //}
    //public void bindDeny()
    //{
    //    string username = Session["User"].ToString();
    //    dtt = CuBL.getOrderByCus(username, 4);
    //    rptDeny.DataSource = dtt;
    //    rptDeny.DataBind();
    //}
    protected void Button3_Click(object sender, EventArgs e)
    {
        ResetTextBox();
    }
    public void ResetTextBox()
    {
        txtComPass.Text="";
        txtNewPass.Text="";
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        if (txtToDate.Text == "")
        {
            Label1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
            if (txtFromDate.Text == "")
            {
                Label2.Visible = true;
            }
            else
            {
                Label2.Visible = false;
                if (DateTime.Compare(DateTime.Parse(txtToDate.Text), DateTime.Parse(txtFromDate.Text)) > 0)
                {
                    lbErrorMess.Visible = true;
                    lbErrorMess.Text = "From date must be less than to date !";
                }
                else
                {
                    lbErrorMess.Visible = false;
                }
            }
        }


        
    }
    public void DetailTranf(object sender, CommandEventArgs e)
    {
        string orderdetailid =e.CommandArgument.ToString();
        int n = dtt.Rows.Count;

        for (int i = 0; i < n; i++)
        {
            string getName =  Convert.ToString(dtt.Rows[i]["orderDetailID"]);
            if (getName.IndexOf(orderdetailid, StringComparison.CurrentCultureIgnoreCase) >= 0)
            {
                
                Label4.Text = dtt.Rows[i]["parcelToCity"].ToString();

            }
        }
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (txtNewPass.Text.Equals(String.Empty) && txtComPass.Text.Equals(String.Empty))
        {
            Label13.Text = "Not empty";
        }
        {
            Label13.Visible = false;
            CuBL.changepass(Session["User"].ToString().Trim(), txtNewPass.Text.Trim());
        }
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
        AccountInfomation();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {

        int i = CuBL.UpdateAccoountInformation(Session["User"].ToString().Trim(), txtFullname.Text.Trim(), txtAddress.Text.Trim(), txtEmailInfo.Text.Trim());
        if (i > 0)
        {
            messeginfo.Visible = true;
            messeginfo.Text = "Change information successful !";
        }
        else
        {
            messeginfo.Visible = true;
            messeginfo.Text = " Change information unsuccessful !";
        }
        AccountInfomation();
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        hideallpanel();
        AccountInfomation();
        Panel4.Visible = true;
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        hideallpanel();
        Panel3.Visible = true;
    }
    protected void LinkButton4_Click(object sender, EventArgs e)
    {
        hideallpanel();
        Panel5.Visible = true;
        bindPending();
        
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
        
        Label5.Text = Label4.Text;
    }
}
