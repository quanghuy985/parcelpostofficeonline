using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Data;
public partial class Magazine : System.Web.UI.Page
{
    private DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        bind();
    }
    private void bind()
    {
        MagazineBL magazine = new MagazineBL();
        dt = magazine.view_magazine();
        rpt_magazine.DataSource = dt;
        rpt_magazine.DataBind();
    }
    public void addCart(object sender, CommandEventArgs e)
    {

        MagazineBL mgb = new MagazineBL();

        MagazineEN mge = new MagazineEN();
        dt = mgb.view_magazine_byID(Convert.ToInt32(e.CommandArgument.ToString()));
        ArrayList cart;

        if (dt.Rows.Count != 0)
        {
            mge.MagazineDailyID = Convert.ToInt32(e.CommandArgument.ToString()); ;
            mge.ServiceID = Convert.ToInt32(dt.Rows[0].ItemArray[1].ToString());
            mge.MagazineName = dt.Rows[0].ItemArray[2].ToString();
            mge.MonthMagazineDaily = 1;
        }
        if (Session["ShoppingCart"] != null)
        {
            cart = (ArrayList)Session["ShoppingCart"];
            int n = cart.Count, j = -1;
            for (int i = 0; i < n; i++)
            {
                if (((MagazineEN)cart[i]).MagazineDailyID == Convert.ToInt32(e.CommandArgument.ToString()))
                {
                    j = i;
                }
            }
            if (j > -1)
            {
                cart.RemoveAt(j);
            }
            cart.Add(mge);
        }
        else
        {
            cart = new ArrayList();
            cart.Add(mge);
        }
        Session["ShoppingCart"] = cart;

    }
    public void viewDetails(object sender, CommandEventArgs e)
    {
        Response.Redirect("MagazineDetail.aspx?magaid="+e.CommandArgument.ToString());
    }

    protected void rpt_magazine_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        
    }
}
