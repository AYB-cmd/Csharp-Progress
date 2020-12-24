using System;
using System.Collections.Generic;
using System.Text;

namespace Gestion_De_Comptes_Bancaires
{
    class Carnet : Account
    {
        public int NumeroCarnet { get; set; }
        public Carnet ()
        {

        }
        public Carnet(int sum)
        {

        }

        public override void Credit()
        {
            Console.WriteLine("this is credit of cheque");
        }
        public override void debiter()
        {
            Console.WriteLine("this is debiter of cheque");
        }
    }
}
