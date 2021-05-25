using System;
using System.Collections.Generic;
using System.Text;

namespace VAR
{
    public class Tva
    {
        public double TTC(double arg)
        {
            double result;

            double Tva = (arg / 100) * 19;
            result = arg + Tva;
            return result;
        }
    }
}
