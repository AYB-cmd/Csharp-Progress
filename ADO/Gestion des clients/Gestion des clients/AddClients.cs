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
        ADO Ado = new ADO();
        public AddClients()
        {
            InitializeComponent();

        }

        /*private string FirstName;
        private string LastName;
        private string Address;
        private string City;*/

        //private int ClientID;
        private string FullName;
        private int parsedCustomerID;



        private bool IsCustomerNameValid()
        {
            if (txtFirstName.Text == "" || txtLastName.Text == "")
            {
                MessageBox.Show("Please enter a name.");
                return false;
            }
            else
            {
                FullName = txtFirstName.Text + " " + txtLastName.Text;
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

                return true;
            }
        }


        private void ClearForm()
        {
            txtFirstName.Clear();
            txtLastName.Clear();
            txtAddress.Clear();
            txtCity.Clear();

        }

        private void btnCreateAccount_Click(object sender, EventArgs e)
        {
            if (IsCustomerNameValid() && IsCustomerAdressValid())
            {

                using (SqlConnection connection = new SqlConnection(Properties.Settings.Default.connString))
                {

                    using (SqlCommand sqlCommand = new SqlCommand("NewClient", connection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        
                        sqlCommand.Parameters.Add(new SqlParameter("@FName", SqlDbType.NVarChar, (40)));
                        sqlCommand.Parameters["@FName"].Value = txtFirstName.Text;
                        sqlCommand.Parameters.Add(new SqlParameter("@LName", SqlDbType.NVarChar, (40)));
                        sqlCommand.Parameters["@LName"].Value = txtLastName.Text;
                        sqlCommand.Parameters.Add(new SqlParameter("@CAddress", SqlDbType.NVarChar, (40)));
                        sqlCommand.Parameters["@CAddress"].Value = txtAddress.Text;
                        sqlCommand.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar, (40)));
                        sqlCommand.Parameters["@City"].Value = txtCity.Text;
                      
                        try
                        {
                            connection.Open();
                            
                            sqlCommand.ExecuteNonQuery();
                            
                            MessageBox.Show(FullName + " has added successfully.");
                        }
                        catch
                        {
                            MessageBox.Show("Customer ID was not returned. Account could not be created.");
                        }
                        finally
                        {
                            connection.Close();
                        }
                    }
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

