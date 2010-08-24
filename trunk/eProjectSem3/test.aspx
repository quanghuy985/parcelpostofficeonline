<div style="vertical-align: middle; width: 100%">
                                    <table>
                                        <tr>
                                            <td style="width: 100px">
                                            </td>
                                            <td>
                                                <asp:Panel ID="pnFrom" runat="server" GroupingText="From" Width="100%" BorderWidth="0px"
                                                    Font-Bold="False" BackColor="#CC0000" Font-Strikeout="False">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbFrom" Text="City :" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:DropDownList ID="ddlCity" runat="server" Width="100%" AppendDataBoundItems="true">
                                                                    <asp:ListItem>--- Please select city ---</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="width: 40%">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbDistrict" runat="server" Text="District :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:DropDownList ID="ddlDistrict" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbAddress" runat="server" Text="Address :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtAddress" Width="100%" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorAddress" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbSendto" runat="server" Text="Send To :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:CheckBox ID="cbSendTo" Text="Foreign Country" runat="server" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td style="width: 88px">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnSendtoforeign" runat="server" GroupingText="Foreign Address" 
                                                    BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbAddressForeign" runat="server" Text="Address :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:TextBox ID="txtAddressForeign" runat="server" Width="100%"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorAddressForeign" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnTo" runat="server" GroupingText="To" BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbCityTo" runat="server" Text="City :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:DropDownList ID="ddlCityTo" runat="server" Width="100%" AppendDataBoundItems="true">
                                                                    <asp:ListItem>--- Please select city ---</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbDistrictTo" runat="server" Text="District :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                
                                                                 <asp:DropDownList ID="ddlDistrictTo" runat="server" Width="100%">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbAddressTo" runat="server" Text="Address :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:TextBox ID="txtAddressTo" Width="100%" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorAddressTo" runat="server" ForeColor="#FF3300" Text="*"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnDetail" runat="server" GroupingText="Detail" 
                                                    BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbLocation" runat="server" Text="Option :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="checkOption" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbFee" runat="server" Text="Fee :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="spFee" runat="server" Text=""></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="lbFeeDescription1" runat="server" Font-Size="Small" ForeColor="Black"
                                                                    Text="usd/kg"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbWeight" runat="server" Text="Weight :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%">
                                                                <asp:TextBox ID="txtWeight" runat="server" Width="100%"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lbErrorWeight" runat="server" ForeColor="#FF3300" Text="Must be number"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbOptionSend" runat="server" Text="Kind to send :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="lbKindToSend" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbAdditionalFee" runat="server" Text="Additional Fee :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="lbAddFee" runat="server" Text=""></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbParcel" runat="server" Text="Parcel Post ID :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbParcelPostID" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbServiceDetail" runat="server" Text="Service ID :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbServiceDetailID" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbUserName" runat="server" Text="Account Name:"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbUser" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%">
                                                                <asp:Label ID="lbDiscountID" runat="server" Text="Discount ID :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%">
                                                                <asp:Label ID="lbDiscountIDSession" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left" style="width: 25%" >
                                                                <asp:Label ID="lbDiscount" runat="server" Text="Discount Name :"></asp:Label>
                                                            </td>
                                                            <td align="left" style="width: 50%" >
                                                                <asp:Label ID="lbDiscountName" runat="server" ForeColor="Black"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;</td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Label ID="lbDiscount3" runat="server" Text="Discount Price :"></asp:Label>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Label ID="lbDiscountPrice" runat="server" ForeColor="Black"></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="lbFeeDescription2" runat="server" Font-Size="Small" 
                                                                    ForeColor="Black" Text="usd"></asp:Label>
                                                            </td>
                                                            <td class="style5">
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="style1" style="width: 19px">
                                                &nbsp;
                                            </td>
                                            <td class="style2">
                                                <asp:Panel ID="pnTotalAmount" runat="server" GroupingText="Total Amount" 
                                                    BackColor="#CC0000">
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                <asp:Label ID="lbTotalAmount" runat="server" Text="Total :"></asp:Label>
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <asp:Label ID="lbTotal" runat="server" Text=""></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="lbFeeDescription0" runat="server" Font-Size="Small" ForeColor="Black"
                                                                    Text="usd"></asp:Label>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 25%" align="left">
                                                                &nbsp;
                                                            </td>
                                                            <td style="width: 50%" align="left">
                                                                <input type="button" id="btSubmit" runat="server" value="Submit" style="width: 65px"
                                                                    onclick="clicker()" />
                                                                <asp:Button ID="btBack" runat="server" Text="Back" Width="68px" />
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 10%">
                                                                &nbsp;
                                                            </td>
                                                            <td style="width: 50%">
                                                                <asp:Label ID="lbError" runat="server" ForeColor="Black"></asp:Label>
                                                                <p>
                                                                    <asp:Label ID="lbOutput" runat="server" ForeColor="Black"></asp:Label></p>
                                                            </td>
                                                            <td>
                                                                &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </div>