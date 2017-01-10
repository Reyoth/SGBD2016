using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DALEF;

namespace MainApp.Lecteur
{
    public partial class LecteurGui : Form
    {
        private int focus=0;
        private BIB_AllLibelle_Result biblio = new BIB_AllLibelle_Result();
        private LEC_Login_Result session = new LEC_Login_Result();
        public LecteurGui(BIB_AllLibelle_Result biblio, LEC_Login_Result session)
        {
            InitializeComponent();
            this.biblio = biblio;
            this.session = session;
            timer1.Start();
        }

        private void LecteurGui_Load(object sender, EventArgs e)
        {

            //Chargemenet data username et bibliotheque 
            userName.Text = session.LEC_UserName;
            bibliotheque.Text = biblio.BIB_Libelle;
            
            //chargement data volet Emprunt
            dgvLivreEmprunt.DataSource = null;
            dgvExempDispo.DataSource = null;
            dgvEmpruntsEmprunt.DataSource = null;
            dgvRetardsEmprunt.DataSource = null;
            var ListExemplairesByBibId = BL.Lecteur.AllExemplairesByBibId(biblio.BIB_ID);
            dgvLivreEmprunt.DataSource = ListExemplairesByBibId;
            dgvLivreEmprunt.Columns[0].Visible = false;
            var ListExempplaireReservedispo = BL.Lecteur.AllExemplairesReserveDispo(session.LEC_Id, biblio.BIB_ID);
            dgvExempDispo.DataSource = ListExempplaireReservedispo;
            var ListEmpruntsEnCoursByLecId = BL.Lecteur.AllEmpruntsEncoursByLecId(session.LEC_Id);
            dgvEmpruntsEmprunt.DataSource = ListEmpruntsEnCoursByLecId;
            dgvEmpruntsEmprunt.Columns[0].Visible = false;
            dgvEmpruntsEmprunt.Columns[4].Visible = false;
            dgvEmpruntsEmprunt.Columns[5].Visible = false;
            dgvEmpruntsEmprunt.Columns[7].Visible = false;
            var ListRetards = BL.Lecteur.AllRetardsByLecIdAllbib(session.LEC_Id);
            dgvRetardsEmprunt.DataSource = ListRetards;
            dgvRetardsEmprunt.Columns[0].Visible = false;
            dgvRetardsEmprunt.Columns[1].Visible = false;
            dgvRetardsEmprunt.Columns[2].Visible = false;
            dgvRetardsEmprunt.Columns[3].HeaderText = "Jours de retards";
            dgvRetardsEmprunt.Columns[4].HeaderText = "Montant dû";
            dgvRetardsEmprunt.Columns[6].HeaderText = "Date d'emprunt";
            dgvRetardsEmprunt.Columns[5].Visible = false;
            dgvRetardsEmprunt.Columns[7].Visible = false;
            dgvRetardsEmprunt.Columns[8].Visible = false;
            dgvRetardsEmprunt.Columns[10].Visible = false;
            dgvRetardsEmprunt.Columns[11].Visible = false;
            double somme = 0.00;
            for (int i = 0; i < dgvRetardsEmprunt.Rows.Count; i++)
            {
                somme += double.Parse(dgvRetardsEmprunt.Rows[i].Cells[4].Value.ToString());
            }
            lMontant.Text = somme.ToString();

            
            //chargement data volet Reservation
            dgvLivreReservation.DataSource = null;
            dgvReservation.DataSource = null;
            var LivresByBib = BL.Lecteur.AllLLivresByBibId(biblio.BIB_ID);
            dgvLivreReservation.DataSource = LivresByBib;
            dgvLivreReservation.Columns[0].Visible = false;
            dgvLivreReservation.Columns[3].Visible = false;
            var ListReservations = BL.Lecteur.AllReservationsByLecId(session.LEC_Id);
            dgvReservation.DataSource = ListReservations;

            //chargement data volet Historique
            dgvEmpruntHistorique.DataSource = null;
            var ListEmprunts = BL.Lecteur.AllEmpruntsByLecId(session.LEC_Id);
            dgvEmpruntHistorique.DataSource = ListEmprunts;

            //chargement data volet Profil
            ChargeruserProfil();








        }

        private void btnISBNGoRechLivre_Click(object sender, EventArgs e)
        {
            
        }

        private void btnTitreGoRechLivre_Click(object sender, EventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            string dateheure = DateTime.Now.ToString();
            
        }

        private void picSignOut_Click(object sender, EventArgs e)
        {
            LectLogin lectLogin = new LectLogin();
            this.Hide();
            lectLogin.Show();
        }

        private void lEmpruntsEnCours_Click(object sender, EventArgs e)
        {

        }

