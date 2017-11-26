using Newtonsoft.Json;
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
    public class EventsController : ApiController
    {
        public string responseString;
        public EventDetails eventDetails;
        public Exceptions exceptions;

        [HttpGet]
        [ActionName("AllEvents")]
        public Object FetchAllEvents(string location)
        {
            try
            {
                eventDetails = new EventDetails();
                XmlDocument doc = new XmlDocument();
                var result = new Object();

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("https://www.eventbriteapi.com/v3/events/search/");
                    string urlParams = "?token=AE2GXLM3DCRXR3MFTDRX&location.address=" + location;
                    // client.DefaultRequestHeaders.Accept.Clear();
                    // client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    var response = client.GetAsync(urlParams).Result;

                    if (response.IsSuccessStatusCode)
                    {
                        
                        responseString = response.Content.ReadAsStringAsync().Result;
                       
                        return responseString;
                    }

                    else
                    {
                        Exceptions exceptions = new Exceptions();
                        exceptions.ExceptionMessage = "Events Service API was not called successfully";
                        eventDetails.eventResults = null;
                        eventDetails.ExceptionDetails = exceptions;

                    }

                }
                return eventDetails;
            }
            catch (Exception ex)
            {
                Exceptions exceptions = new Exceptions();
                exceptions.ExceptionMessage = "Exception in FetchAllEvents(): " + ex.InnerException;
                eventDetails.eventResults = null;
                eventDetails.ExceptionDetails = exceptions;
                return eventDetails;
            }
        }

        
    }
}
