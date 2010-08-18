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

/// <summary>
/// Summary description for MagazineEN
/// </summary>
public class MagazineEN 
{
    private int magazineDailyID;

    public int MagazineDailyID
    {
        get { return magazineDailyID; }
        set { magazineDailyID = value; }
    }
    private int serviceID;

    public int ServiceID
    {
        get { return serviceID; }
        set { serviceID = value; }
    }
    private int serviceDetailID;

    public int ServiceDetailID
    {
        get { return serviceDetailID; }
        set { serviceDetailID = value; }
    }
    private string magazineName;

    public string MagazineName
    {
        get { return magazineName; }
        set { magazineName = value; }
    }
    private string magazineImage;

    public string MagazineImage
    {
        get { return magazineImage; }
        set { magazineImage = value; }
    }
    private int magazineStatus;

    public int MagazineStatus
    {
        get { return magazineStatus; }
        set { magazineStatus = value; }
    }
    private int monthMagazineDaily;
    public int MonthMagazineDaily {
        get { return monthMagazineDaily; }
        set { monthMagazineDaily = value; }
    }

	public MagazineEN()
	{
		
	}
}
