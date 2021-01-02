using Caliburn.Micro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Animation;

namespace PCleaner.MVVM.ViewModels
{
    public class ShellViewModel :  Conductor<Object>
    {

        private int _CurrentProgress = 30;
        public int CurrentProgress
        {
            get
            {
                return _CurrentProgress;
            }
            set
            {
                _CurrentProgress = value;
                NotifyOfPropertyChange(() => CurrentProgress);
            }
        }

        public void ProgressBar(int Value)
        {
            
        }
      

        public void ProgressBar(double Value)
        {
            Value = 20;
        }


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
