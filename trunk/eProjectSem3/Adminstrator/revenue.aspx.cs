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

public partial class Adminstrator_revenue : System.Web.UI.Page
{
    revenceBL re = new revenceBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        lbltatalorder.Text = re.get_total_order().ToString();
        lblorderavailable.Text = re.get_order_available().ToString();
        lblorderfinsh.Text = re.get_order_finnish().ToString();
        resetpanel();
    }
    public void resetpanel() {
        paneltotalorder.Visible = false;
        Paneltotalrevence.Visible = false;
        panelorderfinish.Visible = false;
        panelorderavailable.Visible = false;
    }

    protected void lbltatalorder_Command(object sender, CommandEventArgs e)
    {
        paneltotalorder.Visible = true;
        GridView4.DataSource = re.get_all_order();
        GridView4.DataBind();
    }
    protected void lblorderavailable_Command(object sender, CommandEventArgs e)
    {
        panelorderavailable.Visible = true;
        GridView_available.DataSource = re.get_all_order_available();
        GridView_available.DataBind();
    }
    protected void lblorderfinsh_Click(object sender, EventArgs e)
    {
        panelorderfinish.Visible = true;
    }
    protected void lblrevence_Click(object sender, EventArgs e)
    {

    }
    protected void lblrevence_Command(object sender, CommandEventArgs e)
    {
        Paneltotalrevence.Visible = true;
    }
    protected void Start_date_SelectionChanged(object sender, EventArgs e)
    {
        paneltotalorder.Visible = true;
        bind_grid_total_order(Convert.ToDateTime(Start_date.SelectedDate) ,Convert.ToDateTime(end_date.SelectedDate));
        
    }
    public void bind_grid_total_order(DateTime startdate,DateTime enddate) {
        GridView4.DataSource = re.pc_get_total_order_by_time(startdate, enddate);
        GridView4.DataBind();
    }
    protected void Start_date_SelectionChanged1(object sender, EventArgs e)
    {
        paneltotalorder.Visible = true;        
    }
    protected void end_date1_SelectionChanged(object sender, EventArgs e)
    {
        paneltotalorder.Visible = true;
        bind_grid_total_order(Convert.ToDateTime(Start_date_1.SelectedDate), Convert.ToDateTime(end_date1.SelectedDate));
        
    }
    public void bind_grid_total_order_available(DateTime startdate1, DateTime enddate1)
    {
        GridView4.DataSource = re.pc_get_total_order_available_by_time(startdate1, enddate1);
        GridView4.DataBind();
    }
}
