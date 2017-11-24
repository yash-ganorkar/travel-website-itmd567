using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class CarBooking
    {
        public string UserID { get; set; }
        public int PaymentID { get; set; }
        public string CarType { get; set; }
        public string PossibleModels { get; set; }
        public string PickUpLocation { get; set; }
        public string PickUpDate { get; set; }
        public string PickUpTime { get; set; }
        public string DropOffDate { get; set; }
        public string DropOffTime { get; set; }
        public PaymentDetails paymentDetails { get; set; }

    }
}