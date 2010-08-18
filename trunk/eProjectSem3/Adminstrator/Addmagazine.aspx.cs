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
using System.IO;
using System.Data.OleDb;
public partial class Addmagazine : System.Web.UI.Page
{
    MagazineBL mgb = new MagazineBL();
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
      //  Controls.Clear();
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
        int count=  mgb.insert_magazine(txtmagaName.Text, txtMagaDescrip.Text,FileUpload1.FileName, "admin");
        txtmagaName.Text = "";
        txtMagaDescrip.Text = "";       
          Label1.Text = "Ban vua them mot magazine moi";      
    }
}
