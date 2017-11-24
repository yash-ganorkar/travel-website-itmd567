using Microsoft.AspNet.Identity;
using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travelopedia
{
    public partial class SuccessPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Payment"] != null && Context.User.Identity.IsAuthenticated)
                {
                    transactionid.InnerText = Session["token"].ToString();
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
    }
}