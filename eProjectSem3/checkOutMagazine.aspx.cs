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

public partial class checkOutMagazine : System.Web.UI.Page
{
    MagazineBL mgb = new MagazineBL();
    private DataTable dta;
    ArrayList cart;
    protected void Page_Load(object sender, EventArgs e)
    {
            dta= mgb.view_service_detail();       
           DropDownList1.DataSource = dta;
           DropDownList1.DataTextField = "serviceDetailName";
           DropDownList1.DataValueField = "serviceDetailID";
           DropDownList1.DataBind();          
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         cart =(ArrayList)Session["ShoppingCart"];
        MagazineBL mgb = new MagazineBL();
        mgb.insert_Order_detail("quan", cart, txtadress.Text, Convert.ToInt32(DropDownList1.SelectedValue.ToString()));
    }
}
