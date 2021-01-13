using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace SimpleDataApp
{
    public partial class ModifyClient : Form
    {
        private string customerName { get; set; }
 
        
        public ModifyClient()
        {
            InitializeComponent();
        }
        public ModifyClient(string name)
        {
            this.customerName = name;
            
            InitializeComponent();
            SetValue();
        }
        private string CustomerLastName;
        private string City;
        private string CustomerFirstName;
        private string Address;

        private void SetValue()
        {
            getCustomeFirstName.Text = customerName;
            getCustomerLastName.Text = "this is customer last name";
            getCustomerAddress.Text = "this is customer address";
            getCustomerCity.Text = "this is customer city";

        }
        private bool IsCustomerNameValid()
        {
            
            if (txtFirstName.Text == "" || txtLastName.Text == "")
            {
                
                return true;
            }
            else
            {
                this.CustomerLastName = txtLastName.Text;
                this.CustomerFirstName = txtFirstName.Text;
                return true;
            }
        }

        private bool IsCustomerAdressValid()
        {
            if (txtAddress.Text == "" || txtCity.Text == "")
            {
                
                return true;
            }
            else
            {
                this.City = txtCity.Text;
                this.Address = txtAddress.Text;
                return true;
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
