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
using System.Data;
using System.Data.OleDb;
public partial class Addmagazine : System.Web.UI.Page
{
    MagazineBL mgb = new MagazineBL();
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSumit_Click(object sender, EventArgs e)
    {
        // Check to see if file was uploaded
        if (!FileUpload1.HasFile)
        {
            Response.Write("Not found file<br>");
        }

        if (FileUpload1.PostedFile.ContentLength < 55555)
        {
            Response.Write("File nho qua");
        }

        else
        {
            //Response.Write("File size: " + FileUpload1.PostedFile.ContentLength + "Mb.<br>");
            //Response.Write("FIle name: " + FileUpload1.FileName);
            String strUpload = Server.MapPath(@"images/" + FileUpload1.FileName);
            //string strSave = @"\Image\";
            FileUpload1.SaveAs(strUpload);
            //FileUpload1.SaveAs(Server.MapPath(strSave));

            //FileUpload1.SaveAs(@"C:\"+FileUpload1.FileName);
          //  Response.Write("<h1>Saved</h1>");
        }

      int count=  mgb.insert_magazine(txtmagaName.Text, txtMagaDescrip.Text,FileUpload1.FileName, "admin");
      if (count > 0) {
          Label1.Text = "Ban vua them mot magazine moi";
      }
    }
    //private void WriteToFile(string strPath, ref byte[] Buffer)
    //{
    //    // Create a file
    //    FileStream newFile = new FileStream(strPath, FileMode.Create);

    //    // Write data to the file
    //    newFile.Write(Buffer, 0, Buffer.Length);

    //    // Close file
    //    newFile.Close();
    //}
    //private string GetMyName()
    //{
    //    // Get the script name
    //    string strScript = Request.ServerVariables["SCRIPT_NAME"];

    //    // Get position of last slash
    //    int nPos = strScript.LastIndexOf("/");

    //    // Get everything after slash
    //    if (nPos > -1)
    //        strScript = strScript.Substring(nPos + 1);

    //    return strScript;
    //}
}
