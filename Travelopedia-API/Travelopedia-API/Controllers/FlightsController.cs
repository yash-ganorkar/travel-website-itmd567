using System.Collections.Generic;
using System.Web.Http;
using Google.Apis.QPXExpress.v1;
using Google.Apis.QPXExpress.v1.Data;
using Google.Apis.Services;

namespace Travelopedia_API.Controllers
{
    public class FlightsController : ApiController
    {
        [HttpPost]
        [ActionName("AllFlights")]
        
        public TripsSearchResponse FetchAllFlights(TripsSearchRequest tripsSearchRequest)
        {
            QPXExpressService service = new QPXExpressService(new BaseClientService.Initializer()
            {
                ApiKey = "AIzaSyBOlWOYjzgML-FDW6wxgGxezzEokm0nUeI",
                ApplicationName = "API key 1",

            });
            var result = service.Trips.Search(tripsSearchRequest).Execute();
            return result;
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