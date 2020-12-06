using System;
using System.Collections.Generic;
using System.Text;

namespace Gestion_De_Stock
{
    public class Article
    {
        private string _articleName;

        private int _referenceNumber;

        private double _sellPrice;

        private double _buyPrice;

      /*  public string ArticleTitle
        {
            get
                {
                if (this._sellPrice < this._buyPrice)
                {
                    return string.Format("be aware {0} cost more than {1}", this._articleName, this._buyPrice);
                }
                
                }
        }*/
        public Article(string articleName, int referenceNumber, double sellPrice, double buyPrice)
        {
            this._articleName = articleName;
            this._referenceNumber = referenceNumber;
            this._sellPrice = sellPrice;
            this._buyPrice = buyPrice;

            
        }

        public void showName()
        {
            
            if (this._sellPrice > this._buyPrice)
            {
                Console.WriteLine(string.Format("be aware {0} cost more than {1}", this._articleName, this._buyPrice));
            }
        }
                
            


    }
}
