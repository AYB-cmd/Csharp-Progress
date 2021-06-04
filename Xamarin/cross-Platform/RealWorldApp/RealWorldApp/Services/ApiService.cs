using Newtonsoft.Json;
using RealWorldApp.Model;
using System;
using System.Collections.Generic;
using System.Net.Http;
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
    }

}
