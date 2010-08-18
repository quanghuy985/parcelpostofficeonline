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
using System.Data.SqlClient;
using System.Collections.Generic;
/// <summary>
/// Summary description for BranchBO
/// </summary>
public class BranchBO
{
    DBhelper helper = new DBhelper();
	public BranchBO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable getCity()
    {
        return helper.ExecuteQuerry("pc_getCity", null);
    }
    public DataTable getDistrictByCity(string city)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter para = new SqlParameter("@city", SqlDbType.NVarChar);
        para.Value = city;
        list.Add(para);
        return helper.ExecuteQuerry("pc_getDistrictByCity", list);
    }
    public DataTable getAreaByCity(string city)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter para = new SqlParameter("@city", SqlDbType.NVarChar);
        para.Value = city;
        list.Add(para);
        return helper.ExecuteQuerry("pc_getAreaByCity", list);
    }
}
