﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FattaangOnlineShopping.Home" %>

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

        .auto-style1 {
            height: 23px;
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
                                        <asp:LinkButton ID="btnFattaang" runat="server" Font-Underline="false" Font-Size="20pt"
                                            ForeColor="Red" OnClick="btnFattaang_Click">0
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
                                <tr>
                                    <td class="style2" style="vertical-align: top">
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
                                                                    <img alt="" src='<%# Bind("ImageUrl") %>' runat="server" id="imgProductPhoto" style="border: ridge 1px black; width: 173px; height: 160px;"/>
                                                                </td>
                                                            </tr>

                                                            <%--Product Price--%>
                                                            <tr>
                                                                <td>
                                                                    Price: <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <%--Add to cart button--%>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button ID="btnAddToCart" runat="server" Text="Add To Cart" CommandArgument='<%# Bind("ProductId") %>' 
                                                                        OnClick="btnAddToCart_Click" Width="100%" BorderColor="Black" BorderStyle="Inset" BorderWidth="1px"/>
                                                                </td>
                                                            </tr>

                                                        </table>
                                                    </div>
                                                </ItemTemplate>

                                            </asp:DataList>
                                        </asp:Panel>

                                        <asp:Panel ID="pnlMyCart" runat="server">
                                        </asp:Panel>
                                    </td>

                                    <td class="style3" style="vertical-align: top; text-align: center">
                                        <%--Categories Panel--%>
                                        <asp:Panel ID="pnlCategories" runat="server" ScrollBars="Auto" Height="500" BorderColor="Black"
                                            BorderStyle="Inset" BorderWidth="1px">
                                            <asp:DataList ID="dlCategories" runat="server" CellPadding="4" ForeColor="#333333" Width="252px">
                                                <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True"/>
                                                <HeaderStyle  BackColor="#5D7B9D" ForeColor="White" Font-Bold="true"/>
                                                <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnCategory" runat="server" Text='<%# Bind("CategoryName") %>'
                                                        OnClick="lbtnCategory_Click" CommandArgument='<%# Bind("CategoryID") %>'>
                                                    </asp:LinkButton>
                                            </ItemTemplate>
                                                <%--highlight selected item--%>
                                                <SelectedItemStyle BackColor="#E2DED6" Font-Bold="true" ForeColor="#333333"/>
                                            </asp:DataList>
                                        </asp:Panel>
                                         
                                        <%--CheckOut Panel--%>
                                        <asp:Panel ID="pnlCheckOut" runat="server"></asp:Panel>
                                    </td>
                                </tr>
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
