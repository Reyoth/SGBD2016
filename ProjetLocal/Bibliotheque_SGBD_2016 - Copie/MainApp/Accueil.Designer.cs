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
            this.SuivantBt = new System.Windows.Forms.Button();
            this.Connectionlabel = new System.Windows.Forms.Label();
            this.ConnectionCombobox = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // SuivantBt
            // 
            this.SuivantBt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SuivantBt.Location = new System.Drawing.Point(86, 84);
            this.SuivantBt.Margin = new System.Windows.Forms.Padding(2);
            this.SuivantBt.Name = "SuivantBt";
            this.SuivantBt.Size = new System.Drawing.Size(100, 40);
            this.SuivantBt.TabIndex = 8;
            this.SuivantBt.Text = "Suivant";
            this.SuivantBt.UseVisualStyleBackColor = true;
            this.SuivantBt.Click += new System.EventHandler(this.SuivantBt_Click);
            // 
            // Connectionlabel
            // 
            this.Connectionlabel.AutoSize = true;
            this.Connectionlabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Connectionlabel.Location = new System.Drawing.Point(61, 23);
            this.Connectionlabel.Margin = new System.Windows.Forms.Padding(2, 0, 2, 0);
            this.Connectionlabel.Name = "Connectionlabel";
            this.Connectionlabel.Size = new System.Drawing.Size(147, 20);
            this.Connectionlabel.TabIndex = 7;
            this.Connectionlabel.Text = "Mode de connexion";
            // 
            // ConnectionCombobox
            // 
            this.ConnectionCombobox.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.ConnectionCombobox.FormattingEnabled = true;
            this.ConnectionCombobox.Items.AddRange(new object[] {
            "Admin",
            "Lecteur"});
            this.ConnectionCombobox.Location = new System.Drawing.Point(63, 50);
            this.ConnectionCombobox.Margin = new System.Windows.Forms.Padding(2);
            this.ConnectionCombobox.Name = "ConnectionCombobox";
            this.ConnectionCombobox.Size = new System.Drawing.Size(145, 28);
            this.ConnectionCombobox.TabIndex = 6;
            // 
            // Accueil
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(269, 146);
            this.Controls.Add(this.SuivantBt);
            this.Controls.Add(this.Connectionlabel);
            this.Controls.Add(this.ConnectionCombobox);
            this.Name = "Accueil";
            this.Text = "Mode de connexion";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button SuivantBt;
        private System.Windows.Forms.Label Connectionlabel;
        private System.Windows.Forms.ComboBox ConnectionCombobox;
    }
}

