
namespace MVVM.ViewModels
{
    using MVVM.Commands;
    using MVVM.Models;
    using System;
    using System.ComponentModel;
    using System.Diagnostics;
    using System.Windows;
    using System.Windows.Input;

    internal class CustomerViewModel : INotifyPropertyChanged
    {
        /// <summary>
        /// Initializes a new instance og the CustomerViewModel Class.
        /// </summary>
        public CustomerViewModel()
        {
            _Customer = new Customer("david");
            UpdateCommand = new CustomerUpdateCommand(this);
        }
        private Customer _Customer;
        public Customer Customer
        {
            get 
            { 
                return _Customer;
            }
            set
            {
                _Customer = value;
                OnPropertyChanged(_Customer);
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(Customer propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs());
            }
        }
        //public Customer Customer{ get { return _Customer; } }

        /// <summary>
        /// Gets oe sets a system.Boolean value indicating whether the customer can be update
        /// </summary>
        public bool CanUpdate
        {
            get
            {
                if (Customer == null)
                {
                    return false;
                }
                return !string.IsNullOrWhiteSpace(Customer.Name);
            }
        }

        public ICommand UpdateCommand
        {
            get;
            private set;
        }
        /// <summary>
        /// Saves changes to the Customer instance.
        /// </summary>
        public void SaveChanges()
        {
            MessageBox.Show(string.Format("{0} was Updated", Customer.Name));
        }
       
    }
}
