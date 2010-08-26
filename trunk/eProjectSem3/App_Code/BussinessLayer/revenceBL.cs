using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
    /// <summary>
    /// //////////////////////////////
    /// </summary>
    /// <returns></returns>
    public int get_total_order()
    {

        dta = db.ExecuteQuerry("pc_get_total_order", null);
        return Convert.ToInt32(dta.Rows[0].ItemArray[0].ToString());
    }
    public string get_total_order_by_id(int id)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@id", SqlDbType.Int);
        para1.Value = id;
        list.Add(para1);
        dta = db.ExecuteQuerry("pc_get_total_order_by_id", list);
        return dta.Rows[0].ItemArray[0].ToString();
    }
    /// <summary>
    /// ////////////////////////////////////////////
    /// </summary>
    /// <returns></returns>
    public string get_total_parcel()
    {
        dta = db.ExecuteQuerry("pc_get_all_parcel", null);
        return dta.Rows[0].ItemArray[0].ToString();
    }
    public string get_total_parcel_by_id(int id)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@id", SqlDbType.Int);
        para1.Value = id;
        list.Add(para1);
        dta = db.ExecuteQuerry("pc_get_total_parcel_By_id", list);
        return dta.Rows[0].ItemArray[0].ToString();
    }

    /// <summary>
    /// ////////////////////////////////////////////////////////
    /// </summary>
    /// <returns></returns>
    public DataTable get_all_order()
    {
        return db.ExecuteQuerry("pc_getall_order", null);
    }
    public DataTable get_all_order_available()
    {
        return db.ExecuteQuerry("pc_get_order_available", null);
    }
    public DataTable get_all_order_finnish()
    {
        return db.ExecuteQuerry("pc_get_total_orderfinnish", null);
    }
    public String get_total_revence()
    {
        dta = db.ExecuteQuerry("pc_get_total_revenece", null);
        return dta.Rows[0].ItemArray[0].ToString();
    }
    
        public String get_total_revence_maga()
    {
        dta = db.ExecuteQuerry("pc_get_total_revence_magazine", null);
        return dta.Rows[0].ItemArray[0].ToString();
    }
    /// <summary>
    /// /////////////////////////////////////////////////////////////
    /// </summary>
    /// <param name="start_date"></param>
    /// <param name="end_date"></param>
    /// <returns></returns>
    /// 

    public DataTable get_all_parcel()
    {

        return db.ExecuteQuerry("pc_getall_parcel", null);
    }
    public DataTable get_parcel_by_time(DateTime start_date, DateTime end_date)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@start_date", SqlDbType.DateTime);
        para1.Value = start_date;
        list.Add(para1);
        SqlParameter para2 = new SqlParameter("@end_date", SqlDbType.DateTime);
        para2.Value = end_date;
        list.Add(para2);
        return db.ExecuteQuerry("pc_get_parcel_by_time", list);

    }
    public DataTable get_parcel_by_id(int id)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@id", SqlDbType.Int);
        para1.Value = id;
        list.Add(para1);
        return db.ExecuteQuerry("pc_get_all_parcel_by_id", list);
    }
    public DataTable get_all_parcel_by_time_id(int id, DateTime start_date, DateTime end_date)
    {
        list = new List<SqlParameter>();
        SqlParameter para0 = new SqlParameter("@id", SqlDbType.Int);
        para0.Value = id;
        list.Add(para0);
        SqlParameter para1 = new SqlParameter("@start_date", SqlDbType.DateTime);
        para1.Value = start_date;
        list.Add(para1);
        SqlParameter para2 = new SqlParameter("@end_date", SqlDbType.DateTime);
        para2.Value = end_date;
        list.Add(para2);
        return db.ExecuteQuerry("pc_get_parcel_by_id_time", list);

    }
    /// <summary>
    /// ///////////////
    /// </summary>
    /// <param name="start_date"></param>
    /// <param name="end_date"></param>
    /// <returns></returns>
    public DataTable pc_get_total_order_by_time(DateTime start_date, DateTime end_date)
    {
        list = new List<SqlParameter>();
        SqlParameter para1 = new SqlParameter("@start_date", SqlDbType.DateTime);
        para1.Value = start_date;
        list.Add(para1);
        SqlParameter para2 = new SqlParameter("@end_date", SqlDbType.DateTime);
        para2.Value = end_date;
        list.Add(para2);
        return db.ExecuteQuerry("pc_get_total_order_by_time", list);

    }
    public DataTable pc_get_total_order_by_time_id(int id, DateTime start_date, DateTime end_date)
    {
        list = new List<SqlParameter>();
        SqlParameter para0 = new SqlParameter("@id", SqlDbType.Int);
        para0.Value = id;
        list.Add(para0);
        SqlParameter para1 = new SqlParameter("@start_date", SqlDbType.DateTime);
        para1.Value = start_date;
        list.Add(para1);
        SqlParameter para2 = new SqlParameter("@end_date", SqlDbType.DateTime);
        para2.Value = end_date;
        list.Add(para2);
        return db.ExecuteQuerry("pc_get_total_order_by_time_id", list);

    }
}
