using Stripe;
using System;
using System.Web.Configuration;
using Travelopedia.Models;
using System.Web.UI;
using Newtonsoft.Json.Linq;

namespace Travelopedia
{
    public partial class Home : System.Web.UI.Page
    {
        public string stripePublishableKey = WebConfigurationManager.AppSettings["StripePublishableKey"];
        public string amount = "0.0";
        public double amt = 0;
        public string[] sessionValues;
        public string DataType = "";

        public PaymentDetails paymentDetails;
        protected void Page_Load(object sender, EventArgs e)
        {
                paymentDetails = new PaymentDetails();
                if (Request.Cookies["TimedCookie"] != null)
                {
                    if (Session["Data"].ToString() != "")
                    {
                        hiddenFieldLogin.Value = "logout";
                        string username = Request.Cookies["TimedCookie"]["User"].ToString();

                        int timeout = Session.Timeout * 1000 * 60;

                        DateTime sessionStart = (DateTime)Session["Timer"];

                        DateTime origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
                        TimeSpan diff = sessionStart.ToUniversalTime() - origin;

                        int timerStarted = (int)Math.Floor(diff.TotalSeconds);

                        origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
                        diff = DateTime.Now.ToUniversalTime() - origin;
                        int timerNow = (int)Math.Floor(diff.TotalSeconds);

                        timeout = ((timeout/1000) - (timerNow - timerStarted)) * 1000;

                        JToken token = JObject.Parse(Session["Data"].ToString());
                        DataType = Session["DataType"].ToString();

                        ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                        if (DataType == "flightround")
                        {
                        //amount = sessionValues[10];
                        //FlightDetailsRound.Visible = true;
                        //CarDetails.Visible = false;
                        //depttime1.Text = sessionValues[3];
                        //deptdate1.Text = sessionValues[12];
                        //dept1.Text = sessionValues[1];
                        //arrivetime1.Text = sessionValues[4];
                        //arrivedate1.Text = sessionValues[12];
                        //arrive1.Text = sessionValues[2];
                        //duration1.Text = sessionValues[5];

                        //depttime2.Text = sessionValues[8];
                        //deptdate2.Text = sessionValues[13];
                        //dept2.Text = sessionValues[6];
                        //arrivetime2.Text = sessionValues[9];
                        //arrivedate2.Text = sessionValues[13];
                        //arrive2.Text = sessionValues[7];
                        //duration2.Text = sessionValues[11];
                        //amount = (Convert.ToDouble(token.SelectToken("saleTotal").ToString()) * 100).ToString();
                        //flightprice.Text = sessionValues[10];
                    }
                    else if (DataType == "flightone")
                        {
                            FlightDetailsOne.Visible = true;
                            CarDetails.Visible = false;

                            DateTime oDate = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString());

                            depttimeo.Text = oDate.ToShortTimeString();
                            deptdateo.Text = oDate.ToShortDateString();
                            depto.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            oDate = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("arrivalTime").ToString());

                            flightlocation.InnerText = Session["Location"].ToString();

                            arrivetimeo.Text = oDate.ToShortTimeString();
                            arrivedateo.Text = oDate.ToShortDateString();
                            arriveo.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();

                            totalamounttext.InnerText = token.SelectToken("pricing")[0].SelectToken("saleFareTotal").ToString();
                            totaltax.InnerText = token.SelectToken("pricing")[0].SelectToken("saleTaxTotal").ToString();

                            durationo.Text = token.SelectToken("slice")[0].SelectToken("duration").ToString();
                            flightpriceo.Text = token.SelectToken("saleTotal").ToString();
                            string amt = token.SelectToken("saleTotal").ToString().Substring(3, token.SelectToken("saleTotal").ToString().Length-3);
                            amount = (Convert.ToDouble(amt) * 100).ToString();

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
                                Amount = Convert.ToInt32(Convert.ToDouble(amount) * 100),
                                Description = "Sample Charge",
                                Currency = "usd",
                                CustomerId = customer.Id,
                                ReceiptEmail = customer.Email,
                                SourceTokenOrExistingSourceId = customer.DefaultSourceId
                            });

                            StripeConfiguration.SetApiKey(WebConfigurationManager.AppSettings["StripeSecretKey"]);

                            var chargeService = new StripeChargeService();
                            StripeCharge charges2 = chargeService.Get(charge.Id);

