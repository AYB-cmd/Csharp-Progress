using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace gestionDesEtudiants.Models
{
    public class RoleModel
    {
        public RoleModel(string name)
        {
            Name = name;
        }

        public string Name { get; set; }

    }
}
