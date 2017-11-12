using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Travelopedia_API.Models
{
    public class CarDetails
    {
        public List<CarResult> carResults { get; set; }
        public Exceptions ExceptionDetails { get; set; }
    }

    public class CarTypes
    {
        public string TypicalSeating { get; set; }
        public string CarTypeName { get; set; }
        public string CarTypeCode { get; set; }
        public string PossibleModels { get; set; }
        public string PossibleFeatures { get; set; }

    }

    public class CarResult
    {
        public string DeepLink { get; set; }
        public string HWRefNumber { get; set; }
        public string SubTotal { get; set; }
        public string TaxesAndFees { get; set; }

        public string TotalPrice { get; set; }
        public string CarTypeCode { get; set; }
        public string DailyRate { get; set; }
        public string DropoffDay { get; set; }
        public string DropoffTime { get; set; }
        public string PickupDay { get; set; }

        public string PickupTime { get; set; }
        public string MileageDescription { get; set; }
        public string RentalAgency { get; set; }
        public string RentalDays { get; set; }
        public string VendorLocation { get; set; }

        public string TypicalSeating { get; set; }
        public string CarTypeName { get; set; }
        public string PossibleModels { get; set; }
        public string PossibleFeatures { get; set; }

    }
}