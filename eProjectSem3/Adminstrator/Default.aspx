<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Adminstrator/MasterPage1.master"
    CodeFile="Default.aspx.cs" Inherits="Adminstrator_Default" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="width: 100%;">
            <tr>
                <td class="style4" align="right">
                    Username :
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtUserName" runat="server" Width="238px"></asp:TextBox>
                </td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Username not null"
                        ControlToValidate="txtUserName">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4" align="right">
                    Password :
                </td>
                <td class="style2">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="238px"></asp:TextBox>
                </td>
                <td class="style3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password not null"
                        ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                </td>
                <td class="style2">
                    <asp:Button ID="Button1" runat="server" Text="Login" Width="91px" OnClick="Button1_Click" />
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                </td>
                <td class="style2">
                    <asp:Label ID="lbError" runat="server" ForeColor="Red"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        HeaderText="List Error" />
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
