using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace DALEF
{
    public class Lecteur
    {
        public static List<BIB_AllLibelle_Result> BIB_AllLibelle()
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                
                return dbContext.BIB_AllLibelle().ToList();
            }
        }

        public static List<EMP_AllEmpruntsByLEC_Id_Result> EMP_AllEmpruntsByLEC_Id(int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EMP_AllEmpruntsByLEC_Id(lecId).ToList();
            }
        }

        public static List<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EMP_RetardsAllBibByLec(lecId).ToList();
            }
        }

        public static List<EMP_AllEmpruntsRenduByLEC_Id_Result> AllEmpruntsByLecId(int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EMP_AllEmpruntsRenduByLEC_Id(lecId).ToList();
            }
        }

        public static List<EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(int bibId, string isbn)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EXE_AllExemplairesDispoByBibByISBN(bibId, isbn).ToList();
            }
        }

        public static List<EXE_AllExemplairesByBibId_Result> AllExemplaireBybBibId(int bib_ID)
        {
            using (SGBD2016_BibliothequeEntities dbcontext = new SGBD2016_BibliothequeEntities())
            {
                return dbcontext.EXE_AllExemplairesByBibId(bib_ID).ToList();
            }
        }

        public static List<EMP_RetardsAllBibByLec_Result> AllRetardsByLecIdAllbib(int lEC_Id)
        {
            using (SGBD2016_BibliothequeEntities dbcontext = new SGBD2016_BibliothequeEntities())
            {
                return dbcontext.EMP_RetardsAllBibByLec(lEC_Id).ToList();
            }
        }

        public static List<RES_ListeReservationsByLEC_Id_Result> AllReservationsByLecId(int lEC_Id)
        {
            using (SGBD2016_BibliothequeEntities dbcontext = new SGBD2016_BibliothequeEntities())
            {
                return dbcontext.RES_ListeReservationsByLEC_Id(lEC_Id).ToList();
            }
        }

        public static List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> AllEmpruntsEnCoursByLecId(int lEC_Id)
        {
            using (SGBD2016_BibliothequeEntities dbcontext = new SGBD2016_BibliothequeEntities())
            {
                return dbcontext.EMP_AllEmpruntsEnCoursByLEC_Id(lEC_Id).ToList();
            }
        }

        public static LEC_GetUserData_Result GetUserData(int Lec_Id)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.LEC_GetUserData(Lec_Id).ElementAt(0);
            }
        }

        public static List<LIV_LivreByBib_idByISBN_Result> AllLivresByISBN(int bibId, string isbn)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.LIV_LivreByBib_idByISBN(bibId, isbn).ToList();
            }
        }

        public static List<LIV_LivreByBib_idByTitre_Result> AllLivresByTitle(int bibId, string titre)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.LIV_LivreByBib_idByTitre(bibId, titre).ToList();
            }
        }

        public static List<LIV_LivreByBib_id_Result> AllLivreByBibId(int bibId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.LIV_LivreByBib_id(bibId).ToList();
            }
        }

        public static void UpdateUserData(int Lec_Id, string nom, string prenom, string sexe, string adresse, string ville, int codePostal, DateTime dateNaissance, string username, string password, string image)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                dbContext.LEC_UpdateUserData(Lec_Id, nom, prenom, sexe, adresse, ville, codePostal, dateNaissance, username, password, image);
            }
        }

        public static List<EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(int bibId, string titre)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EXE_AllExemplairesDispoByBibByTitle(bibId, titre).ToList();
            }
        }

        public static void EXE_EmprunterExemplaire(int exeId, int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                dbContext.EXE_EmprunterExemplaire(exeId, lecId);
            }
        }
        public static LEC_Login_Result LEC_Login(string username, string password)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.LEC_Login(username, password).ElementAt(0);
            }
        }
        public static List<EXE_AllExemplairesDispoByBibByISBN_Result> AllExeplairesByISBN(int bibId, string isbn)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EXE_AllExemplairesDispoByBibByISBN(bibId, isbn).ToList();
            }
        }
        public static List<EXE_AllExemplairesDispoByBibId_Result> EXE_AllExemplairesDispoByBibId(int bibId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EXE_AllExemplairesDispoByBibId(bibId).ToList();
            }
        }

        public static List<EXE_AllExemplairesDispoByBibByTitle_Result> AllExemplairesByTitle(int bibId, string titre)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.EXE_AllExemplairesDispoByBibByTitle(bibId, titre).ToList();
            }
        }
        public static List<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.RES_ListeReservationsByLEC_Id(lecId).ToList();
            }
        }
        public static List<RES_ListeReservationsDisponibleByLEC_IdAllBib_Result> RES_ListeReservationsDisponibleByLEC_IdAllBib(int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.RES_ListeReservationsDisponibleByLEC_IdAllBib(lecId).ToList();
            }
        }
        public static List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int lecId, int bibId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                return dbContext.RES_ListeReservationsDisponibleByLEC_IdByBib(lecId, bibId).ToList();
            }
        }
        public static void RES_ReserverLivre(int livId, int lecId)
        {
            using (SGBD2016_BibliothequeEntities dbContext = new SGBD2016_BibliothequeEntities())
            {
                dbContext.RES_ReserverLivre(livId, lecId);
            }
        }


    }
}
