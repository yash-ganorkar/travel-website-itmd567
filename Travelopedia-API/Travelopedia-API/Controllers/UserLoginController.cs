using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Travelopedia_API.Models;

namespace Travelopedia_API.Controllers
{
    public class UserLoginController : ApiController
    {
        UserCredentials[] usercredentials = new UserCredentials[]
        {
            new UserCredentials { username="yash", password="yash" },
            new UserCredentials { username="shruti", password="shruti" }
        };

        [HttpGet]
        [ActionName("Login")]
        
        public IHttpActionResult CheckValidLogin(string username)
        {
            var validUser = usercredentials.FirstOrDefault((u) => u.username == username);

            if(validUser == null)
            {
                return NotFound();
            }
            return Ok(validUser);
        }

        [HttpGet]
        [ActionName("Login")]

        public IHttpActionResult GetAllLogin()
        {
            return Ok(usercredentials);
        }
    }
}
