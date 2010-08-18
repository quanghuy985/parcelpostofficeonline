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

public partial class NewsDetail : System.Web.UI.Page
{
    DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        NewsBL news = new NewsBL();
        dt = news.viewNewsDetail(Convert.ToInt32(Request.QueryString["id"].ToString()));
        rptNewsDetail.DataSource = dt;
        rptNewsDetail.DataBind();
        bindGrid();
    }
    private void bindGrid()
    {
        NewsBL news = new NewsBL();
        dt = news.view10News();
        rptNewsFooter.DataSource = dt;
        rptNewsFooter.DataBind();
    }
    protected void rptNewsDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
    {

    }
}
