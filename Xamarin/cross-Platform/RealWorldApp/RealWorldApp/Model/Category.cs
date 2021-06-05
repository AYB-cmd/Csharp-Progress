using System;
using System.Collections.Generic;
using System.Text;

namespace RealWorldApp.Model
{
    public class Category
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public string FullImageUrl => AppSetting.ApiUrl + ImageUrl;
    }
}
