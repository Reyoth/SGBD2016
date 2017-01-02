using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MainApp
{
    public partial class AdministrateurGui : Form
    {
        public AdministrateurGui()
        {
            InitializeComponent();
        }

        private void AdministrateurGui_Load(object sender, EventArgs e)
        {
            dgvgestExemplaire.DataSource = null;
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
     
        
        private void timer1_Tick(object sender, EventArgs e)
        {
            DateTime dh = DateTime.Now;
            lDateHeure.Text = dh.ToString();
        }

        private void btnISBNGoRechLivre_Click_1(object sender, EventArgs e)
        {
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            BL.Administrateur.LivreByISBN(ref ds, txtISBNRechLivre.Text);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
        }

        private void btnTitreGoRechLivre_Click_1(object sender, EventArgs e)
        {
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            string LiveTitle = "%" + txtTitreRechLivre.Text + "%";
            BL.Administrateur.LivreByTitre(ref ds, LiveTitle);
            gdvLivre.DataSource = ds.Tables[0].DefaultView;
        }
    }
}
