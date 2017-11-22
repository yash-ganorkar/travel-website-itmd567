using Stripe;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travelopedia
{
    public partial class ErrorPayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["Payment"] != null)
                {
                    StripeCharge charge = (StripeCharge) Session["Payment"];
                    transactionid.InnerText = charge.Id;
                }
            }
        }
    }
}