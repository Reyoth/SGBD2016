using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BL
{
    public class Administrateur
    {
        public static void EXE_CreerExemplaire(string code, DateTime DateAchat, byte indisponible, int BibId, int LivId)
        {
            DALADO.Administrateur.EXE_CreerExemplaire(code, DateAchat, indisponible, BibId, LivId);
        }

        public static void AllExemplairesAllBib(ref DataSet ds)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.AllExemplairesAllBib(ds);
            ds = DsBl;

        }
        public static void AllExemplairesByBibId(ref DataSet ds, int BibId)
        {
            DataSet DsBl= new DataSet();
            DsBl = DALADO.Administrateur.AllExemplairesByBibId(ds, BibId);
            ds = DsBl;
        }

        public static void AllRetardataires(ref DataSet ds)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.AllRetardataires(ds);
            ds = DsBl;
        }

        public static void AllLivres(ref DataSet ds)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.AllLivres(ds);
            ds = DsBl;
        }

        public static void RetournerExemplaire(int exemplaireId)
        {
            DALADO.Administrateur.RetournerExemplaire(exemplaireId);
        }

        public static void AllLecteurs(ref DataSet ds)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.AllLecteurs(ds);
            ds = DsBl;
        }
        public static void AllEmpruntsEnCours(ref DataSet ds)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.AllEmpruntsEnCours(ds);
            ds = DsBl;
        }
        public static void AllReservationsEnCours(ref DataSet ds)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.AllReservationsEnCours(ds);
            ds = DsBl;
        }

        public static void LivreByISBN(ref DataSet ds, string isbn)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.LivreByISBN(ds, isbn );
            ds = DsBl;
        }
        public static void LivreByTitre(ref DataSet ds, string titre)
        {
            DataSet DsBl = new DataSet();
            DsBl = DALADO.Administrateur.LivreByTitre(ds, titre);
            ds = DsBl;
        }
    }
}
