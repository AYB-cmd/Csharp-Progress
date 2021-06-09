using FrontService.Data;
using FrontService.Services;
using Microsoft.AspNetCore.Components;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FrontService.Pages
{
    public class CategoriesListBase : ComponentBase
    {
        [Inject]
        public ICategoryService CategoryService { get; set; }

        public IEnumerable<Category> Categories { get; set; }

        protected override async Task OnInitializedAsync()
        {
            Categories = (await CategoryService.GetCategories()).ToList();
        }


    }
}
