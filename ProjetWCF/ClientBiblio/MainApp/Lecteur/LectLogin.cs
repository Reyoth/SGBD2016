using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MainApp.ServiceReferenceLecteur;


namespace MainApp.Lecteur
{
    public partial class LectLogin : Form
    {
        List<BIB_AllLibelle_Result> biblios = new List<BIB_AllLibelle_Result>();
        List<int> idbiblios = new List<int>();

        BIB_AllLibelle_Result biblio = new BIB_AllLibelle_Result();
        LEC_Login_Result session = new LEC_Login_Result();
        
        public LectLogin()
        {
            InitializeComponent();
        }

        private void btnConnect_Click(object sender, EventArgs e)
        {
            var client = new ServiceLecteurClient();
            session = client.LEC_Login(txtLogin.Text, txtPwd.Text);
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
            var client = new ServiceLecteurClient();
            
            var biblios = client.BIB_AllLibelle();
            //var idbiblios = new List<int>();
           foreach (var bib in biblios)
            {
                cb.Items.Add(bib.BIB_Libelle);
                idbiblios.Add(bib.BIB_ID);
            }
        }

        private void cbBibliotheque_SelectionChangeCommitted(object sender, EventArgs e)
        {
            var a = cbBibliotheque.SelectedIndex;
            biblio.BIB_ID = idbiblios.ElementAt(a);
            biblio.BIB_Libelle = cbBibliotheque.SelectedItem.ToString();


        }

       
    }
}
