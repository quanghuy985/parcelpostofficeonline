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

public partial class Adminstrator_newmanager : System.Web.UI.Page
{
    int status = 0;
    NewsBL news = new NewsBL();
    DataTable dta = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        btnupdate.Visible = false;
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;
        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        Panel1.Visible = true;
        int id=Convert.ToInt32(_gridView.Rows[_selectedIndex].Cells[1].Text);
        dta = news.view_new_byid(id);
        txttitle.Text = dta.Rows[0].ItemArray[1].ToString();
        txtbrief.Text = dta.Rows[0].ItemArray[2].ToString();
        FCKeditor1.Value = dta.Rows[0].ItemArray[3].ToString();
        if (dta.Rows[0].ItemArray[6] == "True")
        {
            ctnstatus.Checked = true;
        }

    }
    protected void btnaddnew_Click(object sender, EventArgs e)
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
        if (ctnstatus.Checked = true)
        {
            status = 1;
        }
        else
        {
            status = 0;
        }
        news.insert_news(txttitle.Text, txtbrief.Text, FCKeditor1.Value, FileUpload1.FileName, "admin", status);

    }
}
