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
    int status1 = 0;
    int status2 = 0;
    int id;
    string image;
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
        Panel1.Visible = true;
        btnaddnew.Visible = false;
        GridView _gridView = (GridView)sender;
        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        id = Convert.ToInt32(_gridView.Rows[_selectedIndex].Cells[2].Text);
        dta = news.view_new_byid(id);
        txttitle.Text = dta.Rows[0].ItemArray[1].ToString();
        txtbrief.Text = dta.Rows[0].ItemArray[2].ToString();
        FCKeditor1.Value = dta.Rows[0].ItemArray[3].ToString();
        lblimage.Text = dta.Rows[0].ItemArray[4].ToString();
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
            String strUpload = Server.MapPath(@"~/images/" + FileUpload1.FileName);
            FileUpload1.SaveAs(strUpload);
        }
        if (ctnstatus.Checked == true)
        {
            status1 = 1;
        }
        else
        {
            status1= 0;
        }
        news.insert_news(txttitle.Text, txtbrief.Text, FCKeditor1.Value, FileUpload1.FileName, "admin", status1);

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (FileUpload1.FileName == "")
        {
            image = lblimage.Text;
        }
        else
        {
            image = FileUpload1.FileName;
        }
        if (ctnstatus.Checked == true)
        {
            status2 = 1;
        }
        else
        {
            status2 = 0;
        }
        news.update_news(id, txttitle.Text, txtbrief.Text, FCKeditor1.Value, image, status2);
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Response.Write("return confirm('Bạn thực sự muốn xóa?')");
    }
}
