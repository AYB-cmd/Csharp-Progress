

namespace MVVM.Models
{
    using System;
    using System.ComponentModel;
    class Customer : INotifyPropertyChanged
    {
        /// <summary>
        /// Initializes a new instence of the Customer Class;
        /// </summary>
        public Customer(string customerName)
        {
            Name = customerName;
        }
        private string _Name;
        /// <summary>
        /// Get or Set the Customer's name.
        /// </summary>
        public string Name
        {
            get { return _Name; }
            set
            {
                _Name = value;
                OnPropertyChanged("Name");
            }
        }


        #region INotifyPropertyChanged Members
        public event PropertyChangedEventHandler PropertyChanged;
        private void OnPropertyChanged(string propertyName)
        {
            PropertyChangedEventHandler handler = PropertyChanged;
            if (handler != null)
            {
                handler(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
#endregion


