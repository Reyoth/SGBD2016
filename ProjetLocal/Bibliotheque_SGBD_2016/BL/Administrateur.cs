using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;


namespace BL
{
    public class Administrateur
    {
        public static void EXE_CreerExemplaire(string code, DateTime DateAchat, string BibLibelle, string LivTitre)
        {
           DALADO.Administrateur.EXE_CreerExemplaire(code, DateAchat, BibLibelle, LivTitre);
        }

        public static void AllExemplairesAllBib(ref DataSet ds)
        {

            DALADO.Administrateur.AllExemplairesAllBib(ds);


        }

        public static string ADM_Lgin(string userName, string password)
        {
            string userN = DALADO.Administrateur.ADM_Login(userName, password);
            return userN;
        }

        public static void AllExemplairesByBibId(ref DataSet ds, int BibId)
        {

            DALADO.Administrateur.AllExemplairesByBibId(ds, BibId);

        }

        public static void AllRetardataires(ref DataSet ds)
        {

            DALADO.Administrateur.AllRetardataires(ds);

        }

        public static void AllLivres(ref DataSet ds)
        {

            DALADO.Administrateur.AllLivres(ds);

        }

        public static void BIB_AllLibelle(ref List<string> bibliotheques)
        {
            bibliotheques = DALADO.Administrateur.BIB_AllLibelle();
        }

        public static void RetournerExemplaire(int exemplaireId, double montant)
        {
            DALADO.Administrateur.RetournerExemplaire(exemplaireId, montant);
        }

        public static void AllLecteurs(ref DataSet ds)
        {

            DALADO.Administrateur.AllLecteurs(ds);

        }
        public static void AllEmpruntsEnCours(ref DataSet ds)
        {

            DALADO.Administrateur.AllEmpruntsEnCours(ds);

        }
        public static void AllReservationsEnCours(ref DataSet ds)
        {

            DALADO.Administrateur.AllReservationsEnCours(ds);

        }

        public static void LivreByISBN(ref DataSet ds, string isbn)
        {

            DALADO.Administrateur.LivreByISBN(ds, isbn);

        }
        public static void LivreByTitre(ref DataSet ds, string titre)
        {

            DALADO.Administrateur.LivreByTitre(ds, titre);

        }

        public static void AjoutManuelLivre(string ISBN, string Titre, string Image, string Auteurs)
        {
            DALADO.Administrateur.AjoutManuelLivre(ISBN, Titre, Image, Auteurs);
        }

        public static void UpdateLivre(string ISBN, string Titre, string Image, string Auteurs)
        {
            DALADO.Administrateur.UpdateLivre(ISBN, Titre, Image, Auteurs);
        }

        public static void DeleteLivre(string ISBN)
        {
            DALADO.Administrateur.DeleteLivre(ISBN);
        }

        public static void NbEmpruntsByLecId(ref int nbreEmprunts, int LecId)
        {
            int Nbemp = DALADO.Administrateur.NbEmpruntsByLecId(LecId);
            nbreEmprunts = Nbemp;
        }

        public static void NbRetardByLecId(ref int nbRetards, int LecId)
        {
            nbRetards = DALADO.Administrateur.NbRetardsByLecId(LecId);

        }

        public static void AllExemplairesByTitle(ref DataSet ds, string Title)
        {
            DataSet dset = null;
            dset = DALADO.Administrateur.AllExemplairesByTitle(Title);
            ds = dset;
        }

        public static void AllExemplairesByExeCode(ref DataSet ds, string ExeCode)
        {
            ds = DALADO.Administrateur.AllExemplairesByExeCode(ExeCode);
        }

        public static void EXE_AllExemplaireByBIB_Libelle(ref DataTable dt, string Libelle)
        {
            dt = DALADO.Administrateur.EXE_AllExemplaireByBIB_Libelle(Libelle);
        }

        public static void ChargerLivreTitres(ref List<string> titres )
        {
            titres = DALADO.Administrateur.ChargerLivreTitres();
        }
    }
}
