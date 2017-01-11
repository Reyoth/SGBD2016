using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DALEF;
using Entities;
using BIB_AllLibelle_Result = Entities.BIB_AllLibelle_Result;
using EMP_AllEmpruntsEnCoursByLEC_Id_Result = Entities.EMP_AllEmpruntsEnCoursByLEC_Id_Result;
using EMP_AllEmpruntsRenduByLEC_Id_Result = Entities.EMP_AllEmpruntsRenduByLEC_Id_Result;
using EMP_RetardsAllBibByLec_Result = Entities.EMP_RetardsAllBibByLec_Result;
using EXE_AllExemplairesByBibId_Result = Entities.EXE_AllExemplairesByBibId_Result;
using EXE_AllExemplairesDispoByBibByISBN_Result = Entities.EXE_AllExemplairesDispoByBibByISBN_Result;
using EXE_AllExemplairesDispoByBibByTitle_Result = Entities.EXE_AllExemplairesDispoByBibByTitle_Result;
using LIV_LivreByBib_idByISBN_Result = Entities.LIV_LivreByBib_idByISBN_Result;
using LIV_LivreByBib_idByTitre_Result = Entities.LIV_LivreByBib_idByTitre_Result;
using LIV_LivreByBib_id_Result = Entities.LIV_LivreByBib_id_Result;
using RES_ListeReservationsDisponibleByLEC_IdByBib_Result = Entities.RES_ListeReservationsDisponibleByLEC_IdByBib_Result;

namespace BL
{
    public class Lecteur
    {

        public static List<Entities.BIB_AllLibelle_Result> BIB_AllLibelle( )
        {
            List<Entities.BIB_AllLibelle_Result> bibs = new List<BIB_AllLibelle_Result>();

            var dalBibs = DALEF.Lecteur.BIB_AllLibelle();
            foreach (var bibAllLibelleResult in dalBibs)
            {
                bibs.Add(new Entities.BIB_AllLibelle_Result
                {
                 BIB_ID   = bibAllLibelleResult.BIB_ID,
                 BIB_Libelle = bibAllLibelleResult.BIB_Libelle
                });
            }
            return bibs;

        }
        public static Entities.LEC_Login_Result LEC_Login(string login, string password)
        {
            var session = DALEF.Lecteur.LEC_Login(login, password);
            Entities.LEC_Login_Result resultat = new Entities.LEC_Login_Result
            {
                LEC_UserName = session.LEC_UserName,
                LEC_Id = session.LEC_Id
            };
            return resultat;

        }
        public static List<Entities.EMP_AllEmpruntsRenduByLEC_Id_Result> EMP_AllEmpruntsRenduByLEC_Id(int LecId)
        {
            List<Entities.EMP_AllEmpruntsRenduByLEC_Id_Result> list = new List<EMP_AllEmpruntsRenduByLEC_Id_Result>();
            var result = DALEF.Lecteur.EMP_AllEmpruntsRenduByLEC_Id(LecId);
            foreach (var AllEmpruntsRenduByLEC_Id in result)
            {
                list.Add(new Entities.EMP_AllEmpruntsRenduByLEC_Id_Result
                {
                    Exemplaire = AllEmpruntsRenduByLEC_Id.Exemplaire,
                    Titre = AllEmpruntsRenduByLEC_Id.Titre,
                    Bibliothèque = AllEmpruntsRenduByLEC_Id.Bibliothèque,
                    Date_d_emprunt = AllEmpruntsRenduByLEC_Id.Date_d_emprunt,
                    EMP_DateRetour = AllEmpruntsRenduByLEC_Id.EMP_DateRetour,
                    EMP_MontantPaye = AllEmpruntsRenduByLEC_Id.EMP_MontantPaye
                });
            }
            return list;
        }

        public static Entities.LEC_GetUserData_Result GetUserData(int lEC_Id)
        {
            var result = DALEF.Lecteur.GetUserData(lEC_Id);
            Entities.LEC_GetUserData_Result user = new Entities.LEC_GetUserData_Result
            {
                LEC_Nom = result.LEC_Nom,
                LEC_Prenom = result.LEC_Prenom,
                LEC_Sexe = result.LEC_Sexe,
                LEC_Adresse = result.LEC_Adresse,
                LEC_Ville = result.LEC_Ville,
                LEC_CodePostal = result.LEC_CodePostal,
                LEC_DateDeNaissance = result.LEC_DateDeNaissance,
                LEC_UserName = result.LEC_UserName,
                LEC_Password = result.LEC_Password,
                LEC_Photo = result.LEC_Photo,
            };
            return user;
        }

