<%@ Page Language="C#"AutoEventWireup="true"  CodeFile="ParcelPostOfficeFunction.aspx.cs" Inherits="ParcelPostOfficeFunction" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
    <meta http-equiv="Content-Style-Type" content="text/css" />    
        <meta name="description" content="The Post Office® for your travel insurance, foreign currency exchange, savings, insurance and postal services"/>
        <meta name="keywords" content="post office, postoffice, travel insurance, broadband, car insurance, home, savings, post, phone, credit card, banking, instant saver, foreign currency exchange, passports, licence applications, po, uk, business services, letters &amp;amp; parcels, annual"/>
        <meta name="Title" content="Post Office® - For travel insurance, foreign currency, savings and more&#8230;"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7">
    <title>
				Post Office® - For travel insurance, foreign currency, savings and more&#8230;
</title>
				<link rel="stylesheet" type="text/css" href='css/po/default.css'/>
				<link rel="stylesheet" type="text/css" href='css/po/ie_6_default.css'/>
    <script type="text/javascript" language="Javascript" src="js/po_browser.js"></script>   
    <link rel="shortcut icon" href="icons/po/favicon.ico" type="image/x-icon" />
    <link rel="icon" href="icons/po/favicon.ico" type="image/x-icon" />
    <script type="text/javascript" language="Javascript" src="js/po_browser.js"></script>   

        <script src="js/jquery-1.4.2.js" type="text/javascript"></script>
        <style type="text/css">
            .style1
            {
                width: 81px;
            }
        </style>
  

        <script language="javascript" type="text/javascript">
            var $j = jQuery.noConflict();
            $j(document).ready(function() {


                $j("#txtAddressForeign").change(function() {
                    $j("#checkOption").text("From In Viet Nam to Foreign");
                    $j("#checkOption").val("From In Viet Nam to Foreign");
                    $j("#pnDetail").slideDown("slow");

                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                        data: "{'parcelName':'" + $j("#<%=checkOption.ClientID%>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(message) {
                            $j("#spFee").text(message.d);
                        }
                    });
                });

                //Set Option cho Parcel
                $j("#ddlCityTo").change(function() {

                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/CalculateLocation",
                        data: "{type:'huyhcker','fromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','toCity':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(messageoption) {
                            $j("#checkOption").text(messageoption.d);
                            $j("#checkOption").val(messageoption.d);
                            $j.ajax({
                                type: "POST",
                                url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                                data: "{'parcelName':'" + messageoption.d + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function(message) {
                                    $j("#spFee").text(message.d);
                                }
                            });
                        }
                    });
                    $j("#pnDetail").slideDown("slow");
                });






                // Kiem Xem Gui Di nuoc ngoai hay trong nuoc de cho panel xuat hien
                $j("#cbSendTo").change(function() {
                    if ($j("#cbSendTo:checked").length >= 1) {

                        $j("#pnSendtoforeign").slideDown("slow");
                        $j("#pnTo").hide();
                        $j("#pnDetail").slideUp("slow");
                        $j("#pnTotalAmount").slideUp("slow");
                        document.getElementById("txtWeight").value = "";
                    }
                    else {
                        $j("#pnSendtoforeign").hide();
                        $j("#pnDetail").slideUp("slow");
                        $j("#pnTo").slideDown("slow");
                        $j("#pnTotalAmount").slideUp("slow");
                        document.getElementById("txtWeight").value = "";
                        document.getElementById("txtAddressForeign").value = "";

                    }
                });
                // Make the AJAX call to the WebMethod when the textbox loses focus
                $j("#ddlCity").change(function() {
                    if ($j("#<%=ddlCity.ClientID%>").val() != "") {

                        $j.ajax({
                            type: "POST",
                            url: "ParcelPostOfficeFunction.aspx/GetDistrictByCity",
                            data: "{'city':'" + $j("#<%=ddlCity.ClientID%>").val() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function(message) {
                                document.getElementById("ddlDistrict").options.length = 0;
                                for (var i = 0; i < message.d.length; i++) {

                                    var opt = document.createElement("option");
                                    opt.text = message.d[i];
                                    opt.value = message.d[i];
                                    document.getElementById('<%=ddlDistrict.ClientID%>').options.add(opt);
                                }
                            }
                        });
                        if ($j("#cbSendTo:checked").length >= 1) {
                            $j("#checkOption").text("From In Viet Nam to Foreign");
                            $j("#checkOption").val("From In Viet Nam to Foreign");
                            $j("#pnDetail").slideDown("slow");
                            $j("#pnTotalAmount").slideUp("slow");
                            document.getElementById("txtWeight").value = "";
                            $j.ajax({
                                type: "POST",
                                url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                                data: "{'parcelName':'" + $j("#<%=checkOption.ClientID%>").val() + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function(message) {
                                    $j("#spFee").text(message.d);
                                }
                            });
                        } else {
                            $j.ajax({
                                type: "POST",
                                url: "ParcelPostOfficeFunction.aspx/CalculateLocation",
                                data: "{type:'huyhcker','fromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','toCity':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "'}",
                                contentType: "application/json; charset=utf-8",
                                dataType: "json",
                                success: function(messageoption) {
                                    $j("#checkOption").text(messageoption.d);
                                    $j("#checkOption").val(messageoption.d);
                                    $j.ajax({
                                        type: "POST",
                                        url: "ParcelPostOfficeFunction.aspx/CalculateFee",

                                        data: "{'parcelName':'" + messageoption.d + "'}",
                                        contentType: "application/json; charset=utf-8",
                                        dataType: "json",
                                        success: function(message) {
                                            $j("#spFee").text(message.d);
                                            $j("#pnTotalAmount").slideUp("slow");
                                            document.getElementById("txtWeight").value = "";
                                        }
                                    });
                                }
                            });
                        }
                    }
                });


                // Tao su kien load data cho ddlDistrictTo

                $j("#ddlCityTo").change(function() {
                    if ($j("#<%=ddlCityTo.ClientID%>").val() != "") {

                        $j.ajax({
                            type: "POST",
                            url: "ParcelPostOfficeFunction.aspx/GetDistrictByCity",
                            data: "{'city':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "'}",
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function(message) {
                                document.getElementById("ddlDistrictTo").options.length = 0;
                                for (var i = 0; i < message.d.length; i++) {

                                    var opt = document.createElement("option");
                                    opt.text = message.d[i];
                                    opt.value = message.d[i];
                                    document.getElementById("ddlDistrictTo").options.add(opt);

                                }
                                $j("#pnTotalAmount").slideUp("slow");
                                document.getElementById("txtWeight").value = "";

                            },
                            error: function(errormessage) {
                                //Hi&#7875;n th&#7883; l&#7895;i n&#7871;u x&#7843;y ra
                                $j("#checkReturn").text(errormessage.responseText);
                            }
                        });
                    }
                });
                $j("#txtWeight").blur(function() {

                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/CalculateTotalAmount",

                        data: "{type:'huyhcker','Fee':'" + $j("#spFee").text() + "','weight':'" + document.getElementById("txtWeight").value + "','AddFee':'" + $j("#lbAddFee").text()  +"','discountPrice':'" + $j("#lbDiscountPrice").text() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(message) {
                            $j("#lbTotal").text(message.d);
                            if ($j("#lbUser").text() == "Guess") {
                                $j("#btSubmit").hide();
                                $j("#lbOutput").text("You need login to submit parcel");
                            }

                        }
                    });
                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/getParcelPostID",

                        data: "{'parcelName':'" + $j("#<%=checkOption.ClientID%>").val() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(message) {
                            $j("#lbParcelPostID").text(message.d);
                        }
                    });
                    $j("#pnTotalAmount").slideDown("slow");
                    $j("#lbErrorWeight").hide();

                });


                $j("#txtAddress").blur(function() {
                    if (document.getElementById("txtAddress").value == "") {
                        $j("#lbError").text("- You need insert your address");
                        $j("#lbError").show();
                        $j("#lbErrorAddress").show();
                    } else {
                        $j("#lbErrorAddress").hide();
                        $j("#lbError").hide();
                    }
                });
                $j("#txtAddressTo").blur(function() {
                    if (document.getElementById("txtAddressTo").value == "") {
                        $j("#lbError").text("- You need insert destination address");
                        $j("#lbError").show();
                        $j("#lbErrorAddressTo").show();
                    } else {
                        $j("#lbErrorAddressTo").hide();
                        $j("#lbError").hide();
                    }
                });
                $j("#txtAddressForeign").blur(function() {
                    if (document.getElementById("txtAddressForeign").value == "") {
                        $j("#lbError").text("- You need insert destination address");
                        $j("#lbError").show();
                        $j("#lbErrorAddressForeign").show();
                    } else {
                        $j("#lbErrorAddressForeign").hide();
                        $j("#lbError").hide();
                    }
                });

            });
        </script>

      <script type="text/javascript">
        function clicker() {
            if ($j("#cbSendTo:checked").length >= 1) {
                if (document.getElementById("txtAddress").value == "") {
                    $j("#lbError").text("- You need insert your address");
                    $j("#lbError").show();
                    $j("#lbErrorAddress").show();
                }
                else if (document.getElementById("txtAddressForeign").value == "") {
                    $j("#lbError").text("- You need insert destination address");
                    $j("#lbError").show();
                    $j("#lbErrorAddressForeign").show();
                } else if ((isNaN(document.getElementById("txtWeight").value)) || (document.getElementById("txtAddress").value == "")) {
                    $j("#lbErrorWeight").show();

                }
                else {
                            $j.ajax({
                                    type: "POST",
                                    url: "ParcelPostOfficeFunction.aspx/InsertOderDetailForeign",

                                    data: "{type:'huyhcker','serviceDetailID':'" + $j("#lbServiceDetailID").text() + "','parcelPostID':'" + $j("#lbParcelPostID").text() + "','parcelFromAddress':'" + document.getElementById("txtAddress").value + "','parcelFromDistrict':'" + $j("#<%=ddlDistrict.ClientID%>").val() + "','parcelFromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','parcelToAddress':'" + document.getElementById("txtAddressForeign").value + "','parcelWeight':'" + document.getElementById("txtWeight").value + "','parcelAdditionalFee':'" + $j("#lbAddFee").text() + "','totalAmount':'" + $j("#lbTotal").text() + "','custUserName':'" + $j("#lbUser").text() + "','discountID':'" + $j("#lbDiscountIDSession").text() + "','discountPrice':'" + $j("#lbDiscountPrice").text() + "'}",
                                   contentType: "application/json; charset=utf-8",
                                    dataType: "json",
                                    success: function(message) {
                                    $j("#loading").show();
                                    $j("#content").load("Message.aspx?OrderID=" + message.d);
                                    $j("#lbOutput").text("Susscess");
                                    }
                                });

                }
            } else {
                if (document.getElementById("txtAddress").value == "") {
                    $j("#lbError").text("- You need insert your address");
                    $j("#lbError").show();
                    $j("#lbErrorAddress").show();
                } else if (document.getElementById("txtAddressTo").value == "") {
                    $j("#lbError").text("- You need insert destination address");
                    $j("#lbError").show();
                    $j("#lbErrorAddressTo").show();
                } else if ((isNaN(document.getElementById("txtWeight").value)) || (document.getElementById("txtAddress").value == "")) {
                    $j("#lbErrorWeight").show();

                }
                else {
                    $j.ajax({
                        type: "POST",
                        url: "ParcelPostOfficeFunction.aspx/InsertOderDetail",

                        data: "{type:'huyhcker','serviceDetailID':'" + $j("#lbServiceDetailID").text() + "','parcelPostID':'" + $j("#lbParcelPostID").text() + "','parcelFromAddress':'" + document.getElementById("txtAddress").value + "','parcelFromDistrict':'" + $j("#<%=ddlDistrict.ClientID%>").val() + "','parcelFromCity':'" + $j("#<%=ddlCity.ClientID%>").val() + "','parcelToAddress':'" + document.getElementById("txtAddressTo").value + "','parcelToDistrict':'" + $j("#<%=ddlDistrictTo.ClientID%>").val() + "','parcelToCity':'" + $j("#<%=ddlCityTo.ClientID%>").val() + "','parcelWeight':'" + document.getElementById("txtWeight").value + "','parcelAdditionalFee':'" + $j("#lbAddFee").text() + "','totalAmount':'" + $j("#lbTotal").text() + "','custUserName':'" + $j("#lbUser").text() + "','discountID':'" + $j("#lbDiscountIDSession").text() + "','discountPrice':'" + $j("#lbDiscountPrice").text() + "'}",
                        contentType: "application/json; charset=utf-8",
                        dataType: "json",
                        success: function(message) {
                            $j("#loading").show();
                            $j("#content").load("Message.aspx?OrderID=" + message.d);
                            $j("#lbOutput").text("Susscess");
                        }
                    });

                    return false; ;
                }
            }
         
        }
            
    </script>
    <style type="text/css">
            #lbErrorWeight
            {
                display: none;
            }
            #lbErrorAddressTo
            {
                display: none;
            }
            #lbErrorAddress
            {
                display: none;
            }
            #lbErrorAddressForeign
            {
                display: none;
            }
            #pnSendtoforeign
            {
                display: none;
            }
            #pnDetail
            {
                display: none;
            }
            #pnDetail0
            {
                display: none;
            }
            #pnTotalAmount
            {
                display: none;
            }
            .style1
            {
                width: 360px;
            }
            .style2
            {
                width: 483px;
            }
        .style3
        {
            width: 25%;
            height: 17px;
        }
        .style4
        {
            width: 50%;
            height: 17px;
        }
        .style5
        {
            height: 17px;
        }
        </style>
      </head>
      <body>
		<form id="form1" runat="server">
		<div id="Home-Template">
		<div id="Header">
				<div class="logo-container">
							<img src="images/postoffice/widget/header/logo.gif" width="78" height="59" alt="Post Office &reg;" />
				</div>
				<div class="header-right">
	<div class="top-links">
		<div class="top-info">
			<ul>
				<li class="first"><a href="link/finder" accesskey="j">Branch finder</a></li>
				<li><a href="foreignexchange@type=buy&pageId=fex_main&catId=19300210&intcampaignid=PI0193" accesskey="c">
                    Currency converter</a></li>
				<li><a href="link/address" accesskey="i">Address/Postcode finder</a></li>
				<li><a href="link/track" accesskey="k">Track &amp; Trace</a></li>
			</ul>					
		</div>
		<div class="fleft"><img src="images/postoffice/rd2008/account-end.gif" width="4" height="31" alt="" /></div>
	</div>
