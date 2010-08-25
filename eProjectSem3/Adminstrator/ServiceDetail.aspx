<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage.master"
    CodeFile="ServiceDetail.aspx.cs" Inherits="Adminstrator_ServiceDetail" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    Service Detail ID :
                </td>
                <td>
                    <asp:Label ID="lbServiceDetail" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    Welcome
                    <asp:Label ID="lbUserName" runat="server" Text=""></asp:Label>! Have a nice day
                </td>
            </tr>
            <tr>
                <td>
                    Service ID :
                </td>
                <td>
                    <asp:DropDownList ID="ddlServiceID" runat="server">
                        <asp:ListItem Value="1">Parcel Post Office</asp:ListItem>
                        <asp:ListItem Value="2">Magazine Daily</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Service Detail Name :
                </td>
                <td>
                    <asp:TextBox ID="txtServiceDetailName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtServiceDetailName"
                        ErrorMessage="Service Detail Name Not Allow Null">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Service Detail Description :
                </td>
                <td>
                    <asp:TextBox ID="txtDesciption" runat="server" Rows="10" TextMode="MultiLine" Width="428px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesciption"
                        ErrorMessage="Service Description Not Allow Null">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Service Detail Price :
                </td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server" Width="242px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice"
                        ErrorMessage="Price Not Allow Null">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice"
                        ErrorMessage="Price must be number" ValidationExpression="^[0-9]*$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Service Detail Image :
                </td>
                <td>
                    <asp:Image ID="imageServiceDetail" runat="server" Height="163px" Width="242px" />
                    <p>
                        Image :
                        <asp:Label ID="lbImage" runat="server" Text=""></asp:Label>
                    </p>
                    <asp:FileUpload ID="fileUpLoad" runat="server" Width="219px" />
                    <br />
                    Click browser if you want to change image
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Make By :
                </td>
                <td>
                    <asp:Label ID="lbAdmin" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    Status :
                </td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Value="1">True</asp:ListItem>
                        <asp:ListItem Value="0">False</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="List Error :" />
                    <asp:Label ID="lbOutput" runat="server" ForeColor="#0099CC"></asp:Label>
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    <asp:Button ID="btSubmit" runat="server" Text="Submit" OnClick="btSubmit_Click" />
                    <asp:Button ID="btCancel" runat="server" Text="Cancel" OnClick="btCancel_Click" />
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
