<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListMagazine.ascx.cs" Inherits="UAC_ListMagazine" %>
<asp:Repeater ID="rpt_magazine" runat="server" 
    onitemcommand="rpt_magazine_ItemCommand">
<HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
        <div style="float: left; width: 200px; ">
           <table width=200>
           <tr>
           <td colspan=3 align="center"> <img alt="Không có ảnh" width="150"  src="images/<%#DataBinder.Eval(Container.DataItem, "magazineImage")%>" /></td>
            <tr>
            <td ><h3 ><%# DataBinder.Eval(Container.DataItem, "magazineName")%></h3></td>           
           <td><asp:LinkButton ID="LinkButton1" Text="Đặt mua" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "magazineDailyID")%>' OnCommand="addCart" runat="server" /></td>
            <td><asp:LinkButton ID="LinkButton2" Text="Chi tiết" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "magazineDailyID")%>' OnCommand="viewDetails" runat="server" /></td>
            </tr>                     
            </tr>            
            </table>
            <div>&nbsp;</div>
        </div>
        
    </ItemTemplate>
    <FooterTemplate>
       
    </FooterTemplate>
</asp:Repeater>
