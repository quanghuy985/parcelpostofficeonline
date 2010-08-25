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
        bindGidDiscount();
        bindGridAdvertising();
        if (Session["User"] == null)
        {
            lbUser.Text = "Guess";
        }
        else
        {
            lbUser.Text = Session["User"].ToString();
        } 
        if (Session["discountID"] == null)
        {
            lbDiscountName.Text = "No Discount";
            lbDiscountPrice.Text = "0";
            lbDiscountIDSession.Text = "2";
        }
        else
        {
            DataTable dt = new DataTable();
            DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
            dt = discount.getDiscountByID(Convert.ToInt32(Session["discountID"].ToString()));
            lbDiscountName.Text = dt.Rows[0].ItemArray[1].ToString();
            lbDiscountPrice.Text = dt.Rows[0].ItemArray[5].ToString();
            lbDiscountIDSession.Text = Session["discountID"].ToString();
        }

        bindGridDDLCity();
        int id = Convert.ToInt32(Request.QueryString["id"]);
       
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
    public void bindGidDiscount()
    {
        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        DataTable dt = new DataTable();
        dt = discount.view2Discount();
        lbDiscount1.Text = dt.Rows[0].ItemArray[1].ToString();
        lbDiscount2.Text = dt.Rows[1].ItemArray[1].ToString();
        lbDiscountID1.Text = dt.Rows[0].ItemArray[0].ToString();
        lbDiscountID2.Text = dt.Rows[1].ItemArray[0].ToString();
        string discountImageURL1 = "~/images/" + dt.Rows[0].ItemArray[4].ToString();
        string discountImageURL2 = "~/images/" + dt.Rows[1].ItemArray[4].ToString();
        ImageDiscount1.ImageUrl = discountImageURL1;
        ImageDiscount2.ImageUrl = discountImageURL2;
        lbPrice1.Text = dt.Rows[0].ItemArray[5].ToString() + "$";
        lbPrice2.Text = dt.Rows[1].ItemArray[5].ToString() + "$";
    }
    public void bindGridAdvertising()
    {

        DiscountAndAdvertisingBL discount = new DiscountAndAdvertisingBL();
        DataTable dt = new DataTable();
        dt = discount.view2Advertising();
        lbAdvertising1.Text = dt.Rows[0].ItemArray[1].ToString();
        lbAdvertising2.Text = dt.Rows[1].ItemArray[1].ToString();
        lbAdvertisingURL1.Text = dt.Rows[0].ItemArray[5].ToString();
        lbAdvertisingURL2.Text = dt.Rows[1].ItemArray[5].ToString();
        string advertisingImageURL1 = "~/images/" + dt.Rows[0].ItemArray[4].ToString();
        ImageAdvertising1.ImageUrl = advertisingImageURL1;
        ImageAdvertising2.ImageUrl = "~/images/" + dt.Rows[1].ItemArray[4].ToString();
        lbContact1.Text = "8686868";
        lbContact2.Text = "8686868";

    }
    protected void lbtDiscount1_Click(object sender, EventArgs e)
    {
        Session["discountID"] = lbDiscountID1.Text;
        Response.Redirect("ParcelPostOfficeServiceDetail.aspx");
    }
    protected void lbtAdvertising1_Click(object sender, EventArgs e)
    {
        Response.Redirect(lbAdvertisingURL1.Text);
    }
    protected void lbtAdvertising2_Click(object sender, EventArgs e)
    {
        Response.Redirect(lbAdvertisingURL2.Text);
    }
    protected void lbtDiscount2_Click(object sender, EventArgs e)
    {
        Session["discountID"] = lbDiscountID2.Text;
        Response.Redirect("ParcelPostOfficeServiceDetail.aspx");
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
    public static String CalculateTotalAmount(string Fee, string weight, string AddFee, string discountPrice)
    {
        return Convert.ToString(Convert.ToDecimal(Fee) * Convert.ToDecimal(weight) + Convert.ToDecimal(AddFee) - Convert.ToDecimal(discountPrice));

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
    public static String InsertOderDetail(string serviceDetailID, string parcelPostID, string parcelFromAddress, string parcelFromDistrict, string parcelFromCity, string parcelToAddress, string parcelToDistrict, string parcelToCity, string parcelWeight, string parcelAdditionalFee, string totalAmount, string custUserName, string discountID, string discountPrice)
    {

        ParcelPostBO parcel = new ParcelPostBO();
        int orderID = parcel.InsertOrderDetail(custUserName, Convert.ToInt32(serviceDetailID), Convert.ToInt32(parcelPostID), parcelFromAddress, parcelFromDistrict, parcelFromCity, parcelToAddress, parcelToDistrict, parcelToCity, Convert.ToDecimal(parcelWeight), Convert.ToDecimal(parcelAdditionalFee), Convert.ToDecimal(totalAmount),Convert.ToInt32(discountID),Convert.ToDecimal(discountPrice));
        return orderID.ToString();
    }
    [System.Web.Services.WebMethod]
    public static String InsertOderDetailForeign(string serviceDetailID, string parcelPostID, string parcelFromAddress, string parcelFromDistrict, string parcelFromCity, string parcelToAddress, string parcelWeight, string parcelAdditionalFee, string totalAmount, string custUserName, string discountID, string discountPrice)
    {
        ParcelPostBO parcel = new ParcelPostBO();
        int orderID = parcel.InsertOrderDetail(custUserName, Convert.ToInt32(serviceDetailID), Convert.ToInt32(parcelPostID), parcelFromAddress, parcelFromDistrict, parcelFromCity, parcelToAddress, "", "", Convert.ToDecimal(parcelWeight), Convert.ToDecimal(parcelAdditionalFee), Convert.ToDecimal(totalAmount), Convert.ToInt32(discountID), Convert.ToDecimal(discountPrice));
        return orderID.ToString();
    }
}
