using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DALEF;
using Entities;

namespace BL
{
    public class Lecteur
    {

        public static void BIB_AllLibelle(ref List<BIB_AllLibelle_Result> bibs )
        {
            
            bibs = DALEF.Lecteur.BIB_AllLibelle();
            
        }
        public static LEC_Login_Result LEC_Login(string login, string password)
        {

            return  DALEF.Lecteur.LEC_Login(login,password);

        }
        //public static void BIB_AllBibliotheques(ref List<Bibliotheque> biblios)
        //{
        //    using (SGBD2016_BibliothequeEntities context = new SGBD2016_BibliothequeEntities())
        //    {
        //        var bibs = context.BIB_AllLibelle();
        //        foreach (var bib in bibs)
        //        {
        //            Console.WriteLine(bib.ToString());
        //        }
        //    }
        //}
        public static List<EMP_AllEmpruntsRenduByLEC_Id_Result> AllEmpruntsByLecId(int LecId)
        {
            return DALEF.Lecteur.AllEmpruntsByLecId(LecId); 
        }

        public static LEC_GetUserData_Result GetUserData(int lEC_Id)
        {
            LEC_GetUserData_Result user = DALEF.Lecteur.GetUserData(lEC_Id);
            return user;
        }

        public static void UpdateUserData(int Lec_Id, string nom, string prenom, string sexe, string adresse, string ville, int codePostal, DateTime dateNaissanceDateTime, string username, string password, string image)
        {
            DALEF.Lecteur.UpdateUserData(Lec_Id, nom, prenom, sexe, adresse, ville, codePostal, dateNaissanceDateTime, username, password, image);
        }

        public static List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> AllExemplairesReserveDispo(int lEC_Id, int bib_ID)
        {
            return DALEF.Lecteur.RES_ListeReservationsDisponibleByLEC_IdByBib(lEC_Id, bib_ID);
        }

        public static List<EMP_RetardsAllBibByLec_Result> AllRetardsByLecIdAllbib(int lEC_Id)
        {
            return DALEF.Lecteur.AllRetardsByLecIdAllbib(lEC_Id);
        }

        public static List<RES_ListeReservationsByLEC_Id_Result> AllReservationsByLecId(int lEC_Id)
        {
            return DALEF.Lecteur.AllReservationsByLecId(lEC_Id);
        }

        public static List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> AllEmpruntsEncoursByLecId(int lEC_Id)
        {
            return DALEF.Lecteur.AllEmpruntsEnCoursByLecId(lEC_Id);
        }

        public static List<EXE_AllExemplairesByBibId_Result> AllExemplairesByBibId(int bib_ID)
        {
            return DALEF.Lecteur.AllExemplaireBybBibId(bib_ID);
        }

        public static List<EXE_AllExemplairesDispoByBibByISBN_Result> AllExeplairesByISBN(int bibId, string isbn)
        {
            return DALEF.Lecteur.AllExeplairesByISBN(bibId, isbn);
        }

        public static List<EXE_AllExemplairesDispoByBibByTitle_Result> AllExeplairesByTitle(int bibId, string titre)
        {
            return DALEF.Lecteur.AllExemplairesByTitle(bibId, titre);
        }

        public static void EmprunterExemplaire(int exeId, int lecId)
        {
            DALEF.Lecteur.EXE_EmprunterExemplaire(exeId, lecId);
        }

        public static List<LIV_LivreByBib_idByISBN_Result> AllLivresByISBN(int bibId, string isbn)
        {
            return DALEF.Lecteur.AllLivresByISBN(bibId, isbn);
        }

       

        public static List<LIV_LivreByBib_idByTitre_Result> AllLivresByTitle(int bibId, string titre)
        {
            return DALEF.Lecteur.AllLivresByTitle(bibId, titre);
        }

        public static void ReserverLivre(int livId, int lecId)
        {
           DALEF.Lecteur.RES_ReserverLivre(livId, lecId);
        }

        public static List<LIV_LivreByBib_id_Result> AllLLivresByBibId(int bIB_ID)
        {
            return DALEF.Lecteur.AllLivreByBibId(bIB_ID);
        }
    }
}
