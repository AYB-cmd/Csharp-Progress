using Caliburn.Micro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;


namespace PCleaner.MVVM.ViewModels
{
    public class ShellViewModel :  Conductor<Object>
    {
       
        private WindowState _WindowState;

       

        public void ButtonClose()
        {
            Application.Current.Shutdown();
        }
     public void ButtonEnsenble()
        {
            ActivateItem(new EnsenbleViewModel());
        }


    }
}
