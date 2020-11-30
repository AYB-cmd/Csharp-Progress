using System;

namespace loops
{
    class Program
    {
        static void Main(string[] args)
        {
            //loopOne();
            //loopTwo();
            //loopTree();
            //loopTFour();
            //loopTFive();
            loopTsix();
        }

        static void loopTsix()
        {
            int i = 200;
            while (i >= 0)
            {
                Console.WriteLine("Enfin!!!");
                i -= 12;
            }
        }

        static void loopTFive()
        {
            int i = 1;
            while (i <= 100)
            {
                Console.WriteLine("On tient le bon bout...");
                i +=15;
            }
        }
        static void loopTFour()
        {
            int i = 20;
            while (i >= 0)
            {
                Console.WriteLine("C'est presque bon...");
                i--;
            }
        }
        static void loopTree()
        {
            int i = 1;
            while (i <= 15)
            {
                Console.WriteLine("3");
                i++;
            }
        }
        static void loopTwo()
        {
            double i = 1;
            while(i <= 10)
            {
                Console.WriteLine(i);
                i += i/2;
            }
        }
        static void loopOne()
        {
            int i = 1;
            int n = 20;

            while (i < 30)
            {
                int result = i * n;
                Console.WriteLine(result);
                i++;
            }
        }
    }
}
