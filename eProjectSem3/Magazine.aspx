﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Magazine.aspx.cs" Inherits="Magazine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
            <table width="100%">

            <tr>
                <td >
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
                                        <h3>
                                           Price: <%# DataBinder.Eval(Container.DataItem, "magazinePrice")%>$</h3>
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
</asp:Content>