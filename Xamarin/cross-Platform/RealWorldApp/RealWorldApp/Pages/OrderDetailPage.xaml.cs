using RealWorldApp.Model;
using RealWorldApp.Services;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace RealWorldApp.Pages
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class OrderDetailPage : ContentPage
    {
        public ObservableCollection<OrderDetail> OrderDetailCollection;

        public OrderDetailPage()
        {
        }

        public OrderDetailPage(int orderId, double orderTotal)
        {
            InitializeComponent();
            LblTotalPrice.Text = orderTotal + " DH";
            OrderDetailCollection = new ObservableCollection<OrderDetail>();
            GetOrdersDetail(orderId);
        }

        private async void GetOrdersDetail(int orderId)
        {
            var orderDetails = await ApiService.GetOrdersDetail(orderId);
            foreach (var orderDetail in orderDetails)
            {
                OrderDetailCollection.Add(orderDetail);
            }
            LvOrderDetail.ItemsSource = OrderDetailCollection;
        }


        private void TapBack_Tapped(object sender, EventArgs e)
        {
            Navigation.PopModalAsync();
        }
    }
}