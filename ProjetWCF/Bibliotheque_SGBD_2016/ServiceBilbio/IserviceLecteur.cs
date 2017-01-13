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
    public interface IServiceLecteur
    {
        
        //LECTEUR
        [OperationContract]
        List<BIB_AllLibelle_Result> BIB_AllLibelle();

        [OperationContract]
        LEC_Login_Result LEC_Login(string login, string password);

        [OperationContract]
        List<EMP_AllEmpruntsRenduByLEC_Id_Result> EMP_AllEmpruntsRenduByLEC_Id(int LecId);

        [OperationContract]
        LEC_GetUserData_Result GetUserData(int lEC_Id);

        [OperationContract]
        int LEC_UpdateUserData(int Lec_Id, string nom, string prenom, string sexe, string adresse, string ville, int codePostal, DateTime dateNaissanceDateTime, string username, string password, string image);

        [OperationContract]
        List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int lEC_Id, int bib_ID);

        [OperationContract]
        List<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int lEC_Id);

        [OperationContract]
        List<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int lEC_Id);

        [OperationContract]
        List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(int lEC_Id);

        [OperationContract]
        List<EXE_AllExemplairesByBibId_Result> EXE_AllExemplairesByBibId(int bib_ID);

        [OperationContract]
        List<EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(int bibId, string isbn);

        [OperationContract]
        List<EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(int bibId, string titre);

        [OperationContract]
        int EXE_EmprunterExemplaire(int exeId, int lecId);

        [OperationContract]
        List<LIV_LivreByBib_idByISBN_Result> LIV_LivreByBib_idByISBN(int bibId, string isbn);

        [OperationContract]
        List<LIV_LivreByBib_idByTitre_Result> LIV_LivreByBib_idByTitre(int bibId, string titre);

        [OperationContract]
        int ReserverLivre(int livId, int lecId);

        [OperationContract]
        List<LIV_LivreByBib_id_Result> LIV_LivreByBib_id(int bIB_ID);






    }

    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    // You can add XSD files into the project. After building the project, you can directly use the data types defined there, with the namespace "ServiceBilbio.ContractType".
    
}
