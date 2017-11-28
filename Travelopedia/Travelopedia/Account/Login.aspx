<%@ Page Title="Log in" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Travelopedia.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="bg-holder full">
        <div class="bg-mask"></div>
       <div class="bg-img" style="background-image:url(../images/backgrounds/road.jpg);"></div>
        <div class="bg-holder-content text-white">
            <div class="container">
            <h1 class="page-title"><%: Title %>/Register</h1>
            </div>
            <div class="container">
        <div class="row">
            <div class="col-md-4">
                <h3>Welcome to Travelopedia</h3>
                        <p>Search over a <strong>million flight,hotels, cars, events, </strong>and many more.</p>
                        <p>Travelopedia provides the fastest way to book your trip</p>
             </div>
            <div class="col-md-4">
                <section id="loginForm">
                        <h4>Use a local account to log in</h4>
                        <hr />
                        <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <p class="text-danger">
                                <asp:Literal runat="server" ID="FailureText" />
                            </p>
                        </asp:PlaceHolder>
                        <div class="form-group form-group-icon-left">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass=" control-label">Email</asp:Label>
                        
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        
                    </div>
                    <div class="form-group form-group-icon-left">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass=" control-label">Password</asp:Label>
                        
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-primary" />
                        </div>
                    
                
                    <h4>
                        <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                    </h4>
                    <p>
                        <%-- Enable this once you have account confirmation enabled for password reset functionality
                        <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                        --%>
                    </p>
                </section>
            </div>

            <div class="col-md-4">
                <h4>Social Log in</h4>
                <div class="form-group">
                    <section id="socialLoginForm" >
                        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin"/>
                    </section>
                </div>
                </div>
          </div>
         </div>
        
    
            <asp:HiddenField runat="server" ID="hiddenFieldLogin" ClientIDMode="Static"/>
        </div>
    </div>
</asp:Content>
