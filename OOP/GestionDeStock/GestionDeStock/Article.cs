using System;
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




        public Article(string articleName, int articleReference, decimal buyPrice, decimal sellPrice)
        {
            Name = articleName;
            Reference = articleReference;
            Buy = buyPrice;
            Sell = sellPrice;

            if (Buy > Sell) throw new ArgumentException("sell price is less than buy price.");
        }

        public string ShowArticles()
        {

            /*Console.WriteLine("+----------+---------------+--------------+---------------+");
            Console.WriteLine("|   NAME   |   REFERENCE   |   BUYPRICE   |   SELLPRICE   |");
            Console.WriteLine("+----------+---------------+--------------+---------------+");*/
            Console.ForegroundColor = ConsoleColor.Red;
            string table = string.Format(@$"
                             +----------+---------------+--------------+---------------+
                             |   NAME   |   REFERENCE   |   BUYPRICE   |   SELLPRICE   |
                             +----------+---------------+--------------+---------------+
                                 {Name}          { Reference}              {Sell}               {Buy}     
                             |          |               |              |               |
                             +----------+---------------+--------------+---------------+");
            return table;


        }
    }
}
