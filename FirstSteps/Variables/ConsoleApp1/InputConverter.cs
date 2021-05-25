using System;
using System.Collections.Generic;
using System.Text;

namespace VAR
{
    class InputConverter
    {
        public double ConvertInputToNumberic(string argTextInput)
        {
            double convertedNumber;
            if (!double.TryParse(argTextInput, out convertedNumber)) throw new ArgumentException("Expected a numeric value.");
            return convertedNumber;
        }
    }
}
