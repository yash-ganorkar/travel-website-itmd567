using Stripe;
using System;
using System.Web;
using System.Web.Configuration;
using Travelopedia.Models;

namespace Travelopedia
{
    public partial class Home : System.Web.UI.Page
    {
        public string stripePublishableKey = WebConfigurationManager.AppSettings["StripePublishableKey"];
        public string amount = "0.0";
       public string[] sessionValues;

        public PaymentDetails paymentDetails;
        protected void Page_Load(object sender, EventArgs e)
        {
            paymentDetails = new PaymentDetails();

            if(Request.Cookies["TimedCookie"] != null)
            {
                if (Session["Data"].ToString() != "")
                {
                    hiddenFieldLogin.Value = "logout";
                    string username = Request.Cookies["TimedCookie"]["User"].ToString();

                    sessionValues = Session["Data"].ToString().Split('&');
                    amount = ((Convert.ToDouble(sessionValues[3]) * Convert.ToDouble(sessionValues[6])) * 100).ToString();
                    name.Text = sessionValues[0];
                    type.Text = sessionValues[1];
                    location.Text = sessionValues[2];
                    location1.Text = sessionValues[2];
                    price.Text = sessionValues[3];
                    pickup.Text = sessionValues[4];
                    dropoff.Text = sessionValues[5];


                    if (Request.Form["stripeToken"] != null)
                    {
                        var customers = new StripeCustomerService();
                        var charges = new StripeChargeService();

                        var customer = customers.Create(new StripeCustomerCreateOptions
                        {
                            Email = Request.Form["stripeEmail"],
                            SourceToken = Request.Form["stripeToken"]
                        });

                        var charge = charges.Create(new StripeChargeCreateOptions
                        {
                            Amount = Convert.ToInt32(amount),
                            Description = "Sample Charge",
                            Currency = "usd",
                            CustomerId = customer.Id,
                            ReceiptEmail = customer.Email,
                            SourceTokenOrExistingSourceId = customer.DefaultSourceId
                        });

                        StripeConfiguration.SetApiKey(WebConfigurationManager.AppSettings["StripeSecretKey"]);

                        var chargeService = new StripeChargeService();
                        StripeCharge charges2 = chargeService.Get(charge.Id);

                        paymentDetails.Name = sessionValues[0];
                        paymentDetails.PaymentAmount = Convert.ToDouble(amount);
                        paymentDetails.StripeTRNumber = charge.Id;
                        paymentDetails.Email = customer.Email;

                        //using (var client = new HttpClient())
                        //{
                        //    client.BaseAddress = new Uri("http://localhost/Travelopedia-API/api/");
                        //    client.DefaultRequestHeaders.Accept.Clear();
                        //    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                        //    var response = client.PostAsJsonAsync("payment/addpayment", paymentDetails).Result;
                        //    if (response.IsSuccessStatusCode)
                        //    {

                        //    }
                        //}



                        Response.Redirect("Default.Aspx");

                    }

                }
                else
                {
                    Session.Clear();
                    Session.Abandon();
                    Session.Contents.Clear();
                    Response.Redirect("Account/Login.Aspx");
                }

            }
            else
            {
                
                Response.Redirect("Default.Aspx");
            }
        }
    }
}