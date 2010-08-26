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

public partial class MagazineDetail : System.Web.UI.Page
{
    private DataTable dt;
    private DataTable dt1;
    MagazineBL mgb = new MagazineBL();
    protected void Page_Load(object sender, EventArgs e)
    {
      dt1=  mgb.view_magazine_byID(Convert.ToInt32(Request.QueryString["magaid"]));
        lblname.Text=dt1.Rows[0].ItemArray[2].ToString();
        lbldecription.Text=dt1.Rows[0].ItemArray[3].ToString();
        Image2.ImageUrl = "images/"+dt1.Rows[0].ItemArray[4].ToString();
        lblId.Text = dt1.Rows[0].ItemArray[0].ToString();
    }
   
        public void addCart(object sender, CommandEventArgs e)
    {

        MagazineBL mgb = new MagazineBL();

        MagazineEN mge = new MagazineEN();
        dt = mgb.view_magazine_byID(Convert.ToInt32(lblId.Text));
        ArrayList cart;

        if (dt.Rows.Count != 0)
        {
            mge.MagazineDailyID = Convert.ToInt32(lblId.Text); ;
            mge.ServiceID = Convert.ToInt32(dt.Rows[0].ItemArray[1].ToString());
            mge.MagazineName = dt.Rows[0].ItemArray[2].ToString();
            mge.MonthMagazineDaily = 1;
            mge.MagazinePrice = Convert.ToDecimal(dt.Rows[0].ItemArray[1].ToString());
        }
        if (Session["ShoppingCart"] != null)
        {
            cart = (ArrayList)Session["ShoppingCart"];
            int n = cart.Count, j = -1;
            for (int i = 0; i < n; i++)
            {
                if (((MagazineEN)cart[i]).MagazineDailyID == Convert.ToInt32(lblId.Text))
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
}
