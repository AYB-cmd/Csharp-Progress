
using Caliburn.Micro;
using PCleaner.MVVM.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace PCleaner.MVVM
{
    public class Bootstrapper : BootstrapperBase
    {
       // private SimpleContainer _container = new SimpleContainer();
        
        public Bootstrapper()
        {

            Initialize();
        }

      /*  protected override void Configure()
        {
            _container.Instance(_container);

            _container.Singleton<IEventAggregator, EventAggregator>();
        }*/
        protected override void OnStartup(object sender, StartupEventArgs e)
        {
            DisplayRootViewFor<ShellViewModel>();
        }
     
    }
}
