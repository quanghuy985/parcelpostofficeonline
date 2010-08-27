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

public partial class Adminstrator_MagazineManager : System.Web.UI.Page
{
    MagazineBL mgb = new MagazineBL();
    string name;
    string image;
    int status;
    protected void Page_Load(object sender, EventArgs e)
    {
        AdminBL admin = new AdminBL();
        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        else
        {
            string empUserName = Session["User"].ToString();
            if (admin.isAdmin(empUserName))
            {

            }
            else
            {
                Response.Redirect("Message.aspx?content=You don't have permission to use this function");
            }
        }
    }
    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        panel_addnew.Visible = true;
        btn_update.Visible = false;

    }
    protected void btnSumit_Click(object sender, EventArgs e)
    {
        if (FileUpload1.PostedFile.ContentLength < 55555)
        {
            Response.Write("File nho qua");
        }
        else
        {
            String strUpload = Server.MapPath(@"images/" + FileUpload1.FileName);
            FileUpload1.SaveAs(strUpload);
        }
        int count = mgb.insert_magazine(txtmagaName.Text, txtMagaDescrip.Text, FileUpload1.FileName, "admin");
        txtmagaName.Text = "";
        txtMagaDescrip.Text = "";
        Label1.Text = "Ban vua them mot magazine moi";
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        panel_addnew.Visible = true;
        btn_addnew_.Visible = false;
        GridView _gridView = (GridView)sender;       
        int _selectedIndex = int.Parse(e.CommandArgument.ToString());
        lblid.Text = _gridView.Rows[_selectedIndex].Cells[1].Text;
        lblserviecid.Text = _gridView.Rows[_selectedIndex].Cells[2].Text;
        txtmagaName.Text = _gridView.Rows[_selectedIndex].Cells[3].Text;
        txtMagaDescrip.Text = _gridView.Rows[_selectedIndex].Cells[4].Text;      
        lblImage.Text = _gridView.Rows[_selectedIndex].Cells[5].Text;
        if (_gridView.Rows[_selectedIndex].Cells[8].Text == "True")
        {
            ctnstatus.Checked = true;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        if(FileUpload1.FileName==""){
        image=lblImage.Text;
        }
        else{
        image= FileUpload1.FileName;
        }
        if(ctnstatus.Checked=true){
        
        status=1;
        }
        else {
        status=0;
        }
        mgb.update_magazine(Convert.ToInt32(lblid.Text), Convert.ToInt32(lblserviecid.Text), txtmagaName.Text, txtMagaDescrip.Text, image, "admin", status);
        
    }
}
