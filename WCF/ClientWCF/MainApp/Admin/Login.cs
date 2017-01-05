using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MainApp.Admin
{
    public partial class AdminLogin : Form
    {
        public AdminLogin()
        {
            InitializeComponent();
        }

        private void AdminLogin_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Accueil Acc = new Accueil();
            this.Hide();
            Acc.Show();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            AdministrateurGui AdGui = new AdministrateurGui();
            this.Hide();
            AdGui.Show();
        }
    }
}
