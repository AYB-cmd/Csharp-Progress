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




        public void Delete(Stock stock, int selectedArticle)
        {

            if (stock.ArticleList.Count < selectedArticle)
            {
                Console.WriteLine("Articale number is invalid ");
            }
            else
            {
                for (int i = 0; i < stock.ArticleList.Count; i++)
                {
                    stock.ArticleList.RemoveAt(selectedArticle - 1);
                    Console.WriteLine("Successfully Deleted");
                }
            }

        }


        public void Add(Stock stock, string articleName, int reference, decimal buyPrice, decimal sellPrice)
        {


            Article newArticle = new Article(articleName, reference, buyPrice, sellPrice);
            stock.ArticleList.Add(newArticle);
            Console.WriteLine("the article added Successfully ");
        }

        public void Modify(Stock stock, int selectedArticle, string articleName, decimal buyPrice, decimal sellPrice)
        {
            var result = stock.ArticleList[selectedArticle - 1];

            result.Name = articleName;
            result.Buy = buyPrice;
            result.Sell = sellPrice;

            Console.WriteLine("Article Update Seccussfelly");

        }

        public void Search(Stock stock, string searchMethode, string keyWord)
        {

            //search by article name
            switch (searchMethode)
            {
                case "name":

                    for (int i = 0; i < stock.ArticleList.Count; i++)
                    {
                        var article = ArticleList[i].Name;
                        if (article == keyWord)
                        {
                            Console.WriteLine(ArticleList[i].ShowArticles());
                        }

                    }
                    break;

                case "reference":
                    int refernceNumber = Convert.ToInt32(keyWord);
                    for (int i = 0; i < stock.ArticleList.Count; i++)
                    {
                        var article = ArticleList[i].Reference;
                        
                        if (article == refernceNumber)
                        {
                            Console.WriteLine(ArticleList[i].ShowArticles());
                        }

                    }
                    break;
                case "buyprice":
                    decimal buyprice = Convert.ToDecimal(keyWord);
                    for (int i = 0; i < stock.ArticleList.Count; i++)
                    {
                        var article = ArticleList[i].Buy;
                        if (article == buyprice)
                        {
                            Console.WriteLine(ArticleList[i].ShowArticles());
                        }

                    }

                    break;
                case "sellprice":
                    decimal sellprice = Convert.ToDecimal(keyWord);
                    for (int i = 0; i < stock.ArticleList.Count; i++)
                    {
                        var article = ArticleList[i].Sell;
                        if (article == sellprice)
                        {
                            Console.WriteLine(ArticleList[i].ShowArticles());
                        }

                    }

                    break;


                default:
                    throw new ArgumentException("Invalid Option");


            }



            /*var result = stock.ArticleList[selectedArticle - 1];*/
        }

    }
}

