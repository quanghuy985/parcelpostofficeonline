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

public partial class admin_Update_news : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
       // Label1.Text = GridView1.Rows[e.NewEditIndex].FindControl("newsID").ToString(); 
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
      //  Label1.Text = GridView1.Rows[e.RowIndex].FindControl("newsID").ToString(); 
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        GridView _gridView = (GridView)sender;

        // Get the selected index and the command name
        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
       // Label1.Text= _gridView.Rows[_selectedIndex].Cells[1].Text;
        Panel1.Visible = true;
        txttitle.Text = _gridView.Rows[_selectedIndex].Cells[2].Text;
        txtbrief.Text = _gridView.Rows[_selectedIndex].Cells[3].Text;
        FCKeditor1.Value = _gridView.Rows[_selectedIndex].Cells[4].Text;
        //FileUpload1. = _gridView.Rows[_selectedIndex].Cells[5].Text;
                //CheckBox cb = (CheckBox)row.FindControl("newsStatus");
                //ctnstatus.Text = cb.Checked.ToString();
        if (_gridView.Rows[_selectedIndex].Cells[8].Text == "True") {
           ctnstatus.Checked = true;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       // Label1.Text = Convert.ToString(this.GridView1.DataKeys[this.GridView1.SelectedIndex].Value);
        
    }
}
