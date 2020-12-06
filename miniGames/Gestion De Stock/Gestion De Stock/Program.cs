using System;

namespace Gestion_De_Stock
{
    class Program
    {

        static void Main(string[] args)
        {
            Article firstArticle = new Article("first Article",00, 12,10);
            
            firstArticle.showName();

        }
        
    }
}
