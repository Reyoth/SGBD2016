namespace MainApp
{
    partial class LecteurLogin
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cbBibliotheque = new System.Windows.Forms.ComboBox();
            this.lBibliotheque = new System.Windows.Forms.Label();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lPassword = new System.Windows.Forms.Label();
            this.lUserName = new System.Windows.Forms.Label();
            this.txtPwd = new System.Windows.Forms.TextBox();
            this.txtLogin = new System.Windows.Forms.TextBox();
            this.lBienvenue = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // cbBibliotheque
            // 
            this.cbBibliotheque.FormattingEnabled = true;
            this.cbBibliotheque.Location = new System.Drawing.Point(470, 67);
            this.cbBibliotheque.Name = "cbBibliotheque";
            this.cbBibliotheque.Size = new System.Drawing.Size(136, 21);
            this.cbBibliotheque.TabIndex = 31;
            this.cbBibliotheque.SelectedIndexChanged += new System.EventHandler(this.cbBibliotheque_SelectedIndexChanged);
            // 
            // lBibliotheque
            // 
            this.lBibliotheque.AutoSize = true;
            this.lBibliotheque.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lBibliotheque.Location = new System.Drawing.Point(364, 70);
            this.lBibliotheque.Name = "lBibliotheque";
            this.lBibliotheque.Size = new System.Drawing.Size(100, 18);
            this.lBibliotheque.TabIndex = 30;
            this.lBibliotheque.Text = "Bibliothèque :";
            // 
            // btnConnect
            // 
            this.btnConnect.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConnect.Location = new System.Drawing.Point(381, 175);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(137, 50);
            this.btnConnect.TabIndex = 29;
            this.btnConnect.Text = "Connecter";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // lPassword
            // 
            this.lPassword.AutoSize = true;
            this.lPassword.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lPassword.Location = new System.Drawing.Point(364, 137);
            this.lPassword.Name = "lPassword";
            this.lPassword.Size = new System.Drawing.Size(100, 18);
            this.lPassword.TabIndex = 28;
            this.lPassword.Text = "Mot de passe :";
            // 
            // lUserName
            // 
            this.lUserName.AutoSize = true;
            this.lUserName.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lUserName.Location = new System.Drawing.Point(338, 105);
            this.lUserName.Name = "lUserName";
            this.lUserName.Size = new System.Drawing.Size(130, 18);
            this.lUserName.TabIndex = 27;
            this.lUserName.Text = "Nom d\'utilisateur :";
            // 
            // txtPwd
            // 
            this.txtPwd.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPwd.Location = new System.Drawing.Point(470, 131);
            this.txtPwd.Name = "txtPwd";
            this.txtPwd.Size = new System.Drawing.Size(137, 25);
            this.txtPwd.TabIndex = 26;
            this.txtPwd.UseSystemPasswordChar = true;
            // 
            // txtLogin
            // 
            this.txtLogin.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLogin.Location = new System.Drawing.Point(470, 100);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(137, 25);
            this.txtLogin.TabIndex = 25;
            // 
            // lBienvenue
            // 
            this.lBienvenue.AutoSize = true;
            this.lBienvenue.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lBienvenue.Location = new System.Drawing.Point(119, 11);
            this.lBienvenue.Name = "lBienvenue";
            this.lBienvenue.Size = new System.Drawing.Size(439, 18);
            this.lBienvenue.TabIndex = 23;
            this.lBienvenue.Text = "Veuillez choisir une bibliothèqueu et vous identifier s\'il vous plait";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::MainApp.Properties.Resources.livres2;
            this.pictureBox1.Location = new System.Drawing.Point(63, 56);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(281, 181);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 24;
            this.pictureBox1.TabStop = false;
            // 
            // button1
            // 
            this.button1.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.Location = new System.Drawing.Point(524, 175);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(137, 50);
            this.button1.TabIndex = 32;
            this.button1.Text = "Changer le mode\r\nde connexion";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // LecteurLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(708, 261);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.cbBibliotheque);
            this.Controls.Add(this.lBibliotheque);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.lPassword);
            this.Controls.Add(this.lUserName);
            this.Controls.Add(this.txtPwd);
            this.Controls.Add(this.txtLogin);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lBienvenue);
            this.Name = "LecteurLogin";
            this.Text = "Lecteur login";
            this.Load += new System.EventHandler(this.Login_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.ComboBox cbBibliotheque;
        private System.Windows.Forms.Label lBibliotheque;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Label lPassword;
        private System.Windows.Forms.Label lUserName;
        private System.Windows.Forms.TextBox txtPwd;
        private System.Windows.Forms.TextBox txtLogin;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lBienvenue;
        private System.Windows.Forms.Button button1;
    }
}

