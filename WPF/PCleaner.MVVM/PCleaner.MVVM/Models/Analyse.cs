using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PCleaner.MVVM.Models
{
    public class Analyse
    {
        // public string Path { get; set; }

        public DateTime DateAnalyse { get; }
        public long Cks { get; }
        public long Tmps { get; }


        public Analyse()
        {
            DateAnalyse = DateTime.Now;
        }
        public Analyse(DateTime date, long cks, long tmps)
        {
            DateAnalyse = date;
            Cks = cks;
            Tmps = tmps;
        }


        /// <summary>
        /// Calcul Cookies Size
        /// </summary>
        /// <returns> Size Type Long</returns>
        public static long Cookies()
        {
            DirectoryInfo path = new DirectoryInfo("C:/Users/youcode/AppData/Local/Google/Chrome/User Data/Default");
                
            long size = 0;
            FileInfo[] fis = path.GetFiles();
            foreach (FileInfo fi in fis)
            {
                if (fi.Name == "Cookies")
                    size = fi.Length;
            }


            return size / (1024 * 1024);

        }
        /// <summary>
        /// Calcul directory Size
        /// </summary>
        /// <returns> Size Type Long</returns>
        public static long Tmp()
        {
            DirectoryInfo path =  new DirectoryInfo("C:/Windows/Temp");
            long size = 0;
            FileInfo[] fis = path.GetFiles();
            foreach (FileInfo fi in fis)
            {
                size += fi.Length;
            }

           /* DirectoryInfo[] dis = path.GetDirectories();
            foreach (DirectoryInfo di in dis)
            {
                size += Tmp(di);
            }*/
            return size / (1024 * 1024);
        }
    }
}
