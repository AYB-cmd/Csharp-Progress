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

        /*SqlConnection con = new SqlConnection();
        SqlDataAdapter adp = new SqlDataAdapter();
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();*/
        public ManageClients()
        {
            InitializeComponent();
        }

        ADO d = new ADO();
        private string FirstName { get; set; }
        private string LastName { get; set; }
        private string fullName { get; set; }
        private string[] FullName { get; set; }
        //private string fullName { get; set; }
        private string CustomerID { get; set; }
        

        private bool IsCustomerFullNameValid()
        {

            if (txtCustomerFullName.Text == "")
            {
                MessageBox.Show("Please specify a name.");
                return false;
            }
            else
            {
                fullName = txtCustomerFullName.Text;
                FullName = fullName.Split();
                FirstName = FullName[0];
                LastName = FullName[1];
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

               
                return true;
            }
        }


        private void btnFindCustomer_Click(object sender, EventArgs e)
        {

            if (IsCustomerFullNameValid())
            {

                using(SqlConnection connection = new SqlConnection(Properties.Settings.Default.connString))
                {
                    
                    using(SqlCommand command = new SqlCommand("SelectClient",connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@FName", SqlDbType.NVarChar));
                        command.Parameters["@FName"].Value = FirstName;
                        command.Parameters.Add(new SqlParameter("@LName", SqlDbType.NVarChar));
                        command.Parameters["@LName"].Value = LastName;
                        
                        try
                        {
                            connection.Open();
                            using(SqlDataReader dataReader = command.ExecuteReader())
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(dataReader);
                                this.dgvCustomerInfo.DataSource = dataTable;
                                this.CustomerID = Convert.ToString(dataTable.Rows[0][0]) ;   
                                dataReader.Close();
                                btnUpdate.Enabled = true;
                            }
                        }
                        catch
                        {
                            MessageBox.Show("The requested Customer  could not be loaded into the form.");
                        }
                        finally
                        {
                            connection.Close();
                            
                        }
                    }
                }


            }
        }

        private void btnFindCity_Click(object sender, EventArgs e)
        {
            if (IsCustomersCityValid())
            {

                using (SqlConnection connection = new SqlConnection(Properties.Settings.Default.connString))
                {

                    using (SqlCommand command = new SqlCommand("SelectByCity", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.Parameters.Add(new SqlParameter("@City", SqlDbType.NVarChar));
                        command.Parameters["@City"].Value = txtCustomersCity.Text;

                        try
                        {
                            connection.Open();
                            using (SqlDataReader dataReader = command.ExecuteReader())
                            {
                                DataTable dataTable = new DataTable();
                                dataTable.Load(dataReader);
                                this.dgvCustomerInfo.DataSource = dataTable;
                                dataReader.Close();
                                
                            }
                        }
                        catch
                        {
                            MessageBox.Show("The requested Customer  could not be loaded into the form.");
                        }
                        finally
                        {
                            connection.Close();

                        }
                    }
                }


              

            }
        }


        private void btnFinishUpdates_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {

           Form frm = new ModifyClient(CustomerID);
           frm.ShowDialog();

        }
    }
}
