using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for AdminBL
/// </summary>
public class AdminBL
{
    DBhelper Da = new DBhelper();
    public AdminBL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public int Login(String User, String Pass)
    {
        List<SqlParameter> paramList = new List<SqlParameter>();
        SqlParameter param = new SqlParameter();

        param = new SqlParameter("@adminUserName", SqlDbType.VarChar);
        param.Value = User;
        paramList.Add(param);
        param = new SqlParameter("@adminPassword", SqlDbType.VarChar);
        param.Value = Pass;
        paramList.Add(param);
        DataTable dt;
        dt = Da.ExecuteQuerry("pc_AdminLogin", paramList);
        if (dt.Rows.Count > 0)
        {
            return 1;
        }
        else
        {
            return 0;
        }
    }
    public bool isAdmin(string user)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraUser = new SqlParameter("@adminUser", SqlDbType.NVarChar);
        paraUser.Value = user;
        list.Add(paraUser);

        DataTable dt = new DataTable();
        dt = Da.ExecuteQuerry("sp_checkAdmin", list);
        if (dt.Rows.Count != 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
