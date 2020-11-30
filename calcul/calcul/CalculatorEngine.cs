using System;
using System.Collections.Generic;
using System.Text;

namespace calcul
{
    public class CalculatorEngine
    {
        public double Calculate(string argOperation, double argFirstNumber, double argSecondNumber)
        {
            double result;

            switch (argOperation.ToLower())
            {
                case "add":
                case "+":
                    result = argFirstNumber + argSecondNumber;
                    break;

                case "subtract":
                case "-":
                    result = argFirstNumber - argSecondNumber;
                    break;

                case "multiply":
                case "*":
                    result = argFirstNumber * argSecondNumber;
                    break;

                case "divide":
                case "/":
                    result = argFirstNumber / argSecondNumber;
                    break;
                case "modelo":
                case "%":
                    result = argFirstNumber % argSecondNumber;
                    break;
                default:
                    throw new InvalidOperationException("Specifies operation is not recognized");

            }
            return result;
        }
       
        
    }
}
