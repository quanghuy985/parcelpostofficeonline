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
using System.Collections;
using System.Collections.Generic;
/// <summary>
/// Summary description for revenceBL
/// </summary>
public class revenceBL
{
    DataTable dta = new DataTable();
    DBhelper db = new DBhelper();    
    List<SqlParameter> list;
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
    public string get_order_available() {
        dta = db.ExecuteQuerry("pc_get_total_order_available", null);
        return dta.Rows[0].ItemArray[0].ToString();
    }
    public string get_order_finnish()
    {
        dta = db.ExecuteQuerry("pc_get_total_order_finnish", null);
        return dta.Rows[0].ItemArray[0].ToString();
    }
    public DataTable get_all_order()
    {
        return db.ExecuteQuerry("pc_getall_order", null);
    }

    public DataTable pc_get_total_order_by_time(DateTime start_date,DateTime end_date) {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@start_date", SqlDbType.DateTime);
        para1.Value = start_date;
        list.Add(para1);
        SqlParameter para2 = new SqlParameter("@end_date", SqlDbType.DateTime);
        para2.Value = end_date;
        list.Add(para2);
       return db.ExecuteQuerry("pc_get_total_order_by_time", list);
    
    }
   
    public DataTable get_all_order_available() { 
    return db.ExecuteQuerry("pc_get_order_available",null);
    }

    public DataTable pc_get_total_order_available_by_time(DateTime start_date, DateTime end_date)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@start_date", SqlDbType.DateTime);
        para1.Value = start_date;
        list.Add(para1);
        SqlParameter para2 = new SqlParameter("@end_date", SqlDbType.DateTime);
        para2.Value = end_date;
        list.Add(para2);
        return db.ExecuteQuerry("pc_get_total_order_available_by_time", list);

    }
}
