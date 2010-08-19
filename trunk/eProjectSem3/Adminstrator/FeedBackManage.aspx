<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedBackManage.aspx.cs" Inherits="Adminstrator_FeedBackManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Black Admin v2 - Template Admin - Nice Theme</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<style type="text/css" media="all">
		@import url(css/style.css);
		
	</style>	
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery_ui.js" type="text/javascript"></script>
	<script src="js/wysiwyg.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
    <script src="../js/jquery-1.4.2.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        var $j = jQuery.noConflict();

        function clickhere(id, nguoinhan) {

            document.getElementById("TextArea1").value = "";
            $j("#checkReturn").text("");
                $j("#Panel1").slideDown("slow");
                $j("#idnguoinhan").text(id);
                $j("#nguoinhan").text(nguoinhan);
           
                return false;
            }       
 </script>
  <script language="javascript" type="text/javascript">
      var $j = jQuery.noConflict();
      $j(document).ready(function() {
          $j("#Button3").click(function() {
              $j("#Panel1").hide();
          });
      });
 </script>
 <script language="javascript" type"text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function() {

            $j("#Button2").click(function() {
                $j.ajax({
                    type: "POST",

                    url: "FeedBackManage.aspx/sendmail",
                    data: "{type:'chanvl','id':'" + $j("#idnguoinhan").text() + "','email':'" + $j("#nguoinhan").text() + "','body':'" + $j("#TextArea1").val() + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function(message) {
                        $j("#Panel1").hide();
                        $j("#checkReturn").text("Đã gửi thành công !");
                    },
                    error: function(errormessage) {
                        //Hiển thị lỗi nếu xảy ra
                        $j("#checkReturn").text(errormessage.responseText);
                    }
                });
            });
        });
        </script>
        <script type="text/javascript">
            var $j = jQuery.noConflict();
            $j(document).ready(function() {

            $j("#.delbutton").click(function() {

                    //Get the Id of the record to delete
            var record_id = $j(this).attr("id");
            var record_email = $j(this).attr("title")
                    //Get the GridView Row reference
                    var tr_id = $j(this).parents("#.record");
                          
                                // Change the back color of the Row before deleting
                                tr_id.css("background-color", "lightgreen");
                                            document.getElementById("TextArea1").value = "";
                                            $j("#checkReturn").text("");
                                                $j("#Panel1").slideDown("slow");
                                                $j("#idnguoinhan").text(record_id);
                                                $j("#nguoinhan").text(record_email);
                                // Do some animation effect
//                                tr_id.fadeOut(1, function() {

//                                    //Remove GridView row
//                                    tr_id.remove();
//                                });
                            
                       
                    return false;
                });
            });
            
</script>
 <script type="text/javascript">
     var $j = jQuery.noConflict();
     $j(document).ready(function() {

     $j("btDelete").click(function() {

 
             var agree = confirm("Thông tin hợp lệ. Bạn có muốn tiếp tục đăng ký không?");
             if (agree)
                 return true;
             else
                 return false;
         

         });
     });
            
</script>
    <style type="text/css">
        #TextArea1
        {
            width: 822px;
            height: 180px;
        }
        .style2
        {
        }
        
    </style>
      <style type="text/css">
       
       #Panel1
       {
       	display:none;
       } 
            
          .style3
          {
              width: 4px;
          }
            
          .style4
          {
              width: 4px;
              height: 23px;
          }
          .style5
          {
              height: 23px;
          }
            
          </style>
</head>
<body>
   <form id="form1" runat="server">
