using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MainApp.Lecteur
{
    public partial class LecteurGui : Form
    {
        public LecteurGui()
        {
            InitializeComponent();
            timer1.Start();
        }

        private void LecteurGui_Load(object sender, EventArgs e)
        {
            dgvLivreEmprunt.DataSource = null;
            dgvEmpruntsEmprunt.DataSource = null;
            dgvLivreReservation.DataSource = null;
            dgvReservation.DataSource = null;
            dgvEmpruntHistorique.DataSource = null;
            
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
            LecteurGui.ActiveForm.Text = "Inteface : Lecteur "+dateheure;
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
    }
}
