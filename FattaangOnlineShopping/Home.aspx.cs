using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using BusinessLogicLayer;

namespace FattaangOnlineShopping
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                lblCategoryName.Text = "Popular products at shopping heart";
                GetCategory();
                GetProducts(0); //Get all products
            }
            lblAvailableStockAlert.Text = string.Empty;
        }

        private void GetCategory()
        {
            ShoppingCart objShoppingCart = new ShoppingCart();
            BLL objBLL = new BLL();

            dlCategories.DataSource = null;
            dlCategories.DataSource = objBLL.GetCategories();
            dlCategories.DataBind();

        }


        private void GetProducts(int CategoryID)
        {
            ShoppingCart objShoppingCart = new ShoppingCart();
            BLL objBLL = new BLL();

            objShoppingCart.CategoryID = CategoryID;

            dlProducts.DataSource = null;
            dlProducts.DataSource = objBLL.GetAllProducts(objShoppingCart);
            dlProducts.DataBind();
        }

        protected void lblLogo_Click(object sender, EventArgs e)
        {
            lblCategoryName.Text = "Popular products at ShoppingHeart";
            lblProducts.Text = "Products";

            pnlCategories.Visible = true;
            pnlProducts.Visible = true;
            pnlMyCart.Visible = false;
            pnlCheckOut.Visible = false;
            pnlEmptyCart.Visible = false;
            pnlOrderPlacedSuccessfully.Visible = false;

            GetProducts(0);
            //HighlightCartProducts();
        }

        protected void btnFattaang_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {

        }

        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument)); // get CommandArgument value
            GetProducts(CategoryID);
            //HighlightCartProducts();
        }

        protected void txtProductQuantity_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {

        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {

        }
    }
}