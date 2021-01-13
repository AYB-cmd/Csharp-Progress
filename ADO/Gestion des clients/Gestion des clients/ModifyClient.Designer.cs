
namespace SimpleDataApp
{
    partial class ModifyClient
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
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtCity = new System.Windows.Forms.TextBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.txtLastName = new System.Windows.Forms.TextBox();
            this.txtFirstName = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.getCustomerCity = new System.Windows.Forms.TextBox();
            this.getCustomerAddress = new System.Windows.Forms.TextBox();
            this.getCustomerLastName = new System.Windows.Forms.TextBox();
            this.getCustomeFirstName = new System.Windows.Forms.TextBox();
            this.btnApply = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.txtCity);
            this.groupBox1.Controls.Add(this.txtAddress);
            this.groupBox1.Controls.Add(this.txtLastName);
            this.groupBox1.Controls.Add(this.txtFirstName);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(26, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(482, 301);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Modify Client info";
            // 
            // txtCity
            // 
            this.txtCity.AccessibleName = "";
            this.txtCity.Location = new System.Drawing.Point(249, 219);
            this.txtCity.Name = "txtCity";
            this.txtCity.Size = new System.Drawing.Size(218, 27);
            this.txtCity.TabIndex = 6;
            // 
            // txtAddress
            // 
            this.txtAddress.AccessibleName = "";
            this.txtAddress.Location = new System.Drawing.Point(249, 163);
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(218, 27);
            this.txtAddress.TabIndex = 5;
            // 
            // txtLastName
            // 
            this.txtLastName.AccessibleName = "";
            this.txtLastName.Location = new System.Drawing.Point(250, 106);
            this.txtLastName.Name = "txtLastName";
            this.txtLastName.Size = new System.Drawing.Size(217, 27);
            this.txtLastName.TabIndex = 2;
            // 
            // txtFirstName
            // 
            this.txtFirstName.AccessibleName = "";
            this.txtFirstName.Location = new System.Drawing.Point(249, 50);
            this.txtFirstName.Name = "txtFirstName";
            this.txtFirstName.Size = new System.Drawing.Size(218, 27);
            this.txtFirstName.TabIndex = 0;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label3.Location = new System.Drawing.Point(33, 220);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(189, 23);
            this.label3.TabIndex = 1;
            this.label3.Text = "- City                          :";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(33, 107);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(193, 23);
            this.label2.TabIndex = 1;
            this.label2.Text = "- Customer LastName :";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label4.Location = new System.Drawing.Point(33, 164);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(191, 23);
            this.label4.TabIndex = 0;
            this.label4.Text = "- Address                    :";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(33, 51);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(196, 23);
            this.label1.TabIndex = 0;
            this.label1.Text = "- Customer FirstName :";
            // 
            // btnCancel
            // 
            this.btnCancel.AccessibleName = "";
            this.btnCancel.Font = new System.Drawing.Font("Segoe UI Historic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnCancel.Location = new System.Drawing.Point(26, 367);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(193, 59);
            this.btnCancel.TabIndex = 6;
            this.btnCancel.Text = "Cancel";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.getCustomerCity);
            this.groupBox2.Controls.Add(this.getCustomerAddress);
            this.groupBox2.Controls.Add(this.getCustomerLastName);
            this.groupBox2.Controls.Add(this.getCustomeFirstName);
            this.groupBox2.Location = new System.Drawing.Point(531, 12);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(244, 301);
            this.groupBox2.TabIndex = 8;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Current info";
            // 
            // getCustomerCity
            // 
            this.getCustomerCity.AccessibleName = "";
            this.getCustomerCity.Location = new System.Drawing.Point(15, 219);
            this.getCustomerCity.Name = "getCustomerCity";
            this.getCustomerCity.ReadOnly = true;
            this.getCustomerCity.Size = new System.Drawing.Size(218, 27);
            this.getCustomerCity.TabIndex = 6;
            // 
            // getCustomerAddress
            // 
            this.getCustomerAddress.AccessibleName = "";
            this.getCustomerAddress.Location = new System.Drawing.Point(16, 163);
            this.getCustomerAddress.Name = "getCustomerAddress";
            this.getCustomerAddress.ReadOnly = true;
            this.getCustomerAddress.Size = new System.Drawing.Size(218, 27);
            this.getCustomerAddress.TabIndex = 5;
            // 
            // getCustomerLastName
            // 
            this.getCustomerLastName.AccessibleName = "";
            this.getCustomerLastName.Location = new System.Drawing.Point(16, 106);
            this.getCustomerLastName.Name = "getCustomerLastName";
            this.getCustomerLastName.ReadOnly = true;
            this.getCustomerLastName.Size = new System.Drawing.Size(217, 27);
            this.getCustomerLastName.TabIndex = 2;
            // 
            // getCustomeFirstName
            // 
            this.getCustomeFirstName.AccessibleName = "";
            this.getCustomeFirstName.Location = new System.Drawing.Point(16, 50);
            this.getCustomeFirstName.Name = "getCustomeFirstName";
            this.getCustomeFirstName.ReadOnly = true;
            this.getCustomeFirstName.Size = new System.Drawing.Size(218, 27);
            this.getCustomeFirstName.TabIndex = 0;
            // 
            // btnApply
            // 
            this.btnApply.AccessibleName = "";
            this.btnApply.Font = new System.Drawing.Font("Segoe UI Historic", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.btnApply.Location = new System.Drawing.Point(582, 367);
            this.btnApply.Name = "btnApply";
            this.btnApply.Size = new System.Drawing.Size(193, 59);
            this.btnApply.TabIndex = 7;
            this.btnApply.Text = "apply";
            this.btnApply.UseVisualStyleBackColor = true;
            this.btnApply.Click += new System.EventHandler(this.btnApply_Click);
            // 
            // ModifyClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(804, 442);
            this.Controls.Add(this.btnApply);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.btnCancel);
            this.Controls.Add(this.groupBox1);
            this.Name = "ModifyClient";
            this.Text = "Form3";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtCity;
        private System.Windows.Forms.TextBox txtFirstName;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.TextBox textCustomerID;
        private System.Windows.Forms.TextBox txtLastName;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.TextBox getCustomerCity;
        private System.Windows.Forms.TextBox getCustomerAddress;
        private System.Windows.Forms.TextBox getCustomerLastName;
        private System.Windows.Forms.TextBox getCustomeFirstName;
        private System.Windows.Forms.Button btnApply;
    }
}