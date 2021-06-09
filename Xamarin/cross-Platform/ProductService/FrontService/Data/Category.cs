using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace FrontService.Data
{
    public class Category
    {

        [Key]
        public int Id { get; set; }
        public string Name { get; set; }
        public string ImageUrl { get; set; }
        public string FullImageUrl => AppSetting.ApiUrl + ImageUrl;

    }
}

