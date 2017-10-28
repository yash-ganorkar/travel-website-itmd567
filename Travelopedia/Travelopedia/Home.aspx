<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travelopedia.Home" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>
            <asp:LoginName ID="LoginName1" FormatString="Welcome {0}!" runat="server"/>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <div id="paypal-button"></div>
            <form action="/Charge" method="POST">
    <script
        src="https://checkout.stripe.com/checkout.js" class="stripe-button"
        data-key="<%= this.stripePublishableKey %>"
        data-amount="<%= this.amount %>"
        data-name="Stripe.com"
        data-description="Sample Charge"
        data-locale="auto"
        data-zip-code="true">

    </script>
</form>
        </ContentTemplate>
</asp:UpdatePanel>
    </asp:Content>