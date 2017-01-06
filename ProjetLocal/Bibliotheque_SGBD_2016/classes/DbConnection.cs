using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    internal class DbConnection
    {
        private static SqlConnection _db;

        public static SqlConnection db
        {
            get
            {
                if ((_db == null) || (_db.State != ConnectionState.Open))
                {
                    _db = new SqlConnection();
                    _db.ConnectionString = Globals.DefaultConnectionString;
                }
                return _db;
            }

            set { }
        }
    }
}