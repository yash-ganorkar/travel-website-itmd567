<%@ Page Title="Register" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Travelopedia.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="bg-holder full">
        <div class="bg-mask"></div>
        <div class="bg-img" style="background-image:url(../images/backgrounds/road.jpg);"></div>
        <div class="bg-holder-content text-white">

       
            <div class="gap"></div>
            <div class="container">
        
        <h2>New to Travelopedia??</h2>
	<p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
        <div class="row row-wrap" data-gutter="60">
            <div class="col-md-6">
                <form>
                    <asp:ValidationSummary runat="server" CssClass="text-danger" />
                    <div class="form-group ">
                        <i class="fa fa-user input-icon input-icon-show"></i>
                        <asp:Label runat="server" AssociatedControlID="Email" >Email</asp:Label>
                        
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                       
                    </div>
                    <div class="form-group ">
                        <i class="fa fa-lock input-icon input-icon-show"></i>
                        <asp:Label runat="server" AssociatedControlID="Password" >Password</asp:Label>
                        
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                CssClass="text-danger" ErrorMessage="The password field is required." />
                        
                    </div>
                    <div class="form-group ">
                        <i class="fa fa-lock input-icon input-icon-show"></i>
                        <asp:Label runat="server" AssociatedControlID="ConfirmPassword" >Confirm password</asp:Label>
                        
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                        
                    </div>
                     
                        
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-primary" />
                        
                   
                </form>
            </div>
        </div>

    </div>
    
     </div>
    </div>
</asp:Content>
