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
                var queryParam = Request.QueryString["type"];
                if (queryParam == "hotel")
                {
                    hiddenField1.Value = "hotel";
                }
                else if (queryParam == "flight")
                {
                    TripsSearchRequest x = new TripsSearchRequest();
                    string type = Session["flighttype"].ToString();
                    if (type == "roundtrip")
                    {

                        x.Request = new TripOptionsRequest();
                        x.Request.Passengers = new PassengerCounts { AdultCount = 1 };
                        x.Request.Slice = new List<SliceInput>();
                        x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[1], Destination = Request.QueryString[2], Date = "2017-10-28" });
                        x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[2], Destination = Request.QueryString[1], Date = "2017-10-31" });
                        hiddenField1.Value = "flightround";
                    }

                    else
                    {
                        x.Request = new TripOptionsRequest();
                        x.Request.Passengers = new PassengerCounts { AdultCount = 1 };
                        x.Request.Slice = new List<SliceInput>();
                        x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[1], Destination = Request.QueryString[2], Date = "2017-10-28" });
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
                    hiddenField2.Value = responseString;

                }
                else if (queryParam == "car")
                {
                    using (var client = new HttpClient())
                    {
                        hiddenField1.Value = "car";
                    }
                }
            }
            else
            {
                string eventTarget = this.Request["__EVENTTARGET"];
                string eventArgument = this.Request["__EVENTARGUMENT"];

                if (eventTarget != String.Empty)
                {
                    if (eventArgument != String.Empty) { 
                        Session["Data"] = eventArgument.ToString();
                        Response.Redirect("~/Account/Login.aspx");
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

        }
    }
}