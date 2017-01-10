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
        public static List<EMP_AllEmpruntsRenduByLEC_Id_Result> EMP_AllEmpruntsRenduByLEC_Id(int LecId)
        {
            return DALEF.Lecteur.EMP_AllEmpruntsRenduByLEC_Id(LecId); 
        }

        public static LEC_GetUserData_Result GetUserData(int lEC_Id)
        {
            LEC_GetUserData_Result user = DALEF.Lecteur.GetUserData(lEC_Id);
            return user;
        }

        public static void LEC_UpdateUserData(int Lec_Id, string nom, string prenom, string sexe, string adresse, string ville, int codePostal, DateTime dateNaissanceDateTime, string username, string password, string image)
        {
            DALEF.Lecteur.LEC_UpdateUserData(Lec_Id, nom, prenom, sexe, adresse, ville, codePostal, dateNaissanceDateTime, username, password, image);
        }

        public static List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int lEC_Id, int bib_ID)
        {
            return DALEF.Lecteur.RES_ListeReservationsDisponibleByLEC_IdByBib(lEC_Id, bib_ID);
        }

        public static List<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int lEC_Id)
        {
            return DALEF.Lecteur.EMP_RetardsAllBibByLec(lEC_Id);
        }

        public static List<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int lEC_Id)
        {
            return DALEF.Lecteur.RES_ListeReservationsByLEC_Id(lEC_Id);
        }

        public static List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(int lEC_Id)
        {
            return DALEF.Lecteur.EMP_AllEmpruntsEnCoursByLEC_Id(lEC_Id);
        }

        public static List<EXE_AllExemplairesByBibId_Result> EXE_AllExemplairesByBibId(int bib_ID)
        {
            return DALEF.Lecteur.EXE_AllExemplairesByBibId(bib_ID);
        }

        public static List<EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(int bibId, string isbn)
        {
            return DALEF.Lecteur.EXE_AllExemplairesDispoByBibByISBN(bibId, isbn);
        }

        public static List<EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(int bibId, string titre)
        {
            return DALEF.Lecteur.EXE_AllExemplairesDispoByBibByTitle(bibId, titre);
        }

        public static void EXE_EmprunterExemplaire(int exeId, int lecId)
        {
            DALEF.Lecteur.EXE_EmprunterExemplaire(exeId, lecId);
        }

        public static List<LIV_LivreByBib_idByISBN_Result> LIV_LivreByBib_idByISBN(int bibId, string isbn)
        {
            return DALEF.Lecteur.LIV_LivreByBib_idByISBN(bibId, isbn);
        }

       

        public static List<LIV_LivreByBib_idByTitre_Result> LIV_LivreByBib_idByTitre(int bibId, string titre)
        {
            return DALEF.Lecteur.LIV_LivreByBib_idByTitre(bibId, titre);
        }

        public static void ReserverLivre(int livId, int lecId)
        {
           DALEF.Lecteur.RES_ReserverLivre(livId, lecId);
        }

        public static List<LIV_LivreByBib_id_Result> LIV_LivreByBib_id(int bIB_ID)
        {
            return DALEF.Lecteur.LIV_LivreByBib_id(bIB_ID);
        }
    }
}
