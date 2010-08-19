<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Magazine.aspx.cs" Inherits="Magazine" %>

<<<<<<< .mine


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
  
    
       <asp:Repeater ID="rpt_magazine" runat="server" 
    onitemcommand="rpt_magazine_ItemCommand" >
<HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
        <div style="float: left; width: 27%; ">
           <table style="width: 20%; height: 50px;">
           <tr align=center>
           <td colspan=3 align="center"> <img alt="Không có ảnh" width="150"  src="images/<%#DataBinder.Eval(Container.DataItem, "magazineImage")%>" /></td>
=======
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 229px;
        }
        .style2
        {
            width: 700px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="loader">
        <div id="magazineContent">
            <table width="100%">
>>>>>>> .r3
            <tr>
                <td class="style1">
                </td>
                <td class="style2">
                <asp:Repeater ID="rpt_magazine" runat="server" OnItemCommand="rpt_magazine_ItemCommand">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="float: left; width: 27%;">
                            <table style="width: 20%; height: 50px;">
                                <tr align="center">
                                    <td colspan="3" align="center">
                                        <img alt="Không có ảnh" width="150" src="images/<%#DataBinder.Eval(Container.DataItem, "magazineImage")%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <h3>
                                            <%# DataBinder.Eval(Container.DataItem, "magazineName")%></h3>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" Text="Đặt mua" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "magazineDailyID")%>'
                                            OnCommand="addCart" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:LinkButton ID="LinkButton2" Text="Chi tiết" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "magazineDailyID")%>'
                                            OnCommand="viewDetails" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
                </td>
                <td>
                </td>
                </tr>
                </table>
        </div>
        
    </div>
    </form>
</body>
</html>
