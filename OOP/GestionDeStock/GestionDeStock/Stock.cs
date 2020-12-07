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




        public void DeleteArticle(Stock stock,int SelectedArticle)
        {
            
            if (stock.ArticleList.Count < SelectedArticle)
            {
                Console.WriteLine("Articale number is invalid ");
            }
            else
            {
                for (int i = 0; i < stock.ArticleList.Count; i++)
                {
                    stock.ArticleList.RemoveAt(SelectedArticle - 1);
                    Console.WriteLine("Successfully Deleted");
                }
            }

        }

        public void AddArticle( Stock stock, string articleName, int reference, decimal buyPrice,decimal sellPrice)
        {
           

            Article newArticle = new Article(articleName, reference, buyPrice, sellPrice);
            stock.ArticleList.Add(newArticle);
            Console.WriteLine("the article added Successfully ");
        }

       
            
    }
    
}
