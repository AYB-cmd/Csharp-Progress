using Newtonsoft.Json;
using RealWorldApp.Model;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Essentials;

namespace RealWorldApp.Services
{
    public static class ApiService
    {
        public static async Task<bool> RegisterUser(string name, string email, string password)
        {
            var register = new Register()
            {
                Name = name,
                Email = email,
                Password = password 
            };
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            var json = JsonConvert.SerializeObject(register);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response =  await httpClient.PostAsync(AppSetting.ApiUrl + "api/accounts/Register",content);
            if (!response.IsSuccessStatusCode) return false;
            return true;
            
        }

        public static async Task<bool> Login( string email, string password)
        {
            var register = new Login()
            {
               
                Email = email,
                Password = password
            };
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            var json = JsonConvert.SerializeObject(register);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = await httpClient.PostAsync(AppSetting.ApiUrl + "api/accounts/Login", content);
            if (!response.IsSuccessStatusCode) return false;
            var jsonResult = await response.Content.ReadAsStringAsync();
            var result = JsonConvert.DeserializeObject<Token>(jsonResult);
            Preferences.Set("accessToken", result.AccessToken);
            Preferences.Set("UserName", result.UserName);
            Preferences.Set("UserId", result.UserId);
            return true;

        }

        public static async Task<List<Category>> GetCategories()
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/categories");
            return JsonConvert.DeserializeObject<List<Category>>(response);
        }

        public static async Task<Product> GetProductById(int productId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/products/" + productId);
            return JsonConvert.DeserializeObject<Product>(response);
        }

        public static async Task<List<ProductByCategory>> GetProductByCategories(int CategoryId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/Products/ProductsByCategory/" + CategoryId);
            return JsonConvert.DeserializeObject<List<ProductByCategory>>(response);
        }

        public static async Task<List<TrendingProduct>> GetTrendingProducts()
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/products/trendingproducts");
            return JsonConvert.DeserializeObject<List<TrendingProduct>>(response);
        }

        public static async Task<TotalCartItem> GetTotalCartItems(int userId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
           
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/ShoppingCartItems/TotalItems/" + userId);
            return JsonConvert.DeserializeObject<TotalCartItem>(response);
        }


            public static async Task<bool> AddItemsInCart(AddToCart addToCart)
            {
             
                HttpClientHandler handler = new HttpClientHandler();
                var httpClient = new HttpClient(handler);
                var json = JsonConvert.SerializeObject(addToCart);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                 httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
                var response = await httpClient.PostAsync(AppSetting.ApiUrl + "api/ShppingCartItems", content);
                if (!response.IsSuccessStatusCode) return false;
                return true;

            }



        }

    }
