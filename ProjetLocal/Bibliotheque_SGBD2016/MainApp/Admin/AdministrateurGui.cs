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
            var client= new ServiceWCF.Service1Client();
            dgvgestExemplaire.DataSource = null;
            gdvRetardataires.DataSource = null;
            gdvLecteurs.DataSource = null;
            gdvEmpruntEnCours.DataSource = null;
            gdvReservationEnCours.DataSource = null;
            gdvLivre.DataSource = null;
            DataSet ds = new DataSet();
            ds=client.AllExemplairesAllBib(ds);
            ds=client.AllRetardataires(ds);
            ds=client.AllLecteurs(ds);
            ds=client.AllEmpruntsEnCours(ds);
            ds=client.AllReservationsEnCours(ds);
            ds=client.AllLivres(ds);
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
            var client = new ServiceWCF.Service1Client();
            DataSet ds = new DataSet();
            var resultat = client.LivreByISBN(ds, txtISBNRechLivre.Text);
            gdvLivre.DataSource = resultat;
        }

        private void btnTitreGoRechLivre_Click_1(object sender, EventArgs e)
        {
            gdvLivre.DataSource = null;
            var client = new ServiceWCF.Service1Client();
            DataSet ds = new DataSet();
            string LiveTitle = "%" + txtTitreRechLivre.Text + "%";
            var resultat = client.LivreByTitre(ds, LiveTitle);
            gdvLivre.DataSource = resultat;
        }
    }
}
