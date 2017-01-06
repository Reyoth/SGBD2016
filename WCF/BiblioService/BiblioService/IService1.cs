using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace BiblioService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        string GetData(int value);

        [OperationContract]
        CompositeType GetDataUsingDataContract(CompositeType composite);

        //[OperationContract]
        //IList<EXE_AllExemplaireBIB_Id_Result> EXE_AllExemplaireBIB_Id(int BibId);

        [OperationContract]
        void EXE_CreerExemplaire(string code, DateTime DateAchat, byte indisponible, int BibId, int LivId);

        [OperationContract]
        DataSet AllExemplairesAllBib(DataSet ds);

        [OperationContract]
        DataSet AllExemplairesByBibId(DataSet ds, int BibId);

        [OperationContract]
        DataSet AllRetardataires(DataSet ds);

        [OperationContract]
        DataSet AllLivres(DataSet ds);

        [OperationContract]
        void RetournerExemplaire(int exemplaireId);

        [OperationContract]
        DataSet AllLecteurs(DataSet ds);

        [OperationContract]
        DataSet AllEmpruntsEnCours(DataSet ds);

        [OperationContract]
        DataSet AllReservationsEnCours(DataSet ds);

        [OperationContract]
        DataSet LivreByISBN(DataSet ds, string isbn);

        [OperationContract]
        DataSet LivreByTitre(DataSet ds, string titre);

        [OperationContract]
        List<Entities.Livre> LivreByTitle(string title);

        // TODO: Add your service operations here
    }

    // Use a data contract as illustrated in the sample below to add composite types to service operations.
    // You can add XSD files into the project. After building the project, you can directly use the data types defined there, with the namespace "BiblioService.ContractType".
    [DataContract]
    public class CompositeType
    {
        [DataMember]
        public bool BoolValue { get; set; } = true; //remplace les coms ci dessous

        //bool boolValue = true;
        string stringValue = "Hello ";

        //[DataMember]
        //public bool BoolValue
        //{
        //    get { return boolValue; }
        //    set { boolValue = value; }
        //}

        [DataMember]
        public string StringValue
        {
            get { return stringValue; }
            set { stringValue = value; }
        }
    }
}
