using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Data;
/// <summary>
/// Summary description for ParcelPostBO
/// </summary>
public class ParcelPostBO
{
    DBhelper helper = new DBhelper();
	public ParcelPostBO()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable GetServiceDetailParcelPostFromLocation(string parcelFrom, string parcelTo)
    {
        
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraFrom = new SqlParameter("@parcelFrom", SqlDbType.NVarChar);
        SqlParameter paraTo = new SqlParameter("@parcelTo", SqlDbType.NVarChar);
        paraFrom.Value = parcelFrom;
        paraTo.Value = parcelTo;
        list.Add(paraFrom);
        list.Add(paraTo);

        return helper.ExecuteQuerry("sp_CalculateLocation", list);
    }
    public DataTable GetFeeFromParcelName(string parcelName)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraParcelName= new SqlParameter("@parcelName", SqlDbType.NVarChar);
        paraParcelName.Value = parcelName;
        list.Add(paraParcelName);
        return helper.ExecuteQuerry("sp_CalculateFee", list);
    }
    public DataTable getDataForParcelServiceDetail()
    {
        return helper.ExecuteQuerry("sp_GetDataForParcelServiceDetail", null);
    }
    public DataTable getPriceServiceDetailID(int id)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraServiceDetailID = new SqlParameter("@id", SqlDbType.Int);
        paraServiceDetailID.Value = id;
        list.Add(paraServiceDetailID);
        return helper.ExecuteQuerry("sp_getPriceServiceDetail", list);
    }
    public DataTable getParcelPostID(string parcelName)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraParcelName = new SqlParameter("@parcelName", SqlDbType.NVarChar);
        paraParcelName.Value = parcelName;
        list.Add(paraParcelName);
        return helper.ExecuteQuerry("sp_getParcelPostIDbyParcelName",list);
    }
    public int InsertOrder(string custName)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraCustName = new SqlParameter("@custName",SqlDbType.NVarChar);
        paraCustName.Value = custName;
        list.Add(paraCustName);
        helper.ExecuteQuerry("InsertOrder", list);

        DataTable dt = new DataTable();

        dt = helper.ExecuteQuerry("getOrderID", null);
        return Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString());

    }
    public int InsertOrderDetail(string custName, int serviceDetailID, int parcelPostID, string parcelFromAddress, string parcelFromDistrict, string parcelFromCity, string parcelToAddress, string parcelToDistrict, string parcelToCity, decimal parcelWeight, decimal parcelAdditionalFee, decimal totalAmount)
    {
        
            DateTime dateOrder = DateTime.Today;
            int orderID = this.InsertOrder(custName);
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraOrderID = new SqlParameter("@orderID", SqlDbType.Int);
            paraOrderID.Value = orderID;
            list.Add(paraOrderID);
            SqlParameter paraServiceDetailID = new SqlParameter("@serviceDetailID", SqlDbType.Int);
            paraServiceDetailID.Value = serviceDetailID;
            list.Add(paraServiceDetailID);
            SqlParameter paraParcelPostID = new SqlParameter("@parcelPostID", SqlDbType.Int);
            paraParcelPostID.Value = parcelPostID;
            list.Add(paraParcelPostID);
            SqlParameter paraParcelFromAddress = new SqlParameter("@parcelFromAddress", SqlDbType.NVarChar);
            paraParcelFromAddress.Value = parcelFromAddress;
            list.Add(paraParcelFromAddress);
            SqlParameter paraParcelFromDistrict = new SqlParameter("@parcelFromDistrict", SqlDbType.NVarChar);
            paraParcelFromDistrict.Value = parcelFromDistrict;
            list.Add(paraParcelFromDistrict);
            SqlParameter paraParcelFromCity = new SqlParameter("@parcelFromCity", SqlDbType.NVarChar);
            paraParcelFromCity.Value = parcelFromCity;
            list.Add(paraParcelFromCity);
            SqlParameter paraParcelToAddress = new SqlParameter("@parcelToAddress", SqlDbType.NVarChar);
            paraParcelToAddress.Value = parcelToAddress;
            list.Add(paraParcelToAddress);
            SqlParameter paraParcelToDistrict = new SqlParameter("@parcelToDistrict", SqlDbType.NVarChar);
            paraParcelToDistrict.Value = parcelToDistrict;
            list.Add(paraParcelToDistrict);
            SqlParameter paraParcelToCity = new SqlParameter("@parcelToCity", SqlDbType.NVarChar);
            paraParcelToCity.Value = parcelToCity;
            list.Add(paraParcelToCity);
            SqlParameter paraWeight = new SqlParameter("@parcelWeight", SqlDbType.Decimal);
            paraWeight.Value = parcelWeight;
            list.Add(paraWeight);
            SqlParameter paraAdditionalFee = new SqlParameter("@parcelAdditionalFee", SqlDbType.Decimal);
            paraAdditionalFee.Value = parcelAdditionalFee;
            list.Add(paraAdditionalFee);
            SqlParameter paraTotalAmount = new SqlParameter("@parcelTotalAmount", SqlDbType.Decimal);
            paraTotalAmount.Value = totalAmount;
            list.Add(paraTotalAmount);
            SqlParameter paraDateOrder = new SqlParameter("@parcelDateOrder", SqlDbType.DateTime);
            paraDateOrder.Value = dateOrder;
            list.Add(paraDateOrder);
         
            helper.ExecuteQuerry("InserOrderDetail", list);
            return orderID;
    }
}
