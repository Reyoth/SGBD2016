using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LoginMainGui
{
    public partial class AdministrateurGui : Form
    {
        public AdministrateurGui()
        {
            InitializeComponent();
        }

        private void LecteurGui_Load(object sender, EventArgs e)
        {

        }
        public void ChargerDonnees(string bibChoisie, string fullName)
        {
            lFullName.Text = fullName;
            lBibChoisie.Text += bibChoisie;
        }
    }
}
