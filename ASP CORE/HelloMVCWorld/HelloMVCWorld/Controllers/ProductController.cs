using HelloMVCWorld.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HelloMVCWorld.Controllers
{
    public class ProductController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Details(int id)
        {
            Product product = new Product()
            {
                Title = "Toilet Paper",
                Price = 1.99
            };
            return View(product);
        }
    }
}
