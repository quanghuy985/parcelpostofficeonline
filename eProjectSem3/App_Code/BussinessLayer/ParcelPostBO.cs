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
    public bool InsertOrderDetail(string custName, int serviceDetailID, int parcelPostID, string parcelFromAddress, string parcelFromDistrict, string parcelFromCity, string parcelToAddress, string parcelToDistrict, string parcelToCity, float parcelWeight, float parcelAdditionalFee, float totalAmount, DateTime dateOrder)
    {
        try
        {
            int orderID = this.InsertOrder(custName);
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraOrderID = new SqlParameter("@orderID", SqlDbType.Int);
            SqlParameter paraServiceDetailID = new SqlParameter("@serviceDetailID", SqlDbType.Int);
            SqlParameter paraParcelPostID = new SqlParameter("@parcelPostID", SqlDbType.Int);
            SqlParameter paraParcelFromAddress = new SqlParameter("@parcelFromAddress", SqlDbType.NVarChar);
            SqlParameter paraParcelFromDistrict = new SqlParameter("@parcelFromDistrict", SqlDbType.NVarChar);
            SqlParameter paraParcelFromCity = new SqlParameter("@parcelFromCity", SqlDbType.NVarChar);
            SqlParameter paraParcelToAddress = new SqlParameter("@parcelToAddress", SqlDbType.NVarChar);
            SqlParameter paraParcelToDistrict = new SqlParameter("@parcelToDistrict", SqlDbType.NVarChar);
            SqlParameter paraParcelToCity = new SqlParameter("@parcelToCity", SqlDbType.NVarChar);
            SqlParameter paraWeight = new SqlParameter("@parcelWeight", SqlDbType.Float);
            SqlParameter paraAdditionalFee = new SqlParameter("@parcelAdditionalFee", SqlDbType.Float);
            SqlParameter paraTotalAmount = new SqlParameter("@parcelTotalAmount", SqlDbType.Float);
            SqlParameter paraDateOrder = new SqlParameter("@parcelDateOrder", SqlDbType.DateTime);
            paraOrderID.Value = orderID;
            list.Add(paraOrderID);
            paraServiceDetailID.Value = serviceDetailID;
            list.Add(paraServiceDetailID);
            paraParcelPostID.Value = parcelPostID;
            list.Add(paraParcelPostID);
            paraParcelFromAddress.Value = parcelFromAddress;
            list.Add(paraParcelFromAddress);
            paraParcelFromDistrict.Value = parcelFromDistrict;
            list.Add(paraParcelFromDistrict);
            paraParcelFromCity.Value = parcelFromCity;
            list.Add(paraParcelFromCity);
            paraParcelToAddress.Value = parcelToAddress;
            list.Add(paraParcelToAddress);
            paraParcelToDistrict.Value = parcelToDistrict;
            list.Add(paraParcelToDistrict);
            paraParcelToCity.Value = parcelToCity;
            list.Add(paraParcelToCity);
            paraWeight.Value = parcelWeight;
            list.Add(paraWeight);
            paraAdditionalFee.Value = parcelAdditionalFee;
            list.Add(paraAdditionalFee);
            paraTotalAmount.Value = totalAmount;
            list.Add(paraTotalAmount);
            paraDateOrder.Value = dateOrder;
            list.Add(paraDateOrder);

            helper.ExecuteQuerry("InserOrderDetail", list);
            return true;
        }
        catch (SqlException ex)
        {
            return false;
        }
        
    }
}