<div class="account-section">
	<div class="Float-Right">
				<ul>
					<li>Your account</li>
					<li><a href="link/registration@pageId=rego_po">Register</a></li>
					<li><a href="portal/campaign/content1@catId=19100174&mediaId=103700773">Sign in</a></li>
				</ul>
<div class="search-box">
	<input name="_dyncharset" type="hidden" value="ISO-8859-1">
		<label for="search-input" class="textHidden">Search the site</label>
		<input name="search-input" type="text" class="txt-search" value="" onfocus="this.value=''" accesskey="4" id="search-input"><input name="_D:search-input" type="hidden" value=" ">
		<input name="ln-search-button" type="image" class="btn-search" alt="Search" src="images/postoffice/rd2008/btn-search.gif" id="ln-search-button"><input name="_D:ln-search-button" type="hidden" value=" ">
		<input name="/rmg/sitesearch/SiteSearchFormHandler.successUrl" type="hidden" class="notDisplayed" value="/link/po/sitesearch"><input name="_D:/rmg/sitesearch/SiteSearchFormHandler.successUrl" type="hidden" value=" ">
		<input name="/rmg/sitesearch/SiteSearchFormHandler.failureUrl" type="hidden" class="notDisplayed" value=""><input name="_D:/rmg/sitesearch/SiteSearchFormHandler.failureUrl" type="hidden" value=" ">
		<input name="/rmg/sitesearch/SiteSearchFormHandler.searchPosition" type="hidden" class="notDisplayed" value="0"><input name="_D:/rmg/sitesearch/SiteSearchFormHandler.searchPosition" type="hidden" value=" ">
		<input name="/rmg/sitesearch/SiteSearchFormHandler.hierarchicalCategoryId" type="hidden" class="notDisplayed" value="1000001"><input name="_D:/rmg/sitesearch/SiteSearchFormHandler.hierarchicalCategoryId" type="hidden" value=" ">
	<input name="_DARGS" type="hidden" value="/portal/rmgroup/apps/templates/html/po/po_header_search.jspf">
