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
        
        public void Analyzer()
        {
            //String.Format("The size is {0} Mb.", DirSize(new DirectoryInfo("C:/Windows/Temp")));
            string userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            long tmp = Analyse.Tmp(new DirectoryInfo("C:/Windows/Temp"));
            string cookies = "C:/Users/youcode/AppData/Local/Google/Chrome/User Data/Default";
            long cK = Analyse.Cookies(new DirectoryInfo(cookies));
            long total = tmp + cK;
            EspaceAnettoyer = String.Format("The size is {0} Mb.", cK+tmp);


        }










    }
}
