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
    
        public virtual DbSet<Administrateur> Administrateur { get; set; }
        public virtual DbSet<Auteur> Auteur { get; set; }
        public virtual DbSet<Bibliotheque> Bibliotheque { get; set; }
        public virtual DbSet<Emprunt> Emprunt { get; set; }
        public virtual DbSet<Exemplaire> Exemplaire { get; set; }
        public virtual DbSet<Lecteur> Lecteur { get; set; }
        public virtual DbSet<Livre> Livre { get; set; }
        public virtual DbSet<Reservation> Reservation { get; set; }
        public virtual DbSet<Tarif> Tarif { get; set; }
    
        public virtual ObjectResult<string> ADM_Login(string userName, string password)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("ADM_Login", userNameParameter, passwordParameter);
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsEnCours_Result> EMP_AllEmpruntsEnCours()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsEnCours_Result>("EMP_AllEmpruntsEnCours");
        }
    
        public virtual ObjectResult<EMP_ListeRetardatairesAllBib_Result> EMP_ListeRetardatairesAllBib()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_ListeRetardatairesAllBib_Result>("EMP_ListeRetardatairesAllBib");
        }
    
        public virtual ObjectResult<EXE_AllExemplaireAllBib_Result> EXE_AllExemplaireAllBib()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EXE_AllExemplaireAllBib_Result>("EXE_AllExemplaireAllBib");
        }
    
        public virtual ObjectResult<EXE_AllExemplaireByBIB_Id_Result> EXE_AllExemplaireByBIB_Id(Nullable<int> bib_Id)
        {
            var bib_IdParameter = bib_Id.HasValue ?
                new ObjectParameter("Bib_Id", bib_Id) :
                new ObjectParameter("Bib_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EXE_AllExemplaireByBIB_Id_Result>("EXE_AllExemplaireByBIB_Id", bib_IdParameter);
        }
    
        public virtual int EXE_CreerExemplaire(string code, Nullable<System.DateTime> dateAchat, Nullable<bool> indisponible, Nullable<int> bib_Id, Nullable<int> liv_Id)
        {
            var codeParameter = code != null ?
                new ObjectParameter("Code", code) :
                new ObjectParameter("Code", typeof(string));
    
            var dateAchatParameter = dateAchat.HasValue ?
                new ObjectParameter("DateAchat", dateAchat) :
                new ObjectParameter("DateAchat", typeof(System.DateTime));
    
            var indisponibleParameter = indisponible.HasValue ?
                new ObjectParameter("Indisponible", indisponible) :
                new ObjectParameter("Indisponible", typeof(bool));
    
            var bib_IdParameter = bib_Id.HasValue ?
                new ObjectParameter("Bib_Id", bib_Id) :
                new ObjectParameter("Bib_Id", typeof(int));
    
            var liv_IdParameter = liv_Id.HasValue ?
                new ObjectParameter("Liv_Id", liv_Id) :
                new ObjectParameter("Liv_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXE_CreerExemplaire", codeParameter, dateAchatParameter, indisponibleParameter, bib_IdParameter, liv_IdParameter);
        }
    
        public virtual int EXE_RetournerExempplaire(Nullable<int> exemplaireId)
        {
            var exemplaireIdParameter = exemplaireId.HasValue ?
                new ObjectParameter("ExemplaireId", exemplaireId) :
                new ObjectParameter("ExemplaireId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXE_RetournerExempplaire", exemplaireIdParameter);
        }
    
        public virtual ObjectResult<LEC_AllLecteurs_Result> LEC_AllLecteurs()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LEC_AllLecteurs_Result>("LEC_AllLecteurs");
        }
    
        public virtual int LIV_AjoutLivre(string iSBN, string titre, string image)
        {
            var iSBNParameter = iSBN != null ?
                new ObjectParameter("ISBN", iSBN) :
                new ObjectParameter("ISBN", typeof(string));
    
            var titreParameter = titre != null ?
                new ObjectParameter("titre", titre) :
                new ObjectParameter("titre", typeof(string));
    
            var imageParameter = image != null ?
                new ObjectParameter("image", image) :
                new ObjectParameter("image", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("LIV_AjoutLivre", iSBNParameter, titreParameter, imageParameter);
        }
    
        public virtual ObjectResult<LIV_AllLivres_Result> LIV_AllLivres()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_AllLivres_Result>("LIV_AllLivres");
        }
    
        public virtual ObjectResult<LIV_LivreByISBN_Result> LIV_LivreByISBN(string iSBN)
        {
            var iSBNParameter = iSBN != null ?
                new ObjectParameter("ISBN", iSBN) :
                new ObjectParameter("ISBN", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByISBN_Result>("LIV_LivreByISBN", iSBNParameter);
        }
    
        public virtual ObjectResult<LIV_LivreByTitle_Result> LIV_LivreByTitle(string liv_Title)
        {
            var liv_TitleParameter = liv_Title != null ?
                new ObjectParameter("Liv_Title", liv_Title) :
                new ObjectParameter("Liv_Title", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByTitle_Result>("LIV_LivreByTitle", liv_TitleParameter);
        }
    
        public virtual ObjectResult<RES_ListeReservationsEnCours_Result> RES_ListeReservationsEnCours()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RES_ListeReservationsEnCours_Result>("RES_ListeReservationsEnCours");
        }
    
        public virtual ObjectResult<string> BIB_AllLibelle()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("BIB_AllLibelle");
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsAllBib_Result> EMP_AllEmpruntsAllBib()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsAllBib_Result>("EMP_AllEmpruntsAllBib");
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsByBIB_Id_Result> EMP_AllEmpruntsByBIB_Id(Nullable<int> bib_Id)
        {
            var bib_IdParameter = bib_Id.HasValue ?
                new ObjectParameter("Bib_Id", bib_Id) :
                new ObjectParameter("Bib_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsByBIB_Id_Result>("EMP_AllEmpruntsByBIB_Id", bib_IdParameter);
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsByLEC_Id_Result> EMP_AllEmpruntsByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsByLEC_Id_Result>("EMP_AllEmpruntsByLEC_Id", lec_IdParameter);
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsEnCours1_Result> EMP_AllEmpruntsEnCours1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsEnCours1_Result>("EMP_AllEmpruntsEnCours1");
        }
    
        public virtual ObjectResult<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_AllEmpruntsEnCoursByLEC_Id_Result>("EMP_AllEmpruntsEnCoursByLEC_Id", lec_IdParameter);
        }
    
        public virtual ObjectResult<EMP_ListeRetardatairesAllBib1_Result> EMP_ListeRetardatairesAllBib1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EMP_ListeRetardatairesAllBib1_Result>("EMP_ListeRetardatairesAllBib1");
        }
    
        public virtual ObjectResult<EXE_AllExemplaireAllBib1_Result> EXE_AllExemplaireAllBib1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EXE_AllExemplaireAllBib1_Result>("EXE_AllExemplaireAllBib1");
        }
    
        public virtual ObjectResult<EXE_AllExemplaireByBIB_Id1_Result> EXE_AllExemplaireByBIB_Id1(Nullable<int> bib_Id)
        {
            var bib_IdParameter = bib_Id.HasValue ?
                new ObjectParameter("Bib_Id", bib_Id) :
                new ObjectParameter("Bib_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EXE_AllExemplaireByBIB_Id1_Result>("EXE_AllExemplaireByBIB_Id1", bib_IdParameter);
        }
    
        public virtual ObjectResult<EXE_AllExemplaireByLIV_Id_Result> EXE_AllExemplaireByLIV_Id(Nullable<int> liv_Id)
        {
            var liv_IdParameter = liv_Id.HasValue ?
                new ObjectParameter("Liv_Id", liv_Id) :
                new ObjectParameter("Liv_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<EXE_AllExemplaireByLIV_Id_Result>("EXE_AllExemplaireByLIV_Id", liv_IdParameter);
        }
    
        public virtual int EXE_CreerExemplaire1(string code, Nullable<System.DateTime> dateAchat, Nullable<bool> indisponible, Nullable<int> bib_Id, Nullable<int> liv_Id)
        {
            var codeParameter = code != null ?
                new ObjectParameter("Code", code) :
                new ObjectParameter("Code", typeof(string));
    
            var dateAchatParameter = dateAchat.HasValue ?
                new ObjectParameter("DateAchat", dateAchat) :
                new ObjectParameter("DateAchat", typeof(System.DateTime));
    
            var indisponibleParameter = indisponible.HasValue ?
                new ObjectParameter("Indisponible", indisponible) :
                new ObjectParameter("Indisponible", typeof(bool));
    
            var bib_IdParameter = bib_Id.HasValue ?
                new ObjectParameter("Bib_Id", bib_Id) :
                new ObjectParameter("Bib_Id", typeof(int));
    
            var liv_IdParameter = liv_Id.HasValue ?
                new ObjectParameter("Liv_Id", liv_Id) :
                new ObjectParameter("Liv_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXE_CreerExemplaire1", codeParameter, dateAchatParameter, indisponibleParameter, bib_IdParameter, liv_IdParameter);
        }
    
        public virtual int EXE_EmprunterExemplaire(Nullable<int> exe_Id, Nullable<int> lec_Id)
        {
            var exe_IdParameter = exe_Id.HasValue ?
                new ObjectParameter("Exe_Id", exe_Id) :
                new ObjectParameter("Exe_Id", typeof(int));
    
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXE_EmprunterExemplaire", exe_IdParameter, lec_IdParameter);
        }
    
        public virtual int EXE_RetournerExempplaire1(Nullable<int> exemplaireId)
        {
            var exemplaireIdParameter = exemplaireId.HasValue ?
                new ObjectParameter("ExemplaireId", exemplaireId) :
                new ObjectParameter("ExemplaireId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXE_RetournerExempplaire1", exemplaireIdParameter);
        }
    
        public virtual ObjectResult<LEC_AllLecteurs1_Result> LEC_AllLecteurs1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LEC_AllLecteurs1_Result>("LEC_AllLecteurs1");
        }
    
        public virtual ObjectResult<LEC_GetUserData_Result> LEC_GetUserData(Nullable<int> userId)
        {
            var userIdParameter = userId.HasValue ?
                new ObjectParameter("UserId", userId) :
                new ObjectParameter("UserId", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LEC_GetUserData_Result>("LEC_GetUserData", userIdParameter);
        }
    
        public virtual ObjectResult<Nullable<int>> LEC_GetUserId(string username)
        {
            var usernameParameter = username != null ?
                new ObjectParameter("Username", username) :
                new ObjectParameter("Username", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<Nullable<int>>("LEC_GetUserId", usernameParameter);
        }
    
        public virtual ObjectResult<LIV_AllLivres1_Result> LIV_AllLivres1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_AllLivres1_Result>("LIV_AllLivres1");
        }
    
        public virtual ObjectResult<LIV_LivreByISBN1_Result> LIV_LivreByISBN1(string iSBN)
        {
            var iSBNParameter = iSBN != null ?
                new ObjectParameter("ISBN", iSBN) :
                new ObjectParameter("ISBN", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByISBN1_Result>("LIV_LivreByISBN1", iSBNParameter);
        }
    
        public virtual ObjectResult<LIV_LivreByTitle1_Result> LIV_LivreByTitle1(string liv_Title)
        {
            var liv_TitleParameter = liv_Title != null ?
                new ObjectParameter("Liv_Title", liv_Title) :
                new ObjectParameter("Liv_Title", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<LIV_LivreByTitle1_Result>("LIV_LivreByTitle1", liv_TitleParameter);
        }
    
        public virtual ObjectResult<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(Nullable<int> lec_Id)
        {
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RES_ListeReservationsByLEC_Id_Result>("RES_ListeReservationsByLEC_Id", lec_IdParameter);
        }
    
        public virtual ObjectResult<RES_ListeReservationsDisponibleByLEC_Id_Result> RES_ListeReservationsDisponibleByLEC_Id(Nullable<int> idLecteur)
        {
            var idLecteurParameter = idLecteur.HasValue ?
                new ObjectParameter("IdLecteur", idLecteur) :
                new ObjectParameter("IdLecteur", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RES_ListeReservationsDisponibleByLEC_Id_Result>("RES_ListeReservationsDisponibleByLEC_Id", idLecteurParameter);
        }
    
        public virtual ObjectResult<RES_ListeReservationsEnCours1_Result> RES_ListeReservationsEnCours1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<RES_ListeReservationsEnCours1_Result>("RES_ListeReservationsEnCours1");
        }
    
        public virtual int RES_ReserverLivre(Nullable<int> liv_Id, Nullable<int> lec_Id)
        {
            var liv_IdParameter = liv_Id.HasValue ?
                new ObjectParameter("Liv_Id", liv_Id) :
                new ObjectParameter("Liv_Id", typeof(int));
    
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RES_ReserverLivre", liv_IdParameter, lec_IdParameter);
        }
    
        public virtual ObjectResult<string> BIB_AllLibelle1()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("BIB_AllLibelle1");
        }
    
        public virtual int EXE_EmprunterExemplaire1(Nullable<int> exe_Id, Nullable<int> lec_Id)
        {
            var exe_IdParameter = exe_Id.HasValue ?
                new ObjectParameter("Exe_Id", exe_Id) :
                new ObjectParameter("Exe_Id", typeof(int));
    
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("EXE_EmprunterExemplaire1", exe_IdParameter, lec_IdParameter);
        }
    
        public virtual ObjectResult<string> LEC_Login(string userName, string password)
        {
            var userNameParameter = userName != null ?
                new ObjectParameter("UserName", userName) :
                new ObjectParameter("UserName", typeof(string));
    
            var passwordParameter = password != null ?
                new ObjectParameter("Password", password) :
                new ObjectParameter("Password", typeof(string));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<string>("LEC_Login", userNameParameter, passwordParameter);
        }
    
        public virtual int RES_ReserverLivre1(Nullable<int> liv_Id, Nullable<int> lec_Id)
        {
            var liv_IdParameter = liv_Id.HasValue ?
                new ObjectParameter("Liv_Id", liv_Id) :
                new ObjectParameter("Liv_Id", typeof(int));
    
            var lec_IdParameter = lec_Id.HasValue ?
                new ObjectParameter("Lec_Id", lec_Id) :
                new ObjectParameter("Lec_Id", typeof(int));
    
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("RES_ReserverLivre1", liv_IdParameter, lec_IdParameter);
        }
    }
}
