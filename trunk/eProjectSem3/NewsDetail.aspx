<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetail.aspx.cs" MasterPageFile="~/MasterPage.master"
    Inherits="NewsDetail" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 10%">
                    &nbsp;
                </td>
                <td style="width: 80%">
                    <asp:Repeater ID="rptNewsDetail" runat="server" OnItemCommand="rptNewsDetail_ItemCommand">
                        <HeaderTemplate>
                            <table style="width: 100%; vertical-align: middle">
                                <tr>
                                    <td style="width: 100%" align="left">
                                        News >>.
                                    </td>
                                    <hr />
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div style="float: left; width: 100%">
                                <table style="width: 100%; height: 141px;">
                                    <tr>
                                        <td align="left" style="font-style: italic; font-family: Times New Roman;">
                                            Title :
                                            <%# DataBinder.Eval(Container.DataItem, "newsTitle")%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <%# DataBinder.Eval(Container.DataItem, "newsBrief")%>...<p>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <img alt="Không có &#7843;nh" width="50%" src="images/<%#DataBinder.Eval(Container.DataItem, "newsImage")%>" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lbContent" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "newsContent")%>'></asp:Label>
                                        </td>
                                    </tr>
                                    <hr />
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
        <table>
            <tr>
                <td style="width: 20%">
                </td>
                <td align="center" style="width: 40%">
                    <asp:Repeater ID="rptNewsFooter" runat="server">
                        <HeaderTemplate>
                            <table style="width: 100%">
                                <hr />
                                <tr>
                                    <td style="width: 5%">
                                    </td>
                                    <td align="left" style="width: 100%">
                                        Old News :
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div style="float: left; width: 100%">
                                <table style="width: 100%">
                                    <tr>
                                        <td style="width: 0%">
                                        </td>
                                        <td align="left" valign="middle" style="width: 100%; font-size: smaller; font-style: oblique;
                                            font-family: Times New Roman;">
                                            <li><a href="NewsDetail.aspx?newsID=<%#DataBinder.Eval(Container.DataItem, "newsID")%>" id="Button1" style="font-family: Times New Roman; font-size: small;
                                                font-style: italic">
                                                <%# DataBinder.Eval(Container.DataItem, "newsTitle")%></a></li>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                        </FooterTemplate>
                    </asp:Repeater>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
