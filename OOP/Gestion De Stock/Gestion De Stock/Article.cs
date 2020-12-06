using System;
using System.Collections.Generic;
using System.Text;

namespace Gestion_De_Stock
{
    class Article
    {
        int reference;
        string name;
        double priceSell;
        double priceBuy;


        public Article(int articaleReference, string articaleName, double sellArticle,double buyArticle)
        {
            reference = articaleReference;
            name = articaleName;
            priceSell = sellArticle;
            priceBuy = buyArticle;

            if(priceSell < priceBuy)
            {
                throw new NotImplementedException("Attention,  !");
            }
        }
    }
}
