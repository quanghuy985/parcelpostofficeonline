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
/// Summary description for FeedBackBL
/// </summary>
public class FeedBackBL
{
    DBhelper helper = new DBhelper();
    List<SqlParameter> list;
	public FeedBackBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public void InsertFeedBack(string content, string cusID)
    {
        list = new List<SqlParameter>();
        SqlParameter paraContent = new SqlParameter("@feedbackContent", SqlDbType.VarChar);
        SqlParameter paraCusID = new SqlParameter("@cusID", SqlDbType.VarChar);
        paraContent.Value = content;
        paraCusID.Value = cusID;
        list.Add(paraContent);
        list.Add(paraCusID);
        helper.ExecuteQuerry("pc_insertFeedBack", list);
    }
    public DataTable getAllFeedBack()
    {
        return helper.ExecuteQuerry("pc_getAllFeedBack", null);
    }
    public int sendfeedback(int id, String adminname)
    {
        

        List<SqlParameter> paramList = new List<SqlParameter>();
        SqlParameter param = new SqlParameter();

        param = new SqlParameter("@feedID", SqlDbType.Int);
        param.Value = id;
        paramList.Add(param);
        param = new SqlParameter("@adminUserName", SqlDbType.VarChar);
        param.Value = adminname;
        paramList.Add(param);
        return helper.ExecuteQuery("pc_sendFeedBack", CommandType.StoredProcedure, paramList);
    }
    public int DeleteFeedBack(int id)
    {


        List<SqlParameter> paramList = new List<SqlParameter>();
        SqlParameter param = new SqlParameter();

        param = new SqlParameter("@feedID", SqlDbType.Int);
        param.Value = id;
        paramList.Add(param);
        return helper.ExecuteQuery("pc_DeleteFeedBack", CommandType.StoredProcedure, paramList);
    }
    public int DeleteFeedBackByCusName(String Account)
    {


        List<SqlParameter> paramList = new List<SqlParameter>();
        SqlParameter param = new SqlParameter();

        param = new SqlParameter("@cusUserName", SqlDbType.NVarChar);
        param.Value = Account;
        paramList.Add(param);
        return helper.ExecuteQuery("pc_DeleteFeedBackByCusName", CommandType.StoredProcedure, paramList);
    }
    public int LockAccount(String Acc)
    {


        List<SqlParameter> paramList = new List<SqlParameter>();
        SqlParameter param = new SqlParameter();

        param = new SqlParameter("@cusUserName", SqlDbType.NVarChar);
        param.Value = Acc;
        paramList.Add(param);
        return helper.ExecuteQuery("pc_LockAccount", CommandType.StoredProcedure, paramList);
    }
}
