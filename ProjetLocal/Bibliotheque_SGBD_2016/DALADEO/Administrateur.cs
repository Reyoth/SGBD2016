using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DALADO;
using Entities;

namespace DALADO
{
    public class Administrateur
    {
        //Methode pour inserer un exemplaire = Fonctionne
        public static void EXE_CreerExemplaire(string code, DateTime DateAchat, byte indisponible, int BibId, int LivId)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EXE_CreerExemplaire]";
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
        //Afficher tous les livres = Fonctionne
        public static DataSet AllLivres(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LIV_AllLivres]";
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

        public static void UpdateLivre(string iSBN, string titre, string image, string auteurs)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LIV_UpdateLivre]";
                com.Parameters.Add(new SqlParameter("isbn", iSBN));
                com.Parameters.Add(new SqlParameter("titre", titre));
                com.Parameters.Add(new SqlParameter("image", image));
                com.Parameters.Add(new SqlParameter("author", auteurs));
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

        public static DataSet AllExemplairesByTitle(string title)
        {
            DataSet ds=new DataSet();
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EXE_AllExemplaireByTitre]";
                com.Parameters.Add(new SqlParameter("Titre", title));
                da.SelectCommand = com;
                da.Fill(ds, "ListeExemplairesByTitre");
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

        public static int NbRetardsByLecId(int lecId)
        {
            int nbretards = 0;
            SqlCommand com = new SqlCommand();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EMP_NbRetardByLEC_ID]";
                com.Parameters.Add(new SqlParameter("Lec_Id", lecId));
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    nbretards = dr.GetInt32(0);
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
            return nbretards;
        }

        public static int NbEmpruntsByLecId(int LecId)
        {
            int nbreEmprunts = 0;
            SqlCommand com = new SqlCommand();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EMP_NbEmpruntsByLEC_ID]";
                com.Parameters.Add(new SqlParameter("Lec_Id", LecId));
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                   nbreEmprunts= dr.GetInt32(0);
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
            return nbreEmprunts;
        }

        public static void DeleteLivre(string iSBN)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LIV_DeleteLivre]";
                com.Parameters.Add(new SqlParameter("isbn", iSBN));
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

        public static void AjoutManuelLivre(string iSBN, string titre, string image, string auteurs)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LIV_AjoutLivre]";
                com.Parameters.Add(new SqlParameter("ISBN", iSBN));
                com.Parameters.Add(new SqlParameter("titre", titre));
                com.Parameters.Add(new SqlParameter("image", image));
                com.Parameters.Add(new SqlParameter("auteurs", auteurs));
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

        //Affichage des livre par ISBN = Fonctionne
        public static DataSet LivreByISBN(DataSet ds, string isbn)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LIV_LivreByISBN]";
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

        //Affichage d'exeplaire pour l'enseble des bibliothèques = Fonctionne
        public static DataSet AllExemplairesAllBib(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EXE_AllExemplaireAllBib]";
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
        //Affichage de livres par titre
        public static DataSet LivreByTitre(DataSet ds, string titre)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LIV_LivreByTitle]";
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
        //affichage de toutes les reservationsencours = Foncionne
        public static DataSet AllReservationsEnCours(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[RES_ListeReservationsEnCours]";
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
                com.CommandText = "[adminBiblio].[EMP_AllEmpruntsEnCours]";
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

        //
        public static DataSet AllExemplairesByBibId(DataSet ds, int BibId)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EXE_AllExemplaireByBIB_Id]";
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
                com.CommandText = "[adminBiblio].[EMP_ListeRetardatairesAllBib]";
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

        //Methose pour retourner un exemplaire emprunté = Fonctionne
        public static void RetournerExemplaire(int exemplaireId)
        {
            var com = new SqlCommand();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[EXE_RetournerExempplaire]";
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
        //Affichage de l'esmbles des lecteurs = Foctionne
        public static DataSet AllLecteurs(DataSet ds)
        {
            var com = new SqlCommand();
            var da = new SqlDataAdapter();
            try
            {
                DbConnection.db.Open();
                com.Connection = DbConnection.db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "[adminBiblio].[LEC_AllLecteurs]";
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