        private void btUserDataModifier_Click(object sender, EventArgs e)
        {
            txtUserDataNom.Enabled = true;
            txtUserDataPrenom.Enabled = true;
            txtUserDataSexe.Enabled = true;
            txtUserDataAdresse.Enabled = true;
            txtUserDataVille.Enabled = true;
            txtUserDataCodePostal.Enabled = true;
            dtUserDataDateNaissance.Enabled = true;
            txtUserDataUserName.Enabled = true;
            txtUserDataPassword.Enabled = true;
            txtLienPhoto.Enabled = true;

            txtUserDataNom.ReadOnly = false;
            txtUserDataPrenom.ReadOnly = false;
            txtUserDataSexe.ReadOnly = false;
            txtUserDataAdresse.ReadOnly = false;
            txtUserDataVille.ReadOnly = false;
            txtUserDataCodePostal.ReadOnly = false;
            txtUserDataUserName.ReadOnly = false;
            txtUserDataPassword.ReadOnly = false;
            txtLienPhoto.ReadOnly = false;
        }

        public void ChargeruserProfil()
        {
            var user = BL.Lecteur.GetUserData(session.LEC_Id);
            txtUserDataNom.Text = user.LEC_Nom;
            txtUserDataPrenom.Text = user.LEC_Prenom;
            txtUserDataSexe.Text = user.LEC_Sexe;
            txtUserDataAdresse.Text = user.LEC_Adresse;
            txtUserDataVille.Text = user.LEC_Ville;
            txtUserDataCodePostal.Text = user.LEC_CodePostal.ToString();
            dtUserDataDateNaissance.Text = user.LEC_DateDeNaissance;
            txtUserDataUserName.Text = user.LEC_UserName;
            txtUserDataPassword.Text = user.LEC_Password;
            pbUserPictureProfile.ImageLocation = user.LEC_Photo;
            
        }

        private void btnMettreAJourProfile_Click(object sender, EventArgs e)
        {
            BL.Lecteur.UpdateUserData(session.LEC_Id, txtUserDataNom.Text, 
                                      txtUserDataPrenom.Text, 
                                      txtUserDataSexe.Text,
                                      txtUserDataAdresse.Text,
                                      txtUserDataVille.Text,
                                      Int32.Parse(txtUserDataCodePostal.Text),
                                      dtUserDataDateNaissance.Value.Date,
                                      txtUserDataUserName.Text,
                                      txtUserDataPassword.Text,
                                      pbUserPictureProfile.ImageLocation);
                txtUserDataNom.Enabled = false;
                txtUserDataPrenom.Enabled = false;
                txtUserDataSexe.Enabled = false;
                txtUserDataAdresse.Enabled = false;
                txtUserDataVille.Enabled = false;
                txtUserDataCodePostal.Enabled = false;
                dtUserDataDateNaissance.Enabled = false;
                txtUserDataUserName.Enabled = false;
                txtUserDataPassword.Enabled = false;
                txtLienPhoto.Enabled = false;

            txtUserDataNom.ReadOnly = true;
            txtUserDataPrenom.ReadOnly = true;
            txtUserDataSexe.ReadOnly = true;
            txtUserDataAdresse.ReadOnly = true;
            txtUserDataVille.ReadOnly = true;
            txtUserDataCodePostal.ReadOnly = true;
            txtUserDataUserName.ReadOnly = true;
            txtUserDataPassword.ReadOnly = true;
            txtLienPhoto.ReadOnly = true;
        }

        private void lexempDispo_Click(object sender, EventArgs e)
        {

        }

        private void btnReserver_Click(object sender, EventArgs e)
        {
            BL.Lecteur.ReserverLivre(Int32.Parse(dgvLivreReservation.CurrentRow.Cells[0].Value.ToString()), session.LEC_Id);
        }

        private void dgvEmpruntHistorique_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            
        }

        private void bntGoISBNEmprunt_Click(object sender, EventArgs e)
        {
            var Livres = BL.Lecteur.AllExeplairesByISBN(biblio.BIB_ID, txtISBNEmprunt.Text);
            dgvLivreEmprunt.DataSource = Livres;
        }

        private void bntGoTitleEmprunt_Click(object sender, EventArgs e)
        {
            var Livres = BL.Lecteur.AllExeplairesByTitle(biblio.BIB_ID, txtTitleEmprunt.Text);
            dgvLivreEmprunt.DataSource = Livres;
        }

        private void button6_Click(object sender, EventArgs e)
        {
            switch (focus)
            {
                case 1:
                    BL.Lecteur.EmprunterExemplaire((int) dgvLivreEmprunt.CurrentRow.Cells[0].Value, session.LEC_Id);
                    break;
                case 2:
                    BL.Lecteur.EmprunterExemplaire((int) dgvExempDispo.CurrentRow.Cells[5].Value, session.LEC_Id);
                    break;
                default:
                    MessageBox.Show("Veuillez selectionner un exemplaire.", "Information", MessageBoxButtons.OK,
                        MessageBoxIcon.Information);
                    break;
            }
            
        }

