using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Text.RegularExpressions;


namespace SimpleDataApp
{
    public partial class ManageClients : Form
    {
        public ManageClients()
        {
            InitializeComponent();
        }


        private string CustomerFullName { get; set; }
        private string CustomersCity;

        private bool IsCustomerFullNameValid()
        {

            if (txtCustomerFullName.Text == "")
            {
                MessageBox.Show("Please specify a name.");
                return false;
            }
            else
            {
                CustomerFullName = txtCustomerFullName.Text;
                return true;
            }
        }
        private bool IsCustomersCityValid()
        {

            if (txtCustomersCity.Text == "")
            {
                MessageBox.Show("Please specify a City.");
                return false;
            }
           
            else
            {

                CustomerFullName = txtCustomerFullName.Text;
                return true;
            }
        }


        private void btnFindCustomer_Click(object sender, EventArgs e)
        {
            
                if (IsCustomerFullNameValid())
                {


                    try
                    {

                        btnUpdate.Enabled = true;
                        //debug
                        MessageBox.Show("Find customer is working");

                    }
                    catch
                    {
                        MessageBox.Show("The requested Customer  could not be loaded into the form.");
                    }
                    finally
                    {

                    }

                }
            
        }
        private void btnFindCity_Click(object sender, EventArgs e)
        {
            if (IsCustomersCityValid())
            {


                try
                {
                    //debug
                    MessageBox.Show("Find customers by City is working");
                }
                catch
                {
                    MessageBox.Show("The requested Customer could not be loaded into the form.");
                }
                finally
                {

                }

            }
        }
      
     
        private void btnFinishUpdates_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
           
                Form frm = new ModifyClient(CustomerFullName);
                frm.ShowDialog();
            
        }
    }
}
