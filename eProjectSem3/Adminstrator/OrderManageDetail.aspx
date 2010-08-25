<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage1.master"
    CodeFile="OrderManageDetail.aspx.cs" Inherits="Adminstrator_OrderManageDetail" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
            <tr>
                <td style="width: 297px">
                </td>
                <td>
                    <asp:GridView ID="gvOrderManageDetail" runat="server" BackColor="#DEBA84" BorderColor="#DEBA84"
                        BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowSorting="true" AllowPaging="true"
                        AutoGenerateColumns="false" CellSpacing="2">
                        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="orderDetailID" HeaderText="OrderDetail ID" />
                            <asp:BoundField DataField="cusUserName" HeaderText="Customer" />
                            <asp:BoundField DataField="serviceDetailName" HeaderText="Service Name" />
                            <asp:BoundField DataField="parcelWeight" HeaderText="Weight" />
                            <asp:BoundField DataField="totalAmount" HeaderText="Total" />
                            <asp:BoundField DataField="dateOrder" HeaderText="Date Order" />
                            <asp:BoundField DataField="dateTreat" HeaderText="Date Treat" />
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    Control
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtSelect" OnCommand="lbtSelectCommand" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "orderDetailID")%>'
                                        runat="server"> More </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td style="width: 234px">
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
