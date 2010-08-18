using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
public partial class ParcelPostOfficeFunction : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] == null)
        {
            lbUser.Text = "Guess";
        }
        else
        {
            lbUser.Text = Session["User"].ToString();
        }
        bindGridDDLCity();
        int id = Convert.ToInt32(Request.QueryString["id"].ToString());
       
        ParcelPostBO parcel = new ParcelPostBO();
        DataTable dt2 = new DataTable();
        dt2 = parcel.getPriceServiceDetailID(id);
        if (dt2.Rows.Count != 0)
        {
            lbKindToSend.Text = dt2.Rows[0].ItemArray[0].ToString();
            lbAddFee.Text = dt2.Rows[0].ItemArray[1].ToString();

        }
        lbServiceDetailID.Text = Convert.ToString(id);

    }

    protected void bindGridDDLCity()
    {
        DataTable dt;
        BranchBO branch = new BranchBO();
        dt = branch.getCity();
        ddlCity.DataSource = dt;
        ddlCity.DataTextField = "branchCity";
        ddlCity.DataValueField = "branchCity";
        ddlCity.DataBind();
        ddlCityTo.DataSource = dt;
        ddlCityTo.DataTextField = "branchCity";
        ddlCityTo.DataValueField = "branchCity";
        ddlCityTo.DataBind();
    }
    [System.Web.Services.WebMethod]
    public static String[] GetDistrictByCity(string city)
    {

        BranchBO branch = new BranchBO();
        DataTable dtt;
        dtt = branch.getDistrictByCity(city);
        int j = dtt.Rows.Count;
        string[] chuoi = new string[j];
        for (int i = 0; i < j; i++)
        {
            chuoi[i] = dtt.Rows[i].ItemArray[0].ToString();
        }
        return chuoi;
        
    }
    [System.Web.Services.WebMethod]
    public static String CalculateLocation(string fromCity, string toCity)
    {
        DataTable dt;
        DataTable dtFromArea;
        DataTable dtToArea;
        string location = null;
        string fromArea = null;
        string toArea = null;
        BranchBO branch = new BranchBO();
        dtFromArea = branch.getAreaByCity(fromCity);
        if (dtFromArea.Rows.Count != 0)
        {
            fromArea = dtFromArea.Rows[0].ItemArray[0].ToString();
        }
        dtToArea = branch.getAreaByCity(toCity);
        if (dtToArea.Rows.Count != 0)
        {
            toArea = dtToArea.Rows[0].ItemArray[0].ToString();
        }
        if (fromArea.Equals(toArea))
        {
            location = "In Area";

        }
        else
        {
            ParcelPostBO parcelPost = new ParcelPostBO();
            dt = parcelPost.GetServiceDetailParcelPostFromLocation(fromArea, toArea);
            location = dt.Rows[0].ItemArray[0].ToString();


        }
        return location;
    }
    [System.Web.Services.WebMethod]
    public static String CalculateFee(string parcelName)
    {
        string parcelFee = null;
        DataTable dt;
        ParcelPostBO parcelPost = new ParcelPostBO();
        dt = parcelPost.GetFeeFromParcelName(parcelName);
        if (dt.Rows.Count != 0)
        {
            parcelFee = dt.Rows[0].ItemArray[0].ToString();
        }
        else
        {
            parcelFee = "No Data";
        }
        return parcelFee;
    }
    [System.Web.Services.WebMethod]
    public static String CalculateTotalAmount(string Fee, string weight, string AddFee)
    {
        return Convert.ToString(Convert.ToInt32(Fee) * Convert.ToInt32(weight) + Convert.ToInt32(AddFee));

    }
    [System.Web.Services.WebMethod]
    public static String getParcelPostID(string parcelName)
    {
        string result = null;
        ParcelPostBO parcel = new ParcelPostBO();
        DataTable dt = new DataTable();
        dt = parcel.getParcelPostID(parcelName);
        if (dt.Rows.Count != 0)
        {
            result = dt.Rows[0].ItemArray[0].ToString();
        }
        return result;
    }
    [System.Web.Services.WebMethod]
    public static String InsertOderDetail(string serviceDetailID, string parcelPostID, string parcelFromAddress, string parcelFromDistrict, string parcelFromCity, string parcelToAddress, string parcelToDistrict, string parcelToCity, string parcelWeight, string parcelAdditionalFee, string totalAmount, string custUserName)
    {
        
        ParcelPostBO parcel = new ParcelPostBO();
        int orderID = parcel.InsertOrderDetail(custUserName, Convert.ToInt32(serviceDetailID), Convert.ToInt32(parcelPostID), parcelFromAddress, parcelFromDistrict, parcelFromCity, parcelToAddress, parcelToDistrict, parcelToCity, Convert.ToDecimal(parcelWeight), Convert.ToDecimal(parcelAdditionalFee), Convert.ToDecimal(totalAmount));
        return orderID.ToString();
    }

}
