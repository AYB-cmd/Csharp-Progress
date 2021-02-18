using Caliburn.Micro;
using PCleaner.MVVM.EventModels;
using PCleaner.MVVM.Models;
using PCleaner.MVVM.Views;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Media.Animation;


namespace PCleaner.MVVM.ViewModels
{
    public class ShellViewModel : Conductor<Object> 
    {

        
        Hestorique hestorique = new Hestorique();
        public DateTime DateShell;
       
       private IEventAggregator _events;
        public ShellViewModel(IEventAggregator events)
        {
            _events = events;
           
            events.Subscribe(this);
        }



        /* private int _CurrentProgress = 30;
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
   */

        public void ButtonClose()
        {
            Application.Current.Shutdown();
        }
  public void ButtonEnsenble()
        {
            string lastAnalyse = hestorique.LastAnalyse();
            ActivateItem(new EnsenbleViewModel());
        }


        public void ButtonAnalyse()
        {
            //string lastAnalyse = hestorique.LastAnalyse();
            ActivateItem(new AnalyserViewModel());
        }

       /* public void Handle(AnEvent message)
        {
           ActivateItem(new AnalyserViewModel());
        }*/

      
    }
}
