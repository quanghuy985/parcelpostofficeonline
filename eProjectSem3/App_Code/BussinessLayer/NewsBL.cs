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
/// Summary description for NewsBL
/// </summary>
public class NewsBL
{
    DBhelper helper = new DBhelper();
    List<SqlParameter> list; 
	public NewsBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable ViewHotNews()
    {
        return helper.ExecuteQuerry("pc_ViewHotNews", null);
    }
    public DataTable View3News()
    {
        return helper.ExecuteQuerry("pc_View3News",null);
    }
    public DataTable view10News()
    {
        return helper.ExecuteQuerry("pc_View10News", null);
    }
    public DataTable viewNewsDetail(int newsID)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraNewsID = new SqlParameter("@newsID", SqlDbType.Int);
        paraNewsID.Value = newsID;
        list.Add(paraNewsID);
        return helper.ExecuteQuerry("pc_viewNewsByID", list);
    }
    public void insert_news(string title,string brief,string content,string image,string adminName,int status) {

        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@title", SqlDbType.NVarChar);
        SqlParameter para2 = new SqlParameter("@brief", SqlDbType.NVarChar);
        SqlParameter para3 = new SqlParameter("@content", SqlDbType.NVarChar);
        SqlParameter para4 = new SqlParameter("@image", SqlDbType.NVarChar);
        SqlParameter para5 = new SqlParameter("@adminname", SqlDbType.NVarChar);
        SqlParameter para6 = new SqlParameter("@status", SqlDbType.Int);
        para1.Value = title;
        para2.Value = brief;
        para3.Value = content;
        para4.Value = image;
        para5.Value = adminName;
        para6.Value = status;
        list.Add(para1);
        list.Add(para2);
        list.Add(para3);
        list.Add(para4);
        list.Add(para5);
        list.Add(para6);
        helper.ExecuteQuerry("pc_insert_news", list);
    }
  
    public void update_news(int newsID,string newsTitle,string newsBrief,string newsContent,string newsImage,int newsStatus) {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@newsID", SqlDbType.Int);
        SqlParameter para2 = new SqlParameter("@newsTitle", SqlDbType.NVarChar);
        SqlParameter para3 = new SqlParameter("@newsBrief", SqlDbType.NVarChar);
        SqlParameter para4 = new SqlParameter("@newsContent", SqlDbType.NVarChar);
        SqlParameter para5 = new SqlParameter("@newsImage", SqlDbType.NVarChar);
        SqlParameter para6 = new SqlParameter("@newsStatus", SqlDbType.Int);
        para1.Value = newsID;
        para2.Value = newsTitle;
        para3.Value = newsBrief;
        para4.Value = newsContent;
        para5.Value = newsImage;
        para6.Value = newsStatus;
        list.Add(para1);
        list.Add(para2);
        list.Add(para3);
        list.Add(para4);
        list.Add(para5);
        list.Add(para6);
        helper.ExecuteQuerry("pc_update_news", list);
    }
    public DataTable view_new_byid(int id) {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@id", SqlDbType.Int);
        para1.Value = id;
        list.Add(para1);
        return helper.ExecuteQuerry("pc_view_new_byid", list);
    }

}
