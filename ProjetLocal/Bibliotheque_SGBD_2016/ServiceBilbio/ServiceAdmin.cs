using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Entities;

namespace ServiceBilbio
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class ServiceAdmin : IServiceAdmin
    {
        //public string GetData(int value)
        //{
        //    return string.Format("You entered: {0}", value);
        //}

        //public CompositeType GetDataUsingDataContract(CompositeType composite)
        //{
        //    if (composite == null)
        //    {
        //        throw new ArgumentNullException("composite");
        //    }
        //    if (composite.BoolValue)
        //    {
        //        composite.StringValue += "Suffix";
        //    }
        //    return composite;
        //}


        public void EXE_CreerExemplaire(string code, DateTime DateAchat, string BibLibelle, string LivTitre)
        {
            BL.Administrateur.EXE_CreerExemplaire(code, DateAchat, BibLibelle, LivTitre);
        }
        
        public void AllExemplairesAllBib(ref DataSet ds)
        {
            BL.Administrateur.AllExemplairesAllBib(ref ds);
        }

        public string ADM_Lgin(string userName, string password)
        {
            string retour = BL.Administrateur.ADM_Lgin(userName, password);
            return retour;
        }

        public void AllRetardataires(ref DataSet ds)
        {
            BL.Administrateur.AllRetardataires(ref ds);
        }

        public void AllLivres(ref DataSet ds)
        {
            BL.Administrateur.AllLivres(ref ds);
        }

        public void BIB_AllLibelle(ref List<string> bibliotheques)
        {
            BL.Administrateur.BIB_AllLibelle(ref bibliotheques);
        }

        public void RetournerExemplaire(int exemplaireId, double montant)
        {
            BL.Administrateur.RetournerExemplaire(exemplaireId, montant);
        }

        public void AllLecteurs(ref DataSet ds)
        {
            BL.Administrateur.AllLecteurs(ref ds);
        }

        public void AllEmpruntsEnCours(ref DataSet ds)
        {
            BL.Administrateur.AllEmpruntsEnCours(ref ds);
        }

        public void LivreByISBN(ref DataSet ds, string isbn)
        {
            BL.Administrateur.LivreByISBN(ref ds, isbn);
        }

        public void LivreByTitre(ref DataSet ds, string titre)
        {
            BL.Administrateur.LivreByTitre(ref ds, titre);
        }

        public void AjoutManuelLivre(string ISBN, string Titre, string Image, string Auteurs)
        {
            BL.Administrateur.AjoutManuelLivre(ISBN, Titre, Image, Auteurs);
        }

        public void UpdateLivre(string ISBN, string Titre, string Image, string Auteurs)
        {
            BL.Administrateur.UpdateLivre(ISBN, Titre, Image, Auteurs);
        }

        public void DeleteLivre(string ISBN)
        {
            BL.Administrateur.DeleteLivre(ISBN);
        }

        public void NbEmpruntsByLecId(ref int nbreEmprunts, int LecId)
        {
            BL.Administrateur.NbEmpruntsByLecId(ref nbreEmprunts, LecId);
        }

        public void NbRetardByLecId(ref int nbRetards, int LecId)
        {
            BL.Administrateur.NbRetardByLecId(ref nbRetards, LecId);
        }

        public void AllExemplairesByTitle(ref DataSet ds, string Title)
        {
            BL.Administrateur.AllExemplairesByTitle(ref ds, Title);
        }

        public void AllExemplairesByExeCode(ref DataSet ds, string ExeCode)
        {
            BL.Administrateur.AllExemplairesByExeCode(ref ds, ExeCode);
        }

        public void EXE_AllExemplaireByBIB_Libelle(ref DataTable dt, string Libelle)
        {
            BL.Administrateur.EXE_AllExemplaireByBIB_Libelle(ref dt, Libelle);
        }

        public void ChargerLivreTitres(ref List<string> titres)
        {
            BL.Administrateur.ChargerLivreTitres(ref titres);
        }

        public void BIB_AllLibelle(ref List<BIB_AllLibelle_Result> bibs)
        {
            throw new NotImplementedException();
        }

        public LEC_Login_Result LEC_Login(string login, string password)
        {
            throw new NotImplementedException();
        }

        public List<EMP_AllEmpruntsRenduByLEC_Id_Result> EMP_AllEmpruntsRenduByLEC_Id(int LecId)
        {
            throw new NotImplementedException();
        }

        public LEC_GetUserData_Result GetUserData(int lEC_Id)
        {
            throw new NotImplementedException();
        }

        public void LEC_UpdateUserData(int Lec_Id, string nom, string prenom, string sexe, string adresse, string ville, int codePostal,
            DateTime dateNaissanceDateTime, string username, string password, string image)
        {
            throw new NotImplementedException();
        }

        public List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int lEC_Id, int bib_ID)
        {
            throw new NotImplementedException();
        }

        public List<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int lEC_Id)
        {
            throw new NotImplementedException();
        }

        public List<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int lEC_Id)
        {
            throw new NotImplementedException();
        }

        public List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(int lEC_Id)
        {
            throw new NotImplementedException();
        }

        public List<EXE_AllExemplairesByBibId_Result> EXE_AllExemplairesByBibId(int bib_ID)
        {
            throw new NotImplementedException();
        }

        public List<EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(int bibId, string isbn)
        {
            throw new NotImplementedException();
        }

        public List<EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(int bibId, string titre)
        {
            throw new NotImplementedException();
        }

        public void EXE_EmprunterExemplaire(int exeId, int lecId)
        {
            throw new NotImplementedException();
        }

        public List<LIV_LivreByBib_idByISBN_Result> LIV_LivreByBib_idByISBN(int bibId, string isbn)
        {
            throw new NotImplementedException();
        }

        public List<LIV_LivreByBib_idByTitre_Result> LIV_LivreByBib_idByTitre(int bibId, string titre)
        {
            throw new NotImplementedException();
        }

        public void ReserverLivre(int livId, int lecId)
        {
            throw new NotImplementedException();
        }

        public List<LIV_LivreByBib_id_Result> LIV_LivreByBib_id(int bIB_ID)
        {
            throw new NotImplementedException();
        }
    }
}
