using System;

namespace GestionDeStock
{
    class Program
    {
        static void Main(string[] args)
        {
            //initialize  stock class
            Stock stock = new Stock();
            //initialize the inputchecker class
            InputChecker inputChecker = new InputChecker();
            // refer to artical reference number 
            int reference = 0;
            Console.WriteLine("Welcome to the store.");
            
            //action will be a return number from choose method
                int action = ChooseAction();
              

            //Loop for program to keep running or to be closed once you want to
                while (action != 0)
                {
                try
                {


                    switch (action)
                    {

                        case 1:
                            //To auto-incremente  artical reference number 
                            
                            Console.WriteLine("You choose to add a new article to the inventory");

                            string articleName = "";
                            reference++;
                            decimal buyPrice = 0;
                            decimal sellPrice = 0;

                            Console.WriteLine("What is the article name?");
                            articleName = Console.ReadLine();

                            Console.WriteLine("What is the buy Price number?");
                            buyPrice = inputChecker.Numberic(Console.ReadLine());

                            Console.WriteLine("What is the sell  Price number?");
                            sellPrice = inputChecker.Numberic(Console.ReadLine());

                            inputChecker.Deffrence(buyPrice, sellPrice);

                            Article newArticle = new Article(articleName, reference, buyPrice, sellPrice);
                            stock.ArticleList.Add(newArticle);
                            Console.WriteLine("the article added Successfully ");
                            break;

                        case 2:
                            
                            PrintInventory(stock);
                            break;

                    }

                    action = ChooseAction();
                }
                catch (Exception ex)
                {
                    reference--;
                    Console.WriteLine(ex.Message);
                }

            }
            


        }




        private static void PrintInventory(Stock stock)
        {
            if (stock.ArticleList.Count == 0)
            {
                Console.WriteLine("Inventory is empty choose (1) TO ADD A NEW ARTICLE TO INVENTORY");
            }
            for ( int i = 0; i < stock.ArticleList.Count; i++)
            {
               
                Console.WriteLine("Article : {1}",stock.ArticleList[i].SowArticles());
            }
        }



        private static int ChooseAction()
        {
            InputChecker inputChecker = new InputChecker();
           
            

                decimal choice;
                Console.WriteLine("choose an action (0) to quit (1) to add a new article to inventory (2) checkout the inventory");
                choice = inputChecker.Numberic(Console.ReadLine());
                return (int)choice;
            
          
            
        }
    }
}
