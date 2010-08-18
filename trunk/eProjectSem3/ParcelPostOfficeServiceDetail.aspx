<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ParcelPostOfficeServiceDetail.aspx.cs" Inherits="ParcelPostOfficeServiceDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 
  
 
  <script type="text/javascript">
      function clicker(id) {


          $("#loading").show();
          $("#content").load("ParcelPostOfficeFunction.aspx?id=" + id);
          return false;

      }
  
  </script>
  
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%">
        <tr>
        <td style="width:200px" >
        </td>
        <td style="width:600px" align=left>
     
        <h3>
        Introduction about ourself :
        </h3>
       
        We warmly introduce for you about some parcel post office funtion, My Post Office very thank to you because you chose my service.
        We hope these functions easy to use with you, If you have some feedback please chose feedback function to help us can improve application.
        </td>
        <td>
        </td>
        </tr>
    
        <tr>
        <td >
            &nbsp;</td>
        <td>
        
                       
                <asp:DataList ID="ServiceDataList" runat="server" 
                     DataSourceID="ServiceDataSource" Width="585px">
                     
                <ItemTemplate>
                  
                 <div>
                 <table>
                 <tr>
                   <td style="width:100px" align="left"><li><a href="#"><%# Eval("serviceDetailName")%></a></li></td>
                    <td style="width:300px" align="left"></td>
                 </tr>
                 <tr>
		                  <td style="width:100px" align="left"></td>
		                  <td style="width:300px" align="left">
                              <%# Eval("serviceDetailDescription")%>
                         </td>
                         </tr>
                         <tr>
                        <td></td>
                        <td>
                          <p>
                              <img style="vertical-align:middle" alt="No Image" src="images/<%# Eval("serviceDetailImage")%>" />
                          </p>
                          </td>
                          </tr>
                          <tr>
                          <td>
                          </td>
                          <td align="left">
                         Price for use service : <%# Eval("serviceDetailPrice")%>
                          </td>
                          </tr>
                          <tr>
                          <td>
                         </td>
                         <td align="left">
                         If you agree all of our rule please click here to use this service, We warmly thank to you because use our service.
                         <a id="lnMainFunction" href="#" onclick="clicker(<%# Eval("serviceDetailID")%>)">Click Here</a>
                         </td>
                          </tr>
                          </table>
                     </div>
                     
                 </ItemTemplate>
                
                </asp:DataList>
                 <asp:SqlDataSource ID="ServiceDataSource" runat="server" 
                     ConnectionString="<%$ ConnectionStrings:callConnection %>" 
                     SelectCommand="SELECT [serviceDetailName], [serviceDetailDescription],[serviceDetailPrice], [serviceDetailImage], [serviceDetailID] FROM [tblServiceDetail] WHERE (([serviceID] = @serviceID) AND ([serviceDetailStatus] = @serviceDetailStatus))">
                     <SelectParameters>
                         <asp:Parameter DefaultValue="1" Name="serviceID" Type="Int32" />
                         <asp:Parameter DefaultValue="true" Name="serviceDetailStatus" Type="Boolean" />
                     </SelectParameters>
                 </asp:SqlDataSource>
             </td>
        <td>
            &nbsp;</td>
        </tr>
    
    </table>
    </div>
    </form>
</body>
</html>
