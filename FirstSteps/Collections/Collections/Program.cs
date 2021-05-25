using System;
using System.Collections.Generic;

namespace Collections
{
    class Program
    {
        static void Main(string[] args)
        {

            //1.Créer une liste de mois, ajouter le nom des douze mois de l'année et afficher la collection.   
            var months = new List<string>()
                        {
                           "January",
                           "February",
                           "March",
                           "April",
                           "May",
                           "June",
                           "July",
                           "August",
                           "September",
                           "October",
                           "November",
                           "December"
                        };
            Console.WriteLine(string.Format("{0} .Q1.", months));

            //2.Afficher la valeur de la troisième ligne de cette liste (question 1).

            Console.WriteLine(string.Format("{0} .Q2.", months[2]));

            // 3.Avec la liste de l'exercice, afficher la valeur de l'index 5.

            Console.WriteLine(string.Format("{0} .Q3.", months[5]));
            //4.Parcourir tous les éléments de cette liste

            /////////////////////foreach loop///////////////////////////
            months.ForEach(month => Console.WriteLine(string.Format("{0} .Q4(Foreach loop).", month)));


            //////////////////////for loop//////////
            for (int i = 0; i < months.Count; i++)
            {
                Console.WriteLine(string.Format("{0} .Q4(For loop).", months[i]));
            }

           

            // 6.Insérer un élément dans la liste à la première position.
            months.Insert(0, "this should be the first element");
            Console.WriteLine(string.Format("{0} .Q6.",months[0]));

            // 7.Supprimer le troisième élément de cette liste.
            Console.WriteLine(string.Format("{0} .Q7.", months[2]));
            months.RemoveAt(2);
            Console.WriteLine(string.Format("{0} .Q7.", months[2]));

            // 8.Rechercher un élément dans cette liste
            string result = months.Find(item => item == "March");
            Console.WriteLine(string.Format("{0} .Q8.", result));
            int result2 = months.FindIndex(element => element == "March");
            Console.WriteLine("FINDINDEX: {0} .Q8.", result2);
            //9.Trier cette liste
            months.Sort();
            months.ForEach(month => Console.WriteLine(string.Format("{0} .Q9(SORT).", month)));

            // 10.Copier cette liste dans une autre

            List<string> monthsOfTheYear = new List<string>(months);
            monthsOfTheYear.ForEach(month => Console.WriteLine(string.Format("{0} Debuging MonthsOfTheYear List .Q10.", month)));


            


        }   
    }
}