                            if (charges2.Captured == true)
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("SuccessPayment.aspx");
                            }
                            else
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("ErrorPayment.aspx");
                            }


                        }
                    }
                        else if (DataType == "hotel")
                        {
                        HotelDetails.Visible = true;
                        CarDetails.Visible = false;
                        hotelname.Text = token.SelectToken("name").ToString();
                        city.Text = token.SelectToken("city").ToString();
                        state.Text = token.SelectToken("state").ToString();
                        subtotalhotel.Text = token.SelectToken("subtotal").ToString();

                        noofrooms.Text = token.SelectToken("rooms").ToString();
                        hoteltax.Text = token.SelectToken("taxesandfees").ToString();
                        hoteltotal.Text = token.SelectToken("totalprice").ToString();
                        subtotalhotel1.Text = token.SelectToken("subtotal").ToString();
                        hotelnamefilter.Text = hotelname.Text;
                        hotelcityfilter.Text = city.Text;
                        hotelstatefilter.Text = state.Text;
                        hotelcheckin.Text = token.SelectToken("checkindate").ToString();
                        hotelcheckout.Text = token.SelectToken("checkoutdate").ToString();

                        string latitude = token.SelectToken("centroid").ToString().Split('-')[0];
                        string longitude = token.SelectToken("centroid").ToString().Split('-')[1];

                        ScriptManager.RegisterStartupScript(Page, GetType(), "initMap", "<script>initMap(" + latitude + "," + longitude + ")</script>", false);
                        
                        amount = (Convert.ToDouble(hoteltotal.Text) * 100).ToString();

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
                                Amount = Convert.ToInt32(Convert.ToDouble(amount) * 100),
                                Description = "Sample Charge",
                                Currency = "usd",
                                CustomerId = customer.Id,
                                ReceiptEmail = customer.Email,
                                SourceTokenOrExistingSourceId = customer.DefaultSourceId
                            });

                            StripeConfiguration.SetApiKey(WebConfigurationManager.AppSettings["StripeSecretKey"]);

                            var chargeService = new StripeChargeService();
                            StripeCharge charges2 = chargeService.Get(charge.Id);

                            if (charges2.Captured == true)
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("SuccessPayment.aspx");
                            }
                            else
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("ErrorPayment.aspx");
                            }


                        }
                    }
                        else
                        {
                            name.Text = token.SelectToken("PossibleModels").ToString();
                            type.Text = token.SelectToken("CarTypeName").ToString();
                            location.Text = token.SelectToken("VendorLocation").ToString();
                            location1.Text = token.SelectToken("VendorLocation").ToString();
                            price.Text = token.SelectToken("DailyRate").ToString();
                            dailyprice.Text = token.SelectToken("DailyRate").ToString();
                            Subtotal.Text = token.SelectToken("SubTotal").ToString();
                            tax.Text = token.SelectToken("TaxesAndFees").ToString();
                            total.Text = token.SelectToken("TotalPrice").ToString();
                            pickup.Text = token.SelectToken("PickupDay").ToString();
                            dropoff.Text = token.SelectToken("DropoffDay").ToString();
                            days.Text = token.SelectToken("RentalDays").ToString();
                            pickuptime.Text = token.SelectToken("PickupTime").ToString();
                            dropofftime.Text = token.SelectToken("DropoffTime").ToString();

                            amount = (Convert.ToDouble(total.Text) * 100).ToString();

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
                                Amount = Convert.ToInt32(Convert.ToDouble(amount) * 100),
                                Description = "Sample Charge",
                                Currency = "usd",
                                CustomerId = customer.Id,
                                ReceiptEmail = customer.Email,
                                SourceTokenOrExistingSourceId = customer.DefaultSourceId
                            });

                            StripeConfiguration.SetApiKey(WebConfigurationManager.AppSettings["StripeSecretKey"]);

                            var chargeService = new StripeChargeService();
                            StripeCharge charges2 = chargeService.Get(charge.Id);

                            if (charges2.Captured == true)
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("SuccessPayment.aspx");
                            }
                            else
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("ErrorPayment.aspx");
                            }
                                

                        }

                    }

                    }
                    else
                    {
                    if (User.Identity.IsAuthenticated)
                    {
                        Response.Redirect("Default.Aspx");
                    }
                    else
                    {
                        Session.Clear();
                        Session.Abandon();
                        Session.Contents.Clear();
                        Response.Redirect("Default.Aspx");
                    }

                }

                }
                else
                {
                    Response.Redirect("Default.Aspx");
                }
        }
    }
}