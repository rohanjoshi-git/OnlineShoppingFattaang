using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using BusinessLogicLayer;
using System.Data;

namespace FattaangOnlineShopping.Admin
{
    public partial class AddNewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();
            }
        }

        private void GetCategories()
        {
            ShoppingCart objShoppingCart = new ShoppingCart();
            BLL objBLL = new BLL();
            DataTable dt = objBLL.GetCategories();
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataValueField = "CategoryId";
                ddlCategory.DataTextField = "CategoryName";
                ddlCategory.DataSource = dt;
                ddlCategory.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (uploadProductPhoto.PostedFile != null)
            {
                SaveProductPhoto();

                ShoppingCart objShoppingCart = new ShoppingCart();
                BLL objBLL = new BLL();

                objShoppingCart.ProductName = txtProductName.Text;
                objShoppingCart.ProductImage = "~/ProductImages/"+uploadProductPhoto.FileName;
                objShoppingCart.ProductPrice = txtProductPrice.Text;
                objShoppingCart.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);

                //objBLL.AddNewProduct();
                //Alert.Show("Reord Saved Successfully");
                ClearText();

            }
            

        }

        private void ClearText()
        {

        }

        private void SaveProductPhoto()
        {
            if (uploadProductPhoto.PostedFile != null)
            {
                string fileName = uploadProductPhoto.PostedFile.FileName.ToString();


            }
        }
    }
}