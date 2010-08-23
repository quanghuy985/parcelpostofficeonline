using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for OrderManageBL
/// </summary>
public class OrderManageBL
{
    DBhelper helper = new DBhelper();
	public OrderManageBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable viewAllOrder()
    {
        return helper.ExecuteQuerry("sp_viewAllOrder", null);
    }
    public DataTable getBranchForEmployee(string userName)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraUserName = new SqlParameter("@userName", SqlDbType.NVarChar);
        paraUserName.Value = userName;
        list.Add(paraUserName);
        return helper.ExecuteQuerry("getBranchForEmployee", list);

    }
    public DataTable viewOrderByBranch(string district, string city , int status)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraDistrict = new SqlParameter("@district",SqlDbType.NVarChar);
        paraDistrict.Value = district;
        list.Add(paraDistrict);
        SqlParameter paraCity = new SqlParameter("@city", SqlDbType.NVarChar);
        paraCity.Value = city;
        list.Add(paraCity);
        SqlParameter paraStatus = new SqlParameter("@status", SqlDbType.Int);
        paraStatus.Value = status;
        list.Add(paraStatus);
        return helper.ExecuteQuerry("viewOrderByBranch", list);
    }
    public DataTable viewOrderByID(int orderDetailID)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraOrderDetail = new SqlParameter("@orderDetailID", SqlDbType.Int);
        paraOrderDetail.Value = orderDetailID;
        list.Add(paraOrderDetail);
        return helper.ExecuteQuerry("sp_viewOrderByID", list);
    }
}
