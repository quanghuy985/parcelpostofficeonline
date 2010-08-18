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

public partial class FeedBack : System.Web.UI.Page
{
    string cusID;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        cusID = Session["User"].ToString();
    }
    protected void btSubmit_Click(object sender, EventArgs e)
    {
        FeedBackBL feedback = new FeedBackBL();
        feedback.InsertFeedBack(txtFeedBackContent.Text, cusID);
        lbOutput.Text = "Cảm ơn bạn đã phản hồi cho chúng tôi! Chúng tôi sẽ Email lại cho bạn sớm nhất có thể";
    }
}
