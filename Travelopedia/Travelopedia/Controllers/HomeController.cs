using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Travelopedia.Models;

namespace Travelopedia.Controllers
{
    public class HomeController : ApiController
    {
        List<UserModel> UserDet = new List<UserModel>()
        {
            new UserModel {UserId=1,Name="Shruti" },
            new UserModel {UserId=2,Name="Yash" }

        };
        [HttpGet]
        public IEnumerable<UserModel> GETUserDetails()
        {
            return UserDet;
        }
    }
}
