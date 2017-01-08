using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DALADO
{
    public class DbConnection
    {
        private static SqlConnection _db;

        public static SqlConnection db
        {
            get
            {
                if ((_db == null) || (_db.State != ConnectionState.Open))
                {
                    _db = new SqlConnection();
                    _db.ConnectionString = Globals.AdminBiblioConnectionString;
                }
                return _db;
            }

            set { }
        }
    }
}
