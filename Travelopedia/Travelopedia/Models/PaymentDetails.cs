using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class PaymentDetails
    {
        public double PaymentAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public string StripePaymentID { get; set; }
        public string UserID { get; set; }
    }
}