        public static void LEC_UpdateUserData(int Lec_Id, string nom, string prenom, string sexe, string adresse, string ville, int codePostal, DateTime dateNaissanceDateTime, string username, string password, string image)
        {
            DALEF.Lecteur.LEC_UpdateUserData(Lec_Id, nom, prenom, sexe, adresse, ville, codePostal, dateNaissanceDateTime, username, password, image);
        }

        public static List<Entities.RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int lEC_Id, int bib_ID)
        {
            var result = DALEF.Lecteur.RES_ListeReservationsDisponibleByLEC_IdByBib(lEC_Id, bib_ID);
            List < Entities.RES_ListeReservationsDisponibleByLEC_IdByBib_Result > entities = new List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result>();
            foreach (var ligne in result)
            {
                entities.Add(new RES_ListeReservationsDisponibleByLEC_IdByBib_Result
                {
                    Titre = ligne.Titre,
                    EXE_Code = ligne.EXE_Code,
                    BIB_Libelle = ligne.BIB_Libelle,
                    EXE_Id = ligne.EXE_Id,
                    LEC_Id = ligne.LEC_Id,
                    LIV_Image = ligne.LIV_Image

                });
            }
            return entities;
        }

        public static List<Entities.EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int lEC_Id)
        {
            var result = DALEF.Lecteur.EMP_RetardsAllBibByLec(lEC_Id);
            List < Entities.EMP_RetardsAllBibByLec_Result > entitie = new List<EMP_RetardsAllBibByLec_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new EMP_RetardsAllBibByLec_Result
                {
                    ID_Exemplaire = ligne.ID_Exemplaire,
                    Exemplaire = ligne.Exemplaire,
                    Titre = ligne.Titre,
                    ISBN = ligne.ISBN,
                    Bibliotheque = ligne.Bibliotheque ,
                    Date_d_emprunt = ligne.Date_d_emprunt ,
                    Jours_de_retard = ligne.Jours_de_retard,
                    Montant_total_du__ = ligne.Montant_total_du__,
                    LIV_Image = ligne.LIV_Image
                });
            }
            
            return entitie;
        }

        public static List<Entities.RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int lEC_Id)
        {
            var result =DALEF.Lecteur.RES_ListeReservationsByLEC_Id(lEC_Id);
            List<Entities.RES_ListeReservationsByLEC_Id_Result> entitie = new List<Entities.RES_ListeReservationsByLEC_Id_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new Entities.RES_ListeReservationsByLEC_Id_Result
                {
                    ID_Réservation = ligne.ID_Réservation,
                    Titre = ligne.Titre,
                    ISBN = ligne.ISBN,
                    Date_de_réservation = ligne.Date_de_réservation,
                    LIV_Auteurs = ligne.LIV_Auteurs,
                    LIV_Image = ligne.LIV_Image,
                });
            }
            return entitie;
        }

        public static List<Entities.EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(int lEC_Id)
        {
            var result = DALEF.Lecteur.EMP_AllEmpruntsEnCoursByLEC_Id(lEC_Id);
            List<Entities.EMP_AllEmpruntsEnCoursByLEC_Id_Result> entitie = new List<EMP_AllEmpruntsEnCoursByLEC_Id_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new EMP_AllEmpruntsEnCoursByLEC_Id_Result
                {
                    EXE_Code = ligne.EXE_Code,
                    LIV_Titre = ligne.LIV_Titre,
                    BIB_Libelle = ligne.BIB_Libelle,
                    EMP_DateEmprunt =  ligne.EMP_DateEmprunt,
                    LIV_Image = ligne.LIV_Image,
                    TAR_Emprunt = ligne.TAR_Emprunt,
                    Retard = ligne.Retard,
                });
            }
            return entitie;
        }

        public static List<Entities.EXE_AllExemplairesByBibId_Result> EXE_AllExemplairesByBibId(int bib_ID)
        {
            var result = DALEF.Lecteur.EXE_AllExemplairesByBibId(bib_ID);
            List < Entities.EXE_AllExemplairesByBibId_Result > entite = new List<EXE_AllExemplairesByBibId_Result>();
            foreach (var ligne in result)
            {
                entite.Add(new Entities.EXE_AllExemplairesByBibId_Result
                {
                    Auteurs = ligne.Auteurs,
                    Bibliotheque = ligne.Bibliotheque,
                    ID_Exemplaire = ligne.ID_Exemplaire,
                    Exemplaire = ligne.Exemplaire,
                    ISBN = ligne.ISBN,
                    LIV_Image = ligne.LIV_Image,
                    Titre = ligne.Titre
                });
            }
            return entite;
        }

        public static List<Entities.EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(int bibId, string isbn)
        {
            var result = DALEF.Lecteur.EXE_AllExemplairesDispoByBibByISBN(bibId, isbn);
            List<Entities.EXE_AllExemplairesDispoByBibByISBN_Result> entitie = new List<EXE_AllExemplairesDispoByBibByISBN_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new EXE_AllExemplairesDispoByBibByISBN_Result
                {
                    Auteurs = ligne.Auteurs,
                    Bibliotheque = ligne.Bibliotheque,
                    Exemplaire = ligne.Exemplaire,
                    ID_Exemplaire = ligne.ID_Exemplaire,
                    ISBN = ligne.ISBN,
                    Titre = ligne.Titre
                });
            }
            return entitie;
        }

        public static List<Entities.EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(int bibId, string titre)
        {
            var result = DALEF.Lecteur.EXE_AllExemplairesDispoByBibByTitle(bibId, titre);
            List<Entities.EXE_AllExemplairesDispoByBibByTitle_Result> entitie = new List<EXE_AllExemplairesDispoByBibByTitle_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new EXE_AllExemplairesDispoByBibByTitle_Result
                {
                    Auteurs = ligne.Auteurs,
                    Bibliothèque = ligne.Bibliothèque,
                    EXE_Id = ligne.EXE_Id,
                    Exemplaire = ligne.Exemplaire,
                    ISBN = ligne.ISBN,
                    Titre = ligne.Titre
                });
            }
            return entitie;
        }

        public static void EXE_EmprunterExemplaire(int exeId, int lecId)
        {
            DALEF.Lecteur.EXE_EmprunterExemplaire(exeId, lecId);
        }

        public static List<Entities.LIV_LivreByBib_idByISBN_Result> LIV_LivreByBib_idByISBN(int bibId, string isbn)
        {
            var result = DALEF.Lecteur.LIV_LivreByBib_idByISBN(bibId, isbn);
            List < Entities.LIV_LivreByBib_idByISBN_Result > entitie = new List<LIV_LivreByBib_idByISBN_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new LIV_LivreByBib_idByISBN_Result
                {
                    Auteurs = ligne.Auteurs,
                    ID = ligne.ID,
                    Image = ligne.Image,
                    ISBN = ligne.ISBN,
                    Titre = ligne.Titre
                });
            }
            return entitie;
        }

       

        public static List<Entities.LIV_LivreByBib_idByTitre_Result> LIV_LivreByBib_idByTitre(int bibId, string titre)
        {
            var result = DALEF.Lecteur.LIV_LivreByBib_idByTitre(bibId, titre);
            List < Entities.LIV_LivreByBib_idByTitre_Result > entitie = new List<LIV_LivreByBib_idByTitre_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new LIV_LivreByBib_idByTitre_Result
                {
                    Auteurs = ligne.Auteurs,
                    ID = ligne.ID,
                    Image = ligne.Image,
                    ISBN = ligne.ISBN,
                    Titre = ligne.Titre
                });
            }
            return entitie;
        }

        public static void ReserverLivre(int livId, int lecId)
        {
           DALEF.Lecteur.RES_ReserverLivre(livId, lecId);
        }

        public static List<Entities.LIV_LivreByBib_id_Result> LIV_LivreByBib_id(int bIB_ID)
        {
            var result = DALEF.Lecteur.LIV_LivreByBib_id(bIB_ID);
            List < Entities.LIV_LivreByBib_id_Result > entitie = new List<LIV_LivreByBib_id_Result>();
            foreach (var ligne in result)
            {
                entitie.Add(new LIV_LivreByBib_id_Result
                {
                    ID = ligne.ID,
                    Image = ligne.Image,
                    ISBN = ligne.ISBN,
                    Titre = ligne.Titre,
                    Auteurs = ligne.Auteurs,
                });
            }
            return entitie;
        }
    }
}
