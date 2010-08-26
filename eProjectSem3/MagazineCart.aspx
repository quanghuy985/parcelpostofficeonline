<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="MagazineCart.aspx.cs" Inherits="MagazineCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <asp:Label ID="Label6" runat="server" Text="You wasn't select Magazine. please select Magazin from "
        Visible="False"></asp:Label><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Magazine.aspx"
            Visible="False">Magazine Page</asp:HyperLink>
    <br />
    <br />
    <asp:Repeater ID="rpt_mg_cart" runat="server">
        <HeaderTemplate>
            <table id="tb" border="1" cellpadding="2" width="100%" align="center">
                <tr>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th style="color: Black">
                        Cac tap chi da dat
                    </th>
                    <th style="width: 128px">
                    </th>
                    <th>
                    </th>
                </tr>
                <tr align="center">
                    <th style="color: Black">
                        Magazine ID
                    </th>
                    <th style="color: Black">
                        Magazine Nmae
                    </th>
                    <th style="color: Black">
                        Price
                    </th>
                    <th style="color: Black; width: 128px;">
                        Thang
                    </th>
                    <th style="color: Black">
                        Thao tác
                    </th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td style="color: Black">
                    <%# DataBinder.Eval(Container.DataItem, "MagazineDailyID")%>
                </td>
                <td style="color: Black">
                    <%# DataBinder.Eval(Container.DataItem, "magazineName")%>
                </td>
                <td style="color: Black">
                 <%# DataBinder.Eval(Container.DataItem, "magazinePrice")%>
                </td>
                <td style="color: Black; width: 128px;">
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "MonthMagazineDaily", "{0: ###,###}") %>'
                        Width="59%" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </td>
                <td style="color: Black">
                    <asp:Button ID="btnUpdate" runat="server" Text="C&#7853;p nh&#7853;t" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "MagazineDailyID")%>'
                        OnCommand="updateCart" Width="82px" />
                    <asp:Button ID="btnDelete" runat="server" Text="Xóa" CommandArgument='<%#DataBinder.Eval(Container.DataItem, "magazineDailyID")%>'
                        OnCommand="deleteCart" Width="56px" />
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Button ID="btncheckout" runat="server" OnClick="Button1_Click" Text="Check Out"
        Style="width: 94px" />
    &nbsp;<br />
    <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
    &nbsp;<asp:Label ID="Label5" runat="server"
        Text="Label"></asp:Label>
    <br />
    <asp:Panel ID="Panel1" runat="server" Height="166px" Visible="False" Width="355px">
        <table style="width: 97%; height: 98px;">
            <tr>
                <td class="style1">
                    &nbsp;
                </td>
                <td align="center">
                    Thong tin khach hang
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    Service Detail
                </td>
                <td colspan="2" class="style5">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Adress
                </td>
                <td colspan="2" style="color: #FF0000">
                    <asp:TextBox ID="txtadress" runat="server" Width="283px" Height="29px"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtadress"
                        ErrorMessage="pleade insert full adress"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1" align="center" colspan="3">
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Submit" Width="80px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
</asp:Content>
