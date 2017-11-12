using Stripe;
using System;
using System.Web.Configuration;
using Travelopedia.Models;
using System.Web.UI;

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
                    int timeout = Session.Timeout * 1000 * 60;
                    sessionValues = Session["Data"].ToString().Split('&');
                    //amount = ((Convert.ToDouble(sessionValues[3]) * Convert.ToDouble(sessionValues[6])) * 100).ToString();
                    ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                    if (sessionValues[0] == "flightround")
                {
                        amount = sessionValues[10];
                    FlightDetailsRound.Visible = true;
                    CarDetails.Visible = false;
                    depttime1.Text = sessionValues[3];
                    deptdate1.Text = sessionValues[12];
                    dept1.Text = sessionValues[1];
                    arrivetime1.Text = sessionValues[4];
                    arrivedate1.Text = sessionValues[12];
                    arrive1.Text = sessionValues[2];
                    duration1.Text = sessionValues[5];

                    depttime2.Text = sessionValues[8];
                    deptdate2.Text = sessionValues[13];
                    dept2.Text = sessionValues[6];
                    arrivetime2.Text = sessionValues[9];
                    arrivedate2.Text = sessionValues[13];
                    arrive2.Text = sessionValues[7];
                    duration2.Text = sessionValues[11];

                    flightprice.Text = sessionValues[10];
                }
                else if (sessionValues[0] == "flightone")
                {
                    FlightDetailsOne.Visible = true;
                    CarDetails.Visible = false;
                    depttimeo.Text = sessionValues[3];
                    deptdateo.Text = sessionValues[7];
                    depto.Text = sessionValues[1];
                    arrivetimeo.Text = sessionValues[4];
                    arrivedateo.Text = sessionValues[8];
                    arriveo.Text = sessionValues[2];
                    durationo.Text = sessionValues[6];
                    flightpriceo.Text = sessionValues[5];

                        amount = sessionValues[5];
                    }
                else if (sessionValues[0] == "hotel")
                {
                    HotelDetails.Visible = true;
                    CarDetails.Visible = false;
                    hotelname.Text = sessionValues[1];
                    city.Text = sessionValues[2];
                    state.Text = sessionValues[3];
                    subtotalhotel.Text = sessionValues[4];

                    noofrooms.Text = sessionValues[9];
                    hoteltax.Text = sessionValues[5];
                    hoteltotal.Text = sessionValues[6];
                    subtotalhotel1.Text = sessionValues[4];
                    hotelnamefilter.Text = sessionValues[1];
                    hotelcityfilter.Text = sessionValues[2];
                    hotelstatefilter.Text = sessionValues[3];
                    hotelcheckin.Text = sessionValues[12];
                    hotelcheckout.Text = sessionValues[13];
                    string latitude = sessionValues[7];
                    string longitude = sessionValues[8];
                    ScriptManager.RegisterStartupScript(Page, GetType(), "initMap", "<script>initMap(" + latitude + "," + longitude + ")</script>", false);

                        amount = sessionValues[4];
                }
                else
                {
                    name.Text = sessionValues[0];
                    type.Text = sessionValues[1];
                    location.Text = sessionValues[2];
                    location1.Text = sessionValues[2];
                    price.Text = sessionValues[3];
                    dailyprice.Text = sessionValues[3];
                    Subtotal.Text = sessionValues[4];
                    tax.Text = sessionValues[5];
                    total.Text = sessionValues[6];
                    pickup.Text = sessionValues[7];
                    dropoff.Text = sessionValues[8];
                    days.Text = sessionValues[9];
                    pickuptime.Text = sessionValues[10];
                    dropofftime.Text = sessionValues[11];
                        amount = sessionValues[6];
                }				
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
                            Amount = Convert.ToInt32(total.Text),
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
                        paymentDetails.PaymentAmount = Convert.ToDouble(total.Text);
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
                    Response.Redirect("Default.Aspx");
                }

            }
            else
            {
                Response.Redirect("Default.Aspx");
            }
        }
    }
}