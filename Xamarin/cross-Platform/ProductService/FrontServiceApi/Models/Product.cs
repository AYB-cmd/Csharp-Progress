using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FrontServiceApi.Models
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Detail { get; set; }
        public string ImageUrl { get; set; }
        public double Price { get; set; }
        public bool IsTrendingProduct { get; set; }
        public int CategoryId { get; set; }
        public string FullImageUrl => AppSetting.ApiUrl + ImageUrl;
    }
}
