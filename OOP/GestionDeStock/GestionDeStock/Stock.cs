using System;
using System.Collections.Generic;
using System.Text;

namespace GestionDeStock
{
    class Stock
    {
        public List<Article> ArticleList { get; set; }
        public Stock()
        {
            ArticleList = new List<Article>();
        }


    }
    
}
