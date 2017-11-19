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

namespace Travelopedia_API.Controllers
{
    public class FlightsController : ApiController
    {
        [HttpPost]
        [ActionName("AllFlights")]

        public TripsSearchResponse FetchAllFlights(TripsSearchRequest tripSearchRequest)
        {
            try
            {
                QPXExpressService service = new QPXExpressService(new BaseClientService.Initializer()
                {
                    ApiKey = "AIzaSyAJ1NjLJLHj2IyiQa1SYfiRiYiDSw_RBhg",
                    ApplicationName = "API key 1",
                });

                var result = service.Trips.Search(tripSearchRequest).Execute();
                var json = JsonConvert.SerializeObject(result);
                return result;
            }
            catch(Exception ex)
            {
                throw ex;
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