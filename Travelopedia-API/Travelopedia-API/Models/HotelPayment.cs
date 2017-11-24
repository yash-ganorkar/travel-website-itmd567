using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class HotelPayment
    {
        public string UserID { get; set; }
        public int PaymentID { get; set; }
        public string HotelName { get; set; }
        public int NumberOfGuests { get; set; }
        public int NumberOfRooms { get; set; }
        public string Location { get; set; }
        public string CheckInDate { get; set; }
        public string CheckOutDate { get; set; }
        public PaymentDetails paymentDetails { get; set; }
    }
}