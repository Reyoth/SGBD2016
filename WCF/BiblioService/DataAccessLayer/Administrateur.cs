using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer
{
    class Administrateur
    {
        public static int ADM_CheckLog(string userName, string password, int exists)
        {
            SqlCommand ChekcLogin= new SqlCommand();

            SqlDataAdapter oDataAdapter = new SqlDataAdapter();

            try
            {
                DataBase.DbAdminConnection.Open();

                ChekcLogin.Connection = DataBase.DbAdminConnection;

                ChekcLogin.CommandType = CommandType.Text;
                ChekcLogin.CommandText = "ADM_CheckLogin";
                SqlParameter pUsername = new SqlParameter();
                SqlParameter pPassword = new SqlParameter();
                ChekcLogin.Parameters.AddWithValue(pUsername, txtUsername.Text);
                ChekcLogin.Parameters.AddWithValue(pPassword, txtPassword.Text);
                exists = ChekcLogin.ExecuteNonQuery();

                return exists;
            }
            catch (SqlException exSQL)
            {
                int IdError = 999;
                switch (exSQL.Number)
                {
                    case 18456:
                        IdError = 1;
                        break;
                }

                throw new CustomErrors.Error(IdeError);

            }
            catch (Exception ex)
            {
                int IdError = 999;

                throw new CustomErrors.CustomError(IdError);


            }
        }
    }
}
