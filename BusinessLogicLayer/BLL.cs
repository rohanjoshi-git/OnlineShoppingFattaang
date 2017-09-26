using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using BusinessObjects;
using System.Data; // SqlDbType
using System.Web.Configuration;
using System.Configuration;

namespace BusinessLogicLayer
{
    public class BLL
    {
        public BLL()
        {

        }

        public void AddNewCategory(ShoppingCart objShoppingCart)
        {

            //ShoppingCart objShoppingCart = new ShoppingCart();
            DAL objDAL = new DAL();
            SqlParameter[] parameters = new SqlParameter[1];

            //string CategoryName = objShoppingCart.CategoryName;
            parameters[0] = objDAL.AddParameter("@CategoryName", objShoppingCart.CategoryName, SqlDbType.VarChar, 200);
            DataTable dt = objDAL.ExecuteDTByProcedure("SP_AddNewCategory", parameters);

        }

        public void AddNewProduct(ShoppingCart objShoppingCart)
        {
            DAL objDAL = new DAL();
            SqlParameter[] parameters = new SqlParameter[6];
            parameters[0] = objDAL.AddParameter("@ProductName", objShoppingCart.ProductName, SqlDbType.VarChar, 300);
            parameters[1] = objDAL.AddParameter("@ProductPrice", objShoppingCart.ProductPrice, SqlDbType.Int, 100);
            parameters[2] = objDAL.AddParameter("@ProductImage", objShoppingCart.ProductImage, SqlDbType.VarChar, 500);
            parameters[3] = objDAL.AddParameter("@ProductDescription", objShoppingCart.ProductDescription, SqlDbType.VarChar, 1000);
            parameters[4] = objDAL.AddParameter("@CategoryID", objShoppingCart.CategoryID, SqlDbType.Int, 100);
            parameters[5] = objDAL.AddParameter("@ProductQuantity", objShoppingCart.TotalProducts, SqlDbType.Int, 100);

            DataTable dt = objDAL.ExecuteDTByProcedure("SP_AddNewProduct", parameters);
        }

        public DataTable GetCategories()
        {

            DAL objDAL = new DAL();

            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = objDAL.ExecuteDTByProcedure("SP_GetAllCategories", parameters);
            return dt;
        }


        public DataTable GetAllProducts(ShoppingCart objShoppingCart)
        {
            DAL objDAL = new DAL();

            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = objDAL.AddParameter("@CategoryID", objShoppingCart.CategoryID, SqlDbType.Int, 100);
            DataTable dt = objDAL.ExecuteDTByProcedure("SP_GetAllProducts", parameters);
            return dt;
        }

        public DataTable GetProductData(string query)
        {
            //DAL objDAL = new DAL(); move code to DAL
            DataTable dt = new DataTable();
            //dt = objDAL.GetData(query);

            string ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //string ConnectionString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString; // another approch

            SqlConnection con = new SqlConnection(ConnectionString);
            con.Open();

            SqlDataAdapter da = new SqlDataAdapter(query, con);
            da.Fill(dt);

            con.Close();
            return dt;
        }
    }
    

}
