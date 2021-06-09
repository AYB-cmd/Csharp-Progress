using FrontService.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;


namespace FrontService.Services
{
    public class CategoryService : ICategoryService
    {
        private HttpClient httpClient;

        public CategoryService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }


        public async Task<IEnumerable<Category>> GetCategories()
        {

             httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("bearer", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZWxqZWxsYWRpQGdtYWlsLmNvbSIsImp0aSI6IjBmZWQ2N2JhLWY4OTEtNDNhYy05NGU3LWM5OGJhZGUwNWNiZSIsImVtYWlsIjoiYWVsamVsbGFkaUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiYWVsamVsbGFkaUBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJVc2VyIiwibmJmIjoxNjIzMDgxMjczLCJleHAiOjE2MjMxNjc2NzMsImlzcyI6Imh0dHBzOi8vMTkyLjE2OC4xNjEuMTo0NTQ1NiIsImF1ZCI6Imh0dHBzOi8vMTkyLjE2OC4xNjEuMTo0NTQ1NiJ9.CGxomCmSAsCMTqBTc9vcTJ_d4JSEYVFKqxqLS9ptAGI");
             var response = await httpClient.GetStringAsync("api/categories");
             return JsonConvert.DeserializeObject<IEnumerable<Category>>(response);
            /*return await httpClient.GetAsync<Category[]>("api/categories");*/
        }
    }
}
