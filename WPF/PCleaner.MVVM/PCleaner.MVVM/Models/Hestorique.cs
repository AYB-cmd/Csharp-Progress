using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace PCleaner.MVVM.Models
{
    public class Hestorique
    {
        public string FileName { get; }
        private List<Statement> _list = new List<Statement>();

        public Hestorique()
        {
            FileName = "Hestorique";
        }
      

        public void Add(Statement q)
        {
            _list.Add(q);
        }

        public void Save()
        {
           
                XmlSerializer xmlFormat = new XmlSerializer(typeof(List<Statement>));
                Stream fStream = new FileStream(FileName, FileMode.Create, FileAccess.Write);
                xmlFormat.Serialize(fStream, _list);
                fStream.Close();       
        }
     

        public List<Statement> Load()
        {
            XmlSerializer xmlFormat = new XmlSerializer(typeof(List<Statement>));
            Stream fStream = new FileStream(FileName, FileMode.Open, FileAccess.Read);
            _list = (List<Statement>)xmlFormat.Deserialize(fStream);
            fStream.Close();
            return _list;
             
        }

        public void RightToHestoric( Statement s)
        {
            if (File.Exists(FileName))
            {
                Load();
                Add(s);
                Save();
            }
            else
            {
                Add(s);
                Save();
            }
        }
       public string  LastAnalyse()
        {
           string D = "You did not analyse your Computer yet";

            if (File.Exists(FileName))
            {
                Load();

                D = _list[_list.Count - 1 ].Date.ToString();
            }

            return D;
        }
    
        /*public List<Statement> List => _list;*/
    }
}
