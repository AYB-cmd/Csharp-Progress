using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PCleaner.MVVM.Models
{
    class Analyse
    {
        public string Path { get; set; }
        public Analyse()
        {
                
        }
        public Analyse(string path)
        {
            Path = path;
        }

        /// <summary>
        /// Calcul Cookies Size
        /// </summary>
        /// <param name="d"> Directory path</param>
        /// <returns> Size Type Long</returns>
        public static long Cookies(DirectoryInfo d)
        {
            long size = 0;
            FileInfo[] fis = d.GetFiles();
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
        /// <param name="d"> Directory Path</param>
        /// <returns> Size Type Long</returns>
        public static long Tmp(DirectoryInfo d)
        {
            long size = 0;
            FileInfo[] fis = d.GetFiles();
            foreach (FileInfo fi in fis)
            {
                size += fi.Length;
            }

            DirectoryInfo[] dis = d.GetDirectories();
            foreach (DirectoryInfo di in dis)
            {
                size += Tmp(di);
            }
            return size / (1024 * 1024);
        }
    }
}
