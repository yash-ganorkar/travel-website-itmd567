using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Travelopedia
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var fullName = Session["name"].ToString();
            Session.RemoveAll();
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string username = System.Web.HttpContext.Current.User.Identity.Name;
            }
            Label1.Text = "Welcome " + User.Identity.Name;
            
        }
    }
}