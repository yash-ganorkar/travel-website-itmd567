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
    public partial class Results : System.Web.UI.Page
    {
        public string responseString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TripsSearchRequest x = new TripsSearchRequest();
                x.Request = new TripOptionsRequest();
                x.Request.Passengers = new PassengerCounts { AdultCount = 1 };
                x.Request.Slice = new List<SliceInput>();
                x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[0], Destination = Request.QueryString[1], Date = "2017-10-11" });
                x.Request.Slice.Add(new SliceInput() { Origin = Request.QueryString[1], Destination = Request.QueryString[0], Date = "2017-10-28" });

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

            }
        }
    }
}