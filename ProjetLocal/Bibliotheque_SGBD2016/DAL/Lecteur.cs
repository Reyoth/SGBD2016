using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using Entities;

namespace DALADO
{
    public class Lecteur
    {
        //Method qui charge les libellé des bibliotheque
       public static List<string> AllBiblioLibelle()
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                var dbContext = new SGBD2016_BibliothequeEntities();
                var x = dbContext.BIB_AllLibelle().ToList();
                return x;
            }
            
        }

        //Methode qui affiche les livres par isbn en parametre
        public static List<Entities.Livre> LivreByISBN(List<Entities.Livre> lst, string isbn)
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                List<LIV_LivreByISBN_Result> ListByISBN = db.LIV_LivreByISBN(isbn).ToList();

                var ListLivres = from livre in ListByISBN
                    select
                    new Entities.Livre
                    {
                        Id = livre.LIV_Id,
                        ISBN = livre.LIV_ISBN,
                        Titre = livre.LIV_Titre,
                        Image = livre.LIV_Image
                    };
                lst = ListLivres.ToList();
                return lst;
            }
        }

        //Livres pat titre en parametre <LivreAllLivre = info livre + infos auteur>
        public static void LivreByTitre(List<LivreAllLivre> listeLivres)
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                List<LIV_AllLivres_Result> ListByTitre = db.LIV_AllLivres().ToList();

                var ListLivres = from livre in ListByTitre
                                 select
                                 new Entities.LivreAllLivre()
                                 {
                                     Id = livre.LIV_Id,
                                     ISBN = livre.LIV_ISBN,
                                     Titre = livre.LIV_Titre,
                                     AUT_Id = livre.AUT_Id,
                                     AUT_Nom = livre.AUT_Nom,
                                     AUT_Prenom = livre.AUT_Prenom
                                 };
                listeLivres = ListLivres.ToList();
            }
        }

        //liste des emprunts (historique)
        public static void Emprunts(List<EmpruntEnCours> listeEmprunts, int userId)
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                List<EMP_AllEmpruntsByLEC_Id_Result> ListempruntsEnCours = db.EMP_AllEmpruntsByLEC_Id(userId).ToList();

                var lstEmprunts = from emprunt in ListempruntsEnCours
                    select
                    new Entities.EmpruntEnCours()
                    {
                        EMP_Id = emprunt.EMP_Id,
                        EXE_Code = emprunt.EXE_Code,
                        LIV_Titre = emprunt.LIV_Titre,
                        BIB_Libelle = emprunt.BIB_Libelle,
                        LEC_Nom = emprunt.LEC_Nom,
                        LEC_Prenom = emprunt.LEC_Prenom,
                        EMP_DateEmprunt = emprunt.EMP_DateEmprunt,
                        EMP_MontantPaye = emprunt.EMP_MontantPaye
                    };
                listeEmprunts = lstEmprunts.ToList();
            }

        }

        //liste des emprunts en cours
        public static void EmpruntsEnCours(List<Entities.EmpruntEnCours> listeEmprunts, int userId)
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> ListempruntsEnCours = db.EMP_AllEmpruntsEnCoursByLEC_Id(userId).ToList();

                var lstEmprunts = from emprunt in ListempruntsEnCours
                                 select
                                 new Entities.EmpruntEnCours()
                                 {
                                     EMP_Id = emprunt.EMP_Id,
                                     EXE_Code = emprunt.EXE_Code,
                                     LIV_Titre = emprunt.LIV_Titre,
                                     BIB_Libelle = emprunt.BIB_Libelle,
                                     LEC_Nom = emprunt.LEC_Nom,
                                     LEC_Prenom = emprunt.LEC_Prenom,
                                     EMP_DateEmprunt = emprunt.EMP_DateEmprunt,
                                     EMP_MontantPaye = emprunt.EMP_MontantPaye
                                 };
                listeEmprunts = lstEmprunts.ToList();
            }
        }
        //liste des reservations en cours
        public static void ReservationsEnCours(List<Entities.ReservationEnCours> listeReservations, int userId)
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                List<RES_ListeReservationsByLEC_Id_Result> ListReservationEnCours = db.RES_ListeReservationsByLEC_Id(userId).ToList();

                var ListReservations = from reservation in ListReservationEnCours
                                       select
                                       new Entities.ReservationEnCours()
                                       {
                                           RES_Id = reservation.RES_Id,
                                           LIV_Titre = reservation.LIV_Titre,
                                           RES_DateReservation = reservation.RES_DateReservation,
                                           LEC_Nom = reservation.LEC_Nom,
                                           LEC_Prenom = reservation.LEC_Prenom
                                       };
                listeReservations = ListReservations.ToList();
            }
        }

        //liste des livres sans les auteur
        public static List<Livre> LivreByTitre(List<Livre> listeLivres, string titre)
        {
            using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
            {
                List<LIV_LivreByTitle_Result> ListByTitre = db.LIV_LivreByTitle(titre).ToList();

                var ListLivres = from livre in ListByTitre
                                 select
                                 new Entities.Livre
                                 {
                                     Id = livre.LIV_Id,
                                     ISBN = livre.LIV_ISBN,
                                     Titre = livre.LIV_Titre,
                                     Image = livre.LIV_Image
                                 };
                listeLivres = ListLivres.ToList();
                return listeLivres;
            }
        }

        //Methode qui retourne l'id du lecteur connecté - Mis en commentaires puisque les fonctions n'ont pas ete chargées -

        //public static int GetUserId(string usename)
        //{
        //    using (SGBD2016_BibliothequeEntities db = new SGBD2016_BibliothequeEntities())
        //    {
        //        int Id = db.LEC_GetUserId();
        //        return 3;
        //    }
        //}
    }
}