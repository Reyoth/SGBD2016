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
    public partial class LectLogin : Form
    {
        public LectLogin()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            LecteurGui lectGui = new LecteurGui();
            this.Hide();
            lectGui.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MainApp.Accueil acc = new MainApp.Accueil();
            this.Hide();
            acc.Show();
        }
    }
}
