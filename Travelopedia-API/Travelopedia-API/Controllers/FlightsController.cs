using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Google.Apis.QPXExpress.v1;
using Google.Apis.QPXExpress.v1.Data;
using Google.Apis.Services;
using Newtonsoft.Json;
using System.Web.Http.Cors;
using Travelopedia_API.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace Travelopedia_API.Controllers
{
    public class FlightsController : ApiController
    {
        [HttpPost]
        [ActionName("AllFlights")]
        public Object FetchAllFlights(TripsSearchRequest tripSearchRequest)
        {
            try
            {
                QPXExpressService service = new QPXExpressService(new BaseClientService.Initializer()
                {
                    ApiKey = "AIzaSyAJ1NjLJLHj2IyiQa1SYfiRiYiDSw_RBhg",
                    ApplicationName = "API key 1",
                });
                //var result = new TripsSearchResponse();
                var result = service.Trips.Search(tripSearchRequest).Execute();
                var json = JsonConvert.SerializeObject(result);
                return result;
            }
            catch(Exception ex)
            {
                Exceptions exceptions = new Exceptions();
                exceptions.ExceptionMessage = "Error in BookFlight() :" + ex.InnerException;
                return exceptions;

            }

        }

        [HttpPost]
        [ActionName("ConfirmFlight")]
        public Object BookFlight(FlightDetails bookingDetails)
        {
            
            try
            {
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    connection.Open();
                    string sql = "INSERT INTO Payment(PaymentAmount,PaymentDate,StripePaymentID, UserID) VALUES(@param1,@param2,@param3,@param4); SELECT TOP 1 (PaymentID) from Payment order by PaymentID desc";
                    SqlCommand cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.Add("@param1", SqlDbType.Float).Value = bookingDetails.paymentdetails.PaymentAmount/10000;
                        cmd.Parameters.Add("@param2", SqlDbType.DateTime).Value = bookingDetails.paymentdetails.PaymentDate;
                    cmd.Parameters.Add("@param3", SqlDbType.NVarChar).Value = bookingDetails.paymentdetails.StripePaymentID;
                    cmd.Parameters.Add("@param4", SqlDbType.NVarChar).Value = bookingDetails.paymentdetails.UserID;
                    cmd.CommandType = CommandType.Text;

                    var newId = cmd.ExecuteScalar();

                     sql = "INSERT INTO FlightBooking(UserID,PaymentID,FlightType,Source,Destination,Departure1Time,Departure1Date,Arrival1Time,Arrival1Date) VALUES(@param1,@param2,@param3,@param4,@param5,@param6,@param7,@param8,@param9); SELECT TOP 1 (FlightID) from FlightBooking order by FlightID desc";
                    cmd = new SqlCommand(sql, connection);
                    cmd.Parameters.Add("@param1", SqlDbType.NVarChar).Value = bookingDetails.paymentdetails.UserID;
                    cmd.Parameters.Add("@param2", SqlDbType.Int).Value = newId;
                    cmd.Parameters.Add("@param3", SqlDbType.VarChar).Value = bookingDetails.FlightType;
                    cmd.Parameters.Add("@param4", SqlDbType.VarChar).Value = bookingDetails.Source;
                    cmd.Parameters.Add("@param5", SqlDbType.VarChar).Value = bookingDetails.Destination;
                    cmd.Parameters.Add("@param6", SqlDbType.NVarChar).Value = bookingDetails.DepartureTime1;
                    cmd.Parameters.Add("@param7", SqlDbType.NVarChar).Value = bookingDetails.DepartureDate1;
                    cmd.Parameters.Add("@param8", SqlDbType.NVarChar).Value = bookingDetails.ArrivalTime1;
                    cmd.Parameters.Add("@param9", SqlDbType.NVarChar).Value = bookingDetails.ArrivalDate1;

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
        // GET api/<controller>
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post([FromBody]string value)
        {
        }

        // PUT api/<controller>/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
        }
    }
}