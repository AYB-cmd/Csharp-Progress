using System;
using System.IO;
using System.Text;

namespace calcul
{
    class Program
    {

       
        static void Main(string[] args)
        {
            
          
            
            Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + ("{|| WELCOME TO CALCULATOR CLI ||}".Length / 2)) + "}", "{||WELCOME TO CALCULATOR CLI||}"));

            var input = "";
                do
                {
                try
                        {

                            InputConverter inputConverter = new InputConverter();
                            CalculatorEngine calculatorEngine = new CalculatorEngine();
                        

                            Console.WriteLine("enter a Number: ");
                            double firstNumber = inputConverter.ConvertInputToNumberic(Console.ReadLine());
                            Console.WriteLine("enter your oparetion: ");
                            string operation = calculatorEngine.checkOperator(Console.ReadLine());
                            Console.WriteLine("enter a Number: ");
                            double secondNumber = inputConverter.ConvertInputToNumberic(Console.ReadLine());


                            double result = calculatorEngine.Calculate(operation, firstNumber, secondNumber);

                            Console.WriteLine("your result is: {0}", result);

                            Console.WriteLine(String.Format("{0," + ((Console.WindowWidth / 2) + ("{PRESS ENTRE TO Continue}".Length / 2)) + "}", "{PRESS ANY KEY TO Continue}"));
                            Console.WriteLine("PRESS 'Q' TO EXIT ");
                            input = Console.ReadLine();
                    
                        }

                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                    
                        }
                }
                while (input.ToLower() != "q");
           
        }
        
    }
}
