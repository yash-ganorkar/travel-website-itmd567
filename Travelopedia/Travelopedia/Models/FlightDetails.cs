using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class FlightDetails
    {
        public string UserID { get; set; }
        public int PaymentID { get; set; }
        public string FlightType { get; set; }
        public string Source { get; set; }
        public string Destination { get; set; }
        public string DepartureTime1 { get; set; }
        public string DepartureDate1 { get; set; }
        public string ArrivalTime1 { get; set; }
        public string ArrivalDate1 { get; set; }
        public string DepartureTime2 { get; set; }
        public string DepartureDate2 { get; set; }
        public string ArrivalTime2 { get; set; }
        public string ArrivalDate2 { get; set; }

        public PaymentDetails paymentdetails { get; set; }
    }
}