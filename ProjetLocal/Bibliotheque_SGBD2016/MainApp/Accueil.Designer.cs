namespace MainApp
{
    partial class Accueil
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
            this.ConnectionCombobox = new System.Windows.Forms.ComboBox();
            this.Connectionlabel = new System.Windows.Forms.Label();
            this.SuivantBt = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ConnectionCombobox
            // 
            this.ConnectionCombobox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ConnectionCombobox.FormattingEnabled = true;
            this.ConnectionCombobox.Items.AddRange(new object[] {
            "Admin",
            "Lecteur"});
            this.ConnectionCombobox.Location = new System.Drawing.Point(82, 61);
            this.ConnectionCombobox.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.ConnectionCombobox.Name = "ConnectionCombobox";
            this.ConnectionCombobox.Size = new System.Drawing.Size(145, 28);
            this.ConnectionCombobox.TabIndex = 0;
            // 
            // Connectionlabel
            // 
            this.Connectionlabel.AutoSize = true;
            this.Connectionlabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Connectionlabel.Location = new System.Drawing.Point(80, 34);
            this.Connectionlabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Connectionlabel.Name = "Connectionlabel";
            this.Connectionlabel.Size = new System.Drawing.Size(147, 20);
            this.Connectionlabel.TabIndex = 1;
            this.Connectionlabel.Text = "Mode de connexion";
            this.Connectionlabel.Click += new System.EventHandler(this.label1_Click);
            // 
            // SuivantBt
            // 
            this.SuivantBt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SuivantBt.Location = new System.Drawing.Point(105, 95);
            this.SuivantBt.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.SuivantBt.Name = "SuivantBt";
            this.SuivantBt.Size = new System.Drawing.Size(100, 40);
            this.SuivantBt.TabIndex = 2;
            this.SuivantBt.Text = "Suivant";
            this.SuivantBt.UseVisualStyleBackColor = true;
            this.SuivantBt.Click += new System.EventHandler(this.SuivantBt_Click);
            // 
            // Accueil
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(325, 157);
            this.Controls.Add(this.SuivantBt);
            this.Controls.Add(this.Connectionlabel);
            this.Controls.Add(this.ConnectionCombobox);
            this.Margin = new System.Windows.Forms.Padding(2, 2, 2, 2);
            this.Name = "Accueil";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Accueil";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox ConnectionCombobox;
        private System.Windows.Forms.Label Connectionlabel;
        private System.Windows.Forms.Button SuivantBt;
    }
}