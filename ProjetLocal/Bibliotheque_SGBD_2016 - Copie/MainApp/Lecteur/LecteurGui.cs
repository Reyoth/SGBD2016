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
        }

        private void LecteurGui_Load(object sender, EventArgs e)
        {
            List<Entities.Bibliotheque> biblios = null;
            BL.Lecteur.BIB_AllBibliotheques(ref biblios);
            gvLivre.DataSource = biblios;
        }

        private void btnISBNGoRechLivre_Click(object sender, EventArgs e)
        {
            Entities.Livre livre = null;
            BL.Lecteur.LivreByISBN(ref livre, txtISBNRechLivre.Text);
            gvLivre.DataSource = livre;
        }
    }
}
