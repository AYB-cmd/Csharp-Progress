﻿using System;
using System.Collections.Generic;
using System.Text;

namespace RealWorldApp.Model
{
    public class Product
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Detail { get; set; }
        public double Price { get; set; }
        public int CategoryId { get; set; }
        public string ImageUrl { get; set; }
        public string FullImageUrl => AppSetting.ApiUrl + ImageUrl;
    }
}
