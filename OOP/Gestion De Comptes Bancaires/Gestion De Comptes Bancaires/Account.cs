using System;
using System.Collections.Generic;
using System.Text;

namespace Gestion_De_Comptes_Bancaires
{
    abstract class Account
    {
        public int NumeroCompte { get; }
        public string Nom { get; }
        public int Sold { get; set; }

        public Account(int num, string nom, int sold)
        {
            NumeroCompte = num;
            Nom = nom;
            Sold = sold;
        }


        public abstract void Credit();
       
        public abstract void debiter();
    }
}