</div>
	</div>
</div>
				</div>
				<div class="textHidden">
					<a href="#skipmainnav">Skip main navigation</a>
				</div>
		  <div class="top-navigation">
<div class="navigation-tabs">
    <ul id="category">
                <li id="tab1">
                            <div class="menuHeader"><a href="Default.aspx">Home</a></div>
            </li>
                <li id="tab2">
                            <div class="menuHeader"><a href="Magazine.aspx">Magazine</a></div>
            </li>
                <li id="tab3">
                            <div class="menuHeader"><a href="ParcelPostOfficeFunction.aspx">ParcelPostOffice &amp; phone</a></div>
            </li>
                <li id="tab4">
                            <div class="menuHeader"><a href="Login.aspx">Login</a></div>
            </li>
                <li id="tab5">
                            <div class="menuHeader"><a href="ParcelPostOfficeServiceDetail.aspx">ServiceDetail</a></div>
            </li>
                <li id="tab6">
                            <div class="menuHeader"><a href="MagazineCart.aspx">Shopping cart</a></div>
            </li>
                <li id="tab7">
                            <div class="menuHeader"><a href="Business.html">Business</a></div>
            </li>
    </ul>
<br />
                    <div id="rolloverTabs">
                            <div id="dropbox1">
                        <div class="bg">
                            <p>For your Post Office® savings, a fixed rate mortgage or credit card, choose Post 
                                Office® Finance. Need Travel Money? We deliver 0% commission Foreign Currency to 
                                your home.</p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=19300206&mediaId=19300232">Savings &amp; investments</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19300206&mediaId=19400177">Credit cards &amp; loans</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19300206&mediaId=86600737">Mortgages</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19300206&mediaId=86500737">Making payments</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19300206&mediaId=96300778">Travel money</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19300206&mediaId=63000704">Business financial services</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-blue">Savings accounts. See if our wide <a href="jump1@catId=19300206&mediaId=19300232">
                                            savings range</a> suits your needs</p>
                        </div>
                            <div id="dropbox2">
                        <div class="bg">
                            <p>From travel insurance that can start immediately, to car insurance, life, home, 
                                and van insurance, Post Office® Insurance has got it covered. </p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=98200761&mediaId=19300223">Insurance</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=98200761&mediaId=95400765">Life cover</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=98200761&mediaId=107500769">Business insurance</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-blue_ins"><a href="content1@catId=95400765&mediaId=61000695">Life 
                                            insurance</a> - Cover from as little as £5 a month<sup>1</sup></p>
                        </div>
                            <div id="dropbox3">
                        <div class="bg">
                            <p>Super-fast Broadband and Home Phone with line rental included from the Post 
                                Office®. Free connection and free phone calls included. Free wireless router 
                                with some plans.</p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=36600674&mediaId=68600711">Home Phone &amp; Broadband</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=36600674&mediaId=63700719">International phonecards</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-lightgreen">Free calls to UK mobiles every weekend with <a href="content1@catId=68600711&mediaId=19300217">
                                            Home Phone</a></p>
                        </div>
                            <div id="dropbox4">
                        <div class="bg">
                            <p>Need travel insurance for a single trip or for annual multi-trip cover? Or travel 
                                money for delivery to you? It's the Post Office® for everything travel. Your 
                                passport too! </p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=62900708&mediaId=63300708">Travel insurance</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900708&mediaId=19300207">Travel money</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900708&mediaId=63300711">Travel documents</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900708&mediaId=19300214">Travel extras</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900708&mediaId=115700794">Travel talk</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-orange">10% discount off <a href="content1@catId=63300708&mediaId=19300208">
                                            annual multi-trip insurance</a> when you buy online</p>
                        </div>
                            <div id="dropbox5">
                        <div class="bg">
                            <p>Find the best postage rates for your standard, urgent, or valuable letters and 
                                parcels. Buy Online Postage or stamps, mail redirection, find tips for eBay 
                                users and more.</p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=19100175&mediaId=19100176">Sending UK letters &amp; parcels</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19100175&mediaId=63800711">Receiving letters &amp; parcels</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19100175&mediaId=19100179">Overseas letters &amp; parcels</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19100175&mediaId=95100756">Buy stamps and postage online</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=19100175&mediaId=19100182">Mailing guide</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-red">Sending a letter or parcel? Find out the cost using the <a href="../pricefinder.postoffice.co.uk/PriceFinder@catId=91100756&gear=pricingcalc&intcampaignid=PI0525">
                                            Price Finder</a></p>
                        </div>
                            <div id="dropbox6">
                        <div class="bg">
                            <p>For your driving licence, car tax and car insurance, an International Driving 
                                Licence, Passport Check&nbsp;&amp; Send, Identity Checking Service and even your Rod 
                                Fishing Licence. </p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=62900710&mediaId=63400715">Passport &amp; identity</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900710&mediaId=19100187">Licences &amp; car tax</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900710&mediaId=94800755">Counter money services</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-purple"><a href="content1@catId=94800755&mediaId=103400786">Gift 
                                            Card</a> shop in over 17,000 outlets across the UK</p>
                        </div>
                            <div id="dropbox7">
                        <div class="bg">
                            <p>Move a lot of cash? Post Office® can help. Secure cash collection, business 
                                insurance and more -&nbsp;the Post Office® means business. </p>
                                        <ul class="left">
                                            <li>
                                                            <a href="jump1@catId=62900713&mediaId=98700753">Business mailing</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900713&mediaId=94800754">Business financial services</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900713&mediaId=94800765">Travel services</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900713&mediaId=94800773">Services &amp; info</a>
                                            </li>
                                            <li>
                                                            <a href="jump1@catId=62900713&mediaId=102000757">Business insurance</a>
                                            </li>
                                        </ul>
                            </div>
                                        <p class="promo-grey"><a href="portal/rm/jump2@catId=400046&mediaId=26800663">Online 
                                            Postage</a> - Buy and print your stamps online</p>
                        </div>
                    </div>
