﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FattaangOnlineShopping.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin: 200px">
        
    

        <table class="style1" style="text-align: center; border: 1px ridge #808080; width:450px;" >
            <tr>
                <td style="text-align:center;" colspan="2">
                    <asp:Label ID="Lable1" runat="server" Font-Names="Aharoni" ForeColor="#0033CC" 
                        Text="Fattaang-Admin Panel" Style="font-weight: 700"></asp:Label>
                <hr />
                </td>
                
            </tr>
            <tr>
                <td style="text-align:right; width:50%;">
                    User Name: 
                </td>
                <td style="text-align:left; width:50%;">
                    <asp:TextBox ID="txtLoginId" runat="server"></asp:TextBox>
                </td>
                
            </tr>
            <tr>
                <td style="text-align:right; width:50%;">
                    Password: 
                </td>
                <td style="text-align:left; width:50%;">
                    <asp:TextBox TextMode="Password" ID="txtPassword" runat="server"></asp:TextBox>
                </td>
                
            </tr>

            <tr>
                <td style="text-align:center; width:50%;">
                    &nbsp
                </td>
                <td style="text-align:left; width:50%;">
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                </td>
            </tr>
            <tr>
                <td style="text-align:center;" colspan="2">
                    <hr />
                    <asp:Label ID="lblAlert" runat="server" Font-Names="Aharoni" ForeColor="Red"></asp:Label>
                </td>
            </tr>

        </table>

    </div>
    </form>
</body>
</html>
