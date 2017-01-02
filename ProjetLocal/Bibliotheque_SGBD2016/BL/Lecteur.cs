using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace BL
{
    public class Lecteur
    {
        public static List<string> AllBiblioLibelle()
        {
            List<string> lstBibliotheques = DAL.Lecteur.AllBiblioLibelle();
            return lstBibliotheques;
        }

        public static void LivreByISBN(ref List<Entities.Livre> lst, string isbn)
        {
            List<Entities.Livre> listeLivres = new List<Livre>();
            listeLivres = DAL.Lecteur.LivreByISBN(lst, isbn);
            lst = listeLivres;
        }

        public static void LivreByTitre(ref List<Livre> listL, string Titre)
        {
            List<Entities.Livre> listeLivres = new List<Livre>();
            listeLivres = DAL.Lecteur.LivreByTitre(listeLivres, Titre);
            listL = listeLivres;
        }

        public static void AllLivres(ref List<LivreAllLivre> livres)
        {
            List<Entities.LivreAllLivre> listeLivres = new List<LivreAllLivre>();
            DAL.Lecteur.LivreByTitre(listeLivres);
            livres = listeLivres;
        }

        public static void EmpruntsEnCours(ref List<Entities.EmpruntEnCours> empruntsEnCours, int userId)
        {
            List<Entities.EmpruntEnCours> listeEmpruntsEnCours = new List<Entities.EmpruntEnCours>();
            DAL.Lecteur.EmpruntsEnCours(listeEmpruntsEnCours, userId);
            empruntsEnCours = listeEmpruntsEnCours;
        }

        public static void ReservationsEnCours(ref List<Entities.ReservationEnCours> emprunts, int userId)
        {
            List<Entities.ReservationEnCours> listeReservations = new List<Entities.ReservationEnCours>();
            DAL.Lecteur.ReservationsEnCours(listeReservations, userId);
            emprunts = listeReservations;
        }

        public static void Emprunts(ref List<EmpruntEnCours> emprunts, int userId)
        {
            List<Entities.EmpruntEnCours> listeEmprunts = new List<Entities.EmpruntEnCours>();
            DAL.Lecteur.Emprunts(listeEmprunts, userId);
            emprunts = listeEmprunts;
        }

        //public static int GetUserId(string userName)
        //{
        //    int Id = DAL.Lecteur.GetUserId(userName);
        //    return Id;
        //}
    }
}
