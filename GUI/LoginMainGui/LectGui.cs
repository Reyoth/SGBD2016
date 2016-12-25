using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;

namespace LoginMainGui
{
    public partial class LecteurGui : Form
    {
        public LecteurGui()
        {
            InitializeComponent();
            timer1.Start();
        }

        private void btnDeconnecter_Click(object sender, EventArgs e)
        {
            LoginForm Login = new LoginForm();
            this.Hide();
            Login.Show();
        }

        public void ChargerDonnees(string bibChoisie, string fullName)
        {
            lFullName.Text = fullName;
            lBibChoisie.Text += bibChoisie ;
        }

        private void cbLibLivre_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void AdministrateurGui_Load(object sender, EventArgs e)
        {
           
            txtUserDataNom.ReadOnly = true;
            txtUserDataPrenom.ReadOnly = true;
            txtUserDataSexe.ReadOnly = true;
            txtUserDataAdresse.ReadOnly = true;
            txtUserDataVille.ReadOnly = true;
            txtUserDataCodePostal.ReadOnly = true;
            txtUserDataPhone.ReadOnly = true;
            txtUserDataEmail.ReadOnly = true;
            txtUserDataDateNaissance.ReadOnly=true ;
            txtUserDataUserName.ReadOnly = true;
            txtUserDataPassword.ReadOnly = true;
            btnEmprunterReservation.Enabled = false;
            LoadUserData();
            ChargerBibliotheques();
            lFullNameFacturation.Text = lFullName.Text;
            lFullNameReservations.Text = lFullName.Text; ;
            lFullNameemprunts.Text = lFullName.Text;
        }

        private void LoadUserData()
        {
            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LEC_LoadUserData";
                SqlParameter userName = new SqlParameter();
                com.Parameters.AddWithValue("userName", lFullName.Text);
                SqlDataReader reader = com.ExecuteReader();
                while (reader.Read())
                {
                    txtUserDataNom.Text=reader.GetString(1);
                    txtUserDataPrenom.Text = reader.GetString(2);
                    txtUserDataSexe.Text = reader.GetString(3);
                    txtUserDataAdresse.Text = reader.GetString(4);
                    txtUserDataVille.Text = reader.GetString(5);
                    txtUserDataCodePostal.Text = reader.GetInt32(6).ToString();
                    txtUserDataPhone.Text = reader.GetString(7);
                    txtUserDataEmail.Text = reader.GetString(8);
                    txtUserDataDateNaissance.Text = reader.GetDateTime(9).ToString();
                    txtUserDataUserName.Text = reader.GetString(10);
                    txtUserDataPassword.Text = reader.GetString(11);
                }
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }

        }


        private void ChargerBibliotheques()
        {
            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "BIB_AllLibelle";
                SqlDataReader reader = com.ExecuteReader();
                while (reader.Read())
                {
                    cbLibLivre.Items.Add(reader.GetString(0));
                }
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }


        }

        private void lUserDataAdresse_Click(object sender, EventArgs e)
        {

        }

        private void button15_Click(object sender, EventArgs e)
        {
            txtUserDataNom.ReadOnly = false;
            txtUserDataPrenom.ReadOnly = false;
            txtUserDataSexe.ReadOnly = false;
            txtUserDataAdresse.ReadOnly = false;
            txtUserDataVille.ReadOnly = false;
            txtUserDataCodePostal.ReadOnly = false;
            txtUserDataPhone.ReadOnly = false;
            txtUserDataEmail.ReadOnly = false;
            txtUserDataDateNaissance.ReadOnly= false;
            txtUserDataUserName.ReadOnly = false;
            txtUserDataPassword.ReadOnly = false;
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            DateTime dh = DateTime.Now;
            lDateHeure.Text = dh.ToString();
        }

        private void tbnModifierProfile_Click(object sender, EventArgs e)
        {

        }

        private void btnMettreAJourProfile_Click(object sender, EventArgs e)
        {
            byte[] image = null;
            FileStream fs =new FileStream(imgPath, FileMode.Open);
            BinaryReader br = new BinaryReader(fs);
            image = br.ReadBytes((int) fs.Length);
            fs.Close();

            UpdateUserData(txtUserDataUserName.Text);
            txtUserDataNom.ReadOnly = true;
            txtUserDataPrenom.ReadOnly = true;
            txtUserDataSexe.ReadOnly = true;
            txtUserDataAdresse.ReadOnly = true;
            txtUserDataVille.ReadOnly = true;
            txtUserDataCodePostal.ReadOnly = true;
            txtUserDataPhone.ReadOnly = true;
            txtUserDataEmail.ReadOnly = true;
            txtUserDataDateNaissance.ReadOnly = true;
            txtUserDataUserName.ReadOnly = true;
            txtUserDataPassword.ReadOnly = true;
        }

        private void UpdateUserData(string text)
        {

            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LEC_UpdateUserData";
                SqlParameter Nom = new SqlParameter();
                SqlParameter Prenom = new SqlParameter();
                SqlParameter Sexe = new SqlParameter();
                SqlParameter Adresse = new SqlParameter();
                SqlParameter Ville = new SqlParameter();
                SqlParameter CodePostal = new SqlParameter();
                SqlParameter Tel = new SqlParameter();
                SqlParameter Email = new SqlParameter();
                SqlParameter DateNaissance = new SqlParameter();
                SqlParameter UserName = new SqlParameter();
                SqlParameter Password = new SqlParameter();
                com.Parameters.AddWithValue("Nom", txtUserDataUserName.Text);
                com.Parameters.AddWithValue("Prenom", txtUserDataPrenom.Text);
                com.Parameters.AddWithValue("Sexe", txtUserDataSexe.Text);
                com.Parameters.AddWithValue("Adresse", txtUserDataAdresse.Text);
                com.Parameters.AddWithValue("Ville", txtUserDataVille.Text);
                com.Parameters.AddWithValue("CodePostal", int.Parse(txtUserDataCodePostal.Text));
                com.Parameters.AddWithValue("Tel", txtUserDataPhone.Text);
                com.Parameters.AddWithValue("Email", txtUserDataEmail.Text);
                com.Parameters.AddWithValue("DateNaissance", txtUserDataDateNaissance.Text);
                com.Parameters.AddWithValue("UserName", txtUserDataUserName.Text);
                com.Parameters.AddWithValue("Password", txtUserDataPassword.Text);
                com.Parameters.AddWithValue("userName", lFullName.Text);
                com.ExecuteNonQuery();
                LoadUserData();
               
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }
        }
        string imgPath;
        private void btnParcourirPictureProfile_Click(object sender, EventArgs e)
        {
           
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Title = "Choisissez votre photo de profile";
            if (ofd.ShowDialog()==DialogResult.OK)
            {
                pbUserPictureProfile.ImageLocation = ofd.FileName;
                imgPath = ofd.SafeFileName;
            }
        }
    }
}
