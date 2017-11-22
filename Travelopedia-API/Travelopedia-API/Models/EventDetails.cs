using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class EventDetails
    {
        public List<EventResults> eventResults { get; set; }
        public Exceptions ExceptionDetails { get; set; }
    }
    public class EventResults
    {
        public string cityname { get; set; }
        public string venueaddress { get; set; }
    }
}