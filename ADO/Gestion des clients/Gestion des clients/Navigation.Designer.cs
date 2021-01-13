
namespace Gestion_des_clients
{
    partial class Navigation
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.Addclient = new System.Windows.Forms.Button();
            this.btnManageClients = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Showcard Gothic", 25.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(24, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(610, 53);
            this.label1.TabIndex = 0;
            this.label1.Text = "What do you want to do?";
            // 
            // Addclient
            // 
            this.Addclient.AccessibleName = "";
            this.Addclient.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.Addclient.Location = new System.Drawing.Point(210, 144);
            this.Addclient.Name = "Addclient";
            this.Addclient.Size = new System.Drawing.Size(365, 99);
            this.Addclient.TabIndex = 1;
            this.Addclient.Text = "Add Clients";
            this.Addclient.UseVisualStyleBackColor = true;
            this.Addclient.Click += new System.EventHandler(this.btnGoToAdd_Click);
            // 
            // btnManageClients
            // 
            this.btnManageClients.AccessibleName = "";
            this.btnManageClients.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnManageClients.Location = new System.Drawing.Point(210, 249);
            this.btnManageClients.Name = "btnManageClients";
            this.btnManageClients.Size = new System.Drawing.Size(365, 99);
            this.btnManageClients.TabIndex = 2;
            this.btnManageClients.Text = "Manage Clients";
            this.btnManageClients.UseVisualStyleBackColor = true;
            this.btnManageClients.Click += new System.EventHandler(this.btnManageClients_Click);
            // 
            // Navigation
            // 
            this.AccessibleRole = System.Windows.Forms.AccessibleRole.Clock;
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnManageClients);
            this.Controls.Add(this.Addclient);
            this.Controls.Add(this.label1);
            this.Name = "Navigation";
            this.Text = "Gestion de client";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button Addclient;
        private System.Windows.Forms.Button btnManageClients;
    }
}

