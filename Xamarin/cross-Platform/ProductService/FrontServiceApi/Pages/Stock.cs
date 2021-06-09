using FrontServiceApi.Models;
using FrontServiceApi.Services;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FrontServiceApi.Pages
{
    public class StockBase : ComponentBase
    {
        [Inject]
        public IProductService ProductService { get; set; }

        public IEnumerable<Product> Products { get; set; }

        protected override async Task OnInitializedAsync()
        {
            Products = (await ProductService.GetProductById(1)).ToList();
        }
    
    }
}
