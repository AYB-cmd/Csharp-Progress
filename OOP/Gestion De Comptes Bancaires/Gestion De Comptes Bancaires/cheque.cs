using System;
using System.Collections.Generic;
using System.Text;

namespace Gestion_De_Comptes_Bancaires
{
    class Cheque : Account
    {
        public int NemeroCheque { get; set; }
     

        public Cheque(int nemCheque, int num, string nom, int sold):base(num,nom,sold)
        {
            NemeroCheque = nemCheque;
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
