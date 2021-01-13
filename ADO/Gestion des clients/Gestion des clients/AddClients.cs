using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace SimpleDataApp
{
    public partial class AddClients : Form
    {
        public AddClients()
        {
            InitializeComponent();

        }

        private string CustomerLastName;
        private string City;


        private bool IsCustomerNameValid()
        {
            if (txtFirstName.Text == "" || txtLastName.Text == "")
            {
                MessageBox.Show("Please enter a name.");
                return false;
            }
            else
            {
                this.CustomerLastName = txtLastName.Text;
                return true;
            }
        }

        private bool IsCustomerAdressValid()
        {
            if (txtAddress.Text == "" || txtCity.Text == "")
            {
                MessageBox.Show("Please enter an address.");
                return false;
            }
            else
            {
                this.City = txtCity.Text;
                return true;
            }
        }
      
        
        private void ClearForm()
        {
            txtFirstName.Clear();
            txtLastName.Clear();
            txtAddress.Clear();
            txtCity.Clear();
            this.CustomerLastName = "";
            this.City = "";
        }
      
        private void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (IsCustomerNameValid()&& IsCustomerAdressValid())
            {

                try
                {
                    MessageBox.Show("Client add successfully");
                }
                catch
                {
                    MessageBox.Show("Customer ID was not returned. Account could not be created.");
                }
                finally
                {

                }

            }
        }
       
       
        
        private void btnAddAnotherAccount_Click(object sender, EventArgs e)
        {
            this.ClearForm();
        }
        
        private void btnAddFinish_Click(object sender, EventArgs e)
        {
            this.Close();
        }

       
    }
}
