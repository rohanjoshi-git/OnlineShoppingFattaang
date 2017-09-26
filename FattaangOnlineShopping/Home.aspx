<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FattaangOnlineShopping.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .style1 {
            width: 900px;
        }

        .style2 {
            width: 633px;
            text-align: left;
        }

        .style3 {
            width: 257px;
            text-align: center;
        }

        .style4 {
            width: 185px;
            text-align: center;
        }

        .style6 {
            width: 400px;
            text-align: left;
        }

        .style7 {
            width: 427px;
            text-align: center;
        }

        .style8 {
            width: 108px;
            text-align: center;
        }

        .auto-style2 {
            width: 172px;
            border: 1px solid #000000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                <table class="style1" style="align-items: center">
                    <%--Header--%>
                    <tr>
                        <td>
                            <table class="style1" style="text-align: center; border-bottom-style: ridge; border-width: medium; border-color: #808080">
                                <tr>
                                    <td class="style8" rowspan="2" style="text-align: center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fattaang_logo.png" Height="80px" Width="150px" />
                                        &nbsp;
                                    </td>

                                    <td class="style6" rowspan="2">
                                        <asp:LinkButton ID="lblLogo" runat="server" Text="Fattaang" Font-Names="Eras Demi ITC"
                                            Font-Size="20pt" ForeColor="#6600CC" OnClick="lblLogo_Click"></asp:LinkButton>
                                        <br />
                                        For Those Who Love Jeans !!!
                                    </td>

                                    <td class="style7" rowspan="2">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="Images/banner.jpg" Height="80px" Width="350px" />
                                    </td>

                                    <td rowspan="2" style="text-align: right; vertical-align: top">
                                        <asp:Image ID="Image2" runat="server" ImageUrl="Images/shopping-cart-icon.png" Height="60px" Width="80px" />
                                    </td>

                                    <td style="text-align: left">
                                        <asp:LinkButton ID="btnCartItems" runat="server" Font-Underline="false" Font-Size="20pt"
                                            ForeColor="Red" OnClick="btnCartItems_Click">0
                                        </asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style3" style="vertical-align: middle"><%--html> valign="middle"--%>
                            &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <%--Sub Heading--%>
                    <tr>
                        <td>
                            <table class="style1" style="text-align: center; border: thin ridge #808080">
                                <tr>
                                    <td class="style2">&nbsp;
                            <asp:Label ID="lblCategoryName" runat="server" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                    <td class="style3" style="border-left-style: ridge; border-width: thin; border-color: #808080">&nbsp;
                            <asp:Label ID="lblProducts" Text="Products" runat="server" Font-Size="15pt" ForeColor="#6600CC"></asp:Label>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>

                    <%--Content--%>
                    <tr>
                        <td>
                            <table class="style1" style="text-align: center">

                                <%--Products and Categories Panels--%>
                                <tr>

                                    <%--Products and My Cart Panels--%>
                                    <td class="style2" style="vertical-align: top">
                                        <%--Products Panel--%>
                                        <asp:Panel ID="pnlProducts" runat="server" ScrollBars="Auto" Height="500" BorderColor="Black"
                                            BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlProducts" runat="server" RepeatColumns="3" Width="600px" Font-Bold="false"
                                                Font-Italic="false" Font-Overline="false" Font-Strikeout="false" Font-Underline="false">
                                                <ItemTemplate>
                                                    <div style="text-align: left">
                                                        <%--Product--%>
                                                        <table class="style4" style="border: 1px ridge #808080; border-collapse: separate; border-spacing: 1px">
                                                            <%--cellspacing="1"--%>

                                                            <%--Product Name--%>
                                                            <tr>
                                                                <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                                    <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("Name") %>' Style="font-weight: 700">
                                                                    </asp:Label>
                                                                </td>
                                                            </tr>

                                                            <%--Product Image--%>
                                                            <tr>
                                                                <td>
                                                                    <img alt="" src='<%# Eval("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border: ridge 1px black; width: 173px; height: 160px;" />
                                                                </td>
                                                            </tr>

                                                            <%--Product Price, Available Stock, HiddenField --%>
                                                            <tr>
                                                                <td>Price:
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                                    <asp:Image ID="imgTick" runat="server" Visible="false" ImageUrl="~/Images/green_tick_in_circle.jpg" Width="25px" />


                                                                    <%--Available Stock--%>
                                                                    Stock: &nbsp;
                                                                    <asp:Label ID="lblAvailableStock" runat="server" Text='<%#Eval("ProductQuantity") %>'
                                                                        ToolTip="Available Stock" ForeColor="Red" Font-Bold="true">
                                                                    </asp:Label>
                                                                    <%--ToolTip -Gets or sets the text displayed when the mouse pointer hovers over the Web server control.--%>
                                                                    <asp:HiddenField ID="hfProductID" runat="server" Value='<%#Eval("ProductID")%>' />
                                                                </td>
                                                            </tr>

                                                            <%--Add to cart button--%>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CommandArgument='<%# Eval("ProductId") %>'
                                                                        OnClick="btnAddToCart_Click" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"
                                                                        CausesValidation="false" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                                <ItemStyle Width="33%" />
                                                <%--33% width for each item--%>
                                            </asp:DataList>
                                        </asp:Panel>

                                        <%--My Cart Panel--%>
                                        <asp:Panel ID="pnlMyCart" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                            BorderStyle="Inset" BorderWidth="1px" Visible="false">
                                            <table style="text-align: center; border-collapse: separate; border-spacing: 1px;">

                                                <%--1--%>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <%--alert user if products are more than stock--%>
                                                        <asp:Label ID="lblAvailableStockAlert" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>

                                                        <%--Cart Products Datalist--%>

                                                        <asp:DataList ID="dlCartProducts" runat="server" RepeatColumns="3" Font-Bold="false"
                                                            Font-Italic="false" Font-Overline="false" Font-Strikeout="false" Font-Underline="false" Width="551px">

                                                            <ItemTemplate>
                                                                <div style="text-align: left">

                                                                    <table cellspacing="1" style="border: 1px ridge #808080; text-align: center; width: 172px;">
                                                                        <tr>
                                                                            <td style="border-bottom-style: ridge; border-width: 1px; border-color: #000000">
                                                                                <asp:Label ID="lblProductName" runat="server" Text='<%#Eval("Name") %>'
                                                                                    Style="font-weight: 700"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Image ID="imgProductPhoto" runat="server" ImageUrl='<%#Eval("ImageUrl") %>' BorderColor="Black"
                                                                                    BorderStyle="Ridge" BorderWidth="1px" Height="130px" Width="157px" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>Available Stock: &nbsp;
                                                                    <asp:Label ID="lblAvailableStock" runat="server" Text='<%# Eval("AvailableStock") %>'
                                                                        ToolTip="Available Stock" ForeColor="Red" Font-Bold="true"></asp:Label>
                                                                                <br />
                                                                                Price: 
                                                                    <asp:Label ID="lblPrice0" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                                                                &nbsp;
                                                                    x
                                                                    &nbsp;
                                                                    <asp:TextBox ID="txtProductQuantity" runat="server" Width="10px" Height="10px"
                                                                        MaxLength="1" OnTextChanged="txtProductQuantity_TextChanged" AutoPostBack="true"
                                                                        Text='<%# Eval("ProductQuantity") %>'></asp:TextBox>
                                                                                <%--AutoPostBack="true"--%>
                                                                                <asp:HiddenField ID="hfProductID" runat="server" Value='<%# Eval("ProductId") %>' />

                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Button ID="btnRemoveFromCart" runat="server" Text="Remove From Cart"
                                                                                    CommandArgument='<%# Eval("ProductId") %>' Width="100%" BorderColor="Black"
                                                                                    BorderStyle="Inset" BorderWidth="1px" OnClick="btnRemoveFromCart_Click" CausesValidation="false" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>

                                                                </div>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="33%" />
                                                        </asp:DataList>
                                                    </td>
                                                </tr>

                                                <%--2--%>
                                                <tr>
                                                    <td style="text-align: center">&nbsp;
                                                    </td>
                                                </tr>

                                                <%--3--%>
                                                <tr>
                                                    <td style="text-align: center">&nbsp;
                                                    </td>
                                                </tr>
                                            </table>

                                        </asp:Panel>
                                    </td>

                                    <%--Categories and CheckOut Panels--%>
                                    <td class="style3" style="vertical-align: top; text-align: center">
                                        <%--Categories Panel--%>
                                        <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500" BorderColor="Black"
                                            BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlCategories" runat="server" CellPadding="4" ForeColor="#333333" Width="252px">
                                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                                <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                                <HeaderStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="true" />
                                                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCategory" runat="server" Text='<%# Eval("CategoryName") %>'
                                                        OnClick="lbtnCategory_Click" CommandArgument='<%# Eval("CategoryID") %>'>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                                <%--highlight selected item--%>
                                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333" />
                                            </asp:DataList>
                                        </asp:Panel>

                                        <%--CheckOut Panel  Part10 7:30--%>
                                        <asp:Panel ID="pnlCheckOut" runat="server" ScrollBars="Auto" Height="500px" BorderColor="Black"
                                            BorderStyle="Inset" BorderWidth="1px" Visible="false">

                                            <table style="width: 258px;">
                                                <tr>
                                                    <td style="text-align: left">Name:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerName" runat="server" Width="231px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCustomerName"
                                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>

                                                </tr>

                                                <tr>
                                                    <td style="text-align: left">Phone No:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerPhoneNo" runat="server" Width="231px" MaxLength="10"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCustomerPhoneNo"
                                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: left">EmailID:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:TextBox ID="txtCustomerEmailID" runat="server" Width="231px"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCustomerEmailID"
                                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: left">Address:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">&nbsp;
                                                        <asp:TextBox ID="txtCustomerAddress" runat="server" Width="227px" Height="81px"
                                                            TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCustomerAddress"
                                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: left">Total Products:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: center">&nbsp;
                                                        <asp:TextBox ID="txtTotalProducts" runat="server" Width="231px" ReadOnly="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtTotalProducts"
                                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: left">Total Price:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;
                                                        <asp:TextBox ID="txtTotalPrice" runat="server" Width="231px" ReadOnly="true"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtTotalPrice"
                                                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: left">Payment Mode:
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left">

                                                        <asp:RadioButtonList ID="rblPaymentMethod" runat="server">
                                                            <asp:ListItem Value="1" Selected="True">1. Cash on Delivery</asp:ListItem>
                                                            <asp:ListItem Value="2">1. Payment Gateway</asp:ListItem>

                                                        </asp:RadioButtonList>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnPlaceOrder" runat="server" Text="Place Order" Style="font-weight: 700; width: 90px;"
                                                            OnClick="btnPlaceOrder_Click" />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCustomerEmailID"
                                                            ErrorMessage="Please Enter valid Email Id" ForeColor="Red"
                                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>


                                            </table>

                                        </asp:Panel>
                                    </td>
                                </tr>

                                <%--Empty Cart and Order Placed Successfully Panels--%>
                                <tr>
                                    <td colspan="2">

                                        <%-- Empty Cart Panel - by default invisible --%>
                                        <asp:Panel ID="pnlEmptyCart" runat="server" Visible="false">
                                            <div style="text-align: center;">
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Image ID="imgEmptyCart" runat="server" ImageUrl="Images/EmptyCart1.jpeg" Width="500px" />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                            </div>
                                        </asp:Panel>

                                        <%-- Order Placed Successfully Panel - by default invisible --%>
                                        <asp:Panel ID="pnlOrderPlacedSuccessfully" runat="server" Visible="false">
                                            <div style="text-align: center;">
                                                <asp:Image ID="imgOrderPlacedSuccessfully" runat="server" Width="500px" />
                                                <br />
                                                <br />
                                                <label>Order Placed Successfully.</label>
                                                <br />
                                                Transaction details are sent at email id provided by you.
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Label ID="lblTransactionNo" runat="server" Style="font-weight: 700"></asp:Label>
                                                <br />
                                                <br />
                                                <br />
                                                <a href="TrackYourOrder.aspx" target="_blank">Track Your transaction Details Here</a>
                                                <br />
                                                <br />
                                                <br />
                                            </div>
                                        </asp:Panel>
                                    </td>
                                </tr>


                                <%--Footer--%>
                                <tr>
                                    <td colspan="2" style="text-align: center; border: thin ridge #808080">&nbsp;&copy; <a href="#">fattaang.com</a>
                                        || <a href="Admin/Login.aspx">AdminPanel</a>
                                    </td>
                                </tr>

                            </table>
                        </td>
                    </tr>

                </table>
            </ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
