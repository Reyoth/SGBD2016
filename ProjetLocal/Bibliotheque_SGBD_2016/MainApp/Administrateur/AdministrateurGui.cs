using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Entities;

namespace MainApp.Administrateur
{
    public partial class AdministrateurGui : Form
    {
        
        public AdministrateurGui()
        {
            InitializeComponent();
            timer1.Start();
        }

        private void AdministrateurGui_Load(object sender, EventArgs e)
        {
            ////txt volet Gestion LIvre
            txtISBNAjMan.Enabled = false;
            txtTitreAjMan.Enabled = false;
            txtLienAjMan.Enabled = false;
            txtNomAutAjMan.Enabled = false;

            //txt volet Emprunts et retards
            //enable

            txtNomEmprunteur.Enabled = false;
            txtPrenomemprunteur.Enabled = false;
            txtNbEmpruntsEmprunteur.Enabled = false;
            txtRetardsEmprunteur.Enabled = false;
            txtNomretardataire.Enabled = false;
            txtPrenomRetardataire.Enabled = false;
            txtNbJoursRetards.Enabled = false;
            txtMontantRetard.Enabled = false;
            //readonly
            txtNomEmprunteur.ReadOnly = true;
            txtPrenomemprunteur.ReadOnly = true;
            txtNbEmpruntsEmprunteur.ReadOnly = true;
            txtRetardsEmprunteur.ReadOnly = true;
            txtNomretardataire.ReadOnly = true;
            txtPrenomRetardataire.ReadOnly = true;
            txtNbJoursRetards.ReadOnly = true;
            txtMontantRetard.ReadOnly = true;

            //txt volet Lecteur
                //enable
            txtUserDataNom.Enabled = false;
            txtUserDataPrenom.Enabled = false;
            txtUserDataSexe.Enabled = false;
            txtUserDataAdresse.Enabled = false;
            txtUserDataVille.Enabled = false;
            txtUserDataCodePostal.Enabled = false;
            txtUserDataEmail.Enabled = false;
            txtUserDataUsername.Enabled = false;
            dtUserDataDateNaissance.Enabled = false;

            //readOnly
            txtUserDataNom.ReadOnly = true;
            txtUserDataPrenom.ReadOnly = true;
            txtUserDataSexe.ReadOnly = true;
            txtUserDataAdresse.ReadOnly = true;
            txtUserDataVille.ReadOnly = true;
            txtUserDataCodePostal.ReadOnly = true;
            txtUserDataEmail.ReadOnly = true;
            txtUserDataUsername.ReadOnly = true;


            ////Data grid view de tout les volets
            gdvLivre.DataSource = null;
            dgvExemplaire.DataSource = null;
            gdvEmpruntEnCours.DataSource = null;
            gdvRetardataires.DataSource = null;
            gdvLecteurs.DataSource = null;
            DataSet ds = new DataSet();
            BL.Administrateur.AllLivres(ref ds);
            BL.Administrateur.AllExemplairesAllBib(ref ds);
            BL.Administrateur.AllEmpruntsEnCours(ref ds);
            BL.Administrateur.AllRetardataires(ref ds);
            BL.Administrateur.AllLecteurs(ref ds);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
            gdvLivre.Columns[4].Visible = false;
            dgvExemplaire.DataSource = ds.Tables[1].DefaultView; 
            gdvEmpruntEnCours.DataSource = ds.Tables[2].DefaultView; 
            gdvRetardataires.DataSource = ds.Tables[3].DefaultView; 
            gdvLecteurs.DataSource = ds.Tables[4].DefaultView;
        }

        private void btnISBNGoRechLivre_Click(object sender, EventArgs e)
        {
            if (txtISBNRechLivre.Text != "")
            {
                gdvLivre.DataSource = null;
                DataSet ds = new DataSet();
                BL.Administrateur.LivreByISBN(ref ds, txtISBNRechLivre.Text);
                gdvLivre.DataSource = ds.Tables[0].DefaultView;
            }
            else
            {
                
            }
        }

