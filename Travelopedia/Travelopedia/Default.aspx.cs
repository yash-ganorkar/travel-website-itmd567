using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Web.UI.WebControls;
using System.Net.Http;

namespace Travelopedia
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
           // GetSomething();
        }

        static void GetSomething()
        {
            using (var client = new HttpClient())
            {
                client.BaseAddress = new Uri("http://localhost:63699/api/");
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("text/html"));
                var response = client.GetAsync("UserLogin/Login/").Result;
                if (response.IsSuccessStatusCode)
                {
                    string responseString = response.Content.ReadAsStringAsync().Result;
                }
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string[] source = txtSource.Text.Split('-');
                string[] destination = txtDestination.Text.Split('-');
                destination.Le
                string startDate = txtStartDate.Text;
                string endDate = txtEndDate.Text;

                string numberOfPassengers = dropdownNumberOfPassengers.SelectedValue;
            }

        }
    }
}