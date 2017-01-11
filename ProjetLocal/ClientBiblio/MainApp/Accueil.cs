using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MainApp.Administrateur;
using MainApp.Lecteur;

namespace MainApp
{
    public partial class Accueil : Form
    {
        public Accueil()
        {
            InitializeComponent();
        }

        private void SuivantBt_Click(object sender, EventArgs e)
        {
            switch (ConnectionCombobox.SelectedIndex)
            {
                case 0:
                    MainApp.Administrateur.AdmLogin AdmLogin = new MainApp.Administrateur.AdmLogin();
                    this.Hide();
                    AdmLogin.Show();
                    break;
                case 1:
                    MainApp.Lecteur.LectLogin LctLogin = new MainApp.Lecteur.LectLogin();
                    this.Hide();
                    LctLogin.Show();
                    break;
            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}