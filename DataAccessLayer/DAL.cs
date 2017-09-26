using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration; //add System.Configuration in reference from Assemblies
using System.Data.SqlClient;
using System.Data; // for SqlDbType

namespace DataAccessLayer
{
    public class DAL
    {
        public DAL()
        {

        }

        public static string ConnectionString
        {
            get
            {
                return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString.ToString();
            }
        }


        public  SqlParameter AddParameter(string parameterName, object value, SqlDbType DbType, int size) // static
        {
            SqlParameter param = new SqlParameter();
            param.ParameterName = parameterName;
            param.Value = value.ToString();
            param.SqlDbType = DbType;
            param.Size = size;
            param.Direction = ParameterDirection.Input;
            return param; 
        }

        public  DataTable ExecuteDTByProcedure(string ProcedureName, SqlParameter[] Params) // static
        {
            SqlConnection conn = new SqlConnection(ConnectionString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandText = ProcedureName;
            cmd.Parameters.AddRange(Params);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dTable = new DataTable();

            try
            {
                adapter.Fill(dTable);
            }

            catch (Exception ex)
            {

            }
            finally
            {
                // Disposing Objects
                adapter.Dispose();
                cmd.Parameters.Clear();
                cmd.Dispose();
                conn.Dispose();
            }
            return dTable;

        }
       
    }
}