        private void dgvLivreEmprunt_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            this.focus = 1;
           
        }

        private void dgvExempDispo_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            this.focus = 2;
        }

        private void button11_Click(object sender, EventArgs e)
        {
            dgvLivreEmprunt.DataSource = null;
            dgvExempDispo.DataSource = null;
            dgvEmpruntsEmprunt.DataSource = null;
            dgvRetardsEmprunt.DataSource = null;
            var ListExemplairesByBibId = BL.Lecteur.AllExemplairesByBibId(biblio.BIB_ID);
            dgvLivreEmprunt.DataSource = ListExemplairesByBibId;
            dgvLivreEmprunt.Columns[0].Visible = false;
            var ListExempplaireReservedispo = BL.Lecteur.AllExemplairesReserveDispo(session.LEC_Id, biblio.BIB_ID);
            dgvExempDispo.DataSource = ListExempplaireReservedispo;
            var ListEmpruntsEnCoursByLecId = BL.Lecteur.AllEmpruntsEncoursByLecId(session.LEC_Id);
            dgvEmpruntsEmprunt.DataSource = ListEmpruntsEnCoursByLecId;
            dgvEmpruntsEmprunt.Columns[0].Visible = false;
            dgvEmpruntsEmprunt.Columns[4].Visible = false;
            dgvEmpruntsEmprunt.Columns[5].Visible = false;
            dgvEmpruntsEmprunt.Columns[7].Visible = false;
            var ListRetards = BL.Lecteur.AllRetardsByLecIdAllbib(session.LEC_Id);
            dgvRetardsEmprunt.DataSource = ListRetards;
            dgvRetardsEmprunt.Columns[0].Visible = false;
            dgvRetardsEmprunt.Columns[1].Visible = false;
            dgvRetardsEmprunt.Columns[2].Visible = false;
            dgvRetardsEmprunt.Columns[3].HeaderText = "Jours de retards";
            dgvRetardsEmprunt.Columns[4].HeaderText = "Montant dû";
            dgvRetardsEmprunt.Columns[6].HeaderText = "Date d'emprunt";
            dgvRetardsEmprunt.Columns[5].Visible = false;
            dgvRetardsEmprunt.Columns[7].Visible = false;
            dgvRetardsEmprunt.Columns[8].Visible = false;
            dgvRetardsEmprunt.Columns[10].Visible = false;
            dgvRetardsEmprunt.Columns[11].Visible = false;
            double somme = 0.00;
            for (int i = 0; i < dgvRetardsEmprunt.Rows.Count; i++)
            {
                somme += double.Parse(dgvRetardsEmprunt.Rows[i].Cells[4].Value.ToString());
            }
            lMontant.Text = somme.ToString();


        }

        private void btnGoISBNReservation_Click(object sender, EventArgs e)
        {
            var livres = BL.Lecteur.AllLivresByISBN(biblio.BIB_ID,txtISBNReservation.Text);
            dgvLivreReservation.DataSource = livres;
        }

        private void btnGoTitleReservation_Click(object sender, EventArgs e)
        {
            var livres = BL.Lecteur.AllLivresByTitle(biblio.BIB_ID, txtTitleReservation.Text);
            dgvLivreReservation.DataSource = livres;
        }

        private void btnActuLivres_Click(object sender, EventArgs e)
        {
            //chargement data volet Reservation
            dgvLivreReservation.DataSource = null;
            dgvReservation.DataSource = null;
            var LivresByBib = BL.Lecteur.AllLLivresByBibId(biblio.BIB_ID);
            dgvLivreReservation.DataSource = LivresByBib;
            dgvLivreReservation.Columns[0].Visible = false;
            dgvLivreReservation.Columns[3].Visible = false;
            var ListReservations = BL.Lecteur.AllReservationsByLecId(session.LEC_Id);
            dgvReservation.DataSource = ListReservations;
        }

        private void dgvLivreReservation_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            pbReservation.ImageLocation = dgvLivreReservation.CurrentRow.Cells[3].Value.ToString();
        }

        private void tpReservation_Click(object sender, EventArgs e)
        {

        }

        private void btnActuReservation_Click(object sender, EventArgs e)
        {
            dgvReservation.DataSource = null;
            var ListReservations = BL.Lecteur.AllReservationsByLecId(session.LEC_Id);
            dgvReservation.DataSource = ListReservations;
        }

        private void btnActualiserFacturation_Click(object sender, EventArgs e)
        {

        }
    }
}
