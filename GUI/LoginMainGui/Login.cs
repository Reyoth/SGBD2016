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

namespace LoginMainGui
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {
            rbAdmin.Checked = false;
            rbLecteur.Checked = true;
            ChargerBibliotheques();
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
                    cbBibliotheque.Items.Add(reader.GetString(0));
                }
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }


        }

        private void btnConnect_Click(object sender, EventArgs e)
        {

            if (rbAdmin.Checked)
            {
                CheckAdminLogin(txtLogin.Text, txtPwd.Text);
            }
            else
            {
                CheckUserLogin(txtLogin.Text, txtPwd.Text);
            }
            //AdministrateurGui AdGui = new AdministrateurGui();
            //this.Hide();
            //AdGui.ChargerDonnees(cbBibliotheque.SelectedItem.ToString(), txtLogin.Text);
            //AdGui.Show();
            //string bib = cbBibliotheque.SelectedItem.ToString();

            
            
        }
        private void CheckUserLogin(string text1, string text2)
        {
            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "LEC_CheckLogin";
                SqlParameter pUserName = new SqlParameter();
                SqlParameter pPassword = new SqlParameter();
                com.Parameters.AddWithValue("pUserName", txtLogin.Text);
                com.Parameters.AddWithValue("pPassword", txtPwd.Text);
                int result = com.ExecuteNonQuery();
                if (result == 1)
                {
                    LecteurGui LecGui = new LecteurGui();
                    this.Hide();
                    LecGui.ChargerDonnees(cbBibliotheque.SelectedItem.ToString(), txtLogin.Text);


                }
                else
                {
                    MessageBox.Show("Connexion échouée, Vérifiez si le login et le mot de passe entrés sont correctes.\n Vérifiez aussi  que vous avez choisi soit le mode Admin ou utilisateur pour vous connecter...",
                        "Erreur de connexion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }
        }

        private void CheckAdminLogin(string text1, string text2)
        {
            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "ADM_CheckLogin";
                SqlParameter pUserName = new SqlParameter();
                SqlParameter pPassword = new SqlParameter();
                com.Parameters.AddWithValue("pUserName", txtLogin.Text);
                com.Parameters.AddWithValue("pPassword", txtPwd.Text);
                var result = com.ExecuteScalar();
                if (result.Equals(1))
                {
                   
                    AdministrateurGui AdGui = new AdministrateurGui();
                    this.Hide();
                    AdGui.ChargerDonnees(cbBibliotheque.SelectedItem.ToString(), txtLogin.Text);
                    AdGui.Show();
                }
                else
                {
                    MessageBox.Show(
                        "Connexion échouée, Vérifiez si le login et le mot de passe entrés sont correctes ainsi que vous avez choisi soit le mode Admin ou utilisateur pour vous connecter...",
                        "Erreur de connexion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }
        }

        private string GetFLNamesLect(string user, string pwd)
        {
            string fullName="";
            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "GetFLNamesLect";
                SqlParameter pUserName = new SqlParameter();
                SqlParameter pPassword = new SqlParameter();
                com.Parameters.AddWithValue("pUserName", txtLogin.Text);
                com.Parameters.AddWithValue("pPassword", txtPwd.Text);
                var result = com.ExecuteReader();
                fullName = result.GetString(0) + " " + result.GetString(1);
                
            }

            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }
            return fullName;
        }
        private string GetFLNamesAdmin(string user, string pwd)
        {
            string fullName="";
            try
            {
                SqlConnection db = new SqlConnection();
                db.ConnectionString = "Data Source=.;Initial Catalog=Bibliotheque;Integrated Security=True";
                db.Open();
                SqlCommand com = new SqlCommand();
                com.Connection = db;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = "GetFLNamesAdmin";
                SqlParameter useName = new SqlParameter();
                SqlParameter passWord = new SqlParameter();
                com.Parameters.AddWithValue("useName", txtLogin.Text);
                com.Parameters.AddWithValue("passWord", txtPwd.Text);
                SqlDataReader dr = com.ExecuteReader();
                while (dr.Read())
                {
                    fullName = dr.GetString(0) + " " + dr.GetString(1);
                }
              
                //fullName = dataReader.GetString(0) + " " + dataReader.GetString(1);
                //fullName = result.GetString(0) + " " + result.GetString(1);
                return fullName;
            }
            catch (Exception e)
            {

                MessageBox.Show(e.Message);
            }
            return fullName;
        }

        private void cbBibliotheque_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
