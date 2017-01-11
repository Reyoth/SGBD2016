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
using MainApp.Resources;
using MainApp.ServiceReferenceAdmin;

namespace MainApp.Administrateur
{
    public partial class AdministrateurGui : Form
    {
        public string user; 
        public List<string> bibliotheques = new List<string>();
        public AdministrateurGui(string userName)
        {
            InitializeComponent();
            timer1.Start();
            this.user = userName;
        }

        private void AdministrateurGui_Load(object sender, EventArgs e)
        {
            //Chargement username
            lusername.Text = user;

            //replissage des comboBox
            ChargerBibLibelle(cbBiblioExemp);
            //ChargerBibLibelle(cbBibLibelle);
            ChargerLivreTitres(cbLivreExemp);

            ////txt volet Gestion LIvre
            DesactiverChampsGestLivre();

            //txt volet Exemplaires
            DesactiverChampsGestExemplaire();
           
            //txt volet Emprunts et retards
            DesactiverChampsGestEmprunt();
            DesactiverChampsGestRetard();
            
            //txt volet Lecteur
            DesactiverChampsGestLecteur();
            
            ////Data grid view de tout les volets
            ChargerLivres();
            ChargerExemplaires();
            ChargerEmpruntsEnCours();
            ChargerRetardataires();
            ChargerLecteurs();
            
        }

        private void DesactiverChampsGestLecteur()
        {
            txtUserDataNom.Enabled = false;
            txtUserDataPrenom.Enabled = false;
            txtUserDataSexe.Enabled = false;
            txtUserDataAdresse.Enabled = false;
            txtUserDataVille.Enabled = false;
            txtUserDataCodePostal.Enabled = false;
            txtUserDataUsername.Enabled = false;
            dtUserDataDateNaissance.Enabled = false;
            txtUserDataNom.ReadOnly = true;
            txtUserDataPrenom.ReadOnly = true;
            txtUserDataSexe.ReadOnly = true;
            txtUserDataAdresse.ReadOnly = true;
            txtUserDataVille.ReadOnly = true;
            txtUserDataCodePostal.ReadOnly = true;
            txtUserDataUsername.ReadOnly = true;
        }

        private void DesactiverChampsGestRetard()
        {
            txtNomretardataire.Enabled = false;
            txtPrenomRetardataire.Enabled = false;
            txtNbJoursRetards.Enabled = false;
            txtMontantRetard.Enabled = false;

            txtNomretardataire.ReadOnly = true;
            txtPrenomRetardataire.ReadOnly = true;
            txtNbJoursRetards.ReadOnly = true;
            txtMontantRetard.ReadOnly = true;
        }

        private void DesactiverChampsGestEmprunt()
        {
            txtNomEmprunteur.Enabled = false;
            txtPrenomemprunteur.Enabled = false;
            txtNbEmpruntsEmprunteur.Enabled = false;
            txtRetardsEmprunteur.Enabled = false;

            txtNomEmprunteur.ReadOnly = true;
            txtPrenomemprunteur.ReadOnly = true;
            txtNbEmpruntsEmprunteur.ReadOnly = true;
            txtRetardsEmprunteur.ReadOnly = true;
        }

        private void DesactiverChampsGestExemplaire()
        {
            txtCodeExemplaire.Enabled = false;
            cbLivreExemp.Enabled = false;
            dtDateAchatExemp.Enabled = false;
            txtCodeExemplaire.ReadOnly = true;
            cbBiblioExemp.Enabled = false;
        }

        private void DesactiverChampsGestLivre()
        {
            txtISBNAjMan.Enabled = false;
            txtTitreAjMan.Enabled = false;
            txtLienAjMan.Enabled = false;
            txtNomAutAjMan.Enabled = false;
        }

        private void ChargerLecteurs()
        {
            var client = new ServiceAdminClient();
            gdvLecteurs.DataSource = null;
            DataSet ds = new DataSet();
            client.AllLecteurs(ref ds);
            gdvLecteurs.DataSource = ds.Tables[0].DefaultView;
            gdvLecteurs.Columns[9].Visible = false;
            gdvLecteurs.Columns[10].Visible = false;
        }

        private void ChargerRetardataires()
        {
            var client = new ServiceAdminClient();
            gdvRetardataires.DataSource = null;
            DataSet ds = new DataSet();
            client.AllRetardataires(ref ds);
            gdvRetardataires.DataSource = ds.Tables[0].DefaultView;
            gdvRetardataires.Columns[0].Visible = false;
            gdvRetardataires.Columns[5].Visible = false;
            gdvRetardataires.Columns[8].Visible = false;
            gdvRetardataires.Columns[11].Visible = false;

        }

