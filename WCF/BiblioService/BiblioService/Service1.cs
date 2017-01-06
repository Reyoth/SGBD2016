using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using Entities;

namespace BiblioService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in both code and config file together.
    public class Service1 : IService1
    {
        public DataSet AllEmpruntsEnCours(DataSet ds)
        {
            BL.Administrateur.AllEmpruntsEnCours(ref ds);
            return ds;
        }

        public DataSet AllExemplairesAllBib(DataSet ds)
        {
            BL.Administrateur.AllExemplairesAllBib(ref ds);
            return ds;
        }

        public DataSet AllExemplairesByBibId(DataSet ds, int BibId)
        {
            BL.Administrateur.AllExemplairesByBibId(ref ds, BibId);
            return ds;
        }

        public DataSet AllLecteurs(DataSet ds)
        {
            BL.Administrateur.AllLecteurs(ref ds);
            return ds;
        }

        public DataSet AllLivres(DataSet ds)
        {
            BL.Administrateur.AllLivres(ref ds);
            return ds;
        }

        public DataSet AllReservationsEnCours(DataSet ds)
        {
            BL.Administrateur.AllReservationsEnCours(ref ds);
            return ds;
        }

        public DataSet AllRetardataires(DataSet ds)
        {
            BL.Administrateur.AllRetardataires(ref ds);
            return ds;
        }

        public void EXE_CreerExemplaire(string code, DateTime DateAchat, byte indisponible, int BibId, int LivId)
        {
            BL.Administrateur.EXE_CreerExemplaire(code, DateAchat, indisponible, BibId, LivId);
        }

        public string GetData(int value)
        {
            return $"You entered: {value}";
        }
        
        //public IList<EXE_AllExemplaireBIB_Id_Result> EXE_AllExemplaireBIB_Id(int BibId)
        //{
        //    // a modifier car il utiliser les entities directement (pas bien)
        //    using (var context = new SGBD2016_BibliothequeEntities())
        //    {
        //        var exemplaires = context.EXE_AllExemplaireBIB_Id(BibId);
        //        var output = exemplaires.ToList();

        //        return output;
        //    }
        //}

        public CompositeType GetDataUsingDataContract(CompositeType composite)
        {
            if (composite == null)
            {
                throw new ArgumentNullException(nameof(composite));
            }
            if (composite.BoolValue)
            {
                composite.StringValue += "Suffix";
            }
            return composite;
        }

        public DataSet LivreByISBN(DataSet ds, string isbn)
        {
            
            BL.Administrateur.LivreByISBN(ref ds, isbn);
            return ds;
        }

        public List<Livre> LivreByTitle(string title)
        {
            List<Entities.Livre> Livres = null;
            BL.Lecteur.LivreByTitle(ref Livres, title);
            return Livres;
        }

        public DataSet LivreByTitre(DataSet ds, string titre)
        {
            BL.Administrateur.LivreByTitre(ref ds, titre);
            return ds;
        }

        public void RetournerExemplaire(int exemplaireId)
        {
           BL.Administrateur.RetournerExemplaire(exemplaireId);
        }
    }
    [DataContract]
    public class LivreAllLivre
    {
        public int Id { get; set; }
        public string ISBN { get; set; }
        public string Titre { get; set; }
        public int AUT_Id { get; set; }
        public string AUT_Nom { get; set; }
        public string AUT_Prenom { get; set; }
    }
}
