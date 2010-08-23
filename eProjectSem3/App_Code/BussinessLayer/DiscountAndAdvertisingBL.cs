using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DiscountAndAdvertisingBL
/// </summary>
public class DiscountAndAdvertisingBL
{
    DBhelper helper = new DBhelper();
	public DiscountAndAdvertisingBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable view2Discount()
    {
        return helper.ExecuteQuerry("view2Discount", null);
    }
    public DataTable view2Advertising()
    {
        return helper.ExecuteQuerry("view2Advertising", null);
    }
    public DataTable getDiscountByID(int discountID)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraDiscountID = new SqlParameter("@discountID", SqlDbType.Int);
        paraDiscountID.Value = discountID;
        list.Add(paraDiscountID);
        return helper.ExecuteQuerry("getDiscountByID", list);
    }
}
