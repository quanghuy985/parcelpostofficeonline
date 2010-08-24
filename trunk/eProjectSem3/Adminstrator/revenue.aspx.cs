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
        lblorderavailable.Text = re.get_total_order_by_id(0).ToString();
        lblorderfinsh.Text = re.get_total_order_by_id(3).ToString();
        lblparcel.Text = re.get_total_parcel();
        lblparcelavailable.Text = re.get_total_parcel_by_id(0);
        lblparceldelivery.Text = re.get_total_parcel_by_id(3);
        lblparcelneedconfirm.Text = re.get_total_parcel_by_id(1);
        lblparceldenny.Text = re.get_total_parcel_by_id(4);
        lblr_sending.Text = re.get_total_parcel_by_id(2);
        lblrevence.Text = re.get_total_revence();
        resetpanel();
    }
    public void resetpanel()
    {
        paneltotalorder.Visible = false;
        
        panelorderfinish.Visible = false;
        panelorderavailable.Visible = false;
        panel_total_parcel.Visible = false;
        panel_total_pảcel_available.Visible = false;
        panel_total_parcel_confirm.Visible = false;
        panel_total_parcel_delivery.Visible = false;
        panel_total_parcel_sending.Visible = false;
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
        GridView_order_finnish.DataSource = re.get_total_order_by_id(3);
        GridView_order_finnish.DataBind();
    }
    protected void lblrevence_Click(object sender, EventArgs e)
    {
    }
    protected void lblrevence_Command(object sender, CommandEventArgs e)
    {
     //   Paneltotalrevence.Visible = true;
    }
    public void bind_grid_total_order(DateTime startdate, DateTime enddate)
    {
        GridView4.DataSource = re.pc_get_total_order_by_time(startdate, enddate);
        GridView4.DataBind();
    }
    protected void Start_date_SelectionChanged1(object sender, EventArgs e)
    {
        paneltotalorder.Visible = true;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        paneltotalorder.Visible = true;
        if (Convert.ToDateTime(txt_s_date_order.Text) > Convert.ToDateTime(txt_e_date_odrder.Text))
        {
            lbl_eror_order.Text = "start date must be greater than end date";
        }
        else
        {
            bind_grid_total_order(Convert.ToDateTime(txt_s_date_order.Text), Convert.ToDateTime(txt_e_date_odrder.Text));
        }
    }
    protected void btn_filter_order_available_Click(object sender, EventArgs e)
    {
        panelorderavailable.Visible = true;
        if (Convert.ToDateTime(txt_s_date_order_available.Text) > Convert.ToDateTime(txt_e_date_order_available.Text))
        {
            lbl_eror_order_available.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_available.DataSource = re.pc_get_total_order_by_time_id(0, Convert.ToDateTime(txt_s_date_order_available.Text), Convert.ToDateTime(txt_e_date_order_available.Text));
            GridView_available.DataBind();
        }
    }

    protected void btn_finish_Click(object sender, EventArgs e)
    {
        panelorderfinish.Visible = true;
        if (Convert.ToDateTime(txt_s_date_order_available.Text) > Convert.ToDateTime(txt_e_date_order_available.Text))
        {
            lbl_eor_finish.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_order_finnish.DataSource = re.pc_get_total_order_by_time_id(3, Convert.ToDateTime(txt_s_date_order_available.Text), Convert.ToDateTime(txt_e_date_order_available.Text));
            GridView_order_finnish.DataBind();
        }
    }

    protected void lblparcel_Click(object sender, EventArgs e)
    {
        panel_total_parcel.Visible = true;
        GridView_total_parcel.DataSource = re.get_all_parcel();
        GridView_total_parcel.DataBind();
    }
    protected void btn_parcel_Click(object sender, EventArgs e)
    {
        panel_total_parcel.Visible = true;
        if (Convert.ToDateTime(txt_s_date_parcel.Text) > Convert.ToDateTime(txt_e_date_parcel.Text))
        {
            lbl_eor_finish.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_total_parcel.DataSource = re.get_parcel_by_time(Convert.ToDateTime(txt_s_date_order_available.Text), Convert.ToDateTime(txt_e_date_order_available.Text));
            GridView_total_parcel.DataBind();
        }
    }
    protected void lblparcelavailable_Click(object sender, EventArgs e)
    {
        panel_total_pảcel_available.Visible = true;
        GridView_total_parcel_available.DataSource = re.get_parcel_by_id(0);
        GridView_total_parcel_available.DataBind();
    }
    protected void btn_parcel_available_Click(object sender, EventArgs e)
    {
        panel_total_pảcel_available.Visible = true;
        if (Convert.ToDateTime(txt_s_date_parcel_available.Text) > Convert.ToDateTime(txt_e_date_available.Text))
        {
            lbl_eor_parcel_available.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_total_parcel_available.DataSource = re.get_all_parcel_by_time_id(0, Convert.ToDateTime(txt_s_date_parcel_available.Text), Convert.ToDateTime(txt_e_date_available.Text));
            GridView_total_parcel_available.DataBind();
        }
    }

    protected void lblparcelneedconfirm_Click(object sender, EventArgs e)
    {
        panel_total_parcel_confirm.Visible = true;
        GridView_total_parcel_confirm.DataSource = re.get_parcel_by_id(1);
        GridView_total_parcel_confirm.DataBind();
    }
    protected void btn_parcel_confirm_Click(object sender, EventArgs e)
    {
        panel_total_parcel_confirm.Visible = true;
        if (Convert.ToDateTime(txt_s_date_parcel_confirm.Text) > Convert.ToDateTime(txt_e_date_confirm.Text))
        {
            lbl_eor_parcel_confirm.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_total_parcel_confirm.DataSource = re.get_all_parcel_by_time_id(1, Convert.ToDateTime(txt_s_date_parcel_confirm.Text), Convert.ToDateTime(txt_e_date_confirm.Text));
            GridView_total_parcel_confirm.DataBind();
        }
    }
    protected void lblr_sending_Click(object sender, EventArgs e)
    {
        panel_total_parcel_sending.Visible = true;
        GridView_total_parcel_sending.DataSource = re.get_parcel_by_id(2);
        GridView_total_parcel_sending.DataBind();
    }
    protected void btn_parcel_sending_Click(object sender, EventArgs e)
    {
        panel_total_parcel_sending.Visible = true;
        if (Convert.ToDateTime(txt_s_date_parcel_sending.Text) > Convert.ToDateTime(txt_e_date_sending.Text))
        {
            lbl_eor_parcel_sending.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_total_parcel_sending.DataSource = re.get_all_parcel_by_time_id(2, Convert.ToDateTime(txt_s_date_parcel_sending.Text), Convert.ToDateTime(txt_e_date_sending.Text));
            GridView_total_parcel_sending.DataBind();
        }
    }
    protected void lblparceldelivery_Click(object sender, EventArgs e)
    {
        panel_total_parcel_delivery.Visible = true;
        GridView_delvery.DataSource = re.get_parcel_by_id(3);
        GridView_delvery.DataBind();
    }
    protected void btn_parcel_delivery_Click(object sender, EventArgs e)
    {
        panel_total_parcel_delivery.Visible = true;
        if (Convert.ToDateTime(txt_s_date_parcel_delivery.Text) > Convert.ToDateTime(txt_s_date_parcel_delivery.Text))
        {
            lbl_eor_parcel_delivery.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_delvery.DataSource = re.get_all_parcel_by_time_id(3, Convert.ToDateTime(txt_s_date_parcel_delivery.Text), Convert.ToDateTime(txt_s_date_parcel_delivery.Text));
            GridView_delvery.DataBind();
        }
    }
    protected void lblparceldenny_Click(object sender, EventArgs e)
    {
        panel_total_parcel_denny.Visible = true;
        GridView_deny.DataSource = re.get_parcel_by_id(4);
        GridView_deny.DataBind();
    }
    protected void btn_parcel_deny_Click(object sender, EventArgs e)
    {
        panel_total_parcel_denny.Visible = true;
        if (Convert.ToDateTime(txt_s_date_parcel_deny.Text) > Convert.ToDateTime(txt_s_date_parcel_deny.Text))
        {
            lbl_eor_parcel_delivery.Text = "start date must be greater than end date";
        }
        else
        {
            GridView_deny.DataSource = re.get_all_parcel_by_time_id(4, Convert.ToDateTime(txt_s_date_parcel_deny.Text), Convert.ToDateTime(txt_s_date_parcel_deny.Text));
            GridView_deny.DataBind();
        }
    }
    protected void lblrevence5_Click(object sender, EventArgs e)
    {

    }
    protected void lblorderavailable_Click(object sender, EventArgs e)
    {
        panelorderavailable.Visible = true;
        GridView_available.DataSource = re.get_total_order_by_id(0);
        GridView_available.DataBind();
    }
    protected void lbltatalorder_Click(object sender, EventArgs e)
    {

    }
}
