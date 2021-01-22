using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace SimpleDataApp
{
    class ADO
    {
        public SqlConnection con = new SqlConnection();
        private SqlCommand cmd = new SqlCommand();
        public SqlDataReader dr;
        public DataTable dt = new DataTable();
        public SqlDataAdapter dap = new SqlDataAdapter();
        public DataSet ds = new DataSet();
        public DataRow ligne;
        public SqlCommandBuilder cb; 
         
        public void Connect()
        {
            if(con.State == ConnectionState.Closed || con.State == ConnectionState.Broken)
            {
                con.ConnectionString = "Data Source=VI-VERI-VENIVER;Initial Catalog=GestionDeClients;Integrated Security=True";
                con.Open();
            }
        }

        public void Disconnect()
        {
            if(con.State == ConnectionState.Open)
            {
                con.Close();
            }
        }
       /* public void Retrieve(string row,string table)
        {
            try
            {
                Connect();
                dap = new SqlDataAdapter($"select {row} from {table}", con);
                dap.Fill(ds);
            }
            catch
            {
                MessageBox.Show("Can't Connect to the database");
            }
            finally
            {
                Disconnect();
            }
        }*/
    }
}
