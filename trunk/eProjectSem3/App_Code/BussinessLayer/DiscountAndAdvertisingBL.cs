using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
/// <summary>
/// Summary description for DiscountAndAdvertisingBL
/// </summary>
public class DiscountAndAdvertisingBL
{
    DBhelper helper = new DBhelper();
	public DiscountAndAdvertisingBL()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public DataTable view2Discount()
    {
        return helper.ExecuteQuerry("view2Discount", null);
    }
    public DataTable view2Advertising()
    {
        return helper.ExecuteQuerry("view2Advertising", null);
    }
    public DataTable getDiscountByID(int discountID)
    {
        List<SqlParameter> list = new List<SqlParameter>();
        SqlParameter paraDiscountID = new SqlParameter("@discountID", SqlDbType.Int);
        paraDiscountID.Value = discountID;
        list.Add(paraDiscountID);
        return helper.ExecuteQuerry("getDiscountByID", list);
    }
    public bool UpdateDiscountByID(int discountID, string discountName, string discountBrief, string discountContent, string discountImage, decimal discountPrice, int discountStatus)
    {
        try
        {
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraDiscountID = new SqlParameter("@discountID", SqlDbType.Int);
            paraDiscountID.Value = discountID;
            list.Add(paraDiscountID);
            SqlParameter paraDiscountName = new SqlParameter("@discountName", SqlDbType.NVarChar);
            paraDiscountName.Value = discountName;
            list.Add(paraDiscountName);
            SqlParameter paraDiscountBrief = new SqlParameter("@discountBrief", SqlDbType.NVarChar);
            paraDiscountBrief.Value = discountBrief;
            list.Add(paraDiscountBrief);
            SqlParameter paraDiscountContent = new SqlParameter("@discountContent", SqlDbType.NVarChar);
            paraDiscountContent.Value = discountContent;
            list.Add(paraDiscountContent);
            SqlParameter paraDiscountImage = new SqlParameter("@discountImage", SqlDbType.NVarChar);
            paraDiscountImage.Value = discountImage;
            list.Add(paraDiscountImage);
            SqlParameter paraDiscountPrice = new SqlParameter("@discountPrice", SqlDbType.Decimal);
            paraDiscountPrice.Value = discountPrice;
            list.Add(paraDiscountPrice);
            SqlParameter paraStatus = new SqlParameter("@discountStatus", SqlDbType.Int);
            paraStatus.Value = discountStatus;
            list.Add(paraStatus);
            helper.ExecuteQuerry("UpdateDiscount", list);
            return true;
        }
        catch (SqlException)
        {
            return false;
        }
    }
    public bool InsertDiscount(string discountName, string discountBrief, string discountContent, string discountImage, decimal discountPrice, int discountStatus)
    {
        try
        {
            List<SqlParameter> list = new List<SqlParameter>();
            SqlParameter paraDiscountName = new SqlParameter("@discountName", SqlDbType.NVarChar);
            paraDiscountName.Value = discountName;
            list.Add(paraDiscountName);
            SqlParameter paraDiscountBrief = new SqlParameter("@discountBrief", SqlDbType.NVarChar);
            paraDiscountBrief.Value = discountBrief;
            list.Add(paraDiscountBrief);
            SqlParameter paraDiscountContent = new SqlParameter("@discountContent", SqlDbType.NVarChar);
            paraDiscountContent.Value = discountContent;
            list.Add(paraDiscountContent);
            SqlParameter paraDiscountImage = new SqlParameter("@discountImage", SqlDbType.NVarChar);
            paraDiscountImage.Value = discountImage;
            list.Add(paraDiscountImage);
            SqlParameter paraDiscountPrice = new SqlParameter("@discountPrice", SqlDbType.Decimal);
            paraDiscountPrice.Value = discountPrice;
            list.Add(paraDiscountPrice);
            SqlParameter paraDiscountStatus = new SqlParameter("@discountStatus", SqlDbType.NVarChar);
            paraDiscountStatus.Value = discountStatus;
            list.Add(paraDiscountStatus);
            helper.ExecuteQuerry("InsertDiscount", list);
            return true;
        }
        catch (SqlException)
        {
            return false;
        }
    }
}
