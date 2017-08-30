using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
//using System.Configuration;

namespace FattaangOnlineShopping.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string LoginID = WebConfigurationManager.AppSettings["AdminLoginID"];
            //string LoginID = ConfigurationManager.AppSettings["AdminLoginID"];
            string Password = WebConfigurationManager.AppSettings["AdminPassword"];

            if (txtLoginId.Text == LoginID && txtPassword.Text == Password) // check whether user id and password entered is correct or not
            {

                Session["FattaangAdmin"] = "FattaangAdmin"; // to authenticate user
                Response.Redirect("/Admin/AddNewProducts.aspx"); // Redirect user
            }

            else
            {
                lblAlert.Text = "Incorrect user id or password.";
            }
        }
    }
}