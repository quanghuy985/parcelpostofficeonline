<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscountManage.aspx.cs" Inherits="Adminstrator_DiscountManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Dashboard - Admin Template</title>
    <link rel="stylesheet" type="text/css" href="css/theme.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />

    <script>
        var StyleFile = "theme" + document.cookie.charAt(6) + ".css";
        document.writeln('<link rel="stylesheet" type="text/css" href="css/' + StyleFile + '">');
    </script>
<style type="text/css" media="all">
		@import url(css/style.css);
		
	</style>	
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/jquery_ui.js" type="text/javascript"></script>
	<script src="js/wysiwyg.js" type="text/javascript"></script>
	<script src="js/functions.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 187px;
        }
        .style2
        {
            width: 590px;
        }
        .style3
        {
            width: 174px;
        }
        .style4
        {
            width: 340px;
        }
        #pnAddNew 
        {
        	display:none;
        }
    </style>

    <script src="../js/jquery-1.4.2.js" type="text/javascript"></script>

    <script type="text/javascript">
        var $j = jQuery.noConflict();
        $j(document).ready(function() {
            $j("#btAddNew").click(function() {
                $j("#pnAddNew").slideDown("slow");
            });
        });
    </script>

</head>
<body>
    <div id="container">
        <div id="header">
            <h2>
                My eCommerce Admin area</h2>
            <div id="topmenu">
                <ul>
                    <li><a href="revenue.aspx">Home</a></li>
                    <li><a href="newmanager.aspx">News Manage</a></li>
                    <li><a href="FeedBackManage.aspx">FeedBack</a></li>
                    <li><a href="MagazineManager.aspx">Magazine Manage</a></li>
                    <li><a href="ServiceDetailManage.aspx">Service Manage</a></li>
                    <li><a href="OrderManage.aspx">Parcel Order</a></li>
                    <li><a href="revenue.aspx">Revenue Manage</a></li>
                    <li><a href="Login.aspx">Login</a></li>
                </ul>
            </div>
        </div>
                <form id="Form1" runat="server">
        <div id="top-panel">
            <div id="panel">
                <table>
                    <tr>
                        <td>
                            Welcome :
                            <asp:Label ID="lbUser" runat="server" Text=""></asp:Label>! Have A Nice Day...&nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" OnCommand="Log_out">Log Out</asp:LinkButton>
                        </td>
                        <td>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div id="wrapper">
            <div id="content">
        <table style="width: 100%;">
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style2">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None"
                        BorderWidth="1px" CellPadding="4" DataKeyNames="discountID" DataSourceID="gvDiscountDataSource"
                        Width="595px">
                        <RowStyle BackColor="White" ForeColor="#330099" />
                        <Columns>
                            <asp:BoundField DataField="discountID" HeaderText="discountID" InsertVisible="False"
                                ReadOnly="True" SortExpression="discountID" />
                            <asp:BoundField DataField="discountName" HeaderText="discountName" SortExpression="discountName" />
                            <asp:BoundField DataField="discountBrief" HeaderText="discountBrief" SortExpression="discountBrief" />
                            <asp:BoundField DataField="discountImage" HeaderText="discountImage" SortExpression="discountImage" />
                            <asp:BoundField DataField="discountPrice" HeaderText="discountPrice" SortExpression="discountPrice" />
                            <asp:CheckBoxField DataField="discountStatus" HeaderText="discountStatus" SortExpression="discountStatus" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Control
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <a href="DiscountDetail.aspx?discountID=<%# DataBinder.Eval(Container.DataItem, "discountID")%>" id="link">Select</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style2">
                    <asp:SqlDataSource ID="gvDiscountDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:callConnection %>"
                        SelectCommand="SELECT [discountID], [discountName], [discountBrief], [discountImage], [discountPrice], [discountStatus] FROM [tblDiscount]">
                    </asp:SqlDataSource>
                    <input id="btAddNew" type="button" value="AddNew" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td class="style2">
                    &nbsp;
                    <asp:Panel ID="pnAddNew" runat="server" GroupingText="Add New Discount" Style="margin-top: 0px"
                        Width="645px">
                        <table style="width: 100%;">
                            <tr>
                                <td class="style3">
                                    Discount Name :
                                </td>
                                <td class="style4">
                                    <asp:TextBox ID="txtDiscountName" runat="server" Width="335px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDiscountName"
                                        ErrorMessage="Discount Name not allow null">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Discount Brief :
                                </td>
                                <td class="style4">
                                    <asp:TextBox ID="txtDiscountBrief" runat="server" Rows="3" TextMode="MultiLine" Width="335px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDiscountBrief"
                                        ErrorMessage="Discount Brief not allow null">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Discount Content :
                                </td>
                                <td class="style4">
                                    <asp:TextBox ID="txtDiscountContent" runat="server" Rows="5" TextMode="MultiLine"
                                        Width="335px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDiscountContent"
                                        ErrorMessage="Discount Content not allow null">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Discount Image :
                                </td>
                                <td class="style4">
                                    <asp:Label ID="lbImage" runat="server"></asp:Label>
                                    <br />
                                    <asp:FileUpload ID="fileUpload" runat="server" />
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Discount Price :
                                </td>
                                <td class="style4">
                                    <asp:TextBox ID="txtDiscountPrice" runat="server" Width="335px"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtDiscountPrice"
                                        ErrorMessage="Discount Price not allow null">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtDiscountPrice"
                                        ErrorMessage="Price Must Be A Number" ValidationExpression="^[0-9]*$">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Discount Status :
                                </td>
                                <td class="style4">
                                    <asp:DropDownList ID="ddlStatus" runat="server">
                                        <asp:ListItem Value="0">False</asp:ListItem>
                                        <asp:ListItem Value="1">True</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    &nbsp;
                                </td>
                                <td class="style4">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="List Errors :" />
                                    <asp:Label ID="lbOutput" runat="server" ForeColor="#0099CC"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    &nbsp;
                                </td>
                                <td class="style4">
                                    <asp:Button ID="btSubmit" runat="server" Text="Submit" 
                                        onclick="btSubmit_Click" />
                                    <asp:Button ID="btCancel" runat="server" Text="Cancel" />
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
                </form>
        <div id="footer">
            <div id="credits">
                Template by <a href="http://www.bloganje.com">Bloganje</a>
            </div>
            <div id="styleswitcher">
                <ul>
                    <li><a href="javascript: document.cookie='theme='; window.location.reload();" title="Default"
                        id="defswitch">d</a></li>
                    <li><a href="javascript: document.cookie='theme=1'; window.location.reload();" title="Blue"
                        id="blueswitch">b</a></li>
                    <li><a href="javascript: document.cookie='theme=2'; window.location.reload();" title="Green"
                        id="greenswitch">g</a></li>
                    <li><a href="javascript: document.cookie='theme=3'; window.location.reload();" title="Brown"
                        id="brownswitch">b</a></li>
                    <li><a href="javascript: document.cookie='theme=4'; window.location.reload();" title="Mix"
                        id="mixswitch">m</a></li>
                    <li><a href="javascript: document.cookie='theme=5'; window.location.reload();" title="Mix"
                        id="defswitch">m</a></li>
                </ul>
            </div>
            <br />
        </div>
    </div>
</body>
</html>