<script type="text/javascript" src="js/po_rollover.js"></script>
</div>
				</div>
				<a id="skipmainnav"></a>
		</div>
		<div id="Full-Content-Region">
		  <div id="Category-Left"><a name="skipmainnav"></a>
		    <div id="div">
              <div id="Category-layer-left">
                <div id="Category-Main">
                  <div id="Category-Panel">
                    <div class="category-bottom">
                      <div class="category-top">
                        <div class="category-splash">
                            <div class="category-splash">
                                <div class="category-inner">
                                    <div class="category-content">
                                        <h3>
                                            <asp:LinkButton ID="lbtDiscount1" runat="server" OnClick="lbtDiscount1_Click">
                                            <asp:Label ID="lbDiscount1" runat="server" Text=""></asp:Label>
                                            </asp:LinkButton>
                                            <asp:Label ID="lbDiscountID1" runat="server" Text="" Visible="false"></asp:Label>
                                        </h3>
                                        <asp:Image ID="ImageDiscount1" runat="server" Height="103px" Width="175px" />
                                        <table>
                                            <tr>
                                                <td class="style1">
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Medium" ForeColor="#FF3300" Text="Discount"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbPrice1" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Medium" Font-Underline="True" ForeColor="#0033CC"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="category-content">
                                        <div class="category-divider">
                                        </div>
                                        <h3>
                                            <asp:LinkButton ID="lbtDiscount2" runat="server" OnClick="lbtDiscount2_Click">
                                            <asp:Label ID="lbDiscount2" runat="server" Text=""></asp:Label>
                                            </asp:LinkButton>
                                            <asp:Label ID="lbDiscountID2" runat="server" Text="" Visible="false"></asp:Label>
                                        </h3>
                                        <asp:Image ID="ImageDiscount2" runat="server" Height="103px" Width="175px" />
                                        <table>
                                            <tr>
                                                <td class="style1">
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Medium" ForeColor="#FF3300" Text="Discount"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbPrice2" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Medium" Font-Underline="True" ForeColor="#0033CC"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="category-content">
                                        <div class="category-divider">
                                        </div>
                                        <h3>
                                            <asp:LinkButton ID="lbtAdvertising1" runat="server" 
                                                OnClick="lbtAdvertising1_Click">
                                            <asp:Label ID="lbAdvertising1" runat="server" Text=""></asp:Label>
                                            </asp:LinkButton>
                                            <asp:Label ID="lbAdvertisingURL1" runat="server" Text="" Visible="false"></asp:Label>
                                        </h3>
                                        <asp:Image ID="ImageAdvertising1" runat="server" Height="103px" 
                                            Width="175px" />
                                        <table>
                                            <tr>
                                                <td class="style1">
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Small" ForeColor="#FF3300" Text="Contact :"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbContact1" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Medium" Font-Underline="True" ForeColor="#0033CC"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="category-content">
                                        <div class="category-divider">
                                        </div>
                                        <h3>
                                            <asp:LinkButton ID="lbtAdvertising2" runat="server" 
                                                OnClick="lbtAdvertising2_Click">
                                            <asp:Label ID="lbAdvertising2" runat="server" Text=""></asp:Label>
                                            </asp:LinkButton>
                                            <asp:Label ID="lbAdvertisingURL2" runat="server" Text="" Visible="false"></asp:Label>
                                        </h3>
                                        <asp:Image ID="ImageAdvertising2" runat="server" Height="103px" 
                                          Width="175px" />
                                        <table>
                                            <tr>
                                                <td class="style1">
                                                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Small" ForeColor="#FF3300" Text="Contact :"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="lbContact2" runat="server" Font-Bold="True" Font-Italic="True" 
                                                        Font-Size="Medium" Font-Underline="True" ForeColor="#0033CC"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
		      <div id="Category-layer-main">
                <!-- START AUTONOMY SEARCH -->
                <!-- AUTONAME:NAVTITLE Letters & parcels  -->
                <div class="red red-Circle">
                </div>
		        <div id="Category-Layer-bottom">

                            <div id="Foot-Note">
                                <div style="vertical-align: middle; width: 100%">
                                    <table>
                                        <tr>
                                            <td style="width: 100px">
                                            </td>
                                            <td>
                                                <asp:Panel ID="pnFrom" runat="server" GroupingText="From" Width="100%" BorderWidth="0px"
                                                    Font-Bold="False" BackColor="#CC0000" Font-Strikeout="False">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbFrom" Text="City :" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:DropDownList ID="ddlCity" runat="server" Width="100%" AppendDataBoundItems="true">
                                                                    <asp:ListItem>--- Please select city ---</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 40%">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbDistrict" runat="server" Text="District :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="ddlDistrict" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbAddress" runat="server" Text="Address :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtAddress" Width="100%" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorAddress" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbSendto" runat="server" Text="Send To :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:CheckBox ID="cbSendTo" Text="Foreign Country" runat="server" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td style="width: 88px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnSendtoforeign" runat="server" GroupingText="Foreign Address" 
                                                    BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbAddressForeign" runat="server" Text="Address :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:TextBox ID="txtAddressForeign" runat="server" Width="100%"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorAddressForeign" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnTo" runat="server" GroupingText="To" BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbCityTo" runat="server" Text="City :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:DropDownList ID="ddlCityTo" runat="server" Width="100%" AppendDataBoundItems="true">
                                                                    <asp:ListItem>--- Please select city ---</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbDistrictTo" runat="server" Text="District :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                
                                                                 <asp:DropDownList ID="ddlDistrictTo" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbAddressTo" runat="server" Text="Address :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtAddressTo" Width="100%" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorAddressTo" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnDetail" runat="server" GroupingText="Detail" 
                                                    BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbLocation" runat="server" Text="Option :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="checkOption" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbFee" runat="server" Text="Fee :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="spFee" runat="server" Text=""></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="lbFeeDescription1" runat="server" Font-Size="Small" ForeColor="Black"
                                                                    Text="usd/kg"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbWeight" runat="server" Text="Weight :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%">
                                                                <asp:TextBox ID="txtWeight" runat="server" Width="100%"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorWeight" runat="server" ForeColor="#FF3300" Text="Must be number"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbOptionSend" runat="server" Text="Kind to send :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="lbKindToSend" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbAdditionalFee" runat="server" Text="Additional Fee :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="lbAddFee" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbParcel" runat="server" Text="Parcel Post ID :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbParcelPostID" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbServiceDetail" runat="server" Text="Service ID :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbServiceDetailID" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbUserName" runat="server" Text="Account Name:"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbUser" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbDiscountID" runat="server" Text="Discount ID :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbDiscountIDSession" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%" >
                                                                <asp:Label ID="lbDiscount" runat="server" Text="Discount Name :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%" >
                                                                <asp:Label ID="lbDiscountName" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbDiscount3" runat="server" Text="Discount Price :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lbDiscountPrice" runat="server" ForeColor="Black"></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="lbFeeDescription2" runat="server" Font-Size="Small" 
                                                                    ForeColor="Black" Text="usd"></asp:Label>
                                                            </td>
                                                            <td class="style5">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                                &nbsp;
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnTotalAmount" runat="server" GroupingText="Total Amount" 
                                                    BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbTotalAmount" runat="server" Text="Total :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="lbFeeDescription0" runat="server" Font-Size="Small" ForeColor="Black"
                                                                    Text="usd"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                &nbsp;
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <input type="button" id="btSubmit" runat="server" value="Submit" style="width: 65px"
                                                                    onclick="clicker()" />
                                                                <asp:Button ID="btBack" runat="server" Text="Back" Width="68px" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 10%">
                                                                &nbsp;
                                                            </td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="lbError" runat="server" ForeColor="Black"></asp:Label>
                                                                <p>
                                                                    <asp:Label ID="lbOutput" runat="server" ForeColor="Black"></asp:Label></p>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- END AUTONOMY SEARCH -->
                    </div>
                </div>
                <!-- END AUTONOMY SEARCH -->
            </div>
        </div>
        <div id="Footer">
            <div class="textHidden">
                <p>
                    <a href="#footernav">Skip navigationv&quot;&gt;Skip navigation </noscript>
        </div>
    </div>
    </form>
</body>
</html>
