using System;
using System.Collections.Concurrent;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HangMan
{
    class Program
    {
        static void Main(string[] args)
        {
            bool a = true;
            Console.WriteLine("Welcome to hangman!");

            string[] listwords = new string[10];
            listwords[0] = "sheep";
            listwords[1] = "goat";
            listwords[2] = "computer";
            listwords[3] = "america";
            listwords[4] = "watermelon";
            listwords[5] = "icecream";
            listwords[6] = "jasmine";
            listwords[7] = "pineapple";
            listwords[8] = "orange";
            listwords[9] = "mango";

            Random randGen = new Random();

            var idx = randGen.Next(0, 10);

            String mysteryWord = listwords[idx];

            char[] guess = new char[mysteryWord.Length];

            Console.WriteLine("Please Enter your guess:");
            
            for (int p = 0;p< mysteryWord.Length; p++) guess[p] = '*';

            while (a)
            {
                char playerGuess = char.Parse(Console.ReadLine());
                for (int j = 0; j < mysteryWord.Length; j++)
                {
                    if (playerGuess == mysteryWord[j])  
                        guess[j] = playerGuess; 
                }
                Console.WriteLine(guess);
                if (new string(guess) == mysteryWord)
                    a = false;
            }
            Console.WriteLine("you got the word :)");
            Console.Read();

            

        }
    }
}
