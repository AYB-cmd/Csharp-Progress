using System;

namespace GestionDeStock
{
    class Program
    {
        static void Main(string[] args)
        {


            
            //initialize  Stock class
            Stock stock = new Stock();
            //initialize the inputchecker class
            InputChecker inputChecker = new InputChecker();


            Console.ForegroundColor = ConsoleColor.DarkBlue;

            //Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + (" @{Store}".Length / 2)) + "}", "{Store}"));
            Console.WindowWidth = 130;
            Console.WriteLine(@"
     ██████╗ ███████╗███████╗████████╗██╗ ██████╗ ███╗   ██╗    ██████╗ ███████╗    ███████╗████████╗ ██████╗  ██████╗██╗  ██╗
    ██╔════╝ ██╔════╝██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║    ██╔══██╗██╔════╝    ██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝
    ██║  ███╗█████╗  ███████╗   ██║   ██║██║   ██║██╔██╗ ██║    ██║  ██║█████╗      ███████╗   ██║   ██║   ██║██║     █████╔╝ 
    ██║   ██║██╔══╝  ╚════██║   ██║   ██║██║   ██║██║╚██╗██║    ██║  ██║██╔══╝      ╚════██║   ██║   ██║   ██║██║     ██╔═██╗ 
    ╚██████╔╝███████╗███████║   ██║   ██║╚██████╔╝██║ ╚████║    ██████╔╝███████╗    ███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗
    ╚═════╝ ╚══════╝╚══════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝    ╚═════╝ ╚══════╝    ╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝
                                                                                                                          
");
            
            Console.ResetColor();

            // refer to artical reference number 

            int reference = stock.ArticleList.Count;


            //action will be a return number from choose method
            var action = ChooseAction();
           


            //Loop for program to keep running or to be closed once you want to
            while (action != 0)
            {
                
                try
                {
                    
                    

                    switch (action)
                    {
                        /*case -1:
                            ChooseAction();
                            break;*/
                        
                        case 1:
                            //To auto-incremente  artical reference number 
                            Console.Clear();
                            Console.ForegroundColor = ConsoleColor.Blue;
                            Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + ("You choose to add a new article to the inventory".Length / 2)) + "}", "You choose to add a new article to the inventory"));
                            Console.ResetColor();
                            
                            reference++;

                            Console.WriteLine("What is the article name?");
                            string articleName = Console.ReadLine();

                            Console.WriteLine("What is the buy Price number?");
                            decimal buyPrice = inputChecker.Numberic(Console.ReadLine());

                            Console.WriteLine("What is the sell  Price number?");
                            decimal sellPrice = inputChecker.Numberic(Console.ReadLine());

                            /*inputChecker.Deffrence(buyPrice, sellPrice);*/


                            stock.Add(stock, articleName, reference, buyPrice, sellPrice);
                            Console.Clear();
                            break;

                        case 2:
                            Console.Clear();
                            PrintInventory(stock);
                            
                            break;
                        case 3:
                            Console.Clear();
                            Console.ForegroundColor = ConsoleColor.Blue;
                            Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + ("You choose to delete an article pls type The Articale Number.".Length / 2)) + "}", "You choose to delete an article pls type The Articale Number."));
                            Console.ResetColor();

                            
                            int delete = (int)inputChecker.Numberic(Console.ReadLine());
                            stock.Delete(stock, delete);
                            Console.Clear();
                            break;
                        case 4:
                            if (stock.ArticleList.Count == 0)
                            {
                                Console.WriteLine("there is nothing to modify");
                            }
                            else
                            {
                                Console.Clear();
                                Console.ForegroundColor = ConsoleColor.Blue;
                                Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + ("You choose to modify an Article pls type The Articale Number.".Length / 2)) + "}", "You choose to modify an Article pls type The Articale Number."));
                                Console.ResetColor();

                               
                                int modify = (int)inputChecker.Numberic(Console.ReadLine());


                                Console.WriteLine("Modify article name?");
                                string newArticleName = Console.ReadLine();

                                Console.WriteLine("Modify buy Price ?");
                                decimal newBuyPrice = inputChecker.Numberic(Console.ReadLine());

                                Console.WriteLine("Modify sell Price ?");
                                decimal newSellPrice = inputChecker.Numberic(Console.ReadLine());

                                stock.Modify(stock, modify, newArticleName, newBuyPrice, newSellPrice);
                                Console.Clear();
                            }
                           

                            /* int modify = (int)inputChecker.Numberic(Console.ReadLine());
                             stock.ModifyArticle(stock, modify);*/
                            break;

                        case 5:
                            Console.Clear();
                            Console.ForegroundColor = ConsoleColor.Blue;
                            Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + ("pls type Your search method By( name,reference,sellprice,buyprice,greater than):".Length / 2)) + "}", "pls type Your search method By( name,reference,sellprice,buyprice,greater than):"));
                            Console.ResetColor();
                            
                            string searchmethod = Console.ReadLine();

                            Console.WriteLine(SearchQuestion(searchmethod)); 
                            string keyWord = Console.ReadLine().ToLower();

                            stock.Search(stock,searchmethod,keyWord);
                            break;

                            Console.Clear();
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
            else
            {
                for (int i = 0; i < stock.ArticleList.Count; i++)
                {

                    Console.WriteLine("Article #{0}: {1}", i + 1, stock.ArticleList[i].ShowArticles());
                }
                Console.ReadKey();
            }

        }

        

        private static int ChooseAction()
        {
            InputChecker inputChecker = new InputChecker();

            decimal choice;

            Console.ForegroundColor = ConsoleColor.Blue;

            Console.WriteLine("--------------------------------------------------------- \n choose an action : \n ------------------\n          (1) to add a new article to inventory.\n          (2) checkout the inventory.\n          (3) Delete article.\n          (4) Modify an article.\n          (5) search an article.\n          (0) to quit.\n---------------------------------------------------------");
            Console.ResetColor();
            choice = inputChecker.Numberic(Console.ReadLine());
           
            return (int)choice;

        }

        private static string SearchQuestion(string chosenInput) 
        {
            string msg  = "";

            if(chosenInput.ToLower() == "name" )
            {
                msg = "please type article name";

                
            }
            else if(chosenInput.ToLower() == "reference")
            {
               msg = "please type the reference Number";

                
            }
            else if (chosenInput.ToLower() == "sellprice" || chosenInput.ToLower() == "buyprice" || chosenInput.ToLower() ==  "greater than")
            {
                msg = "please type a price";

        
            }
           
            else
            {
                throw new ArgumentException("Invalid Option");
            }

            return msg;
           
            
        }
        
    }
}
