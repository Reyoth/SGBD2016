﻿namespace MainApp.Administrateur
{
    partial class AdmLogin
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
            this.button1 = new System.Windows.Forms.Button();
            this.btnConnect = new System.Windows.Forms.Button();
            this.lPassword = new System.Windows.Forms.Label();
            this.lUserName = new System.Windows.Forms.Label();
            this.txtPwd = new System.Windows.Forms.TextBox();
            this.txtLogin = new System.Windows.Forms.TextBox();
            this.lBienvenue = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.LightBlue;
            this.button1.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.Navy;
            this.button1.Location = new System.Drawing.Point(514, 185);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(137, 50);
            this.button1.TabIndex = 45;
            this.button1.Text = "Changer le mode\r\nde connexion";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btnConnect
            // 
            this.btnConnect.BackColor = System.Drawing.Color.LightBlue;
            this.btnConnect.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConnect.ForeColor = System.Drawing.Color.Navy;
            this.btnConnect.Location = new System.Drawing.Point(371, 185);
            this.btnConnect.Name = "btnConnect";
            this.btnConnect.Size = new System.Drawing.Size(137, 50);
            this.btnConnect.TabIndex = 43;
            this.btnConnect.Text = "Connecter";
            this.btnConnect.UseVisualStyleBackColor = false;
            this.btnConnect.Click += new System.EventHandler(this.btnConnect_Click);
            // 
            // lPassword
            // 
            this.lPassword.AutoSize = true;
            this.lPassword.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lPassword.ForeColor = System.Drawing.Color.Navy;
            this.lPassword.Location = new System.Drawing.Point(408, 141);
            this.lPassword.Name = "lPassword";
            this.lPassword.Size = new System.Drawing.Size(100, 18);
            this.lPassword.TabIndex = 42;
            this.lPassword.Text = "Mot de passe :";
            // 
            // lUserName
            // 
            this.lUserName.AutoSize = true;
            this.lUserName.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lUserName.ForeColor = System.Drawing.Color.Navy;
            this.lUserName.Location = new System.Drawing.Point(378, 101);
            this.lUserName.Name = "lUserName";
            this.lUserName.Size = new System.Drawing.Size(130, 18);
            this.lUserName.TabIndex = 41;
            this.lUserName.Text = "Nom d\'utilisateur :";
            // 
            // txtPwd
            // 
            this.txtPwd.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPwd.ForeColor = System.Drawing.Color.Navy;
            this.txtPwd.Location = new System.Drawing.Point(514, 138);
            this.txtPwd.Name = "txtPwd";
            this.txtPwd.Size = new System.Drawing.Size(137, 25);
            this.txtPwd.TabIndex = 40;
            this.txtPwd.UseSystemPasswordChar = true;
            // 
            // txtLogin
            // 
            this.txtLogin.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLogin.ForeColor = System.Drawing.Color.Navy;
            this.txtLogin.Location = new System.Drawing.Point(514, 98);
            this.txtLogin.Name = "txtLogin";
            this.txtLogin.Size = new System.Drawing.Size(137, 25);
            this.txtLogin.TabIndex = 39;
            // 
            // lBienvenue
            // 
            this.lBienvenue.AutoSize = true;
            this.lBienvenue.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lBienvenue.ForeColor = System.Drawing.Color.Navy;
            this.lBienvenue.Location = new System.Drawing.Point(321, 31);
            this.lBienvenue.Name = "lBienvenue";
            this.lBienvenue.Size = new System.Drawing.Size(330, 18);
            this.lBienvenue.TabIndex = 38;
            this.lBienvenue.Text = "Veuillez votre login et mot de passe s\'il vous plait";
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::MainApp.Properties.Resources.livres2;
            this.pictureBox1.Location = new System.Drawing.Point(1, 43);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(344, 236);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 44;
            this.pictureBox1.TabStop = false;
            // 
            // AdmLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.Window;
            this.ClientSize = new System.Drawing.Size(709, 278);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.btnConnect);
            this.Controls.Add(this.lPassword);
            this.Controls.Add(this.lUserName);
            this.Controls.Add(this.txtPwd);
            this.Controls.Add(this.txtLogin);
            this.Controls.Add(this.lBienvenue);
            this.Controls.Add(this.pictureBox1);
            this.Name = "AdmLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "AdmLogin";
            this.Load += new System.EventHandler(this.AdmLogin_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btnConnect;
        private System.Windows.Forms.Label lPassword;
        private System.Windows.Forms.Label lUserName;
        private System.Windows.Forms.TextBox txtPwd;
        private System.Windows.Forms.TextBox txtLogin;
        private System.Windows.Forms.Label lBienvenue;
        private System.Windows.Forms.PictureBox pictureBox1;
    }
}