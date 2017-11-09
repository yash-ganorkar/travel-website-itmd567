using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web;
using System.Web.Configuration;

namespace Travelopedia.Account
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            FormsAuthentication.SignOut();
            Session.Abandon();
            Session.Clear();
            Session.RemoveAll();

            if (Request.Cookies["UserSettings"] != null)
            {

                if (Request.Cookies["UserSettings"]["Login"] == "true")
                {
                    Request.Cookies["UserSettings"]["Login"] = "false";
                }
            }

            Response.Redirect("~/Default.aspx",true);
        }
    }
}