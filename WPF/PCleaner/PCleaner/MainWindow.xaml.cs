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
using System.Diagnostics;
using System.IO;

namespace PCleaner
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            
        }
        private void ButtonClose_Click(object sender , RoutedEventArgs s)
        {
           

            try
            {
                Application.Current.Shutdown();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void ButtonMin_Click(object sender, RoutedEventArgs s)
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

        private void GridBar_MouseDown(object sender, MouseButtonEventArgs e)
        {
            try
            {
                DragMove();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        private void ButtonVue_Click(object sender, RoutedEventArgs e)
        {


            DirectoryInfo directory = new DirectoryInfo("C:/Windows/Temp");
            DirectoryInfo[] folders = directory.GetDirectories();
            
            float b = 0 ;

            FileInfo[] filesTmp = directory .GetFiles();
            
            foreach (var file in filesTmp)
            {
                b += file.Length; 
            }
            foreach (var folder in folders)
            {
                FileInfo[] files = folder.GetFiles();
                
                /*b +=  Convert.ToInt32(fi.Length);*/
                
                foreach (var File in files)
                {
                    /*MessageBox.Show("Folder: " + folder.Name + " File: " + File.Name);*/
                    b += File.Length;
                    
                }
            }

            /*Test.Text = "The size of " + directory.Name + " is \n" + b / (1024 * 1024) + " Megabytes.\n";*/

        }


        private void ButtonAnalyse_Click(object sender, RoutedEventArgs e)
        {

            DirectoryInfo di = new DirectoryInfo("C:/Windows/Temp/test");
            FileInfo[] fiArr = di.GetFiles();
            foreach (var item in fiArr)
            {
                item.Delete();
            }
        }

        private void ButtonHistorice_Click(object sender, RoutedEventArgs e)
        {
            
        }

        private void buttonOption_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void ButtonWeb_Click(object sender, RoutedEventArgs e)
        {
            

        }

        private void Test_Scroll(object sender, System.Windows.Controls.Primitives.ScrollEventArgs e)
        {

        }
    }
}
