using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer;
using BusinessObjects;
using System.Data;

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

            string CategoryName = objShoppingCart.CategoryName;
            parameters[0] = objDAL.AddParameter("@CategoryName", CategoryName, System.Data.SqlDbType.VarChar, 200);
            DataTable dt = objDAL.ExecuteDTByProcedure("SP_AddNewCategory", parameters);

        }
    }
    

}
