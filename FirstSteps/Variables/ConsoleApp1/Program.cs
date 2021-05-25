using System;

namespace VAR
{
    class Program
    {
        static void Main(string[] args)
        {
            InputConverter inputConverter = new InputConverter();
            Tva tva = new Tva();

            Console.WriteLine("product Name");
            var productName = Console.ReadLine();
            Console.WriteLine("product Price");
            double productPrice = inputConverter.ConvertInputToNumberic(Console.ReadLine());

            double result = tva.TTC(productPrice);
            Console.WriteLine(string.Format("Your product name is {0}  price HT: {1} price with Tva: {2}", productName, productPrice, result));

        }
    }
}
