using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia.Models
{
    public class PaymentDetails
    {
        public string Name { get; set; }

        public double PaymentAmount { get; set; }

        public string Email { get; set; }

        public string StripeTRNumber { get; set; }
    }
}