using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Travelopedia.Account
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["TimedCookie"] != null)
            {
                Session.Abandon();
                Session.Clear();
                Session.RemoveAll();

                HttpCookie cookie = new HttpCookie("TimedCookie");
                cookie.Expires = DateTime.Now.AddMinutes(-30);
                Response.Cookies.Add(cookie);

                Response.Redirect("~/Default.aspx");
            }

            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}