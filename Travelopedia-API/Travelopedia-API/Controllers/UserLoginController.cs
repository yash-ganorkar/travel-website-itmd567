using System.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Travelopedia_API.Classes;
using Travelopedia_API.Models;

namespace Travelopedia_API.Controllers
{
    public class UserLoginController : ApiController
    {
        List<UserCredentials> userCredentials = new List<UserCredentials>();

        [HttpPost]
        [ActionName("Login")] 
        
        public IHttpActionResult CheckValidLogin(UserCredentials userCredential)
        {
            string connectionString = Resource.GetConnection();
            SqlDataReader sqlDataReader = null;
            using (SqlConnection objSQLConnection = new SqlConnection(connectionString))
            {
                objSQLConnection.Open();
                SqlCommand sqlCommand = new SqlCommand("Select username,password from user_login",objSQLConnection);

                sqlDataReader = sqlCommand.ExecuteReader();

                while (sqlDataReader.Read())
                {
                    UserCredentials uc = new UserCredentials();
                    uc.username = sqlDataReader[0].ToString();
                    uc.password = sqlDataReader[1].ToString();

                    userCredentials.Add(uc);
                }

            }

            var validUser = userCredentials.ToArray().FirstOrDefault((u) => u.username == userCredential.username);

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
            return Ok(userCredentials);
        }
    }
}
