using System;
using System.Collections.Generic;
using System.Text;
using static System.Console;

namespace Gestion_de_Bank
{
    class Navigate
    {
        public void start()
        {
            Title = "Bank Management.";
            RunNavigate();




        }
        public void RunNavigate()
        {
            string prompt = "welcome to bank management";
            string[] options = { "choice 1", "choice 2", "Exit" };
            Menu mainMenu = new Menu(prompt, options);
            int selectedIndex = mainMenu.Run();

            switch (selectedIndex)
            {
                case 0:
                    firstChoice();
                    break;
                case 1:
                    secendChoice();
                    break;
                case 2:
                    exit();
                    break;
            }
        }
        public void firstChoice()
        {
            string prompt = "this is you choices ";
            string[] options = { "wahad", "jouj", "tlata", "Exit" };
            Menu mainMenu = new Menu(prompt, options);
            int selectedIndex = mainMenu.Run();

            switch (selectedIndex)
            {
                case 0:
                    Lowla();
                    break;
                case 1:
                    secendChoice();
                    break;
                case 2:
                    Console.WriteLine("hsalti"); 
                    break;
                case 3:
                    exit();
                    break;
            }
        }


        public void secendChoice()
        {
            WriteLine("You selecte Two");
            ReadKey(true);
            RunNavigate();

        }
        public void exit()
        {
            WriteLine("GoodBye");
            ReadKey(true);
            Environment.Exit(0);
        }
        public void Lowla()
        {
            Console.WriteLine("baraka 3lik rja3 lpage lowla");
            ReadKey(true);
            RunNavigate(); 
        }
    }
}
