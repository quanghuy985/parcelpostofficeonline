using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for EmployeeManageBL
/// </summary>
public class EmployeeManageBL
{
    DBhelper helper = new DBhelper();
    DataTable dt = new DataTable();
	public EmployeeManageBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable isEmployee(string userName, string password)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraUser = new SqlParameter("@userName",SqlDbType.NVarChar);
        paraUser.Value = userName;
        list.Add(paraUser);
        SqlParameter paraPassword = new SqlParameter("@password",SqlDbType.NVarChar);
        paraPassword.Value = password;
        list.Add(paraPassword);
        return helper.ExecuteQuerry("checkEmployee",list);
        
    }
}
