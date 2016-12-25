namespace LoginMainGui
{
    partial class LoginForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(LoginForm));
            this.rbLecteur = new System.Windows.Forms.RadioButton();
            this.rbAdmin = new System.Windows.Forms.RadioButton();
            this.cbBibliotheque = new System.Windows.Forms.ComboBox();
            this.lBibliotheque = new System.Windows.Forms.Label();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lPassword = new System.Windows.Forms.Label();
            this.lUserName = new System.Windows.Forms.Label();
            this.txtPwd = new System.Windows.Forms.TextBox();
            this.txtLogin = new System.Windows.Forms.TextBox();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.lBienvenue = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // rbLecteur
            // 
            this.rbLecteur.AutoSize = true;
            this.rbLecteur.Location = new System.Drawing.Point(447, 182);
            this.rbLecteur.Name = "rbLecteur";
            this.rbLecteur.Size = new System.Drawing.Size(71, 17);
            this.rbLecteur.TabIndex = 22;
            this.rbLecteur.TabStop = true;
            this.rbLecteur.Text = "Utilisateur";
            this.rbLecteur.UseVisualStyleBackColor = true;
            // 
            // rbAdmin
            // 
            this.rbAdmin.AutoSize = true;
            this.rbAdmin.Location = new System.Drawing.Point(381, 182);
            this.rbAdmin.Name = "rbAdmin";
            this.rbAdmin.Size = new System.Drawing.Size(54, 17);
            this.rbAdmin.TabIndex = 21;
            this.rbAdmin.TabStop = true;
            this.rbAdmin.Text = "Admin";
            this.rbAdmin.UseVisualStyleBackColor = true;
            // 
            // cbBibliotheque
            // 
            this.cbBibliotheque.FormattingEnabled = true;
            this.cbBibliotheque.Location = new System.Drawing.Point(381, 91);
            this.cbBibliotheque.Name = "cbBibliotheque";
            this.cbBibliotheque.Size = new System.Drawing.Size(136, 21);
            this.cbBibliotheque.TabIndex = 20;
            this.cbBibliotheque.SelectedIndexChanged += new System.EventHandler(this.cbBibliotheque_SelectedIndexChanged);
            // 
            // lBibliotheque
            // 
            this.lBibliotheque.AutoSize = true;
            this.lBibliotheque.Font = new System.Drawing.Font("Modern No. 20", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lBibliotheque.Location = new System.Drawing.Point(294, 93);
            this.lBibliotheque.Name = "lBibliotheque";
            this.lBibliotheque.Size = new System.Drawing.Size(81, 15);
            this.lBibliotheque.TabIndex = 19;
            this.lBibliotheque.Text = "Bibliothèque :";
            // 
            // btnConnect
            // 
            this.btnConnect.Font = new System.Drawing.Font("Modern No. 20", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConnect.Location = new System.Drawing.Point(443, 205);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(75, 23);
            this.btnConnect.TabIndex = 18;
            this.btnConnect.Text = "Connecter";
            this.btnConnect.UseVisualStyleBackColor = true;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // lPassword
            // 
            this.lPassword.AutoSize = true;
            this.lPassword.Font = new System.Drawing.Font("Modern No. 20", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lPassword.Location = new System.Drawing.Point(294, 160);
            this.lPassword.Name = "lPassword";
            this.lPassword.Size = new System.Drawing.Size(81, 15);
            this.lPassword.TabIndex = 17;
            this.lPassword.Text = "Mot de passe :";
            // 
            // lUserName
            // 
            this.lUserName.AutoSize = true;
            this.lUserName.Font = new System.Drawing.Font("Modern No. 20", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lUserName.Location = new System.Drawing.Point(268, 128);
            this.lUserName.Name = "lUserName";
            this.lUserName.Size = new System.Drawing.Size(107, 15);
            this.lUserName.TabIndex = 16;
            this.lUserName.Text = "Nom d\'utilisateur :";
            // 
            // txtPwd
            // 
            this.txtPwd.Font = new System.Drawing.Font("Modern No. 20", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPwd.Location = new System.Drawing.Point(381, 155);
            this.txtPwd.Name = "txtPwd";
            this.txtPwd.Size = new System.Drawing.Size(137, 21);
            this.txtPwd.TabIndex = 15;
            this.txtPwd.UseSystemPasswordChar = true;
            // 
            // txtLogin
            // 
            this.txtLogin.Font = new System.Drawing.Font("Modern No. 20", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLogin.Location = new System.Drawing.Point(381, 123);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(137, 21);
            this.txtLogin.TabIndex = 14;
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::LoginMainGui.Properties.Resources.livres2;
            this.pictureBox1.Location = new System.Drawing.Point(33, 91);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(281, 181);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 13;
            this.pictureBox1.TabStop = false;
            // 
            // lBienvenue
            // 
            this.lBienvenue.AutoSize = true;
            this.lBienvenue.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lBienvenue.Location = new System.Drawing.Point(49, 34);
            this.lBienvenue.Name = "lBienvenue";
            this.lBienvenue.Size = new System.Drawing.Size(439, 18);
            this.lBienvenue.TabIndex = 12;
            this.lBienvenue.Text = "Veuillez choisir une bibliothèqueu et vous identifier s\'il vous plait";
            // 
            // LoginForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(562, 278);
            this.Controls.Add(this.rbLecteur);
            this.Controls.Add(this.rbAdmin);
            this.Controls.Add(this.cbBibliotheque);
            this.Controls.Add(this.lBibliotheque);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.lPassword);
            this.Controls.Add(this.lUserName);
            this.Controls.Add(this.txtPwd);
            this.Controls.Add(this.txtLogin);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.lBienvenue);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "LoginForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.LoginForm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton rbLecteur;
        private System.Windows.Forms.RadioButton rbAdmin;
        private System.Windows.Forms.ComboBox cbBibliotheque;
        private System.Windows.Forms.Label lBibliotheque;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Label lPassword;
        private System.Windows.Forms.Label lUserName;
        private System.Windows.Forms.TextBox txtPwd;
        private System.Windows.Forms.TextBox txtLogin;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.Label lBienvenue;
    }
}

