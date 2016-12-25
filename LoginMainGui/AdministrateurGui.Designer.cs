namespace LoginMainGui
{
    partial class AdministrateurGui
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
            this.lFullName = new System.Windows.Forms.Label();
            this.lBibChoisie = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // lFullName
            // 
            this.lFullName.AutoSize = true;
            this.lFullName.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lFullName.Location = new System.Drawing.Point(96, 110);
            this.lFullName.Name = "lFullName";
            this.lFullName.Size = new System.Drawing.Size(72, 18);
            this.lFullName.TabIndex = 8;
            this.lFullName.Text = "FullName";
            // 
            // lBibChoisie
            // 
            this.lBibChoisie.AutoSize = true;
            this.lBibChoisie.Font = new System.Drawing.Font("Modern No. 20", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lBibChoisie.Location = new System.Drawing.Point(96, 132);
            this.lBibChoisie.Name = "lBibChoisie";
            this.lBibChoisie.Size = new System.Drawing.Size(93, 18);
            this.lBibChoisie.TabIndex = 7;
            this.lBibChoisie.Text = "connecté à  : ";
            // 
            // AdministrateurGui
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.lFullName);
            this.Controls.Add(this.lBibChoisie);
            this.Name = "AdministrateurGui";
            this.Text = "AdministrateurGui";
            this.Load += new System.EventHandler(this.LecteurGui_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lFullName;
        private System.Windows.Forms.Label lBibChoisie;
    }
}