<div id="container"> <!-- Container -->
	<div id="header"> <!-- Header -->
		<div id="title">
			Control Panel <span>Adminstrator &amp; Employee</span>
		</div>
		<div class="logged">
			<p>Hello,
                <asp:Label ID="lbUserName" runat="server" Text="Label"></asp:Label>
            </p>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://nicetheme.net" target="_blank">Sign Out</a></p>
			<p>&nbsp;</p>
		</div>
	</div>	
	<div id="sidebar"> <!-- Sidebar -->
		<div class="sidebox">
			<span class="stitle">Navigation</span>
		<div id="navigation"> <!-- Navigation begins here -->
			<div class="sidenav"><!-- Sidenav -->
				<div class="navhead_blank"><span><a href="#" title="">H</a><a href="#">ome</a></span></div>
				<div class="navhead"><span>Articles</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Write a new Article</a></li>
							<li><a href="#" title="">Manage Articles</a></li>
							<li><a href="#" title="">Manage Comments</a></li>
							<li><a href="#" title="">Manage Categories</a></li>
						</ul>
					</div>
				<div class="navhead"><span>Events Calendar</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
						</ul>
					</div>
				<div class="navhead"><span>Pages</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
							<li><a href="#" title="">Submenu Item 4</a></li>
						</ul>
					</div>
					<div class="navhead"><span>Image Gallery</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
						</ul>
					</div>
				<div class="navhead"><span>Settings</span></div>
					<div class="subnav">
						<ul class="submenu">
							<li><a href="#" title="">Submenu Item 1</a></li>
							<li><a href="#" title="">Submenu Item 2</a></li>
							<li><a href="#" title="">Submenu Item 3</a></li>
						</ul>
					</div>
			</div>
		</div> <!-- END Navigation -->
		</div>
	</div> <!-- END Sidebar -->
	<div id="main"> <!-- Main, right side content -->
		<div id="content"> <!-- Content begins here -->
            <div>
    
        <table align="center" style="width:100%;">
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td align="center">
                <asp:Panel ID="Panel2" runat="server" GroupingText="Các phản hồi">
               <%--
               <table style="width:100%;" border="1" >
              
                   <asp:Repeater ID="rptNewsDetail" runat="server">
                    <HeaderTemplate>
                     
                        <tr>
                        <td style="width:10%"> ID </td>
                            <td class="style1" align="left">
                                FeedBack Content</td>
                            <td align="left" class="style6" style="width:20%">
                                Sender</td>
                                 <td align="left" class="style7">
                                Email</td>
                                <td align="right" style="width:20%"> Action</td>
                        </tr>
                    
                    </HeaderTemplate>
                     <ItemTemplate>
                    
                      <tr>
                       <td style="width:10%"> <%# DataBinder.Eval(Container.DataItem, "feedID")%>
                                </td>
                            <td class="style1" align="left">
                                <%# DataBinder.Eval(Container.DataItem, "feedContent")%></td>
                                <td align="left" class="style6" style="width:20%">
                                <%# DataBinder.Eval(Container.DataItem, "cusUserName")%>
                                </td>
                                <td align="left" class="style7">
                                <%# DataBinder.Eval(Container.DataItem, "cusEmail")%>
                                </td>
                                <td align="right" style="width:20%">
                                <input id="Button1"  type="button" value="Reply"  onclick="clickhere('<%# DataBinder.Eval(Container.DataItem, "feedID")%>','<%# DataBinder.Eval(Container.DataItem, "cusEmail")%>')"  />
                                <input id="Button4" type="button" value="Delete" />
                                <input id="KhoaAcc" type="button" value="Lock Account"
                                </td>        
                        </tr>
                        
                     
                     </ItemTemplate>
                   </asp:Repeater>
                   </table>--%>
                   <asp:GridView CellPadding="3" Width="100%" CellSpacing="2" ID="gvFeedBack" 
                        runat="server" RowStyle-CssClass="record" AutoGenerateColumns="False" 
                        AllowPaging="True" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" 
                        BorderWidth="1px" >
        <RowStyle CssClass="record" BackColor="#FFF7E7" ForeColor="#8C4510"></RowStyle>
          <Columns>
              <asp:BoundField DataField="feedID" HeaderText="ID" />
              <asp:BoundField DataField="feedContent" HeaderText="Feed Content" />
              <asp:BoundField DataField="cusUserName" HeaderText="Sender" />
              <asp:BoundField DataField="cusEmail" HeaderText="Email" />
              <asp:TemplateField>
                  <ItemTemplate>
                    <asp:Button runat="server" ID="btDelete" Text="Delete" OnCommand= "Delete" CommandArgument= '<%# DataBinder.Eval(Container.DataItem, "feedID")%>' />
                  
                    <input id="Button1" class="Button1"  type="button" value="Reply"  onclick="clickhere('<%# DataBinder.Eval(Container.DataItem, "feedID")%>','<%# DataBinder.Eval(Container.DataItem, "cusEmail")%>')"  />
                  
                    <asp:Button runat="server" ID="btLock" Text="Lock Account" OnCommand= "Lock" CommandArgument= '<%# DataBinder.Eval(Container.DataItem, "cusUserName")%>' />
                  </ItemTemplate>
              </asp:TemplateField>
          </Columns>
                       <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                       <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                       <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                       <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
    </asp:GridView>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style4">
                    </td>
                <td class="style5" align="center">
                    <span style="color:Red;" id="checkReturn"></span>
                    <asp:Label ID="lbReturn" runat="server" ForeColor="#CC0000"></asp:Label>
                    </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    <asp:Panel ID="Panel1" runat="server" GroupingText="Trả Lời Phản Hồi">
                        <table style="width:100%;" >
                            <tr>
                                <td class="style2">
                                    ID :  <samp ID="idnguoinhan" style="color:Red;font-size:larger">
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    Người nhận :
                                    <samp ID="nguoinhan" style="color:Red;font-size:larger">
                                    </samp>
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style2" colspan="3">
                                    Nội dung<textarea style="width:100%" ID="TextArea1" cols="20" name="S1" rows="1"></textarea></td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    <input ID="Button2" type="button" value="Gửi" />&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input ID="Button3" type="button" value="Hủy bỏ" /></td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
		    
		</div> <!-- END Content -->

	</div> 	
		<div id="footer"> 
			<p>Copyright <a rel="dofollow" target="_blank" href="http://nicetheme.net/">Nice Theme</a> 2009. All rights reserved.</p>
		</div>	
</div> <!-- END Container -->
    </form>
</body>
</html>
