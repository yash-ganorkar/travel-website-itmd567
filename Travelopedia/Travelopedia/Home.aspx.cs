using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travelopedia
{
    public partial class Home : System.Web.UI.Page
    {
        public string stripePublishableKey = WebConfigurationManager.AppSettings["StripePublishableKey"];
        public string amount = "0.0";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string username = System.Web.HttpContext.Current.User.Identity.Name;
            }
            Label1.Text = "Welcome " + User.Identity.Name;
            string[] sessionValues = Session["Data"].ToString().Split('&');
            amount = ((Convert.ToDouble(sessionValues[3]) * Convert.ToDouble(sessionValues[6]))*100).ToString();
        }
    }
}