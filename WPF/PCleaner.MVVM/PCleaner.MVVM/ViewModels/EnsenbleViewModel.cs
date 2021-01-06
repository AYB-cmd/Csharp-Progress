using Caliburn.Micro;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using PCleaner.MVVM.Models;

namespace PCleaner.MVVM.ViewModels
{
    class EnsenbleViewModel : Screen
    {
        Hestorique hestorique = new Hestorique();
        private string _EspaceAnettoyer = "a déterminer par analyse";
        public string EspaceAnettoyer
        {
            get
            {
                return _EspaceAnettoyer;
            }
            set
            {
                _EspaceAnettoyer = value;
                NotifyOfPropertyChange(() => EspaceAnettoyer);
            }
        }

        private string _DateAnalyse;
        public string DateAnalyse
        {
            get
            {
                return _DateAnalyse;
            }
            set
            {
                _DateAnalyse = value;
                NotifyOfPropertyChange(() => DateAnalyse);
            }
        }

        //to defind the last analyse
        public EnsenbleViewModel(string lastAnalyse)
        {
            DateAnalyse = lastAnalyse;
        }

    public void Analyzer()
        {


            
            long tmp = Analyse.Tmp();
            long cooKies = Analyse.Cookies();
            long total = tmp + cooKies;

            // To give the fields some values;
            EspaceAnettoyer = String.Format("There is {0} Mb Need to be cleaned", total);
            DateAnalyse = new Analyse().DateAnalyse.ToString();

            //To make a hestoric
            Statement statement = new Statement(cooKies, tmp);
            hestorique.RightToHestoric(statement);
            
           
        }

     


    }
}
