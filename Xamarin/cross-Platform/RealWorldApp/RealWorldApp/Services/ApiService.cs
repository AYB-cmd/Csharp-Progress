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
            Preferences.Get("accessToken",string.Empty);
            Preferences.Set("UserName", result.UserName);
            Preferences.Set("UserId", result.UserId);
            Preferences.Set("toKenExpirationTime", result.ExpirationTime);

            DateTime TimeStemp = DateTime.Now;
            long unixTime = ((DateTimeOffset)TimeStemp).ToUnixTimeSeconds();

            Preferences.Set("currentTime", unixTime);
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
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/ShoppingCartItems/TotalItems/" + userId);
            return JsonConvert.DeserializeObject<TotalCartItem>(response);
        }
        public static async Task<CartSubTotal> GetCardSubTotal(int userId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/ShoppingCartItems/SubTotal/" + userId);
            return JsonConvert.DeserializeObject<CartSubTotal>(response);
        }


        public static async Task<List<ShoppingCartItem>> GetShoppingCartItems(int userId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/ShoppingCartItems/" + userId);
            return JsonConvert.DeserializeObject<List<ShoppingCartItem>>(response);
        }


        public static async Task<bool> AddItemsInCart(AddToCart addToCart)
        {
             
                HttpClientHandler handler = new HttpClientHandler();
                var httpClient = new HttpClient(handler);
                var json = JsonConvert.SerializeObject(addToCart);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                 httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
                var response = await httpClient.PostAsync(AppSetting.ApiUrl + "api/ShoppingCartItems", content);
                if (!response.IsSuccessStatusCode) return false;
                return true;

        }
        public static async Task<bool> ClearShoppingCart(int userId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.DeleteAsync(AppSetting.ApiUrl + "api/ShoppingCartItems/" + userId);
            if (!response.IsSuccessStatusCode) return false;
            return true;
        }
        public static async Task<OrderResponse> PlaceOrder(Order order)
        {

            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            var json = JsonConvert.SerializeObject(order);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.PostAsync(AppSetting.ApiUrl + "api/Orders", content);
            var jsonResult = await response.Content.ReadAsStringAsync();
            return JsonConvert.DeserializeObject<OrderResponse>(jsonResult);

        }

        public static async Task<List<OrderByUser>> GetOrdersByUser(int UserId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/Orders/OrdersByUser/" + UserId);
            return JsonConvert.DeserializeObject<List<OrderByUser>>(response);
        }

        public static async Task<List<OrderDetail>> GetOrdersDetail(int orderId)
        {
            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.GetStringAsync(AppSetting.ApiUrl + "api/Orders/OrderDetails/" + orderId);
            return JsonConvert.DeserializeObject<List<OrderDetail>>(response);
        }

        public static async Task<bool> RegisterComplaint(Complaint complaint)
        {

            HttpClientHandler handler = new HttpClientHandler();
            var httpClient = new HttpClient(handler);
            var json = JsonConvert.SerializeObject(complaint);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", Preferences.Get("accessToken", string.Empty));
            var response = await httpClient.PostAsync(AppSetting.ApiUrl + "api/Complaints", content);
            if (!response.IsSuccessStatusCode) return false;
            return true;

        }

    }
    public static class TokenValidator
    {
        public  static async Task CheckTokenValidity()
        {
            var expirationTime = Preferences.Get("TokenExpirationTime", 0);
            DateTime TimeStemp = DateTime.Now;
            long unixTime = ((DateTimeOffset)TimeStemp).ToUnixTimeSeconds();
            Preferences.Set("currentTime", unixTime);
            var currentTime = Preferences.Get("currentTime", 0);
            if(expirationTime < currentTime)
            {
                var email = Preferences.Get("email", string.Empty);
                var password = Preferences.Get("password", string.Empty);
               await ApiService.Login(email,password);
            }
        }
    }

    }
