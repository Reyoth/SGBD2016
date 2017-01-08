using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DALADO
{
    public class Biblio
    {
        public static List<String> ChargerBiblioLib()
        {
            List<string> ListeBiblio = null;
            SqlCommand com = new SqlCommand();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[BIB_AllLibelle]";
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    ListeBiblio.Add(dr.GetString(0));
                }
                dr.Close();

                
            }
            catch (Exception)
            {
                //int IdError = 999;

                //throw new BusinessError.CustomError(IdError);
            }
            finally
            {
                DbConnection.db.Close();
            }
            return ListeBiblio;
        }

    }
}
