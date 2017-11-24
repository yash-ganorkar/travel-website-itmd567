using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Xml;
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
                        state = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes[i].ChildNodes[6].InnerText,// state
                        centroid = doc.DocumentElement.ChildNodes[1].ChildNodes[0].ChildNodes[1].ChildNodes[i].ChildNodes[0].InnerText
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
                    subtotal = Convert.ToDouble(doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[4].InnerText),
                    taxesandfees = Convert.ToDouble(doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[5].InnerText),
                    totalprice = Convert.ToDouble(doc.DocumentElement.ChildNodes[2].ChildNodes[i].ChildNodes[6].InnerText),
                };

                var city = neighborHoodDetails.Single(s => s.id == hrd.id).city;
                var state = neighborHoodDetails.Single(s => s.id == hrd.id).state;
                var name = neighborHoodDetails.Single(s => s.id == hrd.id).name;
                var centroid = neighborHoodDetails.Single(s => s.id == hrd.id).centroid;
                hrd.city = city;
                hrd.state = state;
                hrd.name = name;
                hrd.centroid = centroid;
                PaymentDetails pd = new PaymentDetails();
                hrd.paymentdetails = pd;
                hotelRoomDetails.Add(hrd);
            }
            if (hotelRoomDetails != null)
                hotelRoomDetails = hotelRoomDetails.OrderBy(p => p.totalprice).ToList();
            return hotelRoomDetails;
        }

        [HttpPost]
        [ActionName("ConfirmHotelBooking")]
        public Object ConfirmHotelBooking(HotelPayment hotelPayment)
        {

            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    connection.Open();
                    string sql = "INSERT INTO Payment(PaymentAmount,PaymentDate,StripePaymentID, UserID) VALUES(@param1,@param2,@param3,@param4); SELECT TOP 1 (PaymentID) from Payment order by PaymentID desc";
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.Add("@param1", SqlDbType.Float).Value = hotelPayment.paymentDetails.PaymentAmount / 10000;
                    cmd.Parameters.Add("@param2", SqlDbType.DateTime).Value = hotelPayment.paymentDetails.PaymentDate;
                    cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = hotelPayment.paymentDetails.StripePaymentID;
                    cmd.Parameters.Add("@param4", SqlDbType.NVarChar).Value = hotelPayment.paymentDetails.UserID;
                    cmd.CommandType = CommandType.Text;

                    var newId = cmd.ExecuteScalar();

                    sql = "INSERT INTO HotelBooking(UserID,PaymentID,HotelName,NumberOfGuests,NumberOfRooms,Location,CheckInDate,CheckOutDate) VALUES(@param1,@param2,@param3,@param4,@param5,@param6,@param7,@param8); SELECT TOP 1 (HotelID) from HotelBooking order by HotelID desc";
                    cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.Add("@param1", SqlDbType.NVarChar).Value = hotelPayment.paymentDetails.UserID;
                    cmd.Parameters.Add("@param2", SqlDbType.Int).Value = newId;
                    cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = hotelPayment.HotelName;
                    cmd.Parameters.Add("@param4", SqlDbType.Int).Value = hotelPayment.NumberOfGuests;
                    cmd.Parameters.Add("@param5", SqlDbType.NVarChar).Value = hotelPayment.NumberOfRooms;
                    cmd.Parameters.Add("@param6", SqlDbType.NVarChar).Value = hotelPayment.Location;
                    cmd.Parameters.Add("@param7", SqlDbType.NVarChar).Value = hotelPayment.CheckInDate;
                    cmd.Parameters.Add("@param8", SqlDbType.NVarChar).Value = hotelPayment.CheckOutDate;

                    cmd.CommandType = CommandType.Text;

                    newId = cmd.ExecuteScalar();
                    connection.Close();

                    return newId;
                }
            }
            catch (Exception ex)
            {
                Exceptions exceptions = new Exceptions();
                exceptions.ExceptionMessage = "Error in BookFlight() :" + ex.InnerException;
                return exceptions;
            }
        }
    }
}