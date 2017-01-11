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
    public class ServiceLecteur : IServiceLecteur
    {
        public void BIB_AllLibelle(ref List<BIB_AllLibelle_Result> bibs)
        {
            BL.Lecteur.BIB_AllLibelle(ref bibs);
        }

        public LEC_Login_Result LEC_Login(string login, string password)
        {
            return BL.Lecteur.LEC_Login(login, password);
        }

        public List<EMP_AllEmpruntsRenduByLEC_Id_Result> EMP_AllEmpruntsRenduByLEC_Id(int LecId)
        {
            return BL.Lecteur.EMP_AllEmpruntsRenduByLEC_Id(LecId);
        }

        public LEC_GetUserData_Result GetUserData(int lEC_Id)
        {
            return BL.Lecteur.GetUserData(lEC_Id);
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
