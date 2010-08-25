using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
/// <summary>
/// Summary description for ServiceBL
/// </summary>
public class ServiceBL
{
    DBhelper helper = new DBhelper();
    public ServiceBL()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataTable getServiceDetailByID(int serviceDetailID)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraServiceDetailID = new SqlParameter("@serviceDetailID", SqlDbType.Int);
        paraServiceDetailID.Value = serviceDetailID;
        list.Add(paraServiceDetailID);
        return helper.ExecuteQuerry("sp_getServiceDetailByID", list);
    }
    public bool updateServiceDetail(int serviceDetailID, int serviceID, string serviceDetailName, string serviceDescription, decimal servicePrice, string serviceDetailImage, string adminUserName, int serviceDetailStatus)
    {
        try
        {
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraServiceDetailID = new SqlParameter("@serviceDetailID", SqlDbType.Int);
            paraServiceDetailID.Value = serviceDetailID;
            list.Add(paraServiceDetailID);
            SqlParameter paraServiceID = new SqlParameter("@serviceID", SqlDbType.Int);
            paraServiceID.Value = serviceID;
            list.Add(paraServiceID);
            SqlParameter paraServiceDetailName = new SqlParameter("@serviceDetailName", SqlDbType.NVarChar);
            paraServiceDetailName.Value = serviceDetailName;
            list.Add(paraServiceDetailName);
            SqlParameter paraServiceDescription = new SqlParameter("@serviceDesciption", SqlDbType.NVarChar);
            paraServiceDescription.Value = serviceDescription;
            list.Add(paraServiceDescription);
            SqlParameter paraServicePrice = new SqlParameter("@servicePrice", SqlDbType.Decimal);
            paraServicePrice.Value = servicePrice;
            list.Add(paraServicePrice);
            SqlParameter paraServiceDetailImage = new SqlParameter("@serviceDetailImage", SqlDbType.NVarChar);
            paraServiceDetailImage.Value = serviceDetailImage;
            list.Add(paraServiceDetailImage);
            SqlParameter paraAdminUser = new SqlParameter("@adminUserName", SqlDbType.NVarChar);
            paraAdminUser.Value = adminUserName;
            list.Add(paraAdminUser);
            SqlParameter paraStatus = new SqlParameter("@serviceDetailStatus", SqlDbType.Int);
            paraStatus.Value = serviceDetailStatus;
            list.Add(paraStatus);
            helper.ExecuteQuerry("sp_updateServiceDetail", list);
            return true;
        }
        catch (SqlException)
        {
            return false;
        }
    }
    public bool InsertServiceDetail(int serviceID, string serviceDetailName, string serviceDesciption, decimal serviceDetailPrice, string serviceDetailImage, int serviceDetailStatus, string adminUserName)
    {
        try
        {
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraServiceID = new SqlParameter("@serviceID", SqlDbType.Int);
            paraServiceID.Value = serviceID;
            list.Add(paraServiceID);
            SqlParameter paraServiceDetailName = new SqlParameter("@serviceDetailName", SqlDbType.NVarChar);
            paraServiceDetailName.Value = serviceDetailName;
            list.Add(paraServiceDetailName);
            SqlParameter paraServiceDesciption = new SqlParameter("@serviceDescription", SqlDbType.NVarChar);
            paraServiceDesciption.Value = serviceDesciption;
            list.Add(paraServiceDesciption);
            SqlParameter paraServiceDetailPrice = new SqlParameter("@serviceDetailPrice", SqlDbType.Decimal);
            paraServiceDetailPrice.Value = serviceDetailPrice;
            list.Add(paraServiceDetailPrice);
            SqlParameter paraServiceImage = new SqlParameter("@serviceImage", SqlDbType.NVarChar);
            paraServiceImage.Value = serviceDetailImage;
            list.Add(paraServiceImage);
            SqlParameter paraSerivceStatus = new SqlParameter("@serviceDetailStatus", SqlDbType.Int);
            paraSerivceStatus.Value = serviceDetailStatus;
            list.Add(paraSerivceStatus);
            SqlParameter paraAdminUserName = new SqlParameter("@adminUserName", SqlDbType.NVarChar);
            paraAdminUserName.Value = adminUserName;
            list.Add(paraAdminUserName);
            helper.ExecuteQuerry("InsertServiceDetal", list);
            return true;
        }
        catch (SqlException)
        {
            return false;
        }
    }
}
