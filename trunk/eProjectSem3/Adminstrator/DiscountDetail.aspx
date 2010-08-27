<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DiscountDetail.aspx.cs" MasterPageFile="~/Adminstrator/MasterPage.master"
    Inherits="DiscountDetail" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="style1">
                Discount ID :
            </td>
            <td class="style2">
                <asp:Label ID="lbDiscountID" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style1">
                Discount Name :
            </td>
            <td class="style2">
                <asp:TextBox ID="txtDiscountName" runat="server" Width="500px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDiscountName"
                    ErrorMessage="Discount Name Not Allow Null">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Discount Brief :
            </td>
            <td class="style4">
                <asp:TextBox ID="txtDiscountBrief" runat="server" Width="500px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDiscountBrief"
                    ErrorMessage="Discount Brief Not Allow Null">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Discount Content :
            </td>
            <td class="style4">
                <asp:TextBox ID="txtDiscountContent" runat="server" Rows="10" TextMode="MultiLine"
                    Width="500px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDiscountContent"
                    ErrorMessage="Discount Content Not Allow Null">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                Discount Image :
            </td>
            <td class="style4">
                <asp:Image ID="discountImage" runat="server" Height="139px" Width="268px" />
                <br />
                Image :
                <asp:Label ID="lbImage" runat="server"></asp:Label>
                <br />
                <asp:FileUpload ID="fileUpload" runat="server" />
                <br />
                click Browser to change your Image.
            </td>
            <td class="style5">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style3">
                Discount Price :
            </td>
            <td class="style4">
                <asp:TextBox ID="txtPrice" runat="server" Width="323px"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrice"
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
            <td class="style5">
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
                <br />
            </td>
            <td class="style5">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;
            </td>
            <td class="style4">
                <asp:Button ID="btSubmit" runat="server" OnClick="btSubmit_Click" Text="Submit" />
                <asp:Button ID="btCancel" runat="server" OnClick="btCancel_Click" Text="Cancel" />
            </td>
            <td class="style5">
                &nbsp;
            </td>
        </tr>
    </table>
</asp:Content>