        private void btnTitreGoRechLivre_Click(object sender, EventArgs e)
        {
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            string LiveTitle = txtTitreRechLivre.Text;
            BL.Administrateur.LivreByTitre(ref ds, LiveTitle);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
        }

        private void tbnReserverLivre_Click(object sender, EventArgs e)
        {
            txtISBNAjMan.Enabled = true;
            txtTitreAjMan.Enabled = true;
            txtLienAjMan.Enabled = true;
            txtNomAutAjMan.Enabled = true;
            txtLienAjMan.Enabled = true;
            txtISBNAjMan.ReadOnly = false;
            txtTitreAjMan.ReadOnly = false;
            txtLienAjMan.ReadOnly = false;
            txtNomAutAjMan.ReadOnly = false;
            txtLienAjMan.ReadOnly = false;
        }

        private void gdvLivre_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvLivre.SelectedCells.Count == 1)
            {
                txtISBNAjMan.Text = gdvLivre.CurrentRow.Cells[1].Value.ToString();
                txtTitreAjMan.Text = gdvLivre.CurrentRow.Cells[2].Value.ToString();
                txtNomAutAjMan.Text = gdvLivre.CurrentRow.Cells[3].Value.ToString();
                txtLienAjMan.Text = gdvLivre.CurrentRow.Cells[4].Value.ToString();
                pbLivre.ImageLocation = gdvLivre.CurrentRow.Cells[4].Value.ToString();

            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            DateTime dh = DateTime.Now;
          
        }

        private void gdvEmpruntEnCours_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvEmpruntEnCours.SelectedCells.Count == 1)
            {
                txtNomEmprunteur.Text = gdvEmpruntEnCours.CurrentRow.Cells[6].Value.ToString();
                txtPrenomemprunteur.Text = gdvEmpruntEnCours.CurrentRow.Cells[7].Value.ToString();
                //exemple 5
                txtNbEmpruntsEmprunteur.Text = 5.ToString();
                //exempe 2
                txtRetardsEmprunteur.Text = 2.ToString();
            }
        }

        private void gdvReservationEnCours_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvRetardataires.SelectedCells.Count == 1)
            {
                txtNomretardataire.Text = gdvRetardataires.CurrentRow.Cells[1].Value.ToString();
                txtPrenomRetardataire.Text = gdvRetardataires.CurrentRow.Cells[2].Value.ToString(); ;
                txtNbJoursRetards.Text = "";
                txtMontantRetard.Text = gdvRetardataires.CurrentRow.Cells[3].Value.ToString();
               
            }
        }

        private void groupBox8_Enter(object sender, EventArgs e)
        {

        }

        private void lEmpruntsEnCours_Click(object sender, EventArgs e)
        {

        }

        private void lUserDataUsername_Click(object sender, EventArgs e)
        {

        }

        private void btnAjManLivre_Click(object sender, EventArgs e)
        {
            BL.Administrateur.AjoutManuelLivre(txtISBNAjMan.Text, txtTitreAjMan.Text, txtLienAjMan.Text, txtNomAutAjMan.Text);
        }

        private void btnAjRapLivre_Click(object sender, EventArgs e)
        {
            Entities.Livre Livre = new Livre();
            bool ajouté = BL.GoogleBooks.requestLivre(ref Livre, txtISBNAjRapLivre.Text);
            if (ajouté)
            {
                BL.Administrateur.AjoutManuelLivre(Livre.ISBN, Livre.Titre, Livre.Image, Livre.Authors);
            }
            else
            {
                //error
            }
        }

        private void btnActualiserLivre_Click(object sender, EventArgs e)
        {
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            BL.Administrateur.AllLivres(ref ds);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
            gdvLivre.Columns[4].Visible = false;
        }

        private void btnMAJLivre_Click(object sender, EventArgs e)
        {
            BL.Administrateur.UpdateLivre(txtISBNAjMan.Text, txtTitreAjMan.Text, txtLienAjMan.Text, txtNomAutAjMan.Text);
        }

        private void btnEmprunterLivre_Click(object sender, EventArgs e)
        {
            BL.Administrateur.DeleteLivre(txtISBNAjMan.Text);
        }
    }
}
