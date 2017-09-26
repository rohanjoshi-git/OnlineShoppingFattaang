using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using BusinessLogicLayer;
using System.Data;

namespace FattaangOnlineShopping
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

        protected void btnCartItems_Click(object sender, EventArgs e)
        {
            //GetMyCart();  // to be added
            lblCategoryName.Text = "Products in your Shopping Cart";
            lblProducts.Text = "Customer Details";
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            BLL objBLL = new BLL();

            string ProductId = Convert.ToInt16(((Button)sender).CommandArgument).ToString(); // read ProductId from CommandArgument
            string ProductQuantity = "1";

            DataListItem currentItem = (sender as Button).NamingContainer as DataListItem; // get entire box (selected item) and assign it to currentItem
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (Session["MyCart"] != null) // adding more items in the cart - already added product/products before this product
            {
                DataTable dt = (DataTable)Session["MyCart"];

                // to check whether the product is already added 
                var checkProduct = dt.AsEnumerable().Where(r => r.Field<string>("ProductId") == ProductId);  // AsEnumerable

                if (checkProduct.Count() == 0)
                {
                    string query = "select * from Products where ProductId = " + ProductId + "";
                    DataTable dtProduts = objBLL.GetProductData(query);

                    DataRow dr = dt.NewRow();
                    dr["ProductId"] = ProductId;
                    dr["Name"] = Convert.ToString(dtProduts.Rows[0]["Name"]);
                    dr["Description"] = Convert.ToString(dtProduts.Rows[0]["Description"]);
                    dr["Price"] = Convert.ToString(dtProduts.Rows[0]["Price"]);
                    dr["ImageUrl"] = Convert.ToString(dtProduts.Rows[0]["ImageUrl"]);
                    dr["ProductQuanity"] = ProductQuantity;
                    dr["AvailableStock"] = lblAvailableStock.Text;

                    dt.Rows.Add(dr);

                    Session["MyCart"] = dt;
                    btnCartItems.Text = dt.Rows.Count.ToString(); // to show number of items added into cart
                }
            }
            else // adding first product in the cart
            {
                string query = "select * from Products where ProductId = " + ProductId + "";
                DataTable dtProduts = objBLL.GetProductData(query);

                DataTable dt = new DataTable();
                dt.Columns.Add("ProductId", typeof(string));
                dt.Columns.Add("Name", typeof(string));
                dt.Columns.Add("Description", typeof(string));
                dt.Columns.Add("Price", typeof(string));
                dt.Columns.Add("ImageUrl", typeof(string));
                dt.Columns.Add("ProductQuanity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr = dt.NewRow();
                dr["ProductId"] = ProductId;
                dr["Name"] = Convert.ToString(dtProduts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProduts.Rows[0]["Description"]);
                dr["Price"] = Convert.ToString(dtProduts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProduts.Rows[0]["ImageUrl"]);
                dr["ProductQuanity"] = ProductQuantity;
                dr["AvailableStock"] = lblAvailableStock.Text;

                dt.Rows.Add(dr);

                Session["MyCart"] = dt;
                btnCartItems.Text = dt.Rows.Count.ToString(); // to show number of items added into cart
            }

            HighlightCartProducts();

        }

        protected void lbtnCategory_Click(object sender, EventArgs e)
        {
            pnlMyCart.Visible = false;
            pnlProducts.Visible = true;
            int CategoryID = Convert.ToInt16((((LinkButton)sender).CommandArgument)); // get CommandArgument value
            GetProducts(CategoryID);
            HighlightCartProducts();
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

        private void HighlightCartProducts()
        {
            if (Session["MyCart"] != null)
            {
                DataTable dtProductsAddedToCart = (DataTable)Session["MyCart"];
                if (dtProductsAddedToCart.Rows.Count > 0)
                {
                    foreach (DataListItem item in dlProducts.Items) // iterate through datalist dlProducts
                    {
                        HiddenField hfProductId = item.FindControl("hfProductId") as HiddenField;

                        if (dtProductsAddedToCart.AsEnumerable().Any(row => hfProductId.Value == row.Field<string>("ProductId")))  // AsEnumerable
                        {
                            //item.BackColor = System.Drawing.Color.Green;

                            Button btnAddToCart = item.FindControl("btnAddToCart") as Button;  // server control inside panel
                            btnAddToCart.BackColor = System.Drawing.Color.Green;
                            btnAddToCart.Text = "Added To Cart";

                            Image imgTick = item.FindControl("imgTick") as Image;
                            imgTick.Visible = true;
                        }
                    }
                }
            }
        }
    }
}