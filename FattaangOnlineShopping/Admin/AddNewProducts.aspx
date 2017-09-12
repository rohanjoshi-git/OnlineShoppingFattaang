<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddNewProducts.aspx.cs" Inherits="FattaangOnlineShopping.Admin.AddNewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%--Header--%>
    <div style="align-items:center">
        <h4>Add New Products</h4>
        <hr />
    </div>
    <%--Content--%>
    <table style="text-align:center; border-collapse:separate; border-spacing:1px; width:100%; background-color:#FFFFFF" >   <%--html> cellspacing="1", html5>border-collapse--%>
        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Product Name : 
            </td>
            <td style="width: 50%; text-align: left">
                <asp:TextBox ID="txtProductName" runat="server" Width="212px"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                &nbsp;
            </td>
            <td style="width: 50%; text-align: left">
                 &nbsp;
            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Product Category : 
            </td>
            <td style="width: 50%; text-align: left">
                <asp:DropDownList ID="ddlCategory" runat="server" Width="212px">
                </asp:DropDownList>

            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                &nbsp;
            </td>
            <td style="width: 50%; text-align: left">
                 &nbsp;
            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Product Description: 
            </td>
            <td style="width: 50%; text-align: left">
                <asp:TextBox ID="txtProductDescription" runat="server" Width="212px" Height="80px"
                    TextMode="MultiLine"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Product Image: 
            </td>
            <td style="width: 50%; text-align: left">
                
                <asp:FileUpload ID="uploadProductPhoto" runat="server" />
            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                &nbsp;
            </td>
            <td style="width: 50%; text-align: left">
                 &nbsp;
            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Product Price: 
            </td>
            <td style="width: 50%; text-align: left">
                <asp:TextBox ID="txtProductPrice" runat="server" Width="212px"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                &nbsp;
            </td>
            <td style="width: 50%; text-align: left">
                 &nbsp;
            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Product Quantity: 
            </td>
            <td style="width: 50%; text-align: left">
                <asp:TextBox ID="txtProductQuantity" runat="server" Width="212px"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td style="width:50%; /*padding-left:100px;*/ text-align:left">
                &nbsp;
            </td>
            <td style="width: 50%; text-align: left">
                 &nbsp;
            </td>
        </tr>

        <tr>
            <td style="width:50%;  text-align:right">
                &nbsp;
            </td>
            <td style="width: 50%; text-align: left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" width="100px" Height="30px"
                    OnClick="btnSubmit_Click"/>

            </td>
        </tr>
    </table>

</asp:Content>
