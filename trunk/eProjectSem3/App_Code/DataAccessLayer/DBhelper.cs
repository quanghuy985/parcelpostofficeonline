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
/// Summary description for DBhelper
/// </summary>
public class DBhelper
{
    SqlConnection con;
 
    public SqlConnection getConnect()
    {
        if (con == null || con.State == ConnectionState.Closed)
        {
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["callConnection"].ConnectionString);
            con.Open();

        }
        return con;
    }

    public void PrepareCommand(SqlCommand cmd, String SPName, List<SqlParameter> paramList)
    {
        cmd.Connection = this.getConnect();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.CommandText = SPName;
        if (paramList != null)
        {
            foreach (SqlParameter param in paramList)
            {
                cmd.Parameters.Add(param);
            }
        }
    }
    public DataTable ExecuteQuerry(String SPName, List<SqlParameter> paramList)
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataTable dt = new DataTable();
        PrepareCommand(cmd, SPName, paramList);
        da.SelectCommand = cmd;
        da.Fill(dt);
        return dt;

    }
    public DataSet ExecuteQuerryReturnDataSet(String SPName, List<SqlParameter> paramList)
    {
        SqlCommand cmd = new SqlCommand();
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        PrepareCommand(cmd, SPName, paramList);
        da.SelectCommand = cmd;
        da.Fill(ds);
        return ds;
    }


    public int ExecuteQuery(string sql, CommandType type)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.CommandType = type;
        cmd.Connection = this.getConnect();
        int k = cmd.ExecuteNonQuery();
        return k;
    }


    public int ExecuteQuery(string sql, CommandType type, List<SqlParameter> list)
    {
        int k = 0;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.CommandType = type;
        cmd.Connection = this.getConnect();
        foreach (SqlParameter p in list)
        {
            cmd.Parameters.Add(p);
        }
        try
        {
            k = cmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            con.Close();
            throw ex;
        }

        return k;
    }


    public DataSet ExecuteDataSet(string sql, CommandType type)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = sql;
        cmd.CommandType = type;
        cmd.Connection = this.getConnect();
        SqlDataAdapter data = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        data.Fill(ds);
        return ds;
    }


}
