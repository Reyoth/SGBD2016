using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

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
            //txt volet Gestion LIvre
            txtISBNAjMan.Enabled = false;
            txtTitreAjMan.Enabled = false;
            txtLienAjMan.Enabled = false;
            txtNomAutAjMan.Enabled = false;
            txtPrenomAutAjMan.Enabled = false;

            //txt volet Emprunts et reservations
                //enable
                txtNomEmprunteur.Enabled = false;
                txtPrenomemprunteur.Enabled = false;
                txtNbEmpruntsEmprunteur.Enabled = false;
                txtRetardsEmprunteur.Enabled = false;
                txtNomResEnC.Enabled = false;
                txtPrenomResC.Enabled = false;
                txtDateResC.Enabled = false;
                txtDateDisResC.Enabled = false;
                //redonly
                txtNomEmprunteur.ReadOnly = true;
                txtPrenomemprunteur.ReadOnly = true;
                txtNbEmpruntsEmprunteur.ReadOnly = true;
                txtRetardsEmprunteur.ReadOnly = true;
                txtNomResEnC.ReadOnly = true;
                txtPrenomResC.ReadOnly = true;
                txtDateResC.ReadOnly = true;
                txtDateDisResC.ReadOnly = true;

            //txt volet retards
                

            //Data grid view de tout les volets
            dgvgestExemplaire.DataSource = null;
            gdvRetardataires.DataSource = null;
            gdvLecteurs.DataSource = null;
            gdvEmpruntEnCours.DataSource = null;
            gdvReservationEnCours.DataSource = null;
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            BL.Administrateur.AllExemplairesAllBib(ref ds);
            BL.Administrateur.AllRetardataires(ref ds);
            BL.Administrateur.AllLecteurs(ref ds);
            BL.Administrateur.AllEmpruntsEnCours(ref ds);
            BL.Administrateur.AllReservationsEnCours(ref ds);
            BL.Administrateur.AllLivres(ref ds);
            dgvgestExemplaire.DataSource = ds.Tables[0].DefaultView;
            gdvRetardataires.DataSource = ds.Tables[1].DefaultView;
            gdvLecteurs.DataSource = ds.Tables[2].DefaultView;
            gdvEmpruntEnCours.DataSource = ds.Tables[3].DefaultView;
            gdvReservationEnCours.DataSource = ds.Tables[4].DefaultView;
            gdvLivre.DataSource = ds.Tables[5].DefaultView;
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
            string LiveTitle = "%" + txtTitreRechLivre.Text + "%";
            BL.Administrateur.LivreByTitre(ref ds, LiveTitle);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
        }

        private void tbnReserverLivre_Click(object sender, EventArgs e)
        {
            txtISBNAjMan.Enabled = true;
            txtTitreAjMan.Enabled = true;
            txtLienAjMan.Enabled = true;
            txtNomAutAjMan.Enabled = true;
            txtPrenomAutAjMan.Enabled = true;
            txtISBNAjMan.ReadOnly = false;
            txtTitreAjMan.ReadOnly = false;
            txtLienAjMan.ReadOnly = false;
            txtNomAutAjMan.ReadOnly = false;
            txtPrenomAutAjMan.ReadOnly = false;
        }

        private void gdvLivre_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (gdvLivre.SelectedCells.Count == 1)
            {
                txtISBNAjMan.Text = gdvLivre.CurrentRow.Cells[1].Value.ToString();
                txtTitreAjMan.Text = gdvLivre.CurrentRow.Cells[2].Value.ToString();
                txtNomAutAjMan.Text = gdvLivre.CurrentRow.Cells[3].Value.ToString();
            }
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            DateTime dh = DateTime.Now;
            lDateHeure.Text = dh.ToString();
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
            if (gdvReservationEnCours.SelectedCells.Count == 1)
            {
                txtNomResEnC.Text = gdvReservationEnCours.CurrentRow.Cells[3].Value.ToString();
                txtPrenomResC.Text = gdvReservationEnCours.CurrentRow.Cells[4].Value.ToString();
                txtDateResC.Text = gdvReservationEnCours.CurrentRow.Cells[2].Value.ToString();
                DateTime datePrevu = DateTime.Parse(txtDateResC.Text).AddDays(10) ;
                txtDateDisResC.Text = datePrevu.ToString();
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
    }
}
