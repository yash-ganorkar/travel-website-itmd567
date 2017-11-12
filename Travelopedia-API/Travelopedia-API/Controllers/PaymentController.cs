using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Travelopedia_API.Classes;
using Travelopedia_API.Models;

namespace Travelopedia_API.Controllers
{
    public class PaymentController : ApiController
    {
        [HttpPost]
        [ActionName("AddPayment")]
        public int AddPaymentTransaction(PaymentDetails payDetails)
        {
            string connectionString = Resource.GetConnection();
            SqlDataReader sqlDataReader = null;
            int result = 0;
            using (SqlConnection objSQLConnection = new SqlConnection(connectionString))
            {
                objSQLConnection.Open();
                SqlCommand sqlCommand = new SqlCommand("INSERT INTO Payment (PayeeName, PayeeEmailAddress, PayeeStripeTRNNumber) VALUES (@param1, @param2, @param3)", objSQLConnection);

                sqlCommand.Parameters.Add("@param1",SqlDbType.NVarChar).Value = payDetails.Name;
                sqlCommand.Parameters.Add("@param2", SqlDbType.NVarChar).Value = payDetails.Email;
                sqlCommand.Parameters.Add("@param3", SqlDbType.NVarChar).Value = payDetails.StripeTRNumber;
                sqlCommand.CommandType = CommandType.Text;


                result = sqlCommand.ExecuteNonQuery();

            }
            return result;
        }
    }
}
