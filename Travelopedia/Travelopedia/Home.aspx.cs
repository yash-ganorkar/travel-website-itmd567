using Stripe;
using System;
using System.Web.Configuration;
using Travelopedia.Models;
using System.Web.UI;
using Newtonsoft.Json.Linq;
using Travelopedia_API.Models;
using System.Net.Http;
using Microsoft.AspNet.Identity;
using System.Web;
using System.Net.Mail;
using System.IO;

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
            if (User.Identity.IsAuthenticated)
            {

                if (Session["Data"].ToString() != "")
                {
                    hiddenFieldLogin.Value = "logout";
                    // string username = Request.Cookies["TimedCookie"]["User"].ToString();
                    Session.Timeout = 10;


                    int timeout = Session.Timeout * 1000 * 60;

                    DateTime sessionStart = (DateTime)Session["Timer"];

                    DateTime origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
                    TimeSpan diff = sessionStart.ToUniversalTime() - origin;

                    int timerStarted = (int)Math.Floor(diff.TotalSeconds);

                    origin = new DateTime(1970, 1, 1, 0, 0, 0, 0, DateTimeKind.Utc);
                    diff = DateTime.Now.ToUniversalTime() - origin;
                    int timerNow = (int)Math.Floor(diff.TotalSeconds);

                    timeout = ((timeout / 1000) - (timerNow - timerStarted)) * 1000;


                    JToken token = JObject.Parse(Session["Data"].ToString());
                    DataType = Session["DataType"].ToString();

                    ClientScript.RegisterStartupScript(this.GetType(), "SessionAlert", "SessionExpireAlert(" + timeout + ");", true);

                    if (DataType == "flightround")
                    {
                        FlightDetailsRound.Visible = true;
                        CarDetails.Visible = false;

                        FlightDetails fd = new FlightDetails();
                        PaymentDetails pd = new PaymentDetails();

                        DateTime sDate = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString());
                        DateTime rDate = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString());
                        DateTime sDate2 = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString());
                        DateTime rDate2 = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString());

                        if(Convert.ToInt32(Session["NoOfStops"].ToString()) > 0)
                        {
                            var result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("duration").ToString()));
                            var hours = (int)result.TotalHours;
                            var minutes = result.Minutes;

                            depttime1.Text = sDate.ToShortTimeString();
                            deptdate1.Text = sDate.ToShortDateString();
                            dept1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            arrivetime1.Text = rDate.ToShortTimeString();
                            arrivedate1.Text = rDate.ToShortDateString();
                            if (token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination") == null)
                                arrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();
                            else
                                arrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();
                            duration1.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            depttime2.Text = sDate2.ToShortTimeString();
                            deptdate2.Text = sDate2.ToShortDateString();
                            dept2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            arrivetime2.Text = rDate2.ToShortTimeString();
                            arrivedate2.Text = rDate2.ToShortDateString();
                            if (token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination") == null)
                                arrive2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();
                            else
                                arrive2.Text = token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();

                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[1].SelectToken("duration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            duration2.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            xdepttime1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortTimeString();
                            xdeptdate1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortDateString();
                            xdept1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            xarrivetime1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortTimeString();
                            xarrivedate1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortDateString();
                            if (token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin") == null)
                                xarrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();
                            else
                                xarrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin").ToString();
                            //		token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin").ToString()	"AMS"	string

                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("duration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            xduration1.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            xdepttime2.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortTimeString();
                            xdeptdate2.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortDateString();

                            if (token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin") == null)
                                xdept2.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();
                            else
                                xdept2.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin").ToString();

                            //xdept2.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            xarrivetime2.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortTimeString();
                            xarrivedate2.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortDateString();
                            if (token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination") == null)
                                xarrive2.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();
                            else
                                xarrive2.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();


                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("duration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            xduration2.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("connectionDuration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            stops1.InnerText = "Layover time: " +hours.ToString()+"H " +minutes.ToString()+"M ";


                            ydepttime1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortTimeString();
                            ydeptdate1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortDateString();
                            ydept1.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            yarrivetime1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortTimeString();
                            yarrivedate1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortDateString();
                            if (token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin") == null)
                                yarrive1.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();
                            else
                                yarrive1.Text = token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin").ToString();

                            //                        yarrive1.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();


                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("duration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            yduration1.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            ydepttime2.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortTimeString();
                            ydeptdate2.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortDateString();
                            if (token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin") == null)
                                ydept2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();
                            else
                                ydept2.Text = token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin").ToString();

                            //                        ydept2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            yarrivetime2.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortTimeString();
                            yarrivedate2.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortDateString();
                            if (token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("origin") == null)
                                yarrive2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();
                            else
                                yarrive2.Text = token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();

                            //                        yarrive2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[1].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("duration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            yduration2.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("connectionDuration").ToString()));
                            hours = (int)result.TotalHours;
                            minutes = result.Minutes;

                            stops2.InnerText = "Layover time: " + hours.ToString() + "H " + minutes.ToString() + "M ";

                        }
                        else
                        {

                            return2.Visible = false;
                            return1.Visible = false;

                            var result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("duration").ToString()));
                            var hours = (int)result.TotalHours;
                            var minutes = result.Minutes;

                            depttime1.Text = sDate.ToShortTimeString();
                            deptdate1.Text = sDate.ToShortDateString();
                            dept1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            arrivetime1.Text = rDate.ToShortTimeString();
                            arrivedate1.Text = rDate.ToShortDateString();
                            arrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();
                            duration1.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            depttime2.Text = sDate2.ToShortTimeString();
                            deptdate2.Text = sDate2.ToShortDateString();
                            dept2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            arrivetime2.Text = rDate2.ToShortTimeString();
                            arrivedate2.Text = rDate2.ToShortDateString();
                            arrive2.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();

                             result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[1].SelectToken("duration").ToString()));
                             hours = (int)result.TotalHours;
                             minutes = result.Minutes;

                            duration2.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            xdepttime1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortTimeString();
                            xdeptdate1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortDateString();
                            xdept1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            xarrivetime1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortTimeString();
                            xarrivedate1.Text = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortDateString();
                            xarrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();

                             result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("duration").ToString()));
                             hours = (int)result.TotalHours;
                             minutes = result.Minutes;

                            xduration1.Text = hours.ToString() + "H" + " " + minutes.ToString() + "M";

                            ydepttime1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortTimeString();
                            ydeptdate1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString()).ToShortDateString();
                            ydept1.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                            yarrivetime1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortTimeString();
                            yarrivedate1.Text = DateTime.Parse(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("arrivalTime").ToString()).ToShortDateString();
                            yarrive1.Text = token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("destination").ToString();

                             result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[1].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("duration").ToString()));
                             hours = (int)result.TotalHours;
                             minutes = result.Minutes;

                            yduration1.Text = hours.ToString()+"H" + " "+minutes.ToString()+"M";


                        }

                        returnflightlocation.InnerText = Session["SourceDestination"].ToString();
                        returntotalamounttext.InnerText = token.SelectToken("pricing")[0].SelectToken("saleFareTotal").ToString();
                        returntotaltax.InnerText = token.SelectToken("pricing")[0].SelectToken("saleTaxTotal").ToString();

                        flightprice.Text = token.SelectToken("saleTotal").ToString();

                        string amt = token.SelectToken("saleTotal").ToString().Substring(3, token.SelectToken("saleTotal").ToString().Length - 3);
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
                                pd.UserID = User.Identity.GetUserId();
                                pd.PaymentAmount = Convert.ToDouble(amount) * 100;
                                pd.PaymentDate = DateTime.Now;
                                pd.StripePaymentID = charge.Id;

                                fd.UserID = User.Identity.GetUserId();
                                fd.paymentdetails = pd;
                                fd.FlightType = "Round";
                                fd.Source = depto.Text;
                                fd.Destination = arriveo.Text;
                                fd.ArrivalDate1 = rDate.ToShortDateString();
                                fd.ArrivalTime1 = rDate.ToShortTimeString();
                                fd.DepartureDate1 = sDate.ToShortDateString();
                                fd.DepartureTime1 = sDate.ToShortTimeString();
                                fd.ArrivalDate2 = rDate2.ToShortDateString();
                                fd.ArrivalTime2 = rDate2.ToShortTimeString();
                                fd.DepartureDate2 = sDate2.ToShortDateString();
                                fd.DepartureTime2 = sDate2.ToShortTimeString();

                                using (var client = new HttpClient())
                                {
                                    string responseString = "";
                                    client.BaseAddress = new Uri("http://localhost/Travelopedia-api/api/");
                                    client.DefaultRequestHeaders.Accept.Clear();
                                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                                    var response = client.PostAsJsonAsync("flights/ConfirmFlight/", fd).Result;

                                    if (response.IsSuccessStatusCode)
                                    {
                                        responseString = response.Content.ReadAsStringAsync().Result;
                                    }

                                    MailMessage mail = new MailMessage();
                                    mail.From = new MailAddress("shrutipuranik0710@gmail.com");
                                    mail.To.Add(charges2.ReceiptEmail);
                                    mail.Subject = "This is an email";
                                    mail.Body = CreateBodyRoundFlight();
                                    mail.IsBodyHtml = true;
                                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                                    smtpClient.Credentials = new System.Net.NetworkCredential()
                                    {
                                        UserName = "shrutipuranik0710@gmail.com",
                                        Password = "Shruti_07"
                                    };
                                    smtpClient.EnableSsl = true;
                                    smtpClient.Send(mail);

                                    Session["Payment"] = charges2;
                                    Session["token"] = responseString;
                                    Response.Redirect("SuccessPayment.aspx");
                                }
                            }
                            else
                            {
                                Session["Payment"] = charges2;
                                Response.Redirect("ErrorPayment.aspx");
                            }


                        }
                    }
                    else if (DataType == "flightone")
                    {
                        FlightDetailsOne.Visible = true;
                        CarDetails.Visible = false;

                        FlightDetails fd = new FlightDetails();
                        PaymentDetails pd = new PaymentDetails();

                        DateTime oDate = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("departureTime").ToString());

                        var result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("duration").ToString()));
                        var hours = (int)result.TotalHours;
                        var minutes = result.Minutes;

                        durationo.Text = hours.ToString()+"h " +minutes.ToString()+"m";

                        depttimeo.Text = oDate.ToShortTimeString();
                        deptdateo.Text = oDate.ToShortDateString();
                        depto.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                        zdepttime1.Text= oDate.ToShortTimeString();
                        zdeptdate1.Text = oDate.ToShortDateString();
                        zdept1.Text = token.SelectToken("slice")[0].SelectToken("segment")[0].SelectToken("leg")[0].SelectToken("origin").ToString();

                        zarrivetime1.Text = oDate.ToShortTimeString();
                        zarrivedate1.Text = oDate.ToShortDateString();
                        zarrive1.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();

                        result = TimeSpan.FromMinutes(Convert.ToDouble(token.SelectToken("slice")[0].SelectToken("duration").ToString()));
                        hours = (int)result.TotalHours;
                        minutes = result.Minutes;

                        zduration1.Text = hours.ToString() + "h " + minutes.ToString() + "m";

                        DateTime dDate = DateTime.Parse(token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("arrivalTime").ToString());

                        flightlocation.InnerText = Session["SourceDestination"].ToString();

                        arrivetimeo.Text = dDate.ToShortTimeString();
                        arrivedateo.Text = dDate.ToShortDateString();
                        arriveo.Text = token.SelectToken("slice")[0].SelectToken("segment")[1].SelectToken("leg")[0].SelectToken("destination").ToString();

                        totalamounttext.InnerText = token.SelectToken("pricing")[0].SelectToken("saleFareTotal").ToString();
                        totaltax.InnerText = token.SelectToken("pricing")[0].SelectToken("saleTaxTotal").ToString();

                        
                        flightpriceo.Text = token.SelectToken("saleTotal").ToString();
                        string amt = token.SelectToken("saleTotal").ToString().Substring(3, token.SelectToken("saleTotal").ToString().Length - 3);
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
                                pd.UserID = User.Identity.GetUserId();
                                pd.PaymentAmount = Convert.ToDouble(amount) * 100;
                                pd.PaymentDate = DateTime.Now;
                                pd.StripePaymentID = charge.Id;

                                fd.UserID = User.Identity.GetUserId();
                                fd.paymentdetails = pd;
                                fd.FlightType = "OneWay";
                                fd.Source = depto.Text;
                                fd.Destination = arriveo.Text;
                                fd.ArrivalDate1 = dDate.ToShortDateString();
                                fd.ArrivalTime1 = dDate.ToShortTimeString();
                                fd.DepartureDate1 = oDate.ToShortDateString();
                                fd.DepartureTime1 = oDate.ToShortTimeString();

                                using (var client = new HttpClient())
                                {
                                    string responseString="";
                                    client.BaseAddress = new Uri("http://localhost/Travelopedia-api/api/");
                                    client.DefaultRequestHeaders.Accept.Clear();
                                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                                    var response = client.PostAsJsonAsync("flights/ConfirmFlight/", fd).Result;

                                    if (response.IsSuccessStatusCode)
                                    {
                                        responseString = response.Content.ReadAsStringAsync().Result;
                                    }

                                    MailMessage mail = new MailMessage();
                                    mail.From = new MailAddress("shrutipuranik0710@gmail.com");
                                    mail.To.Add(charges2.ReceiptEmail);
                                    mail.Subject = "This is an email";
                                    mail.Body = CreateBodyOnewayFlight();
                                    mail.IsBodyHtml = true;
                                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                                    smtpClient.Credentials = new System.Net.NetworkCredential()
                                    {
                                        UserName = "shrutipuranik0710@gmail.com",
                                        Password = "Shruti_07"
                                    };
                                    smtpClient.EnableSsl = true;
                                    smtpClient.Send(mail);

                                    Session["Payment"] = charges2;
                                    Session["token"] = responseString;
                                    Response.Redirect("SuccessPayment.aspx");
                                }
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
                        noofguests.Text = Session["NoOfGuests"].ToString();

                        PaymentDetails pd = new PaymentDetails();
                        HotelPayment hp = new HotelPayment();

                        noofrooms.Text = token.SelectToken("rooms").ToString();
                        hoteltax.Text = token.SelectToken("taxesandfees").ToString();
                        hoteltotal.Text = token.SelectToken("totalprice").ToString();
                        subtotalhotel1.Text = token.SelectToken("subtotal").ToString();
                        hotelnamefilter.Text = hotelname.Text;
                        hotelcityfilter.Text = city.Text;
                        hotelstatefilter.Text = state.Text;
                        hotelcheckin.Text = token.SelectToken("checkindate").ToString();
                        hotelcheckout.Text = token.SelectToken("checkoutdate").ToString();

                        string latitude = token.SelectToken("centroid").ToString().Split(',')[0];
                        string longitude = token.SelectToken("centroid").ToString().Split(',')[1];

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

                                pd.UserID = User.Identity.GetUserId();
                                pd.PaymentAmount = Convert.ToDouble(amount) * 100;
                                pd.PaymentDate = DateTime.Now;
                                pd.StripePaymentID = charge.Id;

                                hp.NumberOfRooms = Convert.ToInt32(noofrooms.Text);
                                hp.HotelName = hotelnamefilter.Text;
                                hp.NumberOfGuests = Convert.ToInt32(noofguests.Text);
                                hp.Location = hotelcityfilter.Text + ", " + hotelstatefilter.Text;
                                hp.CheckInDate = hotelcheckin.Text;
                                hp.CheckOutDate = hotelcheckout.Text;
                                hp.paymentDetails = pd;
                                hp.UserID = User.Identity.GetUserId();

                                using (var client = new HttpClient())
                                {
                                    string responseString = "";
                                    client.BaseAddress = new Uri("http://localhost/Travelopedia-api/api/");
                                    client.DefaultRequestHeaders.Accept.Clear();
                                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                                    var response = client.PostAsJsonAsync("hotels/ConfirmHotelBooking/", hp).Result;

                                    if (response.IsSuccessStatusCode)
                                    {
                                        responseString = response.Content.ReadAsStringAsync().Result;
                                    }

                                    MailMessage mail = new MailMessage();
                                    mail.From = new MailAddress("shrutipuranik0710@gmail.com");
                                    mail.To.Add(charges2.ReceiptEmail);
                                    mail.Subject = "This is an email";
                                    mail.Body = CreateBody();
                                    mail.IsBodyHtml = true;
                                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                                    smtpClient.Credentials = new System.Net.NetworkCredential()
                                    {
                                        UserName = "shrutipuranik0710@gmail.com",
                                        Password = "Shruti_07"
                                    };
                                    smtpClient.EnableSsl = true;
                                    smtpClient.Send(mail);

                                    Session["Payment"] = charges2;
                                    Session["token"] = responseString;
                                    Response.Redirect("SuccessPayment.aspx");
                                }
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

                        PaymentDetails pd = new PaymentDetails();
                        CarBooking cb = new CarBooking();
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

                                pd.UserID = User.Identity.GetUserId();
                                pd.PaymentAmount = Convert.ToDouble(amount) * 100;
                                pd.PaymentDate = DateTime.Now;
                                pd.StripePaymentID = charge.Id;

                                cb.UserID = User.Identity.GetUserId();
                                cb.PossibleModels = name.Text;
                                cb.CarType = type.Text;
                                cb.paymentDetails = pd;
                                cb.PickUpDate = pickup.Text;
                                cb.PickUpLocation = location.Text;
                                cb.PickUpTime = pickuptime.Text;
                                cb.DropOffDate = dropoff.Text;
                                cb.DropOffTime = dropofftime.Text;


                                using (var client = new HttpClient())
                                {
                                    string responseString = "";
                                    client.BaseAddress = new Uri("http://localhost/Travelopedia-api/api/");
                                    client.DefaultRequestHeaders.Accept.Clear();
                                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                                    var response = client.PostAsJsonAsync("car/ConfirmCarBooking/", cb).Result;

                                    if (response.IsSuccessStatusCode)
                                    {
                                        responseString = response.Content.ReadAsStringAsync().Result;
                                    }
                                    MailMessage mail = new MailMessage();
                                    mail.From = new MailAddress("shrutipuranik0710@gmail.com");
                                    mail.To.Add(charges2.ReceiptEmail);
                                    mail.Subject = "This is an email";
                                    mail.Body = CreateBodyCar();
                                    mail.IsBodyHtml = true;
                                    SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
                                    smtpClient.Credentials = new System.Net.NetworkCredential()
                                    {
                                        UserName = "shrutipuranik0710@gmail.com",
                                        Password = "Shruti_07"
                                    };
                                    smtpClient.EnableSsl = true;
                                    smtpClient.Send(mail);
                                    Session["Payment"] = charges2;
                                    Session["token"] = responseString;
                                    Response.Redirect("SuccessPayment.aspx");
                                }
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
                    HttpCookie cookie = new HttpCookie("TimedCookie");
                    cookie["User"] = Context.User.Identity.Name;
                    cookie.Expires = DateTime.Now.AddMinutes(5);
                    Response.Cookies.Add(cookie);

                    //data is empty
                    Response.Redirect("Default.Aspx");
                }
            }
            else
            {
                //user is not authenticated
                Response.Redirect("~/Account/Login.aspx");
            }
        }

        private string CreateBodyRoundFlight()
        {
            String body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/MailFlightRound.html")))
            {
                body = reader.ReadToEnd();

            }
            body = body.Replace("{deptdate}", deptdate1.Text);
            body = body.Replace("{depart}", dept1.Text);
            body = body.Replace("{depttime}", depttime1.Text);
            body = body.Replace("{arrivedate}", arrivedate1.Text);
            body = body.Replace("{arrive}", arrive1.Text);
            body = body.Replace("{arrivetime}", arrivetime1.Text);
            body = body.Replace("{travelduration}", duration1.Text);

            body = body.Replace("{deptdate2}", deptdate2.Text);
            body = body.Replace("{depart2}", dept2.Text);
            body = body.Replace("{depttime2}", depttime2.Text);
            body = body.Replace("{arrivedate2}", arrivedate2.Text);
            body = body.Replace("{arrive2}", arrive2.Text);
            body = body.Replace("{arrivetime2}", arrivetime2.Text);
            body = body.Replace("{travelduration2}", duration2.Text);
            body = body.Replace("{total}", flightprice.Text);

            return body;
        }

        private string CreateBodyOnewayFlight()
        {
            String body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/MailFlightOneway.html")))
            {
                body = reader.ReadToEnd();

            }
            body = body.Replace("{deptdate}", deptdateo.Text);
            body = body.Replace("{depart}", depto.Text);
            body = body.Replace("{depttime}", depttimeo.Text);
            body = body.Replace("{arrivedate}", arrivedateo.Text);
            body = body.Replace("{arrive}", arriveo.Text);
            body = body.Replace("{arrivetime}", arrivetimeo.Text);
            body = body.Replace("{travelduration}", durationo.Text);
            body = body.Replace("{total}", flightpriceo.Text);
            
            return body;

        }

        private string CreateBodyCar()
        {
            String body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/mailcar.html")))
            {
                body = reader.ReadToEnd();

            }
            body = body.Replace("{possiblemodels}", name.Text);
            body = body.Replace("{cartype}", type.Text);
            body = body.Replace("{vendorlocation}", location.Text);
            body = body.Replace("{pickup}", pickup.Text);
            body = body.Replace("{pickuptime}", pickuptime.Text);
            body = body.Replace("{dropoff}", dropoff.Text);
            body = body.Replace("{dropofftime}", dropofftime.Text);
            body = body.Replace("{days}", days.Text);
            body = body.Replace("{dailyprice}", dailyprice.Text);
            body = body.Replace("{subtotal}", Subtotal.Text);
            body = body.Replace("{tax}", tax.Text);
            body = body.Replace("{total}", total.Text);
            return body;
           
        }

        private string CreateBody()
        {
            String body = string.Empty;
            using (StreamReader reader = new StreamReader(Server.MapPath("~/Mail.html")))
            {
                body = reader.ReadToEnd();

            }
            body = body.Replace("{hotelname}", hotelname.Text);
            body = body.Replace("{city}", city.Text);
            body = body.Replace("{state}", state.Text);
            body = body.Replace("{checkin}", hotelcheckin.Text);
            body = body.Replace("{checkout}", hotelcheckout.Text);
            body = body.Replace("{rooms}", noofrooms.Text);
            body = body.Replace("{subtotal}", subtotalhotel.Text);
            body = body.Replace("{tax}", hoteltax.Text);
            body = body.Replace("{total}", hoteltotal.Text);
            return body;
           
        }
    }
}