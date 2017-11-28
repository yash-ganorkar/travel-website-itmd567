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
using Travelopedia_API.Models;

namespace Travelopedia
{
    public partial class Results : System.Web.UI.Page
    {
        public string responseString = "";
        public string responseType;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                this.ClientScript.GetPostBackEventReference(this, "arg");
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


                    var queryParam = Request.QueryString["type"];
                    if (queryParam == "hotel")
                    {
                        hiddenField1.Value = "hotel";
                        Session["DataType"] = hiddenField1.Value;
                    }
                    else if (queryParam == "flightone" || queryParam == "flightround")
                    {
                        if (Convert.ToInt32(Request.QueryString["count"]) == 0)
                        {
                            if (Session["flighttype"].ToString() == "roundtrip")
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
                        else if (Request.QueryString["source"] == "" || Request.QueryString["source"] == null)
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
                        else if (Request.QueryString["destination"] == "" || Request.QueryString["destination"] == null)
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
                        else if (Request.QueryString["startdate"] == "" || Request.QueryString["startdate"] == null)
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
                        else if (Request.QueryString["enddate"] == "" || Request.QueryString["enddate"] == null)
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
                            if (Session["flighttype"].ToString() == "flightround")
                            {
                                Session["DataType"] = "flightround";
                                Session["Location"] = sourcecity.Value.Split('-')[2] + " - " + destinationcity.Value.Split('-')[2];
                            }
                            else
                            {
                                Session["DataType"] = "flightone";
                                Session["Location"] = sourcecity.Value.Split('-')[2] + " - " + destinationcity.Value.Split('-')[2];
                            }
                        }
                    }
                    else if (queryParam == "car")
                    {
                        hiddenField1.Value = "car";
                        Session["DataType"] = hiddenField1.Value;
                    }
                }
                else
                {
                    if (Session["User"] == null)
                    {
                        var queryParam = Request.QueryString["type"];
                        Session["Data"] = hiddenField1.Value;
                        if (queryParam == "hotel")
                        {
                            Session["NoOfGuests"] = Convert.ToInt32(guests.Value) + Convert.ToInt32(children.Value);
                        }
                        else if (queryParam == "flightone" || queryParam == "flightround")
                        {
                            Session["NoOfStops"] = hiddenField3.Value;
                            Session["SourceDestination"] = Request.QueryString["source"].ToString().Split('-')[2] + " - " + Request.QueryString["destination"].ToString().Split('-')[2];
                        }

                        Response.Redirect("~/Account/Login.aspx",false);
                    }

                    else
                    {
                        var queryParam = Request.QueryString["type"];
                        Session["Data"] = hiddenField1.Value;
                        if (queryParam == "hotel")
                        {
                            Session["NoOfGuests"] = Convert.ToInt32(guests.Value) + Convert.ToInt32(children.Value);

                        }
                        else if (queryParam == "flightone" || queryParam == "flightround")
                        {
                            Session["NoOfStops"] = hiddenField3.Value;
                            Session["SourceDestination"] = Request.QueryString["source"].ToString().Split('-')[2] + "-" + Request.QueryString["destination"].ToString().Split('-')[2];
                        }
                        Response.Redirect("~/Home.aspx",false);
                    }
                }

            }
            catch (Exception ex)
            {
                Exceptions exception = new Exceptions();
                exception.ExceptionMessage = ex.Message.ToString();
                Session["Exception"] = exception;
                Response.Redirect("~/Error.aspx", false);
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