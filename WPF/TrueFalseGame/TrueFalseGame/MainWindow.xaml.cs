using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TrueFalseGame
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Persistance _trueFalse = new Persistance("database.xml");
        public MainWindow()
        {
            InitializeComponent();

            Loaded += (sender, args) => SetCurrentState(1);
        }

        private void SetCurrentState(int index)
        {
            if (_trueFalse.Exists(index))
            {
                StatementText.Text = _trueFalse[index].Text;
                TrueFalseMark.IsChecked = _trueFalse[index].IsTrue;
            }
            else
            {
                StatementText.Text = " ";
                TrueFalseMark.IsChecked = false;
            }
            UpdateAddButtonState(index);
            SaveStatemnet.IsEnabled = !IsStatementEmpty() && _trueFalse.Exists(index);
        }



        private void UpdateAddButtonState(int index)
        {
            AddStatemnet.IsEnabled = !IsStatementEmpty() &&  _trueFalse.Exists(index);
        }
        private bool IsStatementEmpty()
        {
            return StatementText.Text == string.Empty;
        }

   

        private void NewDB_Click(object sender, RoutedEventArgs e)
        {
            var sfd = new SaveFileDialog();
            if (sfd.ShowDialog() == true){
                _trueFalse = new Persistance(sfd.FileName);
                _trueFalse.Save();

                StatementNumber.Value = 1;
                StatementText.Text = string.Empty;
            }
        }

       /private void OpenDB_Click(object sender, RoutedEventArgs e)
        {
            var ofd = new OpenFileDialog
            {
                InitialDirectory = Path.GetDirectoryName(AssemblyLoadEventArgs.GetExecutingAssembly().location);
            }
            if (ofd.ShowDialog() == true)
            {
                _trueFalse = new Persistance(ofd.FileName);
                _trueFalse.Load();

                StatementNumber.Value = 1;
                
            }
        }

        private void SaveDB_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SaveDbAs_Click(object sender, RoutedEventArgs e)
        {

        }

        private void StartGame_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Cut_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Copy_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Paste_Click(object sender, RoutedEventArgs e)
        {

        }

        private void AddStatemnet_Click(object sender, RoutedEventArgs e)
        {

        }

        private void RemoveStatemnet_Click(object sender, RoutedEventArgs e)
        {

        }

        private void SaveStatemnet_Click(object sender, RoutedEventArgs e)
        {

        }

        private void StatementNumber_ValueChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        { 

        }

        private void TrueFalse_Click(object sender, RoutedEventArgs e)
        {

        }

        private void StatementText_TextChanged(object sender, TextChangedEventArgs e)
        {
            
        }
    }
}
