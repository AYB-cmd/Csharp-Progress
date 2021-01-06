using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PCleaner.MVVM.Models
{
    [Serializable]
    public class Statement
    {
        public DateTime Date { get; set; }
        public long Cookies { get; set; }
        public long Temps { get; set; }

        public Statement()
        {

        }


        public Statement( long cks, long tmps)
        {
            Date = DateTime.Now;
            Cookies = cks;
            Temps = tmps;
        }
      
       




    }
}
