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
    public partial class ModifyClient : Form
    {
        private string customerID { get; set; }


        public ModifyClient()
        {
            InitializeComponent();
        }
        public ModifyClient(string ID)
        {
            this.customerID = ID;

            InitializeComponent();
            SetValue();
        }
        private string CustomerFirstName;
        private string CustomerLastName;
        private string Address;
        private string City;



        private void SetValue()
        {
            using (SqlConnection connection = new SqlConnection(Properties.Settings.Default.connString))
            {

                using (SqlCommand Command = new SqlCommand("SelectClientToUpadate", connection))
                {
                    Command.CommandType = CommandType.StoredProcedure;
                    Command.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
                    Command.Parameters["@ID"].Value = customerID;
                    try
                    {
                        connection.Open();

                        using (SqlDataReader dataReader = Command.ExecuteReader())
                        {
                            DataTable dataTable = new DataTable();
                            dataTable.Load(dataReader);
                            getCustomeFirstName.Text = dataTable.Rows[0][1].ToString();
                            getCustomerLastName.Text = dataTable.Rows[0][2].ToString();
                            getCustomerAddress.Text = dataTable.Rows[0][3].ToString();
                            getCustomerCity.Text = dataTable.Rows[0][4].ToString();
                            dataReader.Close();
                        }
                    }
                    catch
                    {
                        MessageBox.Show("You requeste could not be loaded into the form.");
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
        }



        private void btnCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private bool IsInfoValid()
        {
            if (txtFirstName.Text == "" || txtLastName.Text == "" || txtAddress.Text == "" || txtCity.Text == "")
            {
                MessageBox.Show("Please fill all the fields");
                return false;
            }
            else
            {
                return true;
            }
        }
        private void btnApply_Click(object sender, EventArgs e)
        {


            if (IsInfoValid())
            {
                using (SqlConnection connection = new SqlConnection(Properties.Settings.Default.connString))
                {
                    using (SqlCommand sqlCommand = new SqlCommand("UpdateClient", connection))
                    {
                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.Parameters.Add(new SqlParameter("@ID", SqlDbType.NVarChar, (40)));
                        sqlCommand.Parameters["@ID"].Value = customerID;
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

                            MessageBox.Show(" Updated successfully.");

                        }
                        catch
                        {
                            MessageBox.Show("Customer ID was not returned. Account could not be created.");
                        }
                        finally
                        {

                            connection.Close();
                            SetValue();
                        }
                    }
                }
            }
        }
    }

}
