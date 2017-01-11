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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IServiceAdmin
    {
        //[OperationContract]
        //string GetData(int value);

        //[OperationContract]
        //CompositeType GetDataUsingDataContract(CompositeType composite);

        //ADMINISTRATEUR
        [OperationContract]
        void EXE_CreerExemplaire(string code, DateTime DateAchat, string BibLibelle, string LivTitre);
        [OperationContract]
        void AllExemplairesAllBib(ref DataSet ds);
        [OperationContract]
        string ADM_Lgin(string userName, string password);
        [OperationContract]
        void AllRetardataires(ref DataSet ds);
        [OperationContract]
        void AllLivres(ref DataSet ds);
        [OperationContract]
        void BIB_AllLibelle(ref List<string> bibliotheques);
        [OperationContract]
        void RetournerExemplaire(int exemplaireId, double montant);
        [OperationContract]
        void AllLecteurs(ref DataSet ds);
        [OperationContract]
        void AllEmpruntsEnCours(ref DataSet ds);
        [OperationContract]
        void LivreByISBN(ref DataSet ds, string isbn);
        [OperationContract]
        void LivreByTitre(ref DataSet ds, string titre);
        [OperationContract]
        void AjoutManuelLivre(string ISBN, string Titre, string Image, string Auteurs);
        [OperationContract]
        void UpdateLivre(string ISBN, string Titre, string Image, string Auteurs);
        [OperationContract]
        void DeleteLivre(string ISBN);
        [OperationContract]
        void NbEmpruntsByLecId(ref int nbreEmprunts, int LecId);
        [OperationContract]
        void NbRetardByLecId(ref int nbRetards, int LecId);
        [OperationContract]
        void AllExemplairesByTitle(ref DataSet ds, string Title);
        [OperationContract]
        void AllExemplairesByExeCode(ref DataSet ds, string ExeCode);
        [OperationContract]
        void EXE_AllExemplaireByBIB_Libelle(ref DataTable dt, string Libelle);
        [OperationContract]
        void ChargerLivreTitres(ref List<string> titres);

    }
}
