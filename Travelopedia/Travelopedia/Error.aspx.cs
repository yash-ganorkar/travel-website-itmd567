using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Travelopedia_API.Models;

namespace Travelopedia
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Exceptions ex = (Exceptions)Session["Exception"];
            exception.InnerText = ex.ExceptionMessage;
        }
    }
}