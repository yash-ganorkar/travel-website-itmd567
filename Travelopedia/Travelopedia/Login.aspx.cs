using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Security;
using System.Web.UI.WebControls;
using System.Net.Http;

namespace Travelopedia
{
    public partial class Login : System.Web.UI.Page
    {
        private class UserCredentials
        {
            public string username { get; set; }
            public string password { get; set; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string username = txtUsername.Text;
                string password = txtPassword.Text;

                using (var client = new HttpClient())
                {
                    client.BaseAddress = new Uri("http://localhost:63699/api/");
                    client.DefaultRequestHeaders.Accept.Clear();
                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));

                    UserCredentials uc = new UserCredentials();
                    uc.username = "yash";
                    uc.password = "yash";
                    
                    var response = client.PostAsJsonAsync("UserLogin/Login/",uc).Result;
                    if (response.IsSuccessStatusCode)
                    {
                        string responseString = response.Content.ReadAsStringAsync().Result;
                        Response.Redirect("Home.aspx");
                    }
                }

            }
        }
    }
}