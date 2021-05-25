using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace WEb_ServicesDemo
{
    /// <summary>
    /// Summary description for CalculatorWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class CalculatorWebService : System.Web.Services.WebService
    {

        [WebMethod(Description ="Calculator Application,  Parametres int firstValue,int secondValue, string operation(eg:+,-,*,/)")]
        public  string Calculator(int firstValue,int secondValue,string operation)
        {
            float result = 0;

            switch (operation)
            {
                case "+" : result = firstValue + secondValue;
                    break;
                case "-" : result = firstValue - secondValue;
                    break;
                case "*": result = firstValue * secondValue;
                    break;
                case "/":result = firstValue / secondValue;
                    break;
            }
            return result.ToString();
        }
    }
}