        private void ChargerEmpruntsEnCours()
        {
            var client = new ServiceAdminClient();
            gdvEmpruntEnCours.DataSource = null;
            DataSet ds = new DataSet();
            client.AllEmpruntsEnCours(ref ds);
            gdvEmpruntEnCours.DataSource = ds.Tables[0].DefaultView;
            gdvEmpruntEnCours.Columns[0].Visible = false;
            gdvEmpruntEnCours.Columns[5].Visible = false;
            gdvEmpruntEnCours.Columns[8].Visible = false;
            gdvEmpruntEnCours.Columns[11].Visible = false;

        }

        private void ChargerExemplaires()
        {
            var client = new ServiceAdminClient();
            dgvExemplaire.DataSource = null;
            DataSet ds = new DataSet();
            client.AllExemplairesAllBib(ref ds);
            dgvExemplaire.DataSource = ds.Tables[0].DefaultView;
            dgvExemplaire.Columns[0].Visible = false;
            dgvExemplaire.Columns[7].Visible = false;
            dgvExemplaire.Columns[8].Visible = false;
            dgvExemplaire.Columns[9].Visible = false;
        }

        private void ChargerLivres()
        {
            var client = new ServiceAdminClient();
            DataSet ds = new DataSet();
            gdvLivre.DataSource = null;
            client.AllLivres(ref ds);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
            gdvLivre.Columns[0].Visible = false;
            gdvLivre.Columns[4].Visible = false;
        }

        private void btnISBNGoRechLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            if (txtISBNRechLivre.Text != "")
            {
                gdvLivre.DataSource = null;
                DataSet ds = new DataSet();
                client.LivreByISBN(ref ds, txtISBNRechLivre.Text);
                gdvLivre.DataSource = ds.Tables[0].DefaultView;
            }
            else
            {
                
            }
        }

        private void btnTitreGoRechLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            string LiveTitle = txtTitreRechLivre.Text;
            client.LivreByTitre(ref ds, LiveTitle);
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
            var client = new ServiceAdminClient();
            if (gdvEmpruntEnCours.SelectedCells.Count == 1)
            {
                txtNomEmprunteur.Text = gdvEmpruntEnCours.CurrentRow.Cells[1].Value.ToString();
                txtPrenomemprunteur.Text = gdvEmpruntEnCours.CurrentRow.Cells[2].Value.ToString();
                pbLivreEmprunt.ImageLocation = gdvEmpruntEnCours.CurrentRow.Cells[8].Value.ToString();
                //Calcul du nombre d'emprunt par id
                int LecId = 0;
                LecId = Int32.Parse(gdvEmpruntEnCours.CurrentRow.Cells[11].Value.ToString());
                int NbreEmprunts = 0;
                client.NbEmpruntsByLecId(ref NbreEmprunts, LecId);
                txtNbEmpruntsEmprunteur.Text = NbreEmprunts.ToString();
                //Calcul du nombre des retards
                int NbRetards = 0;
                client.NbRetardByLecId(ref NbRetards, LecId);
                if (NbRetards >= 2)
                {
                    txtRetardsEmprunteur.ForeColor = Color.Red;
                }
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
            var client = new ServiceAdminClient();
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
            client.AjoutManuelLivre(txtISBNAjMan.Text, txtTitreAjMan.Text, txtLienAjMan.Text, txtNomAutAjMan.Text);
        }

