using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DALEF;

namespace MainApp.Lecteur
{
    public partial class LectLogin : Form
    {
        List<BIB_AllLibelle_Result> biblios = new List<BIB_AllLibelle_Result>();
        BIB_AllLibelle_Result biblio = new BIB_AllLibelle_Result();
        LEC_Login_Result session = new LEC_Login_Result();
        
        public LectLogin()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            
            session = BL.Lecteur.LEC_Login(txtLogin.Text, txtPwd.Text);
            LecteurGui lectGui = new LecteurGui(biblio, session);
            this.Hide();
            lectGui.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            MainApp.Accueil acc = new MainApp.Accueil();
            this.Hide();
            acc.Show();
        }

        private void LectLogin_Load(object sender, EventArgs e)
        {
           ChargerBibLibelle(cbBibliotheque);
            //List<String> Bibliotheques = null;
            //BL.Biblio.ChargerBiblioLib(ref Bibliotheques);
            //cbBibliotheque.DataSource = Bibliotheques;
        }

        public void ChargerBibLibelle(ComboBox cb)
        {
            
            BL.Lecteur.BIB_AllLibelle(ref biblios);
           foreach (var bib in biblios)
            {
                cb.Items.Add(bib.BIB_Libelle);
            }
        }

        private void cbBibliotheque_SelectionChangeCommitted(object sender, EventArgs e)
        {

            var x = from bib in biblios
                    where bib.BIB_Libelle.Equals(cbBibliotheque.SelectedItem.ToString())
                    select bib.BIB_ID;
            biblio.BIB_ID = x.ElementAt(0);
            biblio.BIB_Libelle = cbBibliotheque.SelectedItem.ToString();


        }

        private void pictureBox2_Click(object sender, EventArgs e)
        {

        }

        private void lBienvenue_Click(object sender, EventArgs e)
        {

        }
    }
}
