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

public partial class Addnews : System.Web.UI.Page
{
   int status=0;
   NewsBL news = new NewsBL();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile.ContentLength < 500)
        {
            Response.Write("File nho qua");
        }
        else
        {
            String strUpload = Server.MapPath(@"images/" + FileUpload1.FileName);
            FileUpload1.SaveAs(strUpload);
        }
        if (ctbStatus.Checked = true)
        {
            status = 1;
        }
        else
        {
            status = 0;
        }
        news.insert_news(txtTittle.Text, txtBrief.Text, FCKeditor1.Value,FileUpload1.FileName, "admin", status);

    }
}
