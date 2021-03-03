using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace gestionDesEtudiants.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string Nom { get; set; }
        public string Prenom { get; set; }
        public string Cin { get; set; }
        public string Adresse { get; set; }
        public string Role { get; set; }
    }
}
