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
        public static void AllEmpruntsByLecId(ref List<Entities.EmpruntEnCours> empruntsEnCours,int LecId)
        {
            //var ListEmprunt = DALEF.Lecteur.AllEmpruntsByLecId(LecId);
            
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


        //public static List<string> AllBiblioLibelle()
        //{
        //    using (var context = new SGBD2016_BibliothequeEntities())
        //    {
        //        List<string> listLibelleBib = new List<string>();

        //        var biblio = context.Bibliotheques.ToList();

        //        foreach (var bib  in biblio)
        //        {
        //            listLibelleBib.Add(bib.BIB_Libelle);
        //        }
        //        return listLibelleBib;
        //    }

        //}

        //public static void LivreByISBN(ref Entities.Livre livre, string isbn)
        //{

        //    using (SGBD2016_BibliothequeEntities lecteurContext = new SGBD2016_BibliothequeEntities())
        //    {
        //       var  LivreResult = lecteurContext.LIV_LivreByISBN(isbn).ElementAt(0);
        //        livre.ISBN = LivreResult.LIV_ISBN;
        //        livre.Id = LivreResult.LIV_Id;
        //        livre.Titre = LivreResult.LIV_Titre;
        //        livre.Authors = LivreResult.LIV_Auteurs;

        //    }

        //}

        //public static void LivreByTitre(ref List<Entities.Livre> listL, string Titre)
        //{
        //    List<Entities.Livre> listeLivres = new List<Entities.Livre>();
        //    listeLivres = DALADO.Lecteur.LivreByTitre(listeLivres, Titre);
        //    listL = listeLivres;
        //}

        //public static void AllLivres(ref List<Entities.LivreAllLivre> livres)
        //{
        //    List<Entities.LivreAllLivre> listeLivres = new List<LivreAllLivre>();
        //    DALADO.Lecteur.LivreByTitre(listeLivres);
        //    livres = listeLivres;
        //}

        //public static void EmpruntsEnCours(ref List<Entities.EmpruntEnCours> empruntsEnCours, int userId)
        //{
        //    List<Entities.EmpruntEnCours> listeEmpruntsEnCours = new List<Entities.EmpruntEnCours>();
        //    DALADO.Lecteur.EmpruntsEnCours(listeEmpruntsEnCours, userId);
        //    empruntsEnCours = listeEmpruntsEnCours;
        //}

        //public static void ReservationsEnCours(ref List<Entities.ReservationEnCours> emprunts, int userId)
        //{
        //    List<Entities.ReservationEnCours> listeReservations = new List<Entities.ReservationEnCours>();
        //    DALADO.Lecteur.ReservationsEnCours(listeReservations, userId);
        //    emprunts = listeReservations;
        //}

        //public static void Emprunts(ref List<EmpruntEnCours> emprunts, int userId)
        //{
        //    List<Entities.EmpruntEnCours> listeEmprunts = new List<Entities.EmpruntEnCours>();
        //    DALADO.Lecteur.Emprunts(listeEmprunts, userId);
        //    emprunts = listeEmprunts;
        //}

        //public static int GetUserId(string userName)
        //{
        //    int Id = DAL.Lecteur.GetUserId(userName);
        //    return Id;
        //}
    }
}
