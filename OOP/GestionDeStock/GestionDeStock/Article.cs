﻿using System;
using System.Collections.Generic;
using System.Text;

namespace GestionDeStock
{
    public class Article
    {
     

        public string Name { get; set; }
        public int Reference { get; set; }
        public decimal Sell { get; set; }
        public decimal Buy { get; set; }

        

        public Article()
        {
            Name = "nothing set";
            Reference = 0;
            Sell = 0.00M;
            Buy = 0.00M;
        }
        public Article(string articleName, int articleReference, decimal buyPrice, decimal sellPrice)
        {
            Name = articleName;
            Reference = articleReference;
            Buy = buyPrice;
            Sell = sellPrice;
            
        }

        public Article(decimal buyPrice, decimal sellPrice)
        {
            this.Buy = buyPrice;
            this.Sell = sellPrice;
        }

        public  string SowArticles()
        {
            return string.Format("Name: {0}. Reference Number: {1}. Sell price: {2}DH. Buy price: {3}DH", Name, Reference, Sell, Buy);
        }

    }
}
