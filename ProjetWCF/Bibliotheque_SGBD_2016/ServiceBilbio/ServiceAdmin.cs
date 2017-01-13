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

            try
            {
                string retour = BL.Administrateur.ADM_Lgin(userName, password);
                return retour;
            }
            catch (Exception)
            {
                
                return null;
            }
            
        }

        public void AllRetardataires(ref DataSet ds)
        {
            BL.Administrateur.AllRetardataires(ref ds);
        }

        public void AllLivres(ref DataSet ds)
        {
            BL.Administrateur.AllLivres(ref ds);
        }

        public List<string> BIB_AllLibelle()
        {
           return  BL.Administrateur.BIB_AllLibelle();
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
        
    }
}
