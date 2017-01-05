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

            DALADO.Administrateur.AllExemplairesAllBib(ds);


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

        public static void RetournerExemplaire(int exemplaireId)
        {
            DALADO.Administrateur.RetournerExemplaire(exemplaireId);
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
    }
}
