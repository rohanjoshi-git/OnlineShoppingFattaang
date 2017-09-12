using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessObjects;
using BusinessLogicLayer;
using System.Data;
using System.IO; // for Path.GetExtension (get file extension)

namespace FattaangOnlineShopping.Admin
{
    public partial class AddNewProducts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetCategories();

                AddSubmitEvent();

                if(Request.QueryString["alert"] == "success")
                {
                    Response.Write("<script>alert('Record saved successfully');</script>");
                }
            }
        }

        private void AddSubmitEvent()
        {
            UpdatePanel updatePanel = Page.Master.FindControl("AdminUpdatePanel") as UpdatePanel;
            UpdatePanelControlTrigger trigger = new PostBackTrigger();
            trigger.ControlID = btnSubmit.UniqueID;

            updatePanel.Triggers.Add(trigger);
        }

        private void GetCategories()
        {
            ShoppingCart objShoppingCart = new ShoppingCart();
            BLL objBLL = new BLL();
            DataTable dt = objBLL.GetCategories();
            if (dt.Rows.Count > 0)
            {
                ddlCategory.DataValueField = "CategoryID";
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
                objShoppingCart.ProductDescription = txtProductDescription.Text;
                objShoppingCart.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue);
                objShoppingCart.TotalProducts = Convert.ToInt32(txtProductQuantity.Text);

                objBLL.AddNewProduct(objShoppingCart);
                //Alert.Show("Reord Saved Successfully");
                
                // Clear all fields
                ClearText();
                Response.Redirect("~/Admin/AddNewProducts.aspx?alert=success"); // redirected to AddNewProducts and Page_Load will then be called

            }

            else
            {
                Response.Write("<script>alert('Please upload photo');</script>");
            }
           
        }

        private void ClearText()
        {

        }

        private void SaveProductPhoto()
        {
            if (uploadProductPhoto.PostedFile != null)
            {
                //string fileName = uploadProductPhoto.PostedFile.FileName.ToString();
                string fileName = uploadProductPhoto.FileName.ToString();
                string fileExt = Path.GetExtension(uploadProductPhoto.FileName);

                // check file name length
                if(fileName.Length > 96)
                {
                    //Alert.Show("Image name should not exceed 96 characters !");
                    //archive.devnewz.com/devnewz-3-20061129JavaScriptAlertShowmessagefromASPNETCodebehind.html 
                }

                // check file type
                else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" &&  fileExt != ".bmp")
                {
                    //Alert.Show("Only jpeg, jpg, png, bmp images are allowed!");
                }

                // check file size
                else if (uploadProductPhoto.PostedFile.ContentLength > 4000000)
                {
                    //Alert.Show("Image size should not be greater than 4MB!");
                }

                //save image into images folder
                else
                {
                    uploadProductPhoto.SaveAs(Server.MapPath("~/ProductImages/" + fileName));
                } 
            }
        }
    }
}