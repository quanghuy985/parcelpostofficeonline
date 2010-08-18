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

public partial class Default2 : System.Web.UI.Page
{
    private DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
      
        loadFooter();
        bind();
        bindGrid();
    }
    private void loadFooter()
    {
        NewsBL news = new NewsBL();
        dt = news.View3News();
        rptListNewsFooter.DataSource = dt;
        rptListNewsFooter.DataBind();
    }
    private void bind()
    {
        NewsBL news = new NewsBL();
        dt = news.ViewHotNews();
        rptNews.DataSource = dt;
        rptNews.DataBind();
    }
    private void bindGrid()
    {
        NewsBL news = new NewsBL();
        dt = news.view10News();
        rptNewsFooter.DataSource = dt;
        rptNewsFooter.DataBind();
    }
    public void More(object sender, CommandEventArgs e)
    {
        Response.Redirect("NewsDetail.aspx?newsID=" + e.CommandArgument.ToString());
    }
}
