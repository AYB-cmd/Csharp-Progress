using FrontServiceApi.Models;
using MatBlazor;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;

namespace FrontServiceApi.Services
{
    public class ProductService : IProductService
    {
        private readonly HttpClient httpClient;

        public ProductService(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<IEnumerable<Product>> GetProductById(int productId)
        {
            return await httpClient.GetJsonAsync<Product[]>("api/Products/" + productId);
        }

        
        


    }
}

