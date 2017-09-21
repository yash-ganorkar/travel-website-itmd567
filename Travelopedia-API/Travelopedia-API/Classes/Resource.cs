using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Classes
{
    public class Resource
    {
        public static string GetConnection()
        {
            string connectionString = System.Configuration.ConfigurationManager.AppSettings["connectionString"];// ConfigurationSettings.AppSettings(Name) 
            return connectionString;
        }
        public static string GetConfig(string key)
        {
            return System.Configuration.ConfigurationManager.AppSettings[key];
        }
    }
}