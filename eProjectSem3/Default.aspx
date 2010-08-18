<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
			<!--<meta http-equiv="Content-Type" content="text/html; charset=utf-8">-->
			
		<title>Parcel Post Office Online</title>
		<!-- Styles -->
		<link rel="stylesheet" type="text/css" media="screen" href="css/styles.css"  />
		<link rel="stylesheet" type="text/css" media="print" href="css/print.css"  />
		<link rel="stylesheet" type="text/css" media="handheld" href="css/handheld.css"  />
		<link rel="stylesheet" type="text/css" media="screen" href="css/header/small.css" />
        <script src="js/jquery-1.4.2.js" type="text/javascript"></script>
 <script language="javascript" type="text/javascript">
     var msg = " Parcel Post Office Online ";
     var pos = 0;
     var spacer = " ... ";
     var time_length = 500;
     function ScrollTitle() {
         document.title = msg.substring(pos, msg.length) + spacer + msg.substring(0, pos);
         pos++;
         if (pos > msg.length) pos = 0;
         window.setTimeout("ScrollTitle()", time_length);
     }
     ScrollTitle();
</script>
	<script type="text/javascript">
           $(document).ready(function(){
           
              $("#LinkButton1").click(function(){
                   $("#loading").show();
                   $("#content").load("Magazine.aspx");
                   return false;
               });
               $("#LinkButton2").click(function() {
                   $("#loading").show();
                   $("#content").load("ParcelPostOfficeServiceDetail.aspx");
                   return false;
               });
               $("#LinkButton3").click(function() {
                   $("#loading").show();
                   $("#content").load("MagazineCart.aspx");
                   return false;
               });
            });
      </script>
<style>

       #loading {
               display: none;
            }
</style>
	</head>
<body>

    <form id="form1" runat="server">

<div id="nav-container">

    <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
    <asp:LinkButton ID="LinkButton2" runat="server"> Parcel Post Service</asp:LinkButton>
  
    <asp:LinkButton ID="LinkButton3" runat="server">Shopping cart</asp:LinkButton>
  
</div>
<div id="container" >
  <div id="content-container">
		<div id="content" style="text-align:center">
		<div id="loading" style="text-align:center">
              <img src="images/ajax-loader.gif" width="20" height="20">
              <p><blink>Loading.........</blink></p>
          </div>
    </div>
		<div id="sidebar"></div>
		<div class="clearer"></div>
  </div>
	<div class="content-bottom"></div>
</div>

<div id="footer">
  <p>Copyright &copy; 2010 , Group I - C0807I - FPT - Aptech .</p>
    <p>Visitors : <%=Application["count_visit"].ToString()%> <img src="images/User.png" /></p>
 </div>



    </form>



</body>
</html>