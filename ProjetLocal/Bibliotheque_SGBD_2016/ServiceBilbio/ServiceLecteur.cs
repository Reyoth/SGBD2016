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

        public LEC_GetUserData_Result GetUserData(int LecId)
        {
            return BL.Lecteur.GetUserData(LecId);
        }

        public void LEC_UpdateUserData(int LecId, string nom, string prenom, string sexe, string adresse, string ville, int codePostal,
            DateTime dateNaissance, string username, string password, string image)
        {
            BL.Lecteur.LEC_UpdateUserData(LecId, nom, prenom, sexe, adresse, ville, codePostal, dateNaissance, username, password, image);
        }

        public List<RES_ListeReservationsDisponibleByLEC_IdByBib_Result> RES_ListeReservationsDisponibleByLEC_IdByBib(int LecId, int bibId)
        {
            return BL.Lecteur.RES_ListeReservationsDisponibleByLEC_IdByBib(LecId, bibId);
        }

        public List<EMP_RetardsAllBibByLec_Result> EMP_RetardsAllBibByLec(int LecId)
        {
            return BL.Lecteur.EMP_RetardsAllBibByLec(LecId);
        }

        public List<RES_ListeReservationsByLEC_Id_Result> RES_ListeReservationsByLEC_Id(int LecId)
        {
            return BL.Lecteur.RES_ListeReservationsByLEC_Id(LecId);
        }

        public List<EMP_AllEmpruntsEnCoursByLEC_Id_Result> EMP_AllEmpruntsEnCoursByLEC_Id(int LecId)
        {
            return BL.Lecteur.EMP_AllEmpruntsEnCoursByLEC_Id(LecId);
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
