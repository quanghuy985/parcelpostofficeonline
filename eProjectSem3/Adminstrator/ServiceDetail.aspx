<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ServiceDetail.aspx.cs" Inherits="Adminstrator_ServiceDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 288px;
        }
        .style2
        {
            width: 432px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td class="style1">
                Service Detail ID :
                </td>
                <td class="style2">
                    <asp:Label ID="lbServiceDetail" runat="server" Text=""></asp:Label>
                
                </td>
                <td>
                Welcome <asp:Label ID="lbUserName" runat="server" Text=""></asp:Label>! Have a nice day
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Service ID :</td>
                <td class="style2">
                    <asp:DropDownList ID="ddlServiceID" runat="server">
                        <asp:ListItem Value="1">Parcel Post Office</asp:ListItem>
                        <asp:ListItem Value="2">Magazine Daily</asp:ListItem>
                    </asp:DropDownList>
                
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Service Detail Name :</td>
                <td class="style2">
                    <asp:TextBox ID="txtServiceDetailName" runat="server"></asp:TextBox>
                
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtServiceDetailName" 
                        ErrorMessage="Service Detail Name Not Allow Null">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Service Detail Description :</td>
                <td class="style2">
                    <asp:TextBox ID="txtDesciption" runat="server" Rows="10" TextMode="MultiLine" 
                        Width="428px"></asp:TextBox>
                
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtDesciption" 
                        ErrorMessage="Service Description Not Allow Null">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Service Detail Price :</td>
                <td class="style2">
                    <asp:TextBox ID="txtPrice" runat="server" Width="242px"></asp:TextBox>
                
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtPrice" ErrorMessage="Price Not Allow Null">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="txtPrice" ErrorMessage="Price must be number" 
                        ValidationExpression="^[0-9]*$">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    Service Detail Image :</td>
                <td class="style2">
                    <asp:Image ID="imageServiceDetail" runat="server" Height="163px" 
                        Width="242px" />
                        <p>Image :
                        <asp:Label ID="lbImage" runat="server" Text=""></asp:Label>
                        </p>
                    <asp:FileUpload ID="fileUpLoad" runat="server" Width="219px" />
                    
                    <br />
                    Click browser if you want to change image</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;Make By :</td>
                <td class="style2">
                        <asp:Label ID="lbAdmin" runat="server" Text=""></asp:Label>
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Status :</td>
                <td class="style2">
                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem Value="1">True</asp:ListItem>
                            <asp:ListItem Value="0">False</asp:ListItem>
                        </asp:DropDownList>
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            HeaderText="List Error :" />
                        <asp:Label ID="lbOutput" runat="server" ForeColor="#0099CC"></asp:Label>
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                        <asp:Button ID="btSubmit" runat="server" Text="Submit" 
                            onclick="btSubmit_Click" />
                        <asp:Button ID="btCancel" runat="server" Text="Cancel" 
                            onclick="btCancel_Click" />
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
