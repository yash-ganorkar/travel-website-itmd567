<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travelopedia.Home" %>


<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>
            <div class="gap-small"></div>
            <div class="container">
                 <h3><asp:LoginName ID="LoginName1" FormatString="Welcome {0}!" runat="server"/></h3>
            <h5>Session Idle:&nbsp;<span id="secondsIdle"></span>&nbsp;seconds.</h5>
            </div>
           
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <form action="/Charge" method="POST">
            <div class="container">
                 <div class="booking-item-details" runat="server" id="CarDetails" visible="true">

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
                             <div class="col-md-5" >
                                <img src="images/Maserati-GranTurismo-Sport-facelift.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="col-md-7">
                                <div class="booking-item-price-calc">
                                    <div class="row row-wrap">
                                        <div class="col-md-6">
                                            
                                            
                                            
                                        </div>
                                        <div class="col-md-5">
                                            <ul class="list">
                                                 <li>
                                                    <p>Price Per Day<span>$<asp:Label ID="dailyprice" runat="server"></asp:Label></span>
                                                    </p>
                                                </li>
                                                <li>
                                                    <p>Number of Days<span><asp:Label ID="days" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                              <li>
                                                    <p>Sub Total<span>$<asp:Label ID="Subtotal" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                              <li>
                                                    <p>Taxes and Fees<span>$<asp:Label ID="tax" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                                
                                                <li>
                                                    <p>Total Price<span>$<span id="car-total" data-value="490"><asp:Label ID="total" runat="server"></asp:Label></span></span>
                                                    </p>
                                                </li>
                                            </ul>
                                            <div id="paypal-button"></div>
                                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="<%= this.stripePublishableKey %>"
                                    data-amount=<%= this.amount %> * 100
                                    data-name="Stripe.com"
                                    data-description="Sample Charge"
                                    data-locale="auto"
                                    data-zip-code="true">
                                </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="text-small">Arrive at your destination in style with this air-conditioned automatic. With room for 4 passengers and 2 pieces of luggage, it's ideal for small groups looking to get from A to B in comfort. Price can change at any moment so book now to avoid disappointment!</p>

                        <hr>
                        <div class="row row-wrap fadeInDown animated">
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
                    <div class="col-md-3 bounceIn animated">
                        <div class="booking-item-deails-date-location">
                            <ul>
                                <li>
                                    <h5>Location:</h5>
                                    <p><asp:Label ID="location1" runat="server"></asp:Label></p>
                                </li>
                                <li>
                                    <h5>Pick Up:</h5>
                                    
                                    <p><i class="fa fa-calendar box-icon-inline box-icon-gray"></i><asp:Label ID="pickup" runat="server"></asp:Label></p>
                                    <p><i class="fa fa-clock-o box-icon-inline box-icon-gray"></i><asp:Label runat="server" ID="pickuptime"></asp:Label></p>
                                </li>
                                <li>
                                    <h5>Drop Off:</h5>
                                    
                                    <p><i class="fa fa-calendar box-icon-inline box-icon-gray"></i><asp:Label runat="server" ID="dropoff"></asp:Label></p>
                                    <p><i class="fa fa-clock-o box-icon-inline box-icon-gray"></i><asp:Label runat="server" ID="dropofftime"></asp:Label></p>
                                </li>
                            </ul>
                          <!--  <a href="#" class="btn btn-primary">Change Location & Date</a>-->
                        </div>
                        <div class="gap gap-small"></div>
                    </div>
                </div>
                </div>
                 <div class="booking-item-details" id="FlightDetailsRound" runat="server" visible="false">
                      <div class="row row-wrap">
                        <div class="col-md-8">
                            <h3>Flight Details</h3>
                    <ul class="list booking-item-passengers">
                        <li>
                            <div class="row">
                               <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="xdepttime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="xdeptdate1" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="xdept1"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="xterminal1"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="xarrivetime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="xarrivedate1"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="xarrive1"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="xterminal2"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="xduration1" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                            </div>
                            
                            <p runat="server" id="stops1"></p>
                            
                            <div id="return1" runat="server" class="row">
                                <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="xdepttime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="xdeptdate2" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="xdept2"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="xterminal3"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="xarrivetime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="xarrivedate2"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="xarrive2"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="xterminal4"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="xduration2" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                                
                            </div>
                        </li>
                        <li>
                            <div class="row">
                               <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="ydepttime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="ydeptdate1" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="ydept1"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="yterminal1"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="yarrivetime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="yarrivedate1"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="yarrive1"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="yterminal2"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="yduration1" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                            </div>
                            
                            <p runat="server" id="stops2"></p>
                            
                            <div id="return2" runat="server" class="row">
                                <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="ydepttime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="ydeptdate2" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="ydept2"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="yterminal3"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="yarrivetime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="yarrivedate2"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="yarrive2"></asp:Label></p>
                                                    <p>Terminal:<asp:Label runat="server" ID="yterminal4"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="yduration2" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                                
                            </div>
                        </li>
                        
                    </ul>
                            <div class="gap gap-small"></div>
                            <div class="row">
                                <div class="col-md-6">
                                    <img class="pp-img" src="images/stripe.png" alt="Image Alternative text" title="Image Title" />
                                    <p>Important: You will be redirected to Stripe.com's website to securely complete your payment.</p>
                                </div>
                                <div class="col-md-6">
                                      <div id="paypal-button"></div>
                                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="<%= this.stripePublishableKey %>"
                                    data-amount=<%= this.amount %> * 100
                                    data-name="Stripe.com"
                                    data-description="Sample Charge"
                                    data-locale="auto"
                                    data-zip-code="true">

                                    

                                </script>

                                    

                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                    <div class="booking-item-payment">
                        <header class="clearfix">
                            <h5 runat="server" id="returnflightlocation" class="mb0"></h5>
                        </header>
                        <ul class="booking-item-payment-details">
                            <li>
                                <h5>Flight Details</h5>
                                <div class="booking-item-payment-flight">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="depttime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="deptdate1" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="dept1"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="arrivetime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="arrivedate1"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="arrive1"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="duration1" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <p>Return Trip</p>
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="depttime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="deptdate2"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="dept2"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="arrivetime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="arrivedate2"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="arrive2"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label runat="server" ID="duration2"></asp:Label></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <h5>Flight Details</h5>
                                <ul class="booking-item-payment-price">
                                    <li>
                                        <p class="booking-item-payment-price-title">Price</p>
                                        <p runat="server" id="returntotalamounttext" class="booking-item-payment-price-amount">$178<small></small>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="booking-item-payment-price-title">Taxes</p>
                                        <p runat="server" id="returntotaltax" class="booking-item-payment-price-amount">$18<small></small>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <p class="booking-item-payment-total">Total trip: <span><asp:Label ID="flightprice" runat="server"></asp:Label></span>
                        </p>
                    </div>
                </div>
            </div>
                 </div>
                <div class="booking-item-details" id="FlightDetailsOne" runat="server" visible="false">
                    <div class="row row-wrap">
                        <div class="col-md-8">
                            <h3>Flight Details</h3>
                    <ul class="list booking-item-passengers">
                        <li>
                            <div class="row">
                                <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="zdepttime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="zdeptdate1" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="zdept1"></asp:Label></p>
                                                    <p>Terminal: <asp:Label runat="server" ID="zterminal1"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="zarrivetime1"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="zarrivedate1"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="zarrive1"></asp:Label></p>
                                                    <p>Terminal: <asp:Label runat="server" ID="zterminal2"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="zduration1" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                            </div>  
                            <p runat="server" id="stops3"></p>
                            <div id="leg2" runat="server" class="row">
                                <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="zdepttime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="zdeptdate2" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="zdept2"></asp:Label></p>
                                                    <p>Terminal: <asp:Label runat="server" ID="zterminal3"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="zarrivetime2"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="zarrivedate2"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="zarrive2"></asp:Label></p>
                                                    <p>Terminal: <asp:Label runat="server" ID="zterminal4"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="zduration2" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                                
                            </div>
                        </li>
                        
                    </ul>
                            <div class="gap gap-small"></div>
                            <div class="row">
                                <div class="col-md-6">
                                    <img class="pp-img" src="images/stripe.png" alt="Image Alternative text" title="Image Title" />
                                    <p>Important: You will be redirected to Stripe.com's website to securely complete your payment.</p>
                                </div>
                                <div class="col-md-6">
                                      <div id="paypal-button"></div>
                                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="<%= this.stripePublishableKey %>"
                                    data-amount=<%= this.amount %> * 100
                                    data-name="Stripe.com"
                                    data-description="Sample Charge"
                                    data-locale="auto"
                                    data-zip-code="true">

                                    

                                </script>

                                    

                                
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                    <div class="booking-item-payment">
                        <header class="clearfix">
                            <h5 runat="server" id="flightlocation" class="mb0"></h5>
                        </header>
                        <ul class="booking-item-payment-details">
                            <li>
                                <h5>Flight Details</h5>
                                <div class="booking-item-payment-flight">
                                    <div class="row">
                                        <div class="col-md-9">
                                            <div class="booking-item-flight-details">
                                                <div class="booking-item-departure"><i class="fa fa-plane"></i>
                                                    <h5><asp:Label runat="server" ID="depttimeo"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label ID="deptdateo" runat="server"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="depto"></asp:Label></p>
                                                </div>
                                                <div class="booking-item-arrival"><i class="fa fa-plane fa-flip-vertical"></i>
                                                    <h5><asp:Label runat="server" ID="arrivetimeo"></asp:Label></h5>
                                                    <p class="booking-item-date"><asp:Label runat="server" ID="arrivedateo"></asp:Label></p>
                                                    <p class="booking-item-destination"><asp:Label runat="server" ID="arriveo"></asp:Label></p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="booking-item-flight-duration">
                                                <p>Duration</p>
                                                <h5><asp:Label ID="durationo" runat="server"></asp:Label></h5>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </li>
                            <li>
                                <h5>Flight Details</h5>
                                <ul class="booking-item-payment-price">
                                    <li>
                                        <p class="booking-item-payment-price-title">Price</p>
                                        <p runat="server" id="totalamounttext" class="booking-item-payment-price-amount">$178<small></small>
                                        </p>
                                    </li>
                                    <li>
                                        <p class="booking-item-payment-price-title">Taxes</p>
                                        <p runat="server" id="totaltax" class="booking-item-payment-price-amount">$18<small></small>
                                        </p>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                        <p class="booking-item-payment-total">Total trip: <span><asp:Label ID="flightpriceo" runat="server"></asp:Label></span>
                        </p>
                    </div>
                </div>
            </div>
                </div>
                <div class="booking-item-details" id="HotelDetails" runat="server" visible="false">
                    <header class="booking-item-header">
                    <div class="row">
                        <div class="col-md-9">
                            <h2 class="lh1em"><asp:Label ID="hotelname" runat="server"></asp:Label></h2>
                            <p class="lh1em text-small"><i class="fa fa-map-marker"></i> <asp:Label ID="city" runat="server"></asp:Label>, <asp:Label ID="state" runat="server"></asp:Label></p>
                            <ul class="list list-inline text-small">
                                <li><a href="#"><i class="fa fa-envelope"></i> Hotel E-mail</a>
                                </li>
                                <li><a href="#"><i class="fa fa-home"></i> Hotel Website</a>
                                </li>
                                <li><i class="fa fa-phone"></i> +1 (163) 493-1463</li>
                            </ul>
                        </div>
                        <div class="col-md-3">
                            <p class="booking-item-header-price"><small>price from</small>  <span class="text-lg">$<asp:Label ID="subtotalhotel" runat="server"></asp:Label></span>/night</p>
                        </div>
                    </div>
                </header>
                    <div class="gap gap-small"></div>
                     <div class="row row-wrap">
                    <div class="col-md-9">
                        <div class="row">
                             <div class="col-md-5" id="map" style="height:210px;">
                            
                            </div>
                            <div class="col-md-7">
                                <div class="booking-item-price-calc">
                                    <div class="row row-wrap">
                                        <div class="col-md-6">
                                            
                                            
                                            
                                        </div>
                                        <div class="col-md-5">
                                            <ul class="list">
                                               <!--  <li>
                                                    <p>Price Per Day<span>$<asp:Label ID="hotelpriceday" runat="server"></asp:Label></span>
                                                    </p>
                                                </li>-->
                                                <li>
                                                    <p>Number of Rooms<span><asp:Label ID="noofrooms" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                                <li>
                                                    <p>Number of Guests<span><asp:Label ID="noofguests" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                              <li>
                                                    <p>Sub Total<span>$<asp:Label ID="subtotalhotel1" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                              <li>
                                                    <p>Taxes and Fees<span>$<asp:Label ID="hoteltax" runat="server"></asp:Label></span>
                                                    </p>
                                                    
                                                </li>
                                                
                                                <li>
                                                    <p>Total Price<span>$<span id="hotel-total" data-value="490"><asp:Label ID="hoteltotal" runat="server"></asp:Label></span></span>
                                                    </p>
                                                </li>
                                            </ul>
                                            <div id="paypal-button"></div>
                                <script src="https://checkout.stripe.com/checkout.js" class="stripe-button"
                                    data-key="<%= this.stripePublishableKey %>"
                                    data-amount=<%= this.amount %> * 100
                                    data-name="Stripe.com"
                                    data-description="Sample Charge"
                                    data-locale="auto"
                                    data-zip-code="true">

                                    

                                </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="text-small">Every room at this hotel is air conditioned and is fitted with a flat-screen TV. Certain rooms have a sitting area where you can relax. You will find a coffee machine in the room. Each room comes with a private bathroom. For your comfort, you will find free toiletries and a hairdryer.</p>

                        <hr>
                        <div class="row row-wrap fadeIn animated">
                            <div class="col-md-4">
                                <h5>Hotel Facilities</h5>
                                <ul class="booking-item-features booking-item-features-expand clearfix">
                                    <li><i class="im im-wi-fi"></i><span class="booking-item-feature-title">Wi-Fi Internet</span>
                                    </li>
                                    <li><i class="im im-parking"></i><span class="booking-item-feature-title">Parking</span>
                                    </li>
                                    <li><i class="im im-plane"></i><span class="booking-item-feature-title">Airport Transport</span>
                                    </li>
                                    <li><i class="im im-bus"></i><span class="booking-item-feature-title">Shuttle Bus Service</span>
                                    </li>
                                    <li><i class="im im-fitness"></i><span class="booking-item-feature-title">Fitness Center</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h5></h5>
                                <ul class="booking-item-features booking-item-features-expand clearfix">
                                    <li><i class="im im-pool"></i><span class="booking-item-feature-title">Pool</span>
                                    </li>
                                    <li><i class="im im-spa"></i><span class="booking-item-feature-title">SPA</span>
                                    </li>
                                    <li><i class="im im-restaurant"></i><span class="booking-item-feature-title">Restaurant</span>
                                    </li>
                                    <li><i class="im im-wheel-chair"></i><span class="booking-item-feature-title">Wheelchair Access</span>
                                    </li>
                                    <li><i class="im im-business-person"></i><span class="booking-item-feature-title">Business Center</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h5></h5>
                                <ul class="booking-item-features booking-item-features-expand clearfix">
                                    <li><i class="im im-children"></i><span class="booking-item-feature-title">Children Activites</span>
                                    </li>
                                    <li><i class="im im-casino"></i><span class="booking-item-feature-title">Casino & Gambling</span>
                                    </li>
                                    <li><i class="im im-bar"></i><span class="booking-item-feature-title">Bar/Lounge</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 bounceIn animated">
                        <div class="booking-item-deails-date-location">
                            <ul>
                                <li>
                                    <h5>Location:</h5>
                                    <p><asp:Label ID="hotelnamefilter" runat="server"></asp:Label></p>
                                    <p><asp:Label ID="hotelcityfilter" runat="server"></asp:Label>, <asp:Label ID="hotelstatefilter" runat="server"></asp:Label></p>
                                    <p></p>
                                </li>
                                <li>
                                    <h5>Check In</h5>
                                    
                                    <p><i class="fa fa-calendar box-icon-inline box-icon-gray"></i><asp:Label ID="hotelcheckin" runat="server"></asp:Label></p>
                                   
                                </li>
                                <li>
                                    <h5>Check Out</h5>
                                    
                                    <p><i class="fa fa-calendar box-icon-inline box-icon-gray"></i><asp:Label runat="server" ID="hotelcheckout"></asp:Label></p>
                                </li>
                            </ul>
                            <h4 class="lh1em">Summary</h4>
                                <ul class="list booking-item-raiting-summary-list">
                                    <li>
                                        <div class="booking-item-raiting-list-title">Sleep</div>
                                        <ul class="icon-group booking-item-rating-stars">
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <div class="booking-item-raiting-list-title">Location</div>
                                        <ul class="icon-group booking-item-rating-stars">
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o text-gray"></i>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <div class="booking-item-raiting-list-title">Service</div>
                                        <ul class="icon-group booking-item-rating-stars">
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <div class="booking-item-raiting-list-title">Clearness</div>
                                        <ul class="icon-group booking-item-rating-stars">
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                        </ul>
                                    </li>
                                    <li>
                                        <div class="booking-item-raiting-list-title">Rooms</div>
                                        <ul class="icon-group booking-item-rating-stars">
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                            <li><i class="fa fa-smile-o"></i>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                          <!--  <a href="#" class="btn btn-primary">Change Location & Date</a>-->
                        </div>
                        <div class="gap gap-small"></div>
                    </div>
                </div>
                </div>
            </div>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?v=3&libraries=place‌s"></script>
             <script type="text/javascript">
                 
                 var map;
                 var infowindow;

                 //alert(<%= this.amount %>);
                 function initMap(latitude, longitude) {
                     var pyrmont = { lat: latitude, lng: longitude };
                     map = new google.maps.Map(document.getElementById('map'), {
                         center: pyrmont,
                         zoom: 15
                     });
                     infowindow = new google.maps.InfoWindow();
                     var service = new google.maps.places.PlacesService(map);
                     service.nearbySearch({
                         location: pyrmont,
                         radius: 500,
                         type: ['store']
                     }, callback);
                 }
                 function callback(results, status) {
                     if (status === google.maps.places.PlacesServiceStatus.OK) {
                         for (var j = 0; j < results.length; j++) {
                             createMarker(results[j]);
                         }
                     }
                 }
                 function createMarker(place) {
                     var placeLoc = place.geometry.location;
                     var marker = new google.maps.Marker({
                         map: map,
                         position: place.geometry.location
                     });
                     google.maps.event.addListener(marker, 'click', function () {
                         infowindow.setContent(place.name);
                         infowindow.open(map, this);
                     });
                 }

                 </script>  
            <script type="text/javascript">
                 function SessionExpireAlert(timeout) {
                     //alert(timeout);
                     var seconds = timeout / 1000;
                     document.getElementsByName("secondsIdle").innerHTML = seconds;

                     setInterval(function () {
                         seconds--;
                         document.getElementById("secondsIdle").innerHTML = seconds;
                     }, 1000);
                     setTimeout(function () {
                         window.location = "Account/Logout.aspx";
                     }, timeout);
                 };
            </script>            
            
          <asp:HiddenField runat="server" ID="hiddenFieldLogin" ClientIDMode="Static"/>    
</form>
        </ContentTemplate>
</asp:UpdatePanel>
    </asp:Content>
