using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using BusinessLogicLayer;
using System.Data;
using System.IO; // for StreamReader - to read OrderTemplate.thml

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
            HighlightCartProducts();
        }

        protected void btnCartItems_Click(object sender, EventArgs e)
        {
            GetMyCart();
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
                    dr["ProductQuantity"] = ProductQuantity;
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
                dt.Columns.Add("ProductQuantity", typeof(string));
                dt.Columns.Add("AvailableStock", typeof(string));

                DataRow dr = dt.NewRow();
                dr["ProductId"] = ProductId;
                dr["Name"] = Convert.ToString(dtProduts.Rows[0]["Name"]);
                dr["Description"] = Convert.ToString(dtProduts.Rows[0]["Description"]);
                dr["Price"] = Convert.ToString(dtProduts.Rows[0]["Price"]);
                dr["ImageUrl"] = Convert.ToString(dtProduts.Rows[0]["ImageUrl"]);
                dr["ProductQuantity"] = ProductQuantity;
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
            TextBox txtQuantity = (sender as TextBox);  // "sender as TextBox"

            DataListItem currentItem = (sender as TextBox).NamingContainer as DataListItem;
            HiddenField ProductId = currentItem.FindControl("hfProductId") as HiddenField;
            Label lblAvailableStock = currentItem.FindControl("lblAvailableStock") as Label;

            if (txtQuantity.Text == string.Empty || txtQuantity.Text == "0" || txtQuantity.Text == "1")
            {
                txtQuantity.Text = "1";
            }
            else
            {
                if (Session["MyCart"] != null)
                {
                    // check whether Stock is available
                    if (Convert.ToInt32(txtQuantity.Text) <= Convert.ToInt32(lblAvailableStock.Text))
                    {
                        DataTable dt = (DataTable)Session["MyCart"];

                        DataRow[] rows = dt.Select("ProductId = '" + ProductId.Value + "'");

                        int index = dt.Rows.IndexOf(rows[0]);

                        dt.Rows[index]["ProductQuantity"] = txtQuantity.Text;

                        Session["MyCart"] = dt;
                    }
                    else
                    {
                        lblAvailableStockAlert.Text = "Alert: Product buyout should not be more than available stock !";
                        txtQuantity.Text = "1";
                    }
                }
            }

            UpdateTotalBill();

        }

        protected void btnRemoveFromCart_Click(object sender, EventArgs e)
        {
            string ProductId = Convert.ToInt16(((Button)sender).CommandArgument).ToString();

            if (Session["MyCart"] != null)
            {
                DataTable dt = (DataTable)Session["MyCart"];

                DataRow drr = dt.Select("ProductId = " + ProductId + "").FirstOrDefault();

                if (drr != null) dt.Rows.Remove(drr);

                Session["MyCart"] = dt;
            }

            GetMyCart();
        }

        protected void btnPlaceOrder_Click(object sender, EventArgs e)
        {
            string productIds = string.Empty;
            DataTable dt;

            if (Session["MyCart"] != null)
            {

                BLL objBLL = new BLL();
                dt = (DataTable)Session["MyCart"];

                ShoppingCart objCustomerDetails = new ShoppingCart()
                {
                    CustomerName = txtCustomerName.Text,
                    CustomerEmailId = txtCustomerEmailID.Text,
                    CustomerAddress = txtCustomerAddress.Text,
                    CustomerPhoneNo = txtCustomerPhoneNo.Text,
                    TotalProducts = Convert.ToInt32(txtTotalProducts.Text),
                    TotalPrice = Convert.ToInt32(txtTotalPrice.Text),
                    ProductList = productIds,
                    PaymentMethod = rblPaymentMethod.SelectedItem.Text
                };

                DataTable dtResult = objBLL.SaveCustomerDetails(objCustomerDetails);

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    ShoppingCart objProduct = new ShoppingCart()
                    {
                        CustomerId = Convert.ToInt32(dtResult.Rows[0][0]),
                        ProductId = Convert.ToInt32(dt.Rows[i]["ProductId"]),
                        TotalProducts = Convert.ToInt32(dt.Rows[i]["ProductQuantity"]),
                    };

                    objBLL.SaveCustomerProducts(objProduct);

                }

                Session.Clear();
                GetMyCart();

                lblTransactionNo.Text = "Your Transaction Number : " + dtResult.Rows[0][0];

                pnlOrderPlacedSuccessfully.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;

                SendOrderPlacedAlert(txtCustomerName.Text, txtCustomerEmailID.Text, Convert.ToString(dtResult.Rows[0][0]));

                txtCustomerName.Text = string.Empty;
                txtCustomerEmailID.Text = string.Empty;
                txtCustomerAddress.Text = string.Empty;
                txtCustomerPhoneNo.Text = string.Empty;
                txtTotalPrice.Text = "0";
                txtTotalProducts.Text = "0";

            }
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

        private void GetMyCart()
        {
            DataTable dtProducts;

            if (Session["MyCart"] != null) // Convert seession object to datatable
            {
                dtProducts = (DataTable)Session["MyCart"];
            }
            else // create new DataTable - simply assign memory to dtProducts
            {
                dtProducts = new DataTable();
            }

            if (dtProducts.Rows.Count > 0)
            {
                txtTotalProducts.Text = dtProducts.Rows.Count.ToString();
                btnCartItems.Text = dtProducts.Rows.Count.ToString();

                dlCartProducts.DataSource = dtProducts;  // display products added into cart
                dlCartProducts.DataBind();

                UpdateTotalBill();

                pnlMyCart.Visible = true;
                pnlCheckOut.Visible = true;
                pnlEmptyCart.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;

            }
            else
            {
                pnlEmptyCart.Visible = true;
                pnlMyCart.Visible = false;
                pnlCheckOut.Visible = false;
                pnlCategories.Visible = false;
                pnlProducts.Visible = false;
                pnlOrderPlacedSuccessfully.Visible = false;

                dlCartProducts.DataSource = null;
                dlCartProducts.DataBind();

                txtTotalProducts.Text = "0";
                txtTotalPrice.Text = "0";
                btnCartItems.Text = "0";
            }
        }

        private void UpdateTotalBill()
        {
            long TotalPrice = 0;
            long TotalProducts = 0;


            foreach (DataListItem item in dlCartProducts.Items)
            {
                Label PriceLable = item.FindControl("lblPrice") as Label;
                TextBox ProductQuantity = item.FindControl("txtProductQuantity") as TextBox;

                long ProductPrice = Convert.ToInt64(PriceLable.Text) * Convert.ToInt64(ProductQuantity.Text);
                TotalPrice = TotalPrice + ProductPrice;
                TotalProducts = TotalProducts + Convert.ToInt32(ProductQuantity.Text);
            }

            txtTotalPrice.Text = Convert.ToString(TotalPrice);
            txtTotalProducts.Text = Convert.ToString(TotalProducts);
        }

        private void SendOrderPlacedAlert(string CustomerName, string CustomeremailId, string TransactionNo)
        {
            string body = this.PopulateOrderEmailBody(CustomerName, TransactionNo);

            EmailEngine.SendEmail(CustomeremailId, "Fattaang - Your Order Details", body); // SendEmail - static method - can't be called by an instance
        }

        private string PopulateOrderEmailBody(string CustomerName, string TransactionNo)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/OrderTemplate.html")))
            {
                body = reader.ReadToEnd();
            }

            body = body.Replace("{CustomerName}", CustomerName);
            body = body.Replace("{OrderNo}", TransactionNo);
            body = body.Replace("{TransactionURL}", "http://www.fattaang.com/TrackYourOrder.aspx?Id=" + TransactionNo);

            return body;
        }
    }
}