        private void btnAjRapLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            
            Livre Livre = new Livre();
            bool ajouté = Books.requestLivre(ref Livre, txtISBNAjRapLivre.Text);
            if (ajouté)
            {
                client.AjoutManuelLivre(Livre.ISBN, Livre.Titre, Livre.Image, Livre.Authors);
            }
            else
            {
                //error
            }
        }

        private void btnActualiserLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            client.AllLivres(ref ds);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
            gdvLivre.Columns[4].Visible = false;
        }

        private void btnMAJLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            client.UpdateLivre(txtISBNAjMan.Text, txtTitreAjMan.Text, txtLienAjMan.Text, txtNomAutAjMan.Text);
            txtISBNAjMan.Enabled = false;
            txtTitreAjMan.Enabled = false;
            txtLienAjMan.Enabled = false;
            txtNomAutAjMan.Enabled = false;
            txtLienAjMan.Enabled = false;
            txtISBNAjMan.ReadOnly = true;
            txtTitreAjMan.ReadOnly = true;
            txtLienAjMan.ReadOnly = true;
            txtNomAutAjMan.ReadOnly = true;
            txtLienAjMan.ReadOnly = true;
        }

        private void btnEmprunterLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            client.DeleteLivre(txtISBNAjMan.Text);
        }

        private void button24_Click(object sender, EventArgs e)
        {

            ActiverChampsGestExemplaire();
        }

        private void ActiverChampsGestExemplaire()
        {
            txtCodeExemplaire.Enabled = true;
            cbLivreExemp.Enabled = true;
            dtDateAchatExemp.Enabled = true;
            txtCodeExemplaire.ReadOnly = false;
            cbBiblioExemp.Enabled = true;
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
                cbLivreExemp.Text = dgvExemplaire.CurrentRow.Cells[2].Value.ToString(); 
                dtDateAchatExemp.Text = dgvExemplaire.CurrentRow.Cells[4].Value.ToString();
                cbBiblioExemp.Text = dgvExemplaire.CurrentRow.Cells[6].Value.ToString();
                pbExemplaire.ImageLocation = dgvExemplaire.CurrentRow.Cells[7].Value.ToString();
            }
            
        }

        private void gdvRetardataires_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvRetardataires.SelectedCells.Count == 1)
            {
                txtNomretardataire.Text = gdvRetardataires.CurrentRow.Cells[1].Value.ToString();
                txtPrenomRetardataire.Text = gdvRetardataires.CurrentRow.Cells[2].Value.ToString(); 
                txtNbJoursRetards.Text = gdvRetardataires.CurrentRow.Cells[10].Value.ToString(); ;
                txtMontantRetard.Text = gdvRetardataires.CurrentRow.Cells[9].Value.ToString();
                pbLiveRetard.ImageLocation = gdvRetardataires.CurrentRow.Cells[8].Value.ToString();

            }
        }

        private void tbnGoRchExmpCode_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            DataSet ds = new DataSet();
            client.AllExemplairesByExeCode(ref ds, txtCodeRechExemp.Text);
            dgvExemplaire.DataSource = null;
            dgvExemplaire.DataSource = ds.Tables[0].DefaultView;
        }

        private void tbnGoRchExmpTitre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            DataSet ds= new DataSet();
            client.AllExemplairesByTitle(ref ds, txtTitreLivreRechExemp.Text);
            dgvExemplaire.DataSource = null;
            dgvExemplaire.DataSource = ds.Tables[0].DefaultView;
        }
        
        public void ChargerBibLibelle(ComboBox cb)
        {
            var client = new ServiceAdminClient();
            var bibliotheques = client.BIB_AllLibelle();
            foreach (var bib in bibliotheques)
            {
                cb.Items.Add(bib);
            }

        }

        private void btnTitreRechLivre_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            DataSet ds = new DataSet();
            client.LivreByTitre(ref ds, txtTitreRechLivre.Text);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
        }

        //private void tbnGoRchExmpBib_Click(object sender, EventArgs e)
        //{
        //    var client = new ServiceAdminClient();
        //    dgvExemplaire.DataSource = null;
        //    DataSet ds = new DataSet();
        //    client.EXE_AllExemplaireByBIB_Libelle(ref ds, cbBibLibelle.SelectedItem.ToString());
        //    dgvExemplaire.DataSource = ds.Tables[0].DefaultView;
        //    dgvExemplaire.Columns[0].Visible = false;
        //    dgvExemplaire.Columns[7].Visible = false;
        //}
        private void btnAjoutExemplaire_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            string code = txtCodeExemplaire.Text;
            DateTime dateAchat = dtDateAchatExemp.Value.Date;
            string bibliotheque = cbBiblioExemp.SelectedItem.ToString();
            string livre = cbLivreExemp.SelectedItem.ToString();
            client.EXE_CreerExemplaire(code, dateAchat,bibliotheque,livre);
        }

        public void ChargerLivreTitres(ComboBox cb)
        {
            var client = new ServiceAdminClient();
            List<string> titres = new List<string>();
            client.ChargerLivreTitres(ref titres);
            foreach (var t in titres)
            {
                cb.Items.Add(t);
            }
        }

        private void btnRendreExempRetard_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            client.RetournerExemplaire(Int32.Parse(gdvRetardataires.CurrentRow.Cells[0].Value.ToString()), Double.Parse(gdvRetardataires.CurrentRow.Cells[9].Value.ToString()));

        }

        private void btnRendreExempEmpruntEncour_Click(object sender, EventArgs e)
        {
            var client = new ServiceAdminClient();
            client.RetournerExemplaire(Int32.Parse(gdvEmpruntEnCours.CurrentRow.Cells[0].Value.ToString()), Double.Parse(gdvEmpruntEnCours.CurrentRow.Cells[9].Value.ToString()));
        }

        private void btnActuExempRetard_Click(object sender, EventArgs e)
        {
            ChargerRetardataires();
        }

        private void btnActuEmpruntEncour_Click(object sender, EventArgs e)
        {
            ChargerEmpruntsEnCours();
        }

        private void btnActuLecteurs_Click(object sender, EventArgs e)
        {
            ChargerLecteurs();
        }

        private void btnExempActualiser_Click(object sender, EventArgs e)
        {
            ChargerExemplaires();
        }

        private void btnSauveExemp_Click(object sender, EventArgs e)
        {

        }
    }
}
