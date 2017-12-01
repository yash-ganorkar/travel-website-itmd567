using System;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using Owin;
using Travelopedia.Models;
using System.Linq;
using System.Security.Claims;
using Travelopedia_API.Models;

namespace Travelopedia.Account
{
    public partial class RegisterExternalLogin : System.Web.UI.Page
    {
        public string userName = "";
        public string firstName = "", lastName="";
        protected string ProviderName
        {
            get { return (string)ViewState["ProviderName"] ?? String.Empty; }
            private set { ViewState["ProviderName"] = value; }
        }

        protected string ProviderAccountKey
        {
            get { return (string)ViewState["ProviderAccountKey"] ?? String.Empty; }
            private set { ViewState["ProviderAccountKey"] = value; }
        }

        public string nameClaim;

        private void RedirectOnFail()
        {
            Response.Redirect((User.Identity.IsAuthenticated) ? "~/Account/Manage" : "~/Account/Login");
        }

        protected void Page_Load()
        {
            
            // Process the result from an auth provider in the request
            ProviderName = IdentityHelper.GetProviderNameFromRequest(Request);
            if (String.IsNullOrEmpty(ProviderName))
            {
                RedirectOnFail();
                return;
            }
            if (!IsPostBack)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
                if (loginInfo == null)
                {
                    RedirectOnFail();
                    return;
                }

                var user = manager.Find(loginInfo.Login);

                var verifiedloginInfox = Context.GetOwinContext().Authentication.GetExternalIdentity(DefaultAuthenticationTypes.ExternalCookie);
                if(ProviderName == "Facebook")
                {
                    var nameClaim = verifiedloginInfox.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name);
                    var emailClaim = verifiedloginInfox.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email);
                    
                    email.Text = emailClaim.Value;
                    userName = nameClaim.Value.ToString().ToLower();
                    lastName = nameClaim.Value.ToString().Split(' ')[1];
                    firstName = nameClaim.Value.ToString().Split(' ')[0];
                    userName = firstName.ToLower() + "" + lastName.ToLower();

                }
                else
                {
                    var nameClaim = verifiedloginInfox.Claims.FirstOrDefault(c => c.Type == ClaimTypes.GivenName);
                    var emailClaim = verifiedloginInfox.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email);
                    var surNameClaim = verifiedloginInfox.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Surname);
                    var fullNameClaim = verifiedloginInfox.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name);
                    email.Text = emailClaim.Value.ToString();
                    userName = nameClaim.Value.ToString();
                    lastName = surNameClaim.Value.ToString();
                    firstName = fullNameClaim.Value.ToString();

                }

                if (user != null)
                {
                    Session["name"] = firstName.ToString();
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else if (User.Identity.IsAuthenticated)
                {
                    // Apply Xsrf check when linking
                    var verifiedloginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo(IdentityHelper.XsrfKey, User.Identity.GetUserId());


                    if (verifiedloginInfo == null)
                    {
                        RedirectOnFail();
                        return;
                    }

                    var result = manager.AddLogin(User.Identity.GetUserId(), verifiedloginInfo.Login);
                    if (result.Succeeded)
                    {
                        IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    }
                    else
                    {
                        AddErrors(result);
                        return;
                    }
                }
                else
                {
                    CreateAndLoginUser();
                }
            }
        }        
        
        protected void LogIn_Click(object sender, EventArgs e)
        {
            CreateAndLoginUser();
        }

        private void CreateAndLoginUser()
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = userName, Email = email.Text, FirstName = firstName, LastName = lastName };
            IdentityResult result = manager.Create(user);
            
            if (result.Succeeded)
            {
                var loginInfo = Context.GetOwinContext().Authentication.GetExternalLoginInfo();
                if (loginInfo == null)
                {
                    RedirectOnFail();
                    return;
                }
                result = manager.AddLogin(user.Id, loginInfo.Login);
                if (result.Succeeded)
                {
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);

                    // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                    // var code = manager.GenerateEmailConfirmationToken(user.Id);
                    // Send this link via email: IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id)

                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                    return;
                }
            }
          
            AddErrors(result);

        }

        private void AddErrors(IdentityResult result) 
        {
            Exceptions exception = new Exceptions();
            exception.ExceptionMessage = "Email ID already exisit";
            Session["Exception"] = exception;
            Response.Redirect("~/Error.aspx", false);
        }
    }
}