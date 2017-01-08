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

            //txt volet Exemplaires
            txtCodeExemplaire.Enabled = false;
            txtLivreExemplaire.Enabled = false;
            dtDateAchatExemp.Enabled = false;
            txtCodeExemplaire.ReadOnly = true;
            txtLivreExemplaire.ReadOnly = true;

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
            txtUserDataUsername.Enabled = false;
            dtUserDataDateNaissance.Enabled = false;

            //readOnly
            txtUserDataNom.ReadOnly = true;
            txtUserDataPrenom.ReadOnly = true;
            txtUserDataSexe.ReadOnly = true;
            txtUserDataAdresse.ReadOnly = true;
            txtUserDataVille.ReadOnly = true;
            txtUserDataCodePostal.ReadOnly = true;
            txtUserDataUsername.ReadOnly = true;


            ////Data grid view de tout les volets
            gdvLivre.DataSource = null;
            dgvExemplaire.DataSource = null;
            gdvEmpruntEnCours.DataSource = null;
            gdvRetardataires.DataSource = null;
            gdvLecteurs.DataSource = null;
            DataSet ds = new DataSet();
            BL.Administrateur.AllLivres(ref ds);
            var x = ds;
            BL.Administrateur.AllExemplairesAllBib(ref ds);
            BL.Administrateur.AllEmpruntsEnCours(ref ds);
            BL.Administrateur.AllRetardataires(ref ds);
            BL.Administrateur.AllLecteurs(ref ds);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
            gdvLivre.Columns[0].Visible = false;
            gdvLivre.Columns[4].Visible = false;
            dgvExemplaire.DataSource = ds.Tables[1].DefaultView;
            dgvExemplaire.Columns[0].Visible = false;
            dgvExemplaire.Columns[7].Visible = false;
            gdvEmpruntEnCours.DataSource = ds.Tables[2].DefaultView;
            gdvEmpruntEnCours.Columns[0].Visible = false;
            gdvEmpruntEnCours.Columns[5].Visible = false;
            gdvEmpruntEnCours.Columns[8].Visible = false;
            gdvRetardataires.DataSource = ds.Tables[3].DefaultView;
            gdvRetardataires.Columns[0].Visible = false;
            gdvRetardataires.Columns[5].Visible = false;
            gdvRetardataires.Columns[7].Visible = false;
            gdvRetardataires.Columns[10].Visible = false;
            gdvRetardataires.Columns[12].Visible = false;

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
                pbLivreEmprunt.ImageLocation = gdvEmpruntEnCours.CurrentRow.Cells[8].Value.ToString();
                //Calcul du nombre d'emprunt par id
                int LecId = 0;
                LecId = Int32.Parse(gdvEmpruntEnCours.CurrentRow.Cells[5].Value.ToString());
                int NbreEmprunts = 0;
                BL.Administrateur.NbEmpruntsByLecId(ref NbreEmprunts, LecId);
                txtNbEmpruntsEmprunteur.Text = NbreEmprunts.ToString();
                //Calcul du nombre des retards
                int NbRetards = 0;
                BL.Administrateur.NbRetardByLecId(ref NbRetards, LecId);
                txtRetardsEmprunteur.Text = NbRetards.ToString();
            }
        }

        private void gdvReservationEnCours_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
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

        private void button24_Click(object sender, EventArgs e)
        {
            txtCodeExemplaire.Enabled = true;
            txtLivreExemplaire.Enabled = true;
            dtDateAchatExemp.Enabled = true;
            txtCodeExemplaire.ReadOnly = false;
            txtLivreExemplaire.ReadOnly = false;
        }

        private void gdvLecteurs_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvLecteurs.SelectedCells.Count == 1)
            {
                txtUserDataNom.Text = gdvLecteurs.CurrentRow.Cells[1].Value.ToString();
                txtUserDataPrenom.Text = gdvLecteurs.CurrentRow.Cells[2].Value.ToString();
                txtUserDataSexe.Text = gdvLecteurs.CurrentRow.Cells[3].Value.ToString();
                dtUserDataDateNaissance.Value = DateTime.Parse(gdvLecteurs.CurrentRow.Cells[4].Value.ToString());
                txtUserDataAdresse.Text = gdvLecteurs.CurrentRow.Cells[5].Value.ToString();
                txtUserDataVille.Text = gdvLecteurs.CurrentRow.Cells[6].Value.ToString();
                txtUserDataCodePostal.Text = gdvLecteurs.CurrentRow.Cells[7].Value.ToString();
                txtUserDataUsername.Text = gdvLecteurs.CurrentRow.Cells[8].Value.ToString();
                pbUserPictureProfil.ImageLocation = gdvLecteurs.CurrentRow.Cells[10].Value.ToString();
            }
        }

        private void tpgestionLecteurs_Click(object sender, EventArgs e)
        {

        }

        private void button32_Click(object sender, EventArgs e)
        {
        }

        private void gdvLivre_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
           
        }

        private void tbAdministrateur_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void picSignOut_Click(object sender, EventArgs e)
        {
            AdmLogin Adlog = new AdmLogin();
            this.Hide();
            Adlog.Show();
        }

        private void dgvExemplaire_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvExemplaire.SelectedCells.Count == 1)
            {
                txtCodeExemplaire.Text = dgvExemplaire.CurrentRow.Cells[1].Value.ToString();
                txtLivreExemplaire.Text = dgvExemplaire.CurrentRow.Cells[2].Value.ToString(); 
                dtDateAchatExemp.Text = dgvExemplaire.CurrentRow.Cells[4].Value.ToString();
                pbExemplaire.ImageLocation = dgvExemplaire.CurrentRow.Cells[7].Value.ToString();
            }
            
        }

        private void gdvRetardataires_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvRetardataires.SelectedCells.Count == 1)
            {
                txtNomretardataire.Text = gdvRetardataires.CurrentRow.Cells[1].Value.ToString();
                txtPrenomRetardataire.Text = gdvRetardataires.CurrentRow.Cells[2].Value.ToString(); 
                txtNbJoursRetards.Text = gdvRetardataires.CurrentRow.Cells[3].Value.ToString(); ;
                txtMontantRetard.Text = gdvRetardataires.CurrentRow.Cells[4].Value.ToString();
                pbLiveRetard.ImageLocation = gdvRetardataires.CurrentRow.Cells[10].Value.ToString();

            }
        }

        private void tbnGoRchExmpCode_Click(object sender, EventArgs e)
        {

        }

        private void tbnGoRchExmpTitre_Click(object sender, EventArgs e)
        {
            DataSet ds=null;
            BL.Administrateur.AllExemplairesByTitle(ref ds, txtTitreLivreRechExemp.Text);
            dgvExemplaire.DataSource = null;
            dgvExemplaire.DataSource = ds.Tables[0].DefaultView;
        }
    }
}
