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

        public void LEC_UpdateUserData(int lecId, string nom, string prenom, string sexe, string adresse, string ville, int codePostal,
            DateTime dateNaissance, string username, string password, string image)
        {
           BL.Lecteur.LEC_UpdateUserData(lecId, nom, prenom,sexe, adresse, ville, codePostal,dateNaissance, username, password, image);
        }

        public List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int lecId, int bibId)
        {
            return BL.Lecteur.RES_ListeReservationsDisponibleByLEC_IdByBib(lecId, bibId);
        }

        public List<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int lecId)
        {
            return BL.Lecteur.EMP_RetardsAllBibByLec(lecId);
        }

        public List<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int lecId)
        {
            return BL.Lecteur.RES_ListeReservationsByLEC_Id(lecId);
        }

        public List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(int lecId)
        {
            return BL.Lecteur.EMP_AllEmpruntsEnCoursByLEC_Id(lecId);
        }

        public List<EXE_AllExemplairesByBibId_Result> EXE_AllExemplairesByBibId(int bibId)
        {
            return BL.Lecteur.EXE_AllExemplairesByBibId(bibId);
        }

        public List<EXE_AllExemplairesDispoByBibByISBN_Result> EXE_AllExemplairesDispoByBibByISBN(int bibId, string isbn)
        {
            return BL.Lecteur.EXE_AllExemplairesDispoByBibByISBN(bibId, isbn);
        }

        public List<EXE_AllExemplairesDispoByBibByTitle_Result> EXE_AllExemplairesDispoByBibByTitle(int bibId, string titre)
        {
            return BL.Lecteur.EXE_AllExemplairesDispoByBibByTitle(bibId, titre);
        }

        public void EXE_EmprunterExemplaire(int exeId, int lecId)
        {
            BL.Lecteur.EXE_EmprunterExemplaire(exeId, lecId);
        }

        public List<LIV_LivreByBib_idByISBN_Result> LIV_LivreByBib_idByISBN(int bibId, string isbn)
        {
            return BL.Lecteur.LIV_LivreByBib_idByISBN(bibId, isbn);
        }

        public List<LIV_LivreByBib_idByTitre_Result> LIV_LivreByBib_idByTitre(int bibId, string titre)
        {
            return BL.Lecteur.LIV_LivreByBib_idByTitre(bibId, titre);
        }

        public void ReserverLivre(int livId, int lecId)
        {
            BL.Lecteur.ReserverLivre(livId, lecId);
        }

        public List<LIV_LivreByBib_id_Result> LIV_LivreByBib_id(int bibId)
        {
            return BL.Lecteur.LIV_LivreByBib_id(bibId);
        }
    }
}
