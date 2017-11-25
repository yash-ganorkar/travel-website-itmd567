using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;
using System.Web.UI.WebControls;
using System.Net.Http;
using Google.Apis.QPXExpress.v1;
using Google.Apis.QPXExpress.v1.Data;
using Google.Apis.Services;
using Newtonsoft.Json;

namespace Travelopedia
{
    public partial class _Default : Page
    {
        public string flight_type;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    if (Request.Cookies["TimedCookie"] == null)
                    {
                        hiddenFieldLogin.Value = "login";
                    }
                    else
                    {
                        hiddenFieldLogin.Value = "logout";
                    }

                }
                else
                {
                    hiddenFieldLogin.Value = "login";
                }

            }


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {


                string source;
                string destination;
                string startDate;
                string endDate;
                string type;
                string numberOfPassengers;
                if (flight_type == "oneway")
                {
                    source = txtFrom.Text;
                    destination = txtTo.Text;

                    startDate = txtStartDate2.Text;
                    endDate = txtStartDate2.Text;

                    numberOfPassengers = dropdownNumberOfPassengers2.SelectedValue;
                    type = "flightone";
                    Session["flighttype"] = type;
                    Response.Redirect("Results.Aspx?" + "type=" + Server.UrlEncode(type) + "&source=" + Server.UrlEncode(source.Trim()) + "&destination=" + Server.UrlEncode(destination.Trim()) + "&startdate=" + Server.UrlEncode(startDate) + "&enddate=" + Server.UrlEncode(startDate) + "&count=" + Server.UrlEncode(numberOfPassengers));
                }
                else
                {
                    source = txtSource.Text;
                    destination = txtDestination.Text;

                    startDate = txtStartDate.Text;
                    endDate = txtEndDate.Text;

                    numberOfPassengers = dropdownNumberOfPassengers.SelectedValue;
                    type = "flightround";
                    Session["flighttype"] = type;
                    Response.Redirect("Results.Aspx?" + "type=" + Server.UrlEncode(type) + "&source=" + Server.UrlEncode(source.Trim()) + "&destination=" + Server.UrlEncode(destination.Trim()) + "&startdate=" + Server.UrlEncode(startDate) + "&enddate=" + Server.UrlEncode(endDate) + "&count=" + Server.UrlEncode(numberOfPassengers));
                }
                //Response.Redirect("Results.Aspx?" + "type=flight&source=" + Server.UrlEncode(source[1].Trim()) + "&destination=" + Server.UrlEncode(destination[1].Trim()) + "&startdate=" + Server.UrlEncode(startDate) + "&enddate=" + Server.UrlEncode(endDate) + "&count=" + Server.UrlEncode(numberOfPassengers));
            }                

        }

        protected void btnSearchEvents_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string eventlocation = eventLocation.Text;
                Response.Redirect("Results.Aspx?" + "type=event&location=" + Server.UrlEncode(eventlocation));

            }

        }

        protected void btnSearchHotel_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                string dest = txtDest.Text;
                string checkin = txtCheckin.Text;
                string checkout = txtCheckout.Text;
                string rooms = Dropdownlistrooms.SelectedValue;
                string guests = Dropdownlistguests.SelectedValue;
                string children = Dropdownlistchildren.SelectedValue;

                //Response.Redirect("Results.Aspx?" + "type=hotel&dest=" + Server.UrlEncode(dest) + "&rooms=" + Server.UrlEncode(rooms) + "&adults=" + Server.UrlEncode(guests) + "&children=" + Server.UrlEncode(children) + "&startdate=" + Server.UrlEncode(checkin) + "&enddate=" + Server.UrlEncode(checkout));
                Response.Redirect("Results.Aspx?" + "type=hotel&dest=" + Server.UrlEncode(dest) + "&rooms=" + Server.UrlEncode(rooms) + "&adults=" + Server.UrlEncode(guests) + "&children=" + Server.UrlEncode(children) + "&startdate=" + Server.UrlEncode(checkin) + "&enddate=" + Server.UrlEncode(checkout));

            }

        }

        protected void btnSearchCars_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                string location = carDest.Text;
                string pickupdate = carPickDate.Text;
                string dropoffdate = carDropDate.Text;
                string pickuptime = carPickTime.Text;
                string dropofftime = carDropTime.Text;

                //Response.Redirect("Results.Aspx?" + "type=car&dest=" + Server.UrlEncode(location) + "&startdate=" + Server.UrlEncode(pickupdate) + "&enddate=" + Server.UrlEncode(dropoffdate) + "&pickuptime=" + Server.UrlEncode(pickuptime) + "&dropofftime=" + Server.UrlEncode(dropofftime));
                Response.Redirect("Results.Aspx?" + "type=car&dest=" + Server.UrlEncode(location) + "&startdate=" + Server.UrlEncode(pickupdate) + "&enddate=" + Server.UrlEncode(dropoffdate) + "&pickuptime=" + Server.UrlEncode(pickuptime) + "&dropofftime=" + Server.UrlEncode(dropofftime));
            }
        }

        protected void txtSource_TextChanged(object sender, EventArgs e)
        {
            flight_type = "roundtrip";
            Session["flighttype"] = flight_type.ToString();
        }

        protected void txtFrom_TextChanged(object sender, EventArgs e)
        {
            flight_type = "oneway";
            Session["flighttype"] = flight_type.ToString();
        }
    }
}