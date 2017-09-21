<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" MasterPageFile="~/Site.Master" CodeBehind="Login.aspx.cs" Inherits="Travelopedia.Login" %>

<asp:Content ID="LoginContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>
            
            <br /><br />
            <div class="row" data-gutter="60">
                <div class="col-md-4">
<%--                    <h3>Welcome to Traveler</h3>
                    <p>Euismod nunc porta magna elementum penatibus amet gravida sit ligula odio id nunc proin sem augue quis posuere interdum in sapien congue rutrum scelerisque sociosqu cubilia ridiculus et luctus mollis</p>
                    <p>Praesent est semper massa lobortis quisque lectus ridiculus hac eget</p>--%>
                </div>
                <div class="col-md-4">
                    <h3>Login</h3>
                    <form>
                        <div class="form-group form-group-icon-left"><i class="fa fa-user input-icon input-icon-show"></i>
                            <label>Username or email</label>
<%--                            <input class="form-control" placeholder="e.g. johndoe@gmail.com" type="text" />--%>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-lock input-icon input-icon-show"></i>
                            <label>Password</label>
<%--                            <input class="form-control" type="password" placeholder="my secret password" />--%>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                        </div>
<%--                        <input class="btn btn-primary" type="submit" value="Sign in" />--%>
                        <div class="form-group">
                        <asp:Button ID="btnLogin" Text="Login" CssClass="btn btn-primary" runat="server" OnClick="btnLogin_Click"/>
                            </div>
                    </form>
                    <h3>Sign In Options</h3>
                    <div class="g-signin2" data-onsuccess="onSignIn"></div>
                </div>
                <div class="col-md-4"> 
                    <h3>New To Traveler?</h3>
                    <form>
                        <div class="form-group form-group-icon-left"><i class="fa fa-user input-icon input-icon-show"></i>
                            <label>Full Name</label>
                            <input class="form-control" placeholder="e.g. John Doe" type="text" />
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-envelope input-icon input-icon-show"></i>
                            <label>Emai</label>
                            <input class="form-control" placeholder="e.g. johndoe@gmail.com" type="text" />
                        </div>
                        <div class="form-group form-group-icon-left"><i class="fa fa-lock input-icon input-icon-show"></i>
                            <label>Password</label>
                            <input class="form-control" type="password" placeholder="my secret password" />
                        </div>
                        <input class="btn btn-primary" type="submit" value="Sign up for Traveler" />
                    </form>
                </div>
            </div>
            <br /><br />
    <script type="text/javascript">
        function onSignIn(googleUser) {
            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
        }
    </script>                
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>