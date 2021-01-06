using System;
using System.Collections.Generic;
using System.Text;

namespace TrueFalseGame
{
    [Serializable]
    public class Statement
    {
        public string Text { get; set; }
        public bool IsTrue { get; set; }
        public Statement()
        {
        }
        public Statement(string text,bool isTrue)
        {
            Text = text;
            IsTrue = isTrue;
        }

        
    }
}
