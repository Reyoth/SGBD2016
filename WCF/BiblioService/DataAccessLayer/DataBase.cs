using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    public class DataBase
    {
        private static SqlConnection _Db = null;

        public static SqlConnection DbAdminConnection
        {
            get
            {
                if (_Db ==null || _Db.State != ConnectionState.Open)
                {
                    _Db = new SqlConnection();
                    _Db.ConnectionString = Globals.AdminConnectionString;
                }
                return _Db;
            }

            set { }
        }
        public static SqlConnection DbLecteurConnection
        {
            get
            {
                if (_Db == null || _Db.State != ConnectionState.Open)
                {
                    _Db = new SqlConnection();
                    _Db.ConnectionString = Globals.LecteurConnectionString;
                }
                return _Db;
            }

            set { }
        }
        public static SqlConnection DbSysAdminConnection
        {
            get
            {
                if (_Db == null || _Db.State != ConnectionState.Open)
                {
                    _Db = new SqlConnection();
                    _Db.ConnectionString = Globals.SysAdminConnectionString;
                }
                return _Db;
            }

            set { }
        }

    }
}
