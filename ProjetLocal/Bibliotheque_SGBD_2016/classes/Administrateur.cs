﻿using System;
using System.Data;
using System.Data.SqlClient;

namespace DAL
{
    public class Administrateur
    {
        //Fini
        public static void EXE_CreerExemplaire(string code, DateTime DateAchat, byte indisponible, int BibId, int LivId)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "EXE_CreerExemplaire";
                com.Parameters.Add(new SqlParameter("Code", code));
                com.Parameters.Add(new SqlParameter("DateAChat", DateAchat));
                com.Parameters.Add(new SqlParameter("Indisponible", indisponible));
                com.Parameters.Add(new SqlParameter("Bib_Id", BibId));
                com.Parameters.Add(new SqlParameter("Liv_Id", LivId));
                da.InsertCommand = com;
                com.ExecuteNonQuery();
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
        }

        public static DataSet AllLivres(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LIV_AllLivres";
                da.SelectCommand = com;
                da.Fill(ds, "ListeLivres");
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
            return ds;
        }

        public static DataSet LivreByISBN(DataSet ds, string isbn)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LIV_LivreByISBN";
                com.Parameters.Add(new SqlParameter("ISBN", isbn));
                da.SelectCommand = com;
                da.Fill(ds, "LivreByISBN");
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
            return ds;
        }

        //Fini
        public static DataSet AllExemplairesAllBib(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "EXE_AllExemplaireAllBib";
                da.SelectCommand = com;
                da.Fill(ds, "ListeExemplaires");
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
            return ds;
        }

        public static DataSet LivreByTitre(DataSet ds, string titre)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LIV_LivreByTitle";
                com.Parameters.Add(new SqlParameter("Liv_Title", titre));
                da.SelectCommand = com;
                da.Fill(ds, "LivreByTitre");
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
            return ds;
        }

        public static DataSet AllReservationsEnCours(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "RES_ListeReservationsEnCours";
                da.SelectCommand = com;
                da.Fill(ds, "ListeReservationsEnCours");
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
            return ds;
        }

        public static DataSet AllEmpruntsEnCours(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "EMP_AllEmpruntsEnCours";
                da.SelectCommand = com;
                da.Fill(ds, "ListeEmpruntsEnCours");
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
            return ds;
        }

        //Fini
        public static DataSet AllExemplairesByBibId(DataSet ds, int BibId)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "EXE_AllExemplaireByBIB_Id";
                com.Parameters.Add(new SqlParameter("Bib_Id", BibId));
                da.SelectCommand = com;
                da.Fill(ds, "ListeExemplairesByBib_Id");
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
            return ds;
        }

        //Fini
        public static DataSet AllRetardataires(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "EMP_ListeRetardatairesAllBib";
                da.SelectCommand = com;
                da.Fill(ds, "ListeRetardataires");
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
            return ds;
        }

        //Fini
        public static void RetournerExemplaire(int exemplaireId)
        {
            var com = new SqlCommand();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "EXE_RetournerExempplaire";
                com.Parameters.Add(new SqlParameter("ExemplaireId", exemplaireId));
                com.ExecuteNonQuery();
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
        }

        public static DataSet AllLecteurs(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LEC_AllLecteurs";
                da.SelectCommand = com;
                da.Fill(ds, "ListeLecteurs");
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
            return ds;
        }
    }
}