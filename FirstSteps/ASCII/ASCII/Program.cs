using  System;
using static  System.Console;

namespace ASCII
{
    class Program
    {
        static void Main(string[] args)
        {
            int input = Convert.ToInt32(Console.ReadLine());
            int x = 1;
            
            for(int i=2; i<input;i++)
            {
                if (input % i == 0) ;
                Console.WriteLine();
                
              if(x == 0)
                {

                    break;
                }
            }
            if(x == 0)
            {
                Console.WriteLine("rah machi p");
            }
            else
            {
                Console.WriteLine("rah  p");
            }

           
        }
    }
}
