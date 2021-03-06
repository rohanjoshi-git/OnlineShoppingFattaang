﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using BusinessLogicLayer;

namespace FattaangOnlineShopping.Admin
{
    public partial class AddEditCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //ShoppingCart cart = new ShoppingCart() { CategoryName = txtCategoryName.Text };

            ShoppingCart objCart = new ShoppingCart();
            BLL objBLL = new BLL();

            objCart.CategoryName = txtCategoryName.Text;

            objBLL.AddNewCategory(objCart);
            txtCategoryName.Text = string.Empty;
            Response.Redirect("~/Admin/AddNewProducts.aspx");
        }
    }
}