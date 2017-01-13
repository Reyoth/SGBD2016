﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DALEF
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;

    public partial class SGBD2016_BibliothequeEntities : DbContext
    {
        public SGBD2016_BibliothequeEntities()
            : base("name=SGBD2016_BibliothequeEntities")
        {
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }


        public virtual ObjectResult<EMP_AllEmpruntsByLEC_Id_Result> EMP_AllEmpruntsByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue
                ? new ObjectParameter("Lec_Id", lec_Id)
                : new ObjectParameter("Lec_Id", typeof(int));

            return
                ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsByLEC_Id_Result>(
                    "EMP_AllEmpruntsByLEC_Id", lec_IdParameter);
        }

        public virtual int EXE_EmprunterExemplaire(Nullable<int> exe_Id, Nullable<int> lec_Id)
        {
            var exe_IdParameter = exe_Id.HasValue
                ? new ObjectParameter("Exe_Id", exe_Id)
                : new ObjectParameter("Exe_Id", typeof(int));

            var lec_IdParameter = lec_Id.HasValue
                ? new ObjectParameter("Lec_Id", lec_Id)
                : new ObjectParameter("Lec_Id", typeof(int));

            return ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction("EXE_EmprunterExemplaire",
                exe_IdParameter, lec_IdParameter);
        }

        public virtual ObjectResult<LIV_LivreByISBN_Result> LIV_LivreByISBN(string iSBN)
        {
            var iSBNParameter = iSBN != null
                ? new ObjectParameter("ISBN", iSBN)
                : new ObjectParameter("ISBN", typeof(string));

            return
                ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<LIV_LivreByISBN_Result>("LIV_LivreByISBN",
                    iSBNParameter);
        }

        public virtual ObjectResult<LIV_LivreByTitle_Result> LIV_LivreByTitle(string liv_Title)
        {
            var liv_TitleParameter = liv_Title != null
                ? new ObjectParameter("Liv_Title", liv_Title)
                : new ObjectParameter("Liv_Title", typeof(string));

            return
                ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<LIV_LivreByTitle_Result>(
                    "LIV_LivreByTitle", liv_TitleParameter);
        }

        public virtual ObjectResult<RES_ListeReservationsDisponibleByLEC_Id_Result>
            RES_ListeReservationsDisponibleByLEC_Id(Nullable<int> idLecteur)
        {
            var idLecteurParameter = idLecteur.HasValue
                ? new ObjectParameter("IdLecteur", idLecteur)
                : new ObjectParameter("IdLecteur", typeof(int));

            return
                ((IObjectContextAdapter) this).ObjectContext
                    .ExecuteFunction<RES_ListeReservationsDisponibleByLEC_Id_Result>(
                        "RES_ListeReservationsDisponibleByLEC_Id", idLecteurParameter);
        }

        public virtual int RES_ReserverLivre(Nullable<int> liv_Id, Nullable<int> lec_Id)
        {
            var liv_IdParameter = liv_Id.HasValue
                ? new ObjectParameter("Liv_Id", liv_Id)
                : new ObjectParameter("Liv_Id", typeof(int));

            var lec_IdParameter = lec_Id.HasValue
                ? new ObjectParameter("Lec_Id", lec_Id)
                : new ObjectParameter("Lec_Id", typeof(int));

            return ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction("RES_ReserverLivre", liv_IdParameter,
                lec_IdParameter);
        }

        public virtual ObjectResult<EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(
            Nullable<int> bib_Id, string iSBN)
        {
            var bib_IdParameter = bib_Id.HasValue
                ? new ObjectParameter("Bib_Id", bib_Id)
                : new ObjectParameter("Bib_Id", typeof(int));

            var iSBNParameter = iSBN != null
                ? new ObjectParameter("ISBN", iSBN)
                : new ObjectParameter("ISBN", typeof(string));

            return
                ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<EXE_AllExemplairesDispoByBibByISBN_Result>(
                    "EXE_AllExemplairesDispoByBibByISBN", bib_IdParameter, iSBNParameter);
        }

        public virtual ObjectResult<EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(
            Nullable<int> bib_Id, string titre)
        {
            var bib_IdParameter = bib_Id.HasValue
                ? new ObjectParameter("Bib_Id", bib_Id)
                : new ObjectParameter("Bib_Id", typeof(int));

            var titreParameter = titre != null
                ? new ObjectParameter("Titre", titre)
                : new ObjectParameter("Titre", typeof(string));

            return
                ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<EXE_AllExemplairesDispoByBibByTitle_Result>
                    ("EXE_AllExemplairesDispoByBibByTitle", bib_IdParameter, titreParameter);
        }

        public virtual ObjectResult<EXE_AllExemplairesDispoByBibId_Result> EXE_AllExemplairesDispoByBibId(
            Nullable<int> bib_Id)
        {
            var bib_IdParameter = bib_Id.HasValue
                ? new ObjectParameter("Bib_Id", bib_Id)
                : new ObjectParameter("Bib_Id", typeof(int));

            return
                ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<EXE_AllExemplairesDispoByBibId_Result>(
                    "EXE_AllExemplairesDispoByBibId", bib_IdParameter);
        }

        public virtual ObjectResult<RES_ListeReservationsDisponibleByLEC_IdAllBib_Result>
            RES_ListeReservationsDisponibleByLEC_IdAllBib(Nullable<int> idLecteur)
        {
            var idLecteurParameter = idLecteur.HasValue
                ? new ObjectParameter("IdLecteur", idLecteur)
                : new ObjectParameter("IdLecteur", typeof(int));

            return
                ((IObjectContextAdapter) this).ObjectContext
                    .ExecuteFunction<RES_ListeReservationsDisponibleByLEC_IdAllBib_Result>(
                        "RES_ListeReservationsDisponibleByLEC_IdAllBib", idLecteurParameter);
        }

        public virtual ObjectResult<BIB_AllLibelle_Result> BIB_AllLibelle()
        {
            return ((IObjectContextAdapter) this).ObjectContext.ExecuteFunction<BIB_AllLibelle_Result>("BIB_AllLibelle");
        }

        public virtual ObjectResult<LEC_Login_Result> LEC_Login(string userName, string password)
        {
            var userNameParameter = userName != null
                ? new ObjectParameter("UserName", userName)
                : new ObjectParameter("UserName", typeof(string));

            var passwordParameter = password != null
                ? new ObjectParameter("Password", password)
                : new ObjectParameter("Password", typeof(string));
            try
            {
                return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LEC_Login_Result>("LEC_Login", userNameParameter, passwordParameter);

            }
            catch (Exception)
            {

                return null;
            }
        }
    
        public virtual ObjectResult<LEC_GetUserData_Result> LEC_GetUserData(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LEC_GetUserData_Result>("LEC_GetUserData", userIdParameter);
        }
    
        public virtual int LEC_UpdateUserData(Nullable<int> userId, string lEC_Nom, string lEC_Prenom, string lEC_Sexe, string lEC_Adresse, string lEC_Ville, Nullable<int> lEC_CodePostal, Nullable<System.DateTime> lEC_DateDeNaissance, string lEC_UserName, string lEC_Password, string lEC_Photo)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));
    
            var lEC_NomParameter = lEC_Nom != null ?
                new ObjectParameter("LEC_Nom", lEC_Nom) :
                new ObjectParameter("LEC_Nom", typeof(string));
    
            var lEC_PrenomParameter = lEC_Prenom != null ?
                new ObjectParameter("LEC_Prenom", lEC_Prenom) :
                new ObjectParameter("LEC_Prenom", typeof(string));
    
            var lEC_SexeParameter = lEC_Sexe != null ?
                new ObjectParameter("LEC_Sexe", lEC_Sexe) :
                new ObjectParameter("LEC_Sexe", typeof(string));
    
            var lEC_AdresseParameter = lEC_Adresse != null ?
                new ObjectParameter("LEC_Adresse", lEC_Adresse) :
                new ObjectParameter("LEC_Adresse", typeof(string));
    
            var lEC_VilleParameter = lEC_Ville != null ?
                new ObjectParameter("LEC_Ville", lEC_Ville) :
                new ObjectParameter("LEC_Ville", typeof(string));
    
            var lEC_CodePostalParameter = lEC_CodePostal.HasValue ?
                new ObjectParameter("LEC_CodePostal", lEC_CodePostal) :
                new ObjectParameter("LEC_CodePostal", typeof(int));
    
            var lEC_DateDeNaissanceParameter = lEC_DateDeNaissance.HasValue ?
                new ObjectParameter("LEC_DateDeNaissance", lEC_DateDeNaissance) :
                new ObjectParameter("LEC_DateDeNaissance", typeof(System.DateTime));
    
            var lEC_UserNameParameter = lEC_UserName != null ?
                new ObjectParameter("LEC_UserName", lEC_UserName) :
                new ObjectParameter("LEC_UserName", typeof(string));
    
            var lEC_PasswordParameter = lEC_Password != null ?
                new ObjectParameter("LEC_Password", lEC_Password) :
                new ObjectParameter("LEC_Password", typeof(string));
    
            var lEC_PhotoParameter = lEC_Photo != null ?
                new ObjectParameter("LEC_Photo", lEC_Photo) :
                new ObjectParameter("LEC_Photo", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("LEC_UpdateUserData", userIdParameter, lEC_NomParameter, lEC_PrenomParameter, lEC_SexeParameter, lEC_AdresseParameter, lEC_VilleParameter, lEC_CodePostalParameter, lEC_DateDeNaissanceParameter, lEC_UserNameParameter, lEC_PasswordParameter, lEC_PhotoParameter);
        }
    
        public virtual ObjectResult<LIV_LivreByBib_idByISBN_Result> LIV_LivreByBib_idByISBN(Nullable<int> bibId, string iSBN)
        {
            var bibIdParameter = bibId.HasValue ?
                new ObjectParameter("BibId", bibId) :
                new ObjectParameter("BibId", typeof(int));
    
            var iSBNParameter = iSBN != null ?
                new ObjectParameter("ISBN", iSBN) :
                new ObjectParameter("ISBN", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByBib_idByISBN_Result>("LIV_LivreByBib_idByISBN", bibIdParameter, iSBNParameter);
        }
    
        public virtual ObjectResult<LIV_LivreByBib_id_Result> LIV_LivreByBib_id(Nullable<int> bibId)
        {
            var bibIdParameter = bibId.HasValue ?
                new ObjectParameter("BibId", bibId) :
                new ObjectParameter("BibId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByBib_id_Result>("LIV_LivreByBib_id", bibIdParameter);
        }
    
        public virtual ObjectResult<LIV_LivreByBib_idByTitre_Result> LIV_LivreByBib_idByTitre(Nullable<int> bibId, string titre)
        {
            var bibIdParameter = bibId.HasValue ?
                new ObjectParameter("BibId", bibId) :
                new ObjectParameter("BibId", typeof(int));
    
            var titreParameter = titre != null ?
                new ObjectParameter("titre", titre) :
                new ObjectParameter("titre", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByBib_idByTitre_Result>("LIV_LivreByBib_idByTitre", bibIdParameter, titreParameter);
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsRenduByLEC_Id_Result> EMP_AllEmpruntsRenduByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsRenduByLEC_Id_Result>("EMP_AllEmpruntsRenduByLEC_Id", lec_IdParameter);
        }
    
        public virtual ObjectResult<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RES_ListeReservationsByLEC_Id_Result>("RES_ListeReservationsByLEC_Id", lec_IdParameter);
        }
    
        public virtual ObjectResult<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(Nullable<int> idLecteur, Nullable<int> idBibliotheque)
        {
            var idLecteurParameter = idLecteur.HasValue ?
                new ObjectParameter("IdLecteur", idLecteur) :
                new ObjectParameter("IdLecteur", typeof(int));
    
            var idBibliothequeParameter = idBibliotheque.HasValue ?
                new ObjectParameter("IdBibliotheque", idBibliotheque) :
                new ObjectParameter("IdBibliotheque", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RES_ListeReservationsDisponibleByLEC_IdByBib_Result>("RES_ListeReservationsDisponibleByLEC_IdByBib", idLecteurParameter, idBibliothequeParameter);
        }
    
        public virtual ObjectResult<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(Nullable<int> lec_id)
        {
            var lec_idParameter = lec_id.HasValue ?
                new ObjectParameter("Lec_id", lec_id) :
                new ObjectParameter("Lec_id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_RetardsAllBibByLec_Result>("EMP_RetardsAllBibByLec", lec_idParameter);
        }
    
        public virtual ObjectResult<EXE_AllExemplairesByBibId_Result> EXE_AllExemplairesByBibId(Nullable<int> bib_Id)
        {
            var bib_IdParameter = bib_Id.HasValue ?
                new ObjectParameter("Bib_Id", bib_Id) :
                new ObjectParameter("Bib_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EXE_AllExemplairesByBibId_Result>("EXE_AllExemplairesByBibId", bib_IdParameter);
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsEnCoursByLEC_Id_Result>("EMP_AllEmpruntsEnCoursByLEC_Id", lec_IdParameter);
        }
    }
}
