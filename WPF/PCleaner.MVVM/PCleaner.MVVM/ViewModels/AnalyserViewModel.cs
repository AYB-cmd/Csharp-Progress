using Caliburn.Micro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PCleaner.MVVM.ViewModels
{
    public class AnalyserViewModel : Screen
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
    }
}
