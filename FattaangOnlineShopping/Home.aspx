<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FattaangOnlineShopping.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .style1
        {
            width: 900px;
        }
        .style2
        {
            width: 633px;
            text-align:left;
        }
        .style3
        {
            width: 257px;
            text-align:center;
        }
        .style4
        {
            width: 185px;
            text-align:center;
        }
        .style6
        {
            width: 260px;
            text-align:left;
        }
        .style7
        {
            width: 427px;
            text-align:center;
        }
        .style8
        {
            width: 108px;
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

<ContentTemplate>
    <table class="style1" style="align-items:center">
        <%--Header--%>
        <tr>
            <td>
                <table class="style1" style="text-align:center; border-bottom-style:ridge; border-width:medium; border-color:#808080">
                    <tr>
                        <td class="style8" rowspan="2" style="text-align:center">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/fattaang_logo.png" Height="53px" Width="72px"/>
                            &nbsp;
                        </td>

                        <td class="style6" rowspan="2">
                            <asp:LinkButton ID="lblLogo" runat="server" Text="Fattaang" Font-Names="Eras Demi ITC"
                                Font-Size="20pt" ForeColor="#6600CC" OnClick="lblLogo_Click"></asp:LinkButton>
                            <br />
                            For Those Who Love Jeans !!!
                        </td>

                        <td class="style7" rowspan="2">
                            <asp:Image ID="Image3" runat="server" ImageUrl="" Height="67px" Width="282px"/>
                        </td>

                        <td>

                        </td>

                        <td>

                        </td>

                       
                    </tr>
                    <tr>
                        <td class="style3" style="vertical-align:middle"><%--html> valign="middle"--%>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr></tr>
        <tr></tr>
    </table>
</ContentTemplate>
        </asp:UpdatePanel>

    </form>
</body>
</html>
