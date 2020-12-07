using System;
using System.Collections.Generic;
using System.Text;

namespace GestionDeStock
{
    class InputChecker
    {
       

        public void  Deffrence(decimal argBuy, decimal argSell)
        {

            if (argBuy > argSell) throw new ArgumentException("sell price is less than buy price.");

        }


        public decimal Numberic(string argTextInput)
            {

                decimal convertedNumber;
                if (!decimal.TryParse(argTextInput, out convertedNumber)) throw new ArgumentException("Please Enter a numberic value.");
                return convertedNumber;
            }



       

    }
}
