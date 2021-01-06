using PCleaner.MVVM.Models;
using PCleaner.MVVM.ViewModels;
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
using System.Windows.Shapes;

namespace PCleaner.MVVM.Views
{
    /// <summary>
    /// Interaction logic for ShellView.xaml
    /// </summary>
    public partial class ShellView : Window
    {
        ShellViewModel defualt = new ShellViewModel();
        Hestorique hestorique = new Hestorique();
        public ShellView()
        {
            InitializeComponent();
            string lastAnalyse = hestorique.LastAnalyse();
            
        }

       
        private void GridBar_MouseDown(object sender, MouseButtonEventArgs e)
        {
            try {
                DragMove(); 
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ButtonMini_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                this.WindowState = WindowState.Minimized;

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        
    }
}
