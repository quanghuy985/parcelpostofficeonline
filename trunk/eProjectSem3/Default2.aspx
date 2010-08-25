<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" MasterPageFile="~/MasterPage.master"
    Inherits="Default2" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%; margin-right: 0px;">
        <tr>
            <td class="style1" style="width: 367px">
                <asp:Repeater ID="rptNews" runat="server">
                    <HeaderTemplate>
                        <table width="50%">
                            <tr>
                                <td style="width: 10%; font-size: large" align="left">
                                    Hot News >>.
                                </td>
                                <hr />
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="float: left; width: 20px" id="Loader">
                            <table style="width: 20px; height: 20px;">
                                <tr>
                                    <td align="center">
                                        <img alt="Không có &#7843;nh" width="300px" height="200px" src="images/<%#DataBinder.Eval(Container.DataItem, "newsImage")%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="font-style: italic; font-family: Times New Roman;">
                                        Brief :<a href="NewsDetail.aspx?newsID=<%#DataBinder.Eval(Container.DataItem, "newsID")%>"
                                            style="font-family: Times New Roman; font-size: medium; font-style: italic">
                                            <%# DataBinder.Eval(Container.DataItem, "newsTitle")%></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <%# DataBinder.Eval(Container.DataItem, "newsBrief")%>...<a href="NewsDetail.aspx?newsID=<%#DataBinder.Eval(Container.DataItem, "newsID")%>"
                                            id="A1" style="font-style: italic"> More...</a>
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
            <td style="width: 500px">
                <asp:Repeater ID="rptNewsFooter" runat="server">
                    <HeaderTemplate>
                        <table style="width: 100%">
                            <hr />
                            <tr>
                                <td style="width: 5%">
                                </td>
                                <td align="left" style="width: 50%">
                                    Old News :
                                </td>
                                <td>
                                </td>
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="float: left; width: 100%">
                            <table style="width: 50%">
                                <tr>
                                    <td style="width: 5%">
                                    </td>
                                    <td align="left" valign="middle" style="width: 100%; font-size: smaller; font-style: oblique;
                                        font-family: Times New Roman;">
                                        <li><a href="NewsDetail.aspx?newsID=<%#DataBinder.Eval(Container.DataItem, "newsID")%>"
                                            style="font-family: Times New Roman; font-size: small; font-style: italic">
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
        <tr>
            <td colspan="2">
                <asp:Repeater ID="rptListNewsFooter" runat="server">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <td style="width: 100%" align="center">
                                    Attention News >>>
                                </td>
                                <hr />
                            </tr>
                        </table>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="float: left; width: 30%">
                            <table style="width: 100%; height: 141px;">
                                <tr>
                                    <td align="center">
                                        <img alt="Không có &#7843;nh" width="100" src="images/<%#DataBinder.Eval(Container.DataItem, "newsImage")%>" />
                                    </td>
                                    <td align="center" style="font-style: italic; font-family: Times New Roman;">
                                        Brief :<a href="NewsDetail.aspx?newsID=<%#DataBinder.Eval(Container.DataItem, "newsID")%>">
                                            <%# DataBinder.Eval(Container.DataItem, "newsTitle")%></a>
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
        </tr>
    </table>
</asp:Content>
