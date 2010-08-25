<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FeedBack.aspx.cs" MasterPageFile="~/MasterPage.master" Inherits="FeedBack" %>

<asp:Content ID="cntContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table style="width:100%;">
        <tr>
            <td style="width: 30%; height: 106px" valign="top">
                Nội dung phản hồi :</td>
            <td style="width: 60%; height: 106px">
                <asp:TextBox ID="txtFeedBackContent" runat="server" Height="97px" 
                    TextMode="MultiLine" Width="100%"></asp:TextBox>
            </td>
            <td style="height: 106px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtFeedBackContent" 
                    ErrorMessage="Nội dung phản hồi không được trống">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 121px">
                &nbsp;</td>
            <td style="width: 203px">
                <asp:Button ID="btSubmit" runat="server" Text="Gửi" onclick="btSubmit_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 30%">
                <asp:Label ID="lbOutput" runat="server" ForeColor="#0099FF"></asp:Label>
            </td>
            <td style="width: 60%">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    HeaderText="Lỗi :" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

    </div>
</asp:content>
