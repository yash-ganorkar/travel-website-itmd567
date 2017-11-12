using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Xml;
using Travelopedia_API.Models;

namespace Travelopedia_API.Controllers
{
    public class CarController : ApiController
    {
        public CarDetails carDetails;
        private string responseString;
        private List<CarTypes> carTypes;
        public Exceptions exceptions;

        [HttpGet]
        [ActionName("AllCars")]
        public CarDetails FetchAllCars(string location, string startdate, string enddate, string pickuptime, string dropofftime)
        {
            try
            {
                carDetails = new CarDetails();
                XmlDocument doc = new XmlDocument();
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://api.hotwire.com/v1/search/car");
                    string urlParams = "?apikey=8mgjwdbgs6pxuupdwmje72uu&dest=" + location + "&startdate=" + startdate + "&resultType=N&enddate=" + enddate + "&pickuptime=" + pickuptime + "&dropofftime=" + dropofftime;
                    // client.DefaultRequestHeaders.Accept.Clear();
                    // client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    var response = client.GetAsync(urlParams).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        responseString = response.Content.ReadAsStringAsync().Result;
                        doc.LoadXml(responseString);

                        if (doc.DocumentElement.ChildNodes[0].ChildNodes.Count == 0)
                        {
                            GetCarTypesDetails(doc);
                            carDetails.carResults = GetCarDetails(doc);
                        }

                        else
                        {

                            Exceptions exceptions = new Exceptions();
                            exceptions.ExceptionMessage = doc.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[1].InnerText.ToString();
                            carDetails.carResults = null;
                            carDetails.ExceptionDetails = exceptions;
                        }
                    }

                    else
                    {
                        Exceptions exceptions = new Exceptions();
                        exceptions.ExceptionMessage = "Car Service API was not called successfully";
                        carDetails.carResults = null;
                        carDetails.ExceptionDetails = exceptions;
                    }

                }

                return carDetails;

            }
            catch (Exception ex)
            {

                Exceptions exceptions = new Exceptions();
                exceptions.ExceptionMessage = "Error in FetchAllCars() :" + ex.InnerException;
                carDetails.carResults = null;
                carDetails.ExceptionDetails = exceptions;
                return carDetails;
            }
        }

        private void GetCarTypesDetails(XmlDocument doc)
        {
            carTypes = new List<CarTypes>();
            for (var i = 0; i < doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[0].ChildNodes.Count; i++)
            {
                CarTypes ct = new CarTypes()
                {
                    TypicalSeating = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[0].ChildNodes[i].ChildNodes[0].InnerText,//city
                    CarTypeName = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[0].ChildNodes[i].ChildNodes[1].InnerText,//id
                    CarTypeCode = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[0].ChildNodes[i].ChildNodes[2].InnerText,//Name
                    PossibleFeatures = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[0].ChildNodes[i].ChildNodes[3].InnerText,
                    PossibleModels = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[0].ChildNodes[i].ChildNodes[4].InnerText//state
                };
                carTypes.Add(ct);
            }
        }
        private List<CarResult> GetCarDetails(XmlDocument doc)
        {
            List<CarResult> carDetails = new List<CarResult>();
            for (var i = 0; i < doc.DocumentElement.ChildNodes[2].ChildNodes.Count; i++)
            {
                CarResult crd = new CarResult()
                {
                    DeepLink = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[1].InnerText,//currencyCode
                    HWRefNumber = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[3].InnerText,//id
                    SubTotal = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[4].InnerText,
                    TaxesAndFees = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[5].InnerText,
                    TotalPrice = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[6].InnerText,
                    CarTypeCode = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[7].InnerText,
                    DailyRate = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[8].InnerText,
                    DropoffDay = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[9].InnerText,
                    DropoffTime = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[10].InnerText,
                    PickupDay = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[11].InnerText,
                    PickupTime = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[12].InnerText,
                    MileageDescription = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[14].InnerText,
                    RentalAgency = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[17].InnerText,
                    RentalDays = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[18].InnerText,
                    VendorLocation = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[19].InnerText,
                };

                crd.TypicalSeating = carTypes.Single(s => s.CarTypeCode == crd.CarTypeCode).TypicalSeating;
                crd.CarTypeName = carTypes.Single(s => s.CarTypeCode == crd.CarTypeCode).CarTypeName;
                crd.PossibleModels = carTypes.Single(s => s.CarTypeCode == crd.CarTypeCode).PossibleModels;
                crd.PossibleFeatures = carTypes.Single(s => s.CarTypeCode == crd.CarTypeCode).PossibleFeatures;
                carDetails.Add(crd);
            }
            return carDetails;
        }
    }
}