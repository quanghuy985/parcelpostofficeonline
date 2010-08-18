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

public partial class Adminstrator_magazinOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;       
        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
       // txttitle.Text = _gridView.Rows[_selectedIndex].Cells[2].Text;
        int a = Convert.ToInt32(_gridView.Rows[_selectedIndex].Cells[1].Text);
        MagazineBL mgb = new MagazineBL();
      rpt_magazine.DataSource=  mgb.view_order_byId(a);
      rpt_magazine.DataBind();
    }
    public void updateCart(object sender, CommandEventArgs e)
    { }
    public void deleteCart(object sender, CommandEventArgs e)
    { }
    
}
