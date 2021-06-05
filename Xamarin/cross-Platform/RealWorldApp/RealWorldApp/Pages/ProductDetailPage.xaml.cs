using RealWorldApp.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace RealWorldApp.Pages
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ProductDetailPage : ContentPage
    {
        public ProductDetailPage(int productId)
        {
            InitializeComponent();
            GetProductDetails(productId);
        }
        private void TapBack_Tapped(object sender, EventArgs e)
        {
            Navigation.PopModalAsync();
        }

        private async void GetProductDetails(int productId)
        {
            var product = await ApiService.GetProductById(productId);
            LblName.Text = product.Name;
            LblDetail.Text = product.Detail;
            ImgProduct.Source = product.FullImageUrl;
            LblPrice.Text = product.Price.ToString();

        }
    }
}