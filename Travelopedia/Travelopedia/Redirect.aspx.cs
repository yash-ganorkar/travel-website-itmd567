using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travelopedia
{
    public partial class Redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string dailyRate = Request.QueryString["dailyRate"];
            string possibleModel = Request.QueryString["possibleModels"];
        }
    }
}