<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travelopedia.Home" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>
            <asp:LoginName ID="LoginName1" FormatString="Welcome {0}!" runat="server"/>
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <form action="/Charge" method="POST">
            <div class="container">
                 <div class="booking-item-details">

                <header class="booking-item-header">
                    <div class="row">
                        <div class="col-md-9">
                            <h2 class="lh1em">
                            <asp:Label runat="server" ID="name"></asp:Label></h2>
                            <ul class="list list-inline text-small">
                                <li><i class="fa fa-map-marker input-icon input-icon-hightlight"></i> 
                                    <asp:Label runat="server" ID="location"></asp:Label>
                                </li>
                                <li><i class="fa fa-phone"></i> <asp:Label ID="type" runat="server"></asp:Label></li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <p class="booking-item-header-price"><small>price</small>  <span class="text-lg">$<asp:Label runat="server" ID="price"></asp:Label></span>/day</p>
                        </div>
                    </div>
                </header>
                <div class="gap gap-small"></div>
                     <div class="row row-wrap">
                    <div class="col-md-9">
                        <div class="row">
                            <div class="col-md-7">
                                <img src="images/Maserati-GranTurismo-Sport-facelift.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="col-md-5">
                                 
                                <div id="paypal-button"></div>
                               
                                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="<%= this.stripePublishableKey %>"
                                    data-amount="<%= this.amount %>"
                                    data-name="Stripe.com"
                                    data-description="Sample Charge"
                                    data-locale="auto"
                                    data-zip-code="true">

                                    

                                </script>
                            </div>
                        </div>
                        <p class="text-small">Arrive at your destination in style with this air-conditioned automatic. With room for 4 passengers and 2 pieces of luggage, it's ideal for small groups looking to get from A to B in comfort. Price can change at any moment so book now to avoid disappointment!</p>

                        <hr>
                        <div class="row row-wrap">
                            <div class="col-md-4">
                                <h5>Car Features</h5>
                                <ul class="booking-item-features booking-item-features-expand clearfix">
                                    <li><i class="fa fa-male"></i><span class="booking-item-feature-title">Up to 4 Passengers</span>
                                    </li>
                                    <li><i class="im im-car-doors"></i><span class="booking-item-feature-title">3 Doors</span>
                                    </li>
                                    <li><i class="fa fa-briefcase"></i><span class="booking-item-feature-title">2 Pieces of Laggage</span>
                                    </li>
                                    <li><i class="im im-shift-auto"></i><span class="booking-item-feature-title">Automatic Transmission</span>
                                    </li>
                                    <li><i class="im im-diesel"></i><span class="booking-item-feature-title">Gas Vehicle</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h5>Default Equipment</h5>
                                <ul class="booking-item-features booking-item-features-expand clearfix">
                                    <li><i class="im im-climate-control"></i><span class="booking-item-feature-title">Climate Control</span>
                                    </li>
                                    <li><i class="im im-stereo"></i><span class="booking-item-feature-title">Stereo CD/MP3</span>
                                    </li>
                                    <li><i class="im im-car-window"></i><span class="booking-item-feature-title">Power Windows</span>
                                    </li>
                                    <li><i class="im im-fm"></i><span class="booking-item-feature-title">FM Radio</span>
                                    </li>
                                    <li><i class="im im-lock"></i><span class="booking-item-feature-title">Power Door Locks</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="booking-item-deails-date-location">
                            <ul>
                                <li>
                                    <h5>Location:</h5>
                                    <p><asp:Label ID="location1" runat="server"></asp:Label></p>
                                </li>
                                <li>
                                    <h5>Pick Up:</h5>
                                    
                                    <p><i class="fa fa-calendar box-icon-inline box-icon-gray"></i><asp:Label ID="pickup" runat="server"></asp:Label></p>
                                    <p><i class="fa fa-clock-o box-icon-inline box-icon-gray"></i>12:00 AM</p>
                                </li>
                                <li>
                                    <h5>Drop Off:</h5>
                                    
                                    <p><i class="fa fa-calendar box-icon-inline box-icon-gray"></i><asp:Label runat="server" ID="dropoff"></asp:Label></p>
                                    <p><i class="fa fa-clock-o box-icon-inline box-icon-gray"></i>12:00 AM</p>
                                </li>
                            </ul>
                          <!--  <a href="#" class="btn btn-primary">Change Location & Date</a>-->
                        </div>
                        <div class="gap gap-small"></div>
                    </div>
                </div>
                </div>
            </div>
            
            
          <asp:HiddenField runat="server" ID="hiddenFieldLogin" ClientIDMode="Static"/>    
</form>
        </ContentTemplate>
</asp:UpdatePanel>
    </asp:Content>