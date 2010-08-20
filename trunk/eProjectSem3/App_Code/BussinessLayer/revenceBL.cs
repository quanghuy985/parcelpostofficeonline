using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for revenceBL
/// </summary>
public class revenceBL
{
    DataTable dta = new DataTable();
    DBhelper db = new DBhelper();
	public revenceBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public int get_total_order() {
        dta = db.ExecuteQuerry("pc_get_total_order", null);
        return Convert.ToInt32(dta.Rows[0].ItemArray[0].ToString());
    }
}
