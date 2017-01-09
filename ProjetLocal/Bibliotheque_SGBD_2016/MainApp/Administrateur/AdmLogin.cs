using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MainApp.Lecteur;

namespace MainApp.Administrateur
{
    public partial class AdmLogin : Form
    {

        public AdmLogin()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            try
            {
                string userName = BL.Administrateur.ADM_Lgin(txtLogin.Text, txtPwd.Text);
                if (userName == txtLogin.Text)
                {
                    AdministrateurGui AdmGui = new AdministrateurGui(userName);
                    this.Hide();
                    AdmGui.Show();
                }
                
               

            }
            catch (Exception)
            {
                
                throw;
            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MainApp.Accueil acc = new MainApp.Accueil();
            this.Hide();
            acc.Show();
        }

        private void AdmLogin_Load(object sender, EventArgs e)
        {
           
        }
       
    }
}
