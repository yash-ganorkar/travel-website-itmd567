using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class HotelDetails
    {
        public List<HotelRoomDetails> hotelRoomDetails { get; set; }
        public Exceptions ExceptionDetails { get; set; }

    }

    public class NeighborhoodDetails
    {
        
        public string city { get; set; }
        public string id { get; set; }
        public string name { get; set; }
        public string state { get; set; }
        public string centroid { get; set; }

    }

    public class HotelRoomDetails
    {
        public string currencyCode { get; set; }
        public string deeplink { get; set; }
        public string hotwirerefnumber { get; set; }
        public double subtotal { get; set; }
        public double taxesandfees { get; set; }
        public double totalprice { get; set; }
        public string checkindate { get; set; }
        public string checkoutdate { get; set; }
        public string rooms { get; set; }


        public string city { get; set; }
        public string id { get; set; }
        public string state { get; set; }
        public string name { get; set; }
        public string centroid { get; set; }
        public PaymentDetails paymentdetails { get; set; }
    }
}