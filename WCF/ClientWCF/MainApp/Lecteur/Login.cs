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
    public partial class LecteurLogin : Form
    {
        public LecteurLogin()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {

            /* if (rbAdmin.Checked)
             {
                 CheckAdminLogin(txtLogin.Text, txtPwd.Text);
             }
             else
             {
                 CheckUserLogin(txtLogin.Text, txtPwd.Text);
             }*/
            AdministrateurGui AdGui = new AdministrateurGui();
            this.Hide();
            // AdGui.ChargerDonnees(cbBibliotheque.SelectedItem.ToString(), txtLogin.Text);
            AdGui.Show();
            //string bib = cbBibliotheque.SelectedItem.ToString();

        }

        private void cbBibliotheque_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Login_Load(object sender, EventArgs e)
        {
            /*ChargerBibliotheques(cbBibliotheque);*/
        }
        public void ChargerBibliotheques(ComboBox cb)
        {
            List<string> lstBiblio = BL.Lecteur.AllBiblioLibelle();
            foreach (string libelle in lstBiblio)
            {
                cb.Items.Add(libelle);
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Accueil Acc = new Accueil();
            this.Hide();
            Acc.Show();
        }
    }
}
