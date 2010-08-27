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
using System.Collections.Generic;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CustomerBL
/// </summary>
public class CustomerBL
{

    DBhelper helper = new DBhelper();

	public CustomerBL()
	{
		
	}

    public DataTable AddCustomer(string username, string password, string fullname, string address, string email)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter p = new SqlParameter();
        p = new SqlParameter("@cusUsername", SqlDbType.NVarChar);
        p.Value = username;
        list.Add(p);
        p = new SqlParameter("@cusPassword", SqlDbType.NVarChar);
        p.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5"); ;
        list.Add(p);
        p = new SqlParameter("@cusFullname", SqlDbType.NVarChar);
        p.Value = fullname;
        list.Add(p);
        p = new SqlParameter("@cusAddress", SqlDbType.NVarChar);
        p.Value = address;
        list.Add(p);
        p = new SqlParameter("@cusEmail", SqlDbType.NVarChar);
        p.Value = email;
        list.Add(p);
        return helper.ExecuteQuerry("pc_UpdateAccount", list);
    }

    public DataTable CheckExistCustomer(string username)
    {

        SqlParameter p = new SqlParameter();
        List<SqlParameter> list = new List<SqlParameter>();
        p = new SqlParameter("@cusUsername", SqlDbType.NVarChar);
        p.Value = username;
        list.Add(p);
        return helper.ExecuteQuerry("sp_CheckExistCustomer", list);

    }
    public DataTable ResumePassword(string cusUserName)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paracusUserName = new SqlParameter("@cusUserName", SqlDbType.VarChar);
        paracusUserName.Value = cusUserName;
        list.Add(paracusUserName);
        return helper.ExecuteQuerry("pc_getOrderDetailByCus", list);
    }
    public DataTable CheckCustomerLogin(string cusUserName, string cusPassword)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paracusUserName = new SqlParameter("@cusUserName", SqlDbType.VarChar);
        SqlParameter paracusPassword = new SqlParameter("@cusPassword", SqlDbType.VarChar);
        paracusUserName.Value = cusUserName;
        paracusPassword.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(cusPassword, "MD5");
        list.Add(paracusUserName);
        list.Add(paracusPassword);
        return helper.ExecuteQuerry("CheckCustomerLogin", list);
    }
    public DataTable getOrderByCus(string cusUserName, int orderDetailStatus)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paracusUserName = new SqlParameter("@cusUserName", SqlDbType.NVarChar);
        paracusUserName.Value = cusUserName;
        list.Add(paracusUserName);
        SqlParameter paracusStatus = new SqlParameter("@orderDetailStatus", SqlDbType.Int);
        paracusStatus.Value = orderDetailStatus;
        list.Add(paracusStatus);
        return helper.ExecuteQuerry("pc_getOrderDetailByCus", list);
    }
    public DataTable changepass(string cusUserName, string pass)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paracusUserName = new SqlParameter("@cusUserName", SqlDbType.NVarChar);
        paracusUserName.Value = cusUserName;
        list.Add(paracusUserName);
        SqlParameter paracusStatus = new SqlParameter("@cusPassword", SqlDbType.NVarChar);
        paracusStatus.Value = FormsAuthentication.HashPasswordForStoringInConfigFile(pass, "MD5");
        list.Add(paracusStatus);
        return helper.ExecuteQuerry("pc_changepassword", list);
    }
    public int UpdateAccoountInformation(String username, String fullname, String address, String email)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter p = new SqlParameter();
        p = new SqlParameter("@cusUserName", SqlDbType.NVarChar);
        p.Value = username;
        list.Add(p);
        p = new SqlParameter("@cusFullName", SqlDbType.NVarChar);
        p.Value = fullname;
        list.Add(p);
        p = new SqlParameter("@cusAddress", SqlDbType.NVarChar);
        p.Value = address;
        list.Add(p);
        p = new SqlParameter("@cusEmail", SqlDbType.NVarChar);
        p.Value = email;
        list.Add(p);
        return helper.ExecuteNonQuery("pc_UpdateAccount", CommandType.StoredProcedure, list);
    }
    public DataTable searchOrder(String username, int status, DateTime form, DateTime to)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter p = new SqlParameter();
        p = new SqlParameter("@cusUserName", SqlDbType.NVarChar);
        p.Value = username;
        list.Add(p);
        p = new SqlParameter("@orderDetailStatus", SqlDbType.Int);
        p.Value = status;
        list.Add(p);
        p = new SqlParameter("@fromdate", SqlDbType.DateTime);
        p.Value = form;
        list.Add(p);
        p = new SqlParameter("@todate", SqlDbType.DateTime);
        p.Value = to;
        list.Add(p);
        return helper.ExecuteQuerry("pc_SreachOrderCusByDate", list);
    }
}
