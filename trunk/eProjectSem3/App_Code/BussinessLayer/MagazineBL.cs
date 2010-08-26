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

public class MagazineBL
{
    DBhelper helper = new DBhelper();
    DataTable dta = new DataTable();
    DataTable dta1 = new DataTable();
    List<SqlParameter> list;
    private int orderID;
	public MagazineBL()
	{
		
	}
    public DataTable view_magazine()
    {
        return helper.ExecuteQuerry("pc_view_magazine", null);
    }
    public DataTable view_magazine_byID(int magazine_id) {
        
        list = new List<SqlParameter>();
        SqlParameter paraContent = new SqlParameter("@maga_ID", SqlDbType.Int);
        paraContent.Value = magazine_id;
        list.Add(paraContent);
      return  helper.ExecuteQuerry("pc_viewmagazine_byID", list);
      
      
    }
    public int intsert_Order(string cus_Name) {
        list = new List<SqlParameter>();
        SqlParameter paraContent = new SqlParameter("@CusName", SqlDbType.NVarChar);
        paraContent.Value = cus_Name;
        list.Add(paraContent);
        dta= helper.ExecuteQuerry("pc_Insert_order", list);
        dta1 = helper.ExecuteQuerry("pc_get_orderdetail", null);
        if (dta1.Rows.Count != 0)
        {
            orderID = Convert.ToInt32(dta1.Rows[0].ItemArray[0].ToString());
        }
        return orderID;
    }
    // Thằng Quân xem lại đoạn này khai báo mảng thế này sao đc, nó sinh lỗi
    public void insert_Order_detail(string cusname,ArrayList magazine,string adress,int servicedetailID) {
        MagazineEN[] mge = new MagazineEN[magazine.Count];
        int _orderid = this.intsert_Order(cusname);
        for (int i = 0; i < magazine.Count; i++)
        {
            mge[i] = (MagazineEN)magazine[i];
            list = new List<SqlParameter>();
            SqlParameter para1 = new SqlParameter("@orderID", SqlDbType.Int);
            SqlParameter para2 = new SqlParameter("@serviceDetailID", SqlDbType.Int);
            SqlParameter para3 = new SqlParameter("@magazineDailyID", SqlDbType.Int);
            SqlParameter para4 = new SqlParameter("@monthMagazineDaily", SqlDbType.Int);
            SqlParameter para5 = new SqlParameter("@addressMagazineDaily", SqlDbType.NVarChar);
            SqlParameter para6 = new SqlParameter("@totalamount", SqlDbType.Decimal);            
            para1.Value = _orderid;
            para2.Value = servicedetailID;
            para3.Value = mge[i].MagazineDailyID;
            para4.Value = mge[i].MonthMagazineDaily;
            para5.Value = adress;
            para6.Value = mge[i].MagazinePrice;
            list.Add(para1);
            list.Add(para2);
            list.Add(para3);
            list.Add(para4);
            list.Add(para5);
            list.Add(para6);
            helper.ExecuteQuerry("insert_Order_detail", list);
        }

    }
    //public void checkout(String cusName, ArrayList magaZine, String adress, int servicedetailID)
    //{

    //    this.insert_Order_detail(cusName, magaZine, adress);
    //}
    public DataTable view_service_detail() {
        return helper.ExecuteQuerry("pc_view_service_maga", null);
    }
    public int insert_magazine(string magazineName, string magazineDescription, string magazineImage, string adminUserName)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@magazineName", SqlDbType.NVarChar);
        SqlParameter para2 = new SqlParameter("@magazineDescription", SqlDbType.NVarChar);
        SqlParameter para3 = new SqlParameter("@magazineImage", SqlDbType.NVarChar);
        SqlParameter para4 = new SqlParameter("@adminUserName", SqlDbType.NVarChar);
        para1.Value = magazineName;
        para2.Value = magazineDescription;
        para3.Value = magazineImage;
        para4.Value = adminUserName;
        list.Add(para1);
        list.Add(para2);
        list.Add(para3);
        list.Add(para4);
       dta= helper.ExecuteQuerry("pc_insert_magazine", list);
       return dta.Rows.Count;
    }
    public DataTable view_order_byId(int Oid) {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@orderID", SqlDbType.Int);
        para1.Value = Oid;
        list.Add(para1);
      return  dta = helper.ExecuteQuerry("pc_view_order_byId", list);
       
    }
    public DataTable update_magazine(int magazineDailyID ,int serviceID ,string magazineName ,string magazineDescription ,string magazineImage,string adminUserName ,int magazineStatus ) {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@magazineDailyID", SqlDbType.Int);
        SqlParameter para2 = new SqlParameter("@serviceID", SqlDbType.Int);
        SqlParameter para3 = new SqlParameter("@magazineName", SqlDbType.NVarChar);
        SqlParameter para4 = new SqlParameter("@magazineDescription", SqlDbType.NVarChar);
        SqlParameter para5 = new SqlParameter("@magazineImage", SqlDbType.NVarChar);
        SqlParameter para6 = new SqlParameter("@adminUserName", SqlDbType.NVarChar);
        SqlParameter para7 = new SqlParameter("@magazineStatus", SqlDbType.Int);
        para1.Value = magazineDailyID;
        para2.Value = serviceID;
        para3.Value = magazineName;
        para4.Value = magazineDescription;
        para5.Value = magazineImage;
        para6.Value = adminUserName;
        para7.Value = magazineStatus;
        list.Add(para1);
        list.Add(para2);
        list.Add(para3);
        list.Add(para4);
        list.Add(para5);
        list.Add(para6);
        list.Add(para7);
        return dta = helper.ExecuteQuerry("pc_update_magazin", list);
    }

    public void update_status(int magazineDailyID) {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@magazineDailyID", SqlDbType.Int);
        para1.Value = magazineDailyID;
        list.Add(para1);
         helper.ExecuteQuerry("pc_update_status_magazine", list);
    }
}
