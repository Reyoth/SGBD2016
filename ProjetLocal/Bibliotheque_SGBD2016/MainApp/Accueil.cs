using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MainApp.Admin;

namespace MainApp
{
    public partial class Accueil : Form
    {
        public Accueil()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void SuivantBt_Click(object sender, EventArgs e)
        {
            switch (ConnectionCombobox.SelectedItem.ToString())
            {
                case "Admin":   AdminLogin AdmLogin = new AdminLogin();
                                this.Hide();
                                AdmLogin.Show();
                                break;
                case "Lecteur": LecteurLogin LctLogin = new LecteurLogin();
                                this.Hide();
                                LctLogin.Show();
                                break;

            }
        }
    }
}
