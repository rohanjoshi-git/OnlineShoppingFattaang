<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddEditCategory.aspx.cs" Inherits="FattaangOnlineShopping.Admin.AddEditCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Header--%>
    <div>
        <h4>Add New Category</h4>
        <hr />
    </div>
    <%--Content--%>
    <table style="text-align:center; border-collapse:separate; border-spacing:1px; width:100%; background-color:#FFFFFF" >   <%--html> cellspacing="1"--%>
        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                Category Name: 
            </td>
            <td style="width: 50%; text-align: left">
                <asp:TextBox ID="txtCategoryName" runat="server" Width="212px"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td style="width:50%; padding-left:100px; text-align:left">
                &nbsp; 
            </td>
            <td style="width: 50px; text-align: left">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" width="100px" Height="30px"
                    OnClick="btnSubmit_Click"/>

            </td>
        </tr>
    </table>

</asp:Content>
