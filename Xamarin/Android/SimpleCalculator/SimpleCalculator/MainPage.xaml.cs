using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace SimpleCalculator
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();

        }
        private void BtnAdd_Clicked(object sender, EventArgs e)
        {
            double a = Double.Parse(num1.Text);
            double b = Double.Parse(num2.Text);
            res.Text = (a + b).ToString();
        }
        private void BtnSub_Clicked(object sender, EventArgs e)
        {
            double a = Double.Parse(num1.Text);
            double b = Double.Parse(num2.Text);
            res.Text = (a - b).ToString();
        }
        private void BtnMul_Clicked(object sender, EventArgs e)
        {
            double a = Double.Parse(num1.Text);
            double b = Double.Parse(num2.Text);
            res.Text = (a * b).ToString();
        }
        private void BtnDiv_Clicked(object sender, EventArgs e)
        {
            double a = Double.Parse(num1.Text);
            double b = Double.Parse(num2.Text);
            res.Text = (a / b).ToString();
        }
        private void BtnRem_Clicked(object sender, EventArgs e)
        {
            double a = Double.Parse(num1.Text);
            double b = Double.Parse(num2.Text);
            res.Text = (a % b).ToString();
        }
        private void BtnClr_Clicked(object sender, EventArgs e)
        {
            num1.Text = String.Empty;
            num2.Text = String.Empty;
            res.Text = String.Empty;
        }
    }
}
