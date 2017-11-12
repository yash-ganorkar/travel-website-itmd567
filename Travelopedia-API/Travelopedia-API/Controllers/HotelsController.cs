using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Xml;
using System.Xml.Serialization;
using Travelopedia_API.Models;

namespace Travelopedia_API.Controllers
{
    public class HotelsController : ApiController
    {
        
        public string responseString;
        public HotelDetails hotelDetails;
        public List<NeighborhoodDetails> neighborHoodDetails;
        public Exceptions exceptions;

        [HttpGet]
        [ActionName("AllHotels")]
        public HotelDetails FetchAllHotels(string destination, int rooms, int adults, int children, string startdate, string enddate)
        {
            try
            {
                hotelDetails = new HotelDetails();
                XmlDocument doc = new XmlDocument();
               
                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://api.hotwire.com/v1/search/hotel");
                    string urlParams = "?apikey=8mgjwdbgs6pxuupdwmje72uu&dest=" + destination + "&rooms=" + rooms + "&adults=" + adults + "&children=" + children + "&startdate=" + startdate + "&enddate=" + enddate;
                    // client.DefaultRequestHeaders.Accept.Clear();
                    // client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    var response = client.GetAsync(urlParams).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        responseString = response.Content.ReadAsStringAsync().Result;
                        doc.LoadXml(responseString);

                        if (doc.DocumentElement.ChildNodes[0].ChildNodes.Count == 0)
                        {
                            GetNeighborHoodDetails(doc);
                            hotelDetails.hotelRoomDetails = GetHotelRoomDetails(doc);
                        }
                        else
                        {

                            Exceptions exceptions = new Exceptions();
                            exceptions.ExceptionMessage = doc.DocumentElement.ChildNodes[0].ChildNodes[0].ChildNodes[1].InnerText.ToString();
                            hotelDetails.hotelRoomDetails = null;
                            hotelDetails.ExceptionDetails = exceptions;
                        }
                    }

                    else
                    {
                        Exceptions exceptions = new Exceptions();
                        exceptions.ExceptionMessage = "Hotel Service API was not called successfully";
                        hotelDetails.hotelRoomDetails = null;
                        hotelDetails.ExceptionDetails = exceptions;

                    }

                }
                return hotelDetails;
            }
            catch(Exception ex)
            {
                Exceptions exceptions = new Exceptions();
                exceptions.ExceptionMessage = "Exception in FetchAllHotels(): " + ex.InnerException;
                hotelDetails.hotelRoomDetails = null;
                hotelDetails.ExceptionDetails = exceptions;
                return hotelDetails;
            }
        }

        private void GetNeighborHoodDetails(XmlDocument doc)
        {
            try
            {
                neighborHoodDetails = new List<NeighborhoodDetails>();
                for (var i = 0; i < doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes.Count; i++)
                {
                    NeighborhoodDetails nd = new NeighborhoodDetails()
                    {
                        city = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes[i].ChildNodes[1].InnerText,//city
                        id = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes[i].ChildNodes[3].InnerText,//id
                        name = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes[i].ChildNodes[4].InnerText,//Name
                        state = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes[i].ChildNodes[6].InnerText//state
                    };
                    neighborHoodDetails.Add(nd);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        private List<HotelRoomDetails> GetHotelRoomDetails(XmlDocument doc)
        {
            List<HotelRoomDetails> hotelRoomDetails = new List<HotelRoomDetails>();
            for (var i = 0; i < doc.DocumentElement.ChildNodes[2].ChildNodes.Count; i++)
            {
                HotelRoomDetails hrd = new HotelRoomDetails()
                {
                    currencyCode = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[0].InnerText,//currencyCode
                    id = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[10].InnerText,//id
                    checkindate = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[8].InnerText,
                    checkoutdate = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[9].InnerText,
                    deeplink = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[1].InnerText,
                    hotwirerefnumber = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[3].InnerText,
                    rooms = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[15].InnerText,
                    subtotal = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[4].InnerText,
                    taxesandfees = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[5].InnerText,
                    totalprice = doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[6].InnerText,
                };

                var city = neighborHoodDetails.Single(s => s.id == hrd.id).city;
                var state = neighborHoodDetails.Single(s => s.id == hrd.id).state;
                var name = neighborHoodDetails.Single(s => s.id == hrd.id).name;
                var centroid = neighborHoodDetails.Single(s => s.id == hrd.id).centroid;
                hrd.city = city;
                hrd.state = state;
                hrd.name = name;
                hrd.centroid = centroid;
                hotelRoomDetails.Add(hrd);
            }
            return hotelRoomDetails;
            throw new NotImplementedException();
        }

    }
}