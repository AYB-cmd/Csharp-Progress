using System;
using System.Collections.Generic;
using System.Text;

namespace RealWorldApp.Model
{
    public class AddToCart
    {
        public int Price { get; set; }
        public int Qty { get; set; }
        public int ProductId { get; set; }
        public int CustomerId { get; set; }
    }
}
