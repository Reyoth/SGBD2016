using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using Entities;

namespace MainApp
{
   
    public partial class LecteurGui : Form
    {
        //varaible qui prend la valeur de l'id u user connecté
        public int UserId;
        
        public LecteurGui()
        {
            InitializeComponent();
        }

        private void LecteurGui_Load(object sender, EventArgs e)
        {
            //UserId = BL.Lecteur.GetUserId(lFullName.Text);
            ChargerBibliotheques(cbLibLivre);//remplissage du la combobox avec le slibelle biblio

            //Remplissage du gridview du volet "recherche un livre" avec la liste entiere des livres de tte les biblio
            List<Entities.LivreAllLivre> livres=null;
            BL.Lecteur.AllLivres(ref livres);
            gvLivre.DataSource = livres;

            //Remplissage du gridview du volet "Mes emprunts" avec la liste des emprunts en cours du user connecté 
            List<Entities.EmpruntEnCours> EmpruntsEnCours = null;
            BL.Lecteur.EmpruntsEnCours(ref EmpruntsEnCours, UserId);//passage en ref de la liste des emprunts et due l'id du user
            gvEmpruntEnCours.DataSource = EmpruntsEnCours;

            //Remplissage du gridview du volet "Mes emprunts" avec l'historique des emprunts du user connecté 
            List<Entities.EmpruntEnCours> Emprunts = null;
            BL.Lecteur.Emprunts(ref Emprunts, UserId);//passage en ref de la liste des emprunts et due l'id du user
            gvHistoriqueEmprunt.DataSource = Emprunts;


            //Remplissage du gridview du volet
            List<Entities.ReservationEnCours> Reservtaions = null;
            BL.Lecteur.ReservationsEnCours(ref Reservtaions, UserId);//passage en ref de la liste des reservation et due l'id du user
            gvReservationEnCour.DataSource = Reservtaions;

        }
        //chargement de combobox avec la liste des libellé des bibliothqèues
        public void ChargerBibliotheques(ComboBox cb)
        {
            List<string> lstBiblio=BL.Lecteur.AllBiblioLibelle();
            foreach (string libelle in lstBiblio)
            {
                cb.Items.Add(libelle);
            }
        }
        //Remplissage du data grid view du volet rechercher livre
        private void btnISBNGoRechLivre_Click(object sender, EventArgs e)
        {   //on recupère une liste d'objets livres par isbn
            gvLivre.DataSource = null;
            List<Entities.Livre> listLivres = new List<Livre>();
            BL.Lecteur.LivreByISBN(ref listLivres, txtRechLivre.Text);
            gvLivre.DataSource = listLivres;
        }
        //Remplissage du data grid view du volet rechercher livre
        private void btnTitreGoRechLivre_Click(object sender, EventArgs e)
        {
            //on recupère une liste d'objets livres par Titre
            gvLivre.DataSource = null;
            List<Entities.Livre> listLivres = new List<Livre>();
            BL.Lecteur.LivreByTitre(ref listLivres, txtTitreRechLivre.Text);
            gvLivre.DataSource = listLivres;
        }
    }
}
