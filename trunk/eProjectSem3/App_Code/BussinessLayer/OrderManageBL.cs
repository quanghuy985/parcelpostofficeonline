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
    public DataTable viewOrderByBranch(string district, string city, int status)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraDistrict = new SqlParameter("@district", SqlDbType.NVarChar);
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
    public void updateOrder(int orderID, string empUserName)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraOrderID = new SqlParameter("@orderID", SqlDbType.Int);
        paraOrderID.Value = orderID;
        list.Add(paraOrderID);
        SqlParameter paraEmpUserName = new SqlParameter("@empUserName", SqlDbType.NVarChar);
        paraEmpUserName.Value = empUserName;
        list.Add(paraEmpUserName);
        helper.ExecuteQuerry("sp_UpdateOrder", list);

    }
    public bool UpdateOrderParcel(int orderDetailID, Decimal parcelWeight, Decimal addFee, Decimal discountPrice, Decimal parcelTotalAmount, int Status, int OrderID,string empUserName)
    {
        try
        {
            DateTime dateOrder = DateTime.Today;
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraOrderDetailID = new SqlParameter("@orderDetailID", SqlDbType.Int);
            paraOrderDetailID.Value = orderDetailID;
            list.Add(paraOrderDetailID);
            SqlParameter paraParcelWeight = new SqlParameter("@parcelWeight", SqlDbType.Decimal);
            paraParcelWeight.Value = parcelWeight;
            list.Add(paraParcelWeight);
            SqlParameter paraAddFee = new SqlParameter("@addFee", SqlDbType.Decimal);
            paraAddFee.Value = addFee;
            list.Add(paraAddFee);
            SqlParameter paraDiscountPrice = new SqlParameter("@discountPrice", SqlDbType.Decimal);
            paraDiscountPrice.Value = discountPrice;
            list.Add(paraDiscountPrice);
            SqlParameter paraParcelTotalAmount = new SqlParameter("@parcelTotalAmount", SqlDbType.Decimal);
            paraParcelTotalAmount.Value = parcelTotalAmount;
            list.Add(paraParcelTotalAmount);
            SqlParameter paraDateTreat = new SqlParameter("@dateTreat", SqlDbType.DateTime);
            paraDateTreat.Value = dateOrder;
            list.Add(paraDateTreat);
            SqlParameter paraStatus = new SqlParameter("@orderDetailStatus", SqlDbType.Int);
            paraStatus.Value = Status;
            list.Add(paraStatus);
            helper.ExecuteQuerry("UpdateOrderParcel", list);
            this.updateOrder(OrderID, empUserName);
            return true;
        }
        catch (SqlException)
        {

            return false;
        }
    }
}
