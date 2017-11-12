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
using System.Xml;

namespace Travelopedia
{
    public partial class Results : System.Web.UI.Page
    {
        public string responseString = "";
        public string responseType;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.ClientScript.GetPostBackEventReference(this, "arg");
            if (!IsPostBack)
            {
                if (Request.Cookies["TimedCookie"] == null)
                {
                    hiddenFieldLogin.Value = "login";
                }
                else
                {
                    hiddenFieldLogin.Value = "logout";
                }

                var queryParam = Request.QueryString["type"];
                if (queryParam == "hotel")
                {
                    hiddenField1.Value = "hotel";
                }
                else if (queryParam == "flight")
                {
                    if(Convert.ToInt32(Request.QueryString[5]) == 0)
                    {
                        if(Session["flighttype"].ToString() == "roundtrip")
                        {
                            hiddenField2.Value = "Error~Number of Adults cannot be 0";
                            hiddenField1.Value = "flightround";
                        }
                        else
                        {
                            hiddenField2.Value = "Error~Number of Adults cannot be 0";
                            hiddenField1.Value = "flightone";
                        }

                    }
                    else if (Request.QueryString[1] == "" || Request.QueryString[1] == null)
                    {

                        if (Session["flighttype"].ToString() == "roundtrip")
                        {
                            hiddenField2.Value = "Error~Source city cannot be blank.";
                            hiddenField1.Value = "flightround";
                        }
                        else
                        {
                            hiddenField2.Value = "Error~Source city cannot be blank.";
                            hiddenField1.Value = "flightone";
                        }

                    }
                    else if (Request.QueryString[2] == "" || Request.QueryString[2] == null)
                    {
                        if (Session["flighttype"].ToString() == "roundtrip")
                        {
                            hiddenField2.Value = "Error~Destination city cannot be blank.";
                            hiddenField1.Value = "flightround";
                        }
                        else
                        {
                            hiddenField2.Value = "Error~Destination city cannot be blank.";
                            hiddenField1.Value = "flightone";
                        }
                    }
                    else if (Request.QueryString[3] == "" || Request.QueryString[3] == null)
                    {
                        if (Session["flighttype"].ToString() == "roundtrip")
                        {
                            hiddenField2.Value = "Error~Departure Date cannot be blank.";
                            hiddenField1.Value = "flightround";
                        }
                        else
                        {
                            hiddenField2.Value = "Error~Departure Date cannot be blank.";
                            hiddenField1.Value = "flightone";
                        }
                    }
                    else if (Request.QueryString[4] == "" || Request.QueryString[4] == null)
                    {
                        if (Session["flighttype"].ToString() == "roundtrip")
                        {
                            hiddenField2.Value = "Error~Arrival Date cannot be blank.";
                            hiddenField1.Value = "flightround";
                        }
                        else
                        {
                            hiddenField2.Value = "Error~Arrival Date cannot be blank.";
                            hiddenField1.Value = "flightone";
                        }
                    }
                    else
                    {
                        TripsSearchRequest x = new TripsSearchRequest();
                        string type = Session["flighttype"].ToString();
                        if (type == "roundtrip")
                        {

                            x.Request = new TripOptionsRequest();
                            x.Request.Passengers = new PassengerCounts { AdultCount = Convert.ToInt32(Request.QueryString[5]) };
                            x.Request.Slice = new List<SliceInput>();
                            x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[1], Destination = Request.QueryString[2], Date = Request.QueryString[3] });
                            x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[2], Destination = Request.QueryString[1], Date = Request.QueryString[4] });
                            hiddenField1.Value = "flightround";
                        }

                        else
                        {
                            x.Request = new TripOptionsRequest();
                            x.Request.Passengers = new PassengerCounts { AdultCount = Convert.ToInt32(Request.QueryString[5]) };
                            x.Request.Slice = new List<SliceInput>();
                            x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[1], Destination = Request.QueryString[2], Date = Request.QueryString[3] });
                            hiddenField1.Value = "flightone";

                        }
                        using (var client = new HttpClient())
                        {
                            client.BaseAddress = new Uri("http://localhost/Travelopedia-API/api/");
                            client.DefaultRequestHeaders.Accept.Clear();
                            client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                            var response = client.PostAsJsonAsync("flights/allflights", x).Result;
                            if (response.IsSuccessStatusCode)
                            {
                                responseString = response.Content.ReadAsStringAsync().Result;

                            }
                        }

                        if (!ClientScript.IsClientScriptBlockRegistered("myScript"))
                        {
                            ClientScript.RegisterClientScriptBlock(typeof(_Default), "myScript", responseString, true);
                        }
                        hiddenField2.Value = "Response~"+responseString;

                    }

                }
                else if (queryParam == "car")
                {
                        hiddenField1.Value = "car";
                }
            }
            else
            {
                string eventTarget = this.Request["__EVENTTARGET"];
                string eventArgument = this.Request["__EVENTARGUMENT"];

                if (eventTarget != String.Empty)
                {
                    if (eventArgument != String.Empty && Session["User"] == null) { 
                        Session["Data"] = eventArgument.ToString();
                        Response.Redirect("~/Account/Login.aspx");
                    }
                    else
                    {
                        Session["Data"] = eventArgument.ToString();
                        Response.Redirect("~/Home.aspx");
                    }
                }
            }
            
            
        }

        protected void hiddenTextBox1_TextChanged(object sender, EventArgs e)
        {
            string valueChanged = hiddenTextBox1.Text;
        }

        [System.Web.Services.WebMethod]
        public static void Responses(string value)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string h = "hello"; 
        }
    }
}