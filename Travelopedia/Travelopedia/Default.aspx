<%@ Page Title="Home Page" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Travelopedia._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        #preloader 
{ position: fixed; left: 0; top: 0; z-index: 999; width: 100%; height: 100%;  overflow: visible; background: #333 url('images/giphy.gif') no-repeat center center; }
    </style>
    <asp:UpdatePanel runat="server" EnableViewState="true" ID="Panel1">
        <ContentTemplate>
             <div class="loader"></div>
        <div class="top-area show-onload">
            <div class="bg-holder full">
                <div class="bg-mask"></div>
                <div class="bg-img" style="background-image:url(images/2048x1365.png);"></div>
                <video class="bg-video hidden-sm hidden-xs" preload="auto" autoplay="true" loop="loop" muted="muted" poster="img/video-bg.jpg">
                    <source src="media/loop.webm" type="video/webm" />
                    <source src="media/loop.mp4" type="video/mp4" />
                </video>
                <div class="bg-front full-height bg-front-mob-rel">
                    <div class="container full-height">
                        <div class="rel full-height">
                            <div class="tagline visible-lg" id="tagline"><span>It's time to</span>
                                <ul>
                                    <li>live</li>
                                    <li>have fun</li>
                                    <li>relax</li>
                                    <li>meet</li>
                                    <li>being lost</li>
                                    <li>run away</li>
                                    <li>go</li>
                                    <li>explore</li>
                                    <li>find new friends</li>
                                    <li class="active">discover</li>
                                    <li>play</li>
                                </ul>
                            </div>
                            <div class="search-tabs search-tabs-bg search-tabs-bottom mb50">
                                <div class="tabbable">
                                    <ul class="nav nav-tabs" id="myTab">
                                        <li id="1" class="active"><a href="#tab-1" data-toggle="tab"><i class="fa fa-building-o"></i> <span >Hotels</span></a>
                                        </li>
                                        <li id="2"><a href="#tab-2" data-toggle="tab"><i class="fa fa-plane"></i> <span >Flights</span></a>
                                        </li>
                                        <li id="3"><a href="#tab-3" data-toggle="tab"><i class="fa fa-car"></i> <span >Cars</span></a>
                                        </li>
                                        <li id="4"><a href="#tab-4" data-toggle="tab"><i class="fa fa-bolt"></i> <span >Activities</span></a>
                                    </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade in active" id="tab-1">
                                            <h2>Search and Save on Hotels</h2>
                                            
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div id="Hotel" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                            <label>Where are you going?</label>
                                                           <!-- <input class="typeahead form-control" placeholder="City, Airport, Point of Interest or U.S. Zip Code" type="text" />-->
                                                        <asp:TextBox ID="txtDest" runat="server" CausesValidation="true" CssClass="typeahead form-control" placeholder="Enter Source City Code" TextMode="SingleLine"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-daterange">
                                                            <div class="row">
                                                                
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Check-in</label>
                                                                        <asp:TextBox runat="server" CausesValidation="true" CssClass="form-control" ID="txtCheckin" />
                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Check-out</label>
                                                                        <asp:TextBox runat="server" CausesValidation="true" CssClass="form-control" ID="txtCheckout" />
                                                                      
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-select-plus">
                                                                        <label>Rooms</label>
                                                                         <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" ID="Dropdownlistrooms">
                                                                                                <asp:ListItem Enabled="true" Text="Number of Rooms" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="1" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="2" Value="2"></asp:ListItem>
                                                                                                <asp:ListItem  Text="3" Value="3"></asp:ListItem>
                                                                                                <asp:ListItem  Text="4" Value="4"></asp:ListItem>
                                                                                                <asp:ListItem  Text="5" Value="5"></asp:ListItem>
                                                                                                <asp:ListItem  Text="6" Value="6"></asp:ListItem>
                                                                                                <asp:ListItem  Text="7" Value="7"></asp:ListItem>
                                                                                                <asp:ListItem  Text="8" Value="8"></asp:ListItem>
                                                                                                <asp:ListItem  Text="9" Value="9"></asp:ListItem>
                                                                                                <asp:ListItem  Text="10" Value="10"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                    </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-select-plus">
                                                                        <label>Guests</label>
                                                                        <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" CausesValidation="true" ID="Dropdownlistguests">
                                                                                                <asp:ListItem Enabled="true" Text="Number of Guests" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="1" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="2" Value="2"></asp:ListItem>
                                                                                                <asp:ListItem  Text="3" Value="3"></asp:ListItem>
                                                                                                <asp:ListItem  Text="4" Value="4"></asp:ListItem>
                                                                                                <asp:ListItem  Text="5" Value="5"></asp:ListItem>
                                                                                                <asp:ListItem  Text="6" Value="6"></asp:ListItem>
                                                                                                <asp:ListItem  Text="7" Value="7"></asp:ListItem>
                                                                                                <asp:ListItem  Text="8" Value="8"></asp:ListItem>
                                                                                                <asp:ListItem  Text="9" Value="9"></asp:ListItem>
                                                                                                <asp:ListItem  Text="10" Value="10"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                    </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-select-plus">
                                                                        <label>Children</label>
                                                                        <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" CausesValidation="true" ID="Dropdownlistchildren">
                                                                                                <asp:ListItem Enabled="true" Text="Number of Children" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="1" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="2" Value="2"></asp:ListItem>
                                                                                                <asp:ListItem  Text="3" Value="3"></asp:ListItem>
                                                                                                <asp:ListItem  Text="4" Value="4"></asp:ListItem>
                                                                                                <asp:ListItem  Text="5" Value="5"></asp:ListItem>
                                                                                                <asp:ListItem  Text="6" Value="6"></asp:ListItem>
                                                                                                <asp:ListItem  Text="7" Value="7"></asp:ListItem>
                                                                                                <asp:ListItem  Text="8" Value="8"></asp:ListItem>
                                                                                                <asp:ListItem  Text="9" Value="9"></asp:ListItem>
                                                                                                <asp:ListItem  Text="10" Value="10"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                    </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                           <!--     <button class="btn btn-primary btn-lg" type="submit">Search for Hotels</button>
                                             -->
                                            <asp:Button runat="server" CssClass="btn btn-primary btn-lg" ID="btnSearchHotel" OnClick="btnSearchHotel_Click" Text="Search for Hotels" CausesValidation="true"/>
                                        </div>
                                        <div class="tab-pane fade" id="tab-2">
                                            <h2>Search for Cheap Flights</h2>
                                                <div class="tabbable">
                                                    <ul class="nav nav-pills nav-sm nav-no-br mb10" id="flightChooseTab">
                                                        <li id="21" class="active"><a href="#flight-search-1" data-toggle="tab">Round Trip</a>
                                                        </li>
                                                        <li id="22"><a href="#flight-search-2" data-toggle="tab">One Way</a>
                                                        </l>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane fade in active" id="flight-search-1">
                                                            <div class="row">
                                                                <div class="col-md-5">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div id="From" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>From</label>
<%--                                                                                <input class="typeahead form-control" id="myText" placeholder="City, Airport, U.S. Zip" type="text" />--%>
                                                                                <asp:TextBox ID="txtSource" CausesValidation="true" OnTextChanged="txtSource_TextChanged" runat="server" CssClass="typeahead form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div id="To" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>To</label>
                                                                                <asp:TextBox ID="txtDestination" CausesValidation="true" runat="server" CssClass="typeahead form-control" placeholder="Enter Destination City" TextMode="SingleLine"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        </div>
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <div class="input-daterange">
                                                                        <div class="row">
                                                                            <div class="col-md-4">
                                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                                    <label>Departing</label>
                                                                                    <asp:Textbox runat="server" CausesValidation="true" class="form-control" ID="txtStartDate" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                                    <label>Returning</label>
                                                                                    <asp:Textbox runat="server" CausesValidation="true" class="form-control" ID="txtEndDate" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group form-group-lg form-group-select-plus">
                                                                                    <label>Passengers</label>
                                                                                    <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" CausesValidation="true" ID="dropdownNumberOfPassengers">
                                                                                                <asp:ListItem Enabled="true" Text="Select Number of Passengers" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="1" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="2" Value="2"></asp:ListItem>
                                                                                                <asp:ListItem  Text="3" Value="3"></asp:ListItem>
                                                                                                <asp:ListItem  Text="4" Value="4"></asp:ListItem>
                                                                                                <asp:ListItem  Text="5" Value="5"></asp:ListItem>
                                                                                                <asp:ListItem  Text="6" Value="6"></asp:ListItem>
                                                                                                <asp:ListItem  Text="7" Value="7"></asp:ListItem>
                                                                                                <asp:ListItem  Text="8" Value="8"></asp:ListItem>
                                                                                                <asp:ListItem  Text="9" Value="9"></asp:ListItem>
                                                                                                <asp:ListItem  Text="10" Value="10"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                        <div class="tab-pane fade" id="flight-search-2">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div id="OneWayFrom" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>From</label>
                                                                                <asp:TextBox ID="txtFrom" CausesValidation="true" runat="server" OnTextChanged="txtFrom_TextChanged" CssClass="typeahead form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div id="OneWayTo" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>To</label>
                                                                                <asp:TextBox ID="txtTo" CausesValidation="true" runat="server" CssClass="typeahead form-control" placeholder="Enter Destination City" TextMode="SingleLine"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="input-daterange">
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                                    <label>Departing</label>
                                                                                    <asp:Textbox runat="server" CausesValidation="true" class="form-control" ID="txtStartDate2" />
                                                                                </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group form-group-lg form-group-select-plus">
                                                                                    <label>Passengers</label>
                                                                                    <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" ID="dropdownNumberOfPassengers2" CausesValidation="true">
                                                                                                <asp:ListItem Enabled="true" Text="Select Number of Passengers" Value="-1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="1" Value="1"></asp:ListItem>
                                                                                                <asp:ListItem  Text="2" Value="2"></asp:ListItem>
                                                                                                <asp:ListItem  Text="3" Value="3"></asp:ListItem>
                                                                                                <asp:ListItem  Text="4" Value="4"></asp:ListItem>
                                                                                                <asp:ListItem  Text="5" Value="5"></asp:ListItem>
                                                                                                <asp:ListItem  Text="6" Value="6"></asp:ListItem>
                                                                                                <asp:ListItem  Text="7" Value="7"></asp:ListItem>
                                                                                                <asp:ListItem  Text="8" Value="8"></asp:ListItem>
                                                                                                <asp:ListItem  Text="9" Value="9"></asp:ListItem>
                                                                                                <asp:ListItem  Text="10" Value="10"></asp:ListItem>
                                                                                            </asp:DropDownList>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Search for Flights" CausesValidation="true" CssClass="btn btn-primary btn-lg"/>
                                        </div>
                                        <div class="tab-pane fade" id="tab-3">
                                            <h2>Search for Cheap Rental Cars</h2>
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div id="Cars" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Pick-up Location</label>
                                                                  <!--  <input class="typeahead form-control" placeholder="City, Airport, U.S. Zip" type="text" />
                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass=" form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>-->
                                                                    <asp:TextBox ID="carDest" CausesValidation="true" ClientIDMode="Static" runat="server" CssClass="typeahead form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group clockpicker form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Pick-up Time</label>
                                                                        <asp:TextBox ID="carPickTime" CausesValidation="true" runat="server" CssClass="form-control" ClientIDMode="Static" placeholder="10:00" TextMode="SingleLine"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Drop Off Time</label>
                                                                         <asp:TextBox ID="carDropTime" CausesValidation="true" runat="server" CssClass="form-control" placeholder="11:00" TextMode="SingleLine"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <!--<div class="col-md-6">
                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Drop-off Location</label>
                                                                    <input class="typeahead form-control" placeholder="City, Airport, U.S. Zip" type="text" />
                                                                </div>
                                                            </div>-->
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-daterange" data-date-format="M d, D">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Pick-up Date</label>
                                                                       <!-- <input class="form-control" name="start" type="text" />-->
                                                                        <asp:TextBox runat="server" CausesValidation="true" CssClass="form-control" ID="carPickDate" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Drop-ff Date</label>
                                                                        <!-- <input class="form-control" name="end" type="text" /> -->
                                                                        <asp:TextBox runat="server" CausesValidation="true" CssClass="form-control" ID="carDropDate" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 <asp:Button runat="server" Text="Search for Cars" CssClass="btn btn-primary btn-lg" CausesValidation="true" ID="btnSearchCars" OnClick="btnSearchCars_Click"/> 
                                        </div>
                                        <div class="tab-pane fade" id="tab-4">
                                        <h2>Search for Activities</h2>
                                        <form>
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div id="Activities" class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                        <label>Where are you going?</label>
                                                         <asp:TextBox ID="eventLocation" CausesValidation="true" ClientIDMode="Static" runat="server" CssClass="typeahead form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <asp:Button runat="server" Text="Search for Events" CssClass="btn btn-primary btn-lg" CausesValidation="true" ID="btnSearchEvents" OnClick="btnSearchEvents_Click"/> 
                                        </form>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="owl-carousel owl-slider owl-carousel-area visible-lg" id="owl-carousel-slider" data-nav="false">
                    <div class="bg-holder full">
                        <div class="bg-mask"></div>
                        <div class="bg-img" style="background-image:url(images/2048x1365.png);"></div>
                    </div>
                    <div class="bg-holder full">
                        <div class="bg-mask"></div>
                        <div class="bg-img" style="background-image:url(images/2048x2048.png);"></div>
                    </div>
                    <div class="bg-holder full">
                        <div class="bg-mask"></div>
                        <div class="bg-img" style="background-image:url(images/2048x1365.png);"></div>
                    </div>
                </div>
                <div class="bg-img hidden-lg" style="background-image:url(images/2048x1365.png);"></div>
                <div class="bg-mask hidden-lg"></div>
            </div>
        </div>
        <!-- END TOP AREA  -->

        <div class="gap"></div>
           


        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="row row-wrap" data-gutter="120">
                        <div class="col-md-4">
                            <div class="thumb">
                                <header class="thumb-header"><i class="fa fa-briefcase box-icon-black round box-icon-big animate-icon-top-to-bottom"></i>
                                </header>
                                <div class="thumb-caption">
                                    <h5 class="thumb-title"><a class="text-darken" href="#">Combine & Save</a></h5>
                                    <p class="thumb-desc">Book Flights, Hotels, Cars and Events from single application.</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumb">
                                <header class="thumb-header"><i class="fa fa-thumbs-o-up box-icon-black round box-icon-big animate-icon-top-to-bottom"></i>
                                </header>
                                <div class="thumb-caption">
                                    <h5 class="thumb-title"><a class="text-darken" href="#">Best Travel Application</a></h5>
                                    <p class="thumb-desc">Rewarded as best travel application that makes travel easy and fun!</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumb">
                                <header class="thumb-header"><i class="fa fa-send box-icon-black round box-icon-big animate-icon-top-to-bottom"></i>
                                </header>
                                <div class="thumb-caption">
                                    <h5 class="thumb-title"><a class="text-darken" href="#">Best Destinations</a></h5>
                                    <p class="thumb-desc">Select the best destination from Travelopedia and explore more!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="gap gap-small"></div>
        </div>
        
        <div class="container">
            <div class="gap"></div>
            <h2 class="text-center">Top Destinations</h2>
            <div class="gap">
                <div class="row row-wrap">
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/paris.jpg" alt="Image Alternative text" title="196_365" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/fr.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">Paris</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Effiel Tower and many mor!!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/backgrounds/road.jpg" alt="Image Alternative text" title="El inevitable paso del tiempo" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/in.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">India</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Kashmir, Leh Ladhak and many more!!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/backgrounds/taxi.jpg" alt="Image Alternative text" title="Upper Lake in New York Central Park" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/us.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">New York</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Time Square and many more!!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/backgrounds/beach.jpg" alt="Image Alternative text" title="people on the beach" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/us.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">Florida</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Miami beach and many more!!</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
            <asp:HiddenField runat="server" ID="hiddenFieldLogin" ClientIDMode="Static"/>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        

            <script type="text/javascript">
                $(window).load(function () {
                    $(".loader").fadeOut("60000");
                })
            </script>
            <script type="text/javascript">
                $(function () {
                    $("#<%= txtStartDate.ClientID %>").datepicker({ dateFormat: 'yy-mm-dd', autoclose: true });
                    $("#<%= txtEndDate.ClientID %>").datepicker({ dateFormat: 'yy-mm-dd', autoclose: true });
                    $("#<%= txtStartDate2.ClientID %>").datepicker({ dateFormat: 'yy-mm-dd', autoclose: true });
               
                    $("#<%= txtCheckin.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', autoclose: true });
                    $("#<%= txtCheckout.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', autoclose: true });
                    $("#<%= carPickDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', autoclose: true });
                    $("#<%= carDropDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy', autoclose: true });

                });

                function validate(oSrc, args) {
                    if (document.getElementById('1').className == 'active') {
                        var txtDest = document.getElementById('<%=txtDest.ClientID%>').value;
                        var Dropdownlistchildren = document.getElementById('<%=Dropdownlistchildren.ClientID%>').value;
                        var txtCheckin = document.getElementById('<%=txtCheckin.ClientID%>').value;
                        var txtCheckout = document.getElementById('<%=txtCheckout.ClientID%>').value;
                        var Dropdownlistguests = document.getElementById('<%=Dropdownlistguests.ClientID%>').value;
                        var Dropdownlistrooms = document.getElementById('<%=Dropdownlistrooms.ClientID%>').value;

                        var checkinDate = new Date(txtCheckin);
                        var checkoutDate = new Date(txtCheckout);
                        

                        if (txtDest == '' || Dropdownlistchildren == -1 || txtCheckin == '' || txtCheckout == '' || Dropdownlistguests == -1 || Dropdownlistrooms == -1) {
                            args.IsValid = false;
                             alert("All are required fields!!!");
                        }
                        else if (checkinDate > checkoutDate || checkoutDate < checkinDate) {
                            args.IsValid = false;
                            alert("Invalid dates!!!");
                        }
                        else {
                            args.IsValid = true;
                        }

                    }
                    else if (document.getElementById('2').className == 'active') {
                        if (document.getElementById('21').className == 'active') {
                            var txtSource = document.getElementById('<%=txtSource.ClientID%>').value;
                            var txtDestination = document.getElementById('<%=txtDestination.ClientID%>').value;
                            var txtStartDate = document.getElementById('<%=txtStartDate.ClientID%>').value;
                            var txtEndDate = document.getElementById('<%=txtEndDate.ClientID%>').value;
                            var dropdownNumberOfPassengers = document.getElementById('<%=dropdownNumberOfPassengers.ClientID%>').value;

                            var checkinDate = new Date(txtStartDate);
                            var checkoutDate = new Date(txtEndDate);

                            if (txtSource == '' || txtDestination == '' || txtStartDate == '' || txtEndDate == '' || dropdownNumberOfPassengers == -1) {
                                args.IsValid = false;
                                alert("All are required fields!!!");
                            }
                            else if (checkinDate > checkoutDate || checkoutDate < checkinDate) {
                                args.IsValid = false;
                                alert("Invalid dates!!!");
                            }
                            else {
                                args.IsValid = true;
                            }

                        }
                        else if (document.getElementById('22').className == 'active') {

                            var txtFrom = document.getElementById('<%=txtFrom.ClientID%>').value;
                            var txtTo = document.getElementById('<%=txtTo.ClientID%>').value;
                            var txtStartDate2 = document.getElementById('<%=txtStartDate2.ClientID%>').value;
                            var dropdownNumberOfPassengers2 = document.getElementById('<%=dropdownNumberOfPassengers2.ClientID%>').value;

                            var checkinDate = new Date(txtStartDate2);
                            var date = new Date();
                            if (txtFrom == '' || txtTo == '' || dropdownNumberOfPassengers2 == '' || txtStartDate2 == '') {
                                args.IsValid = false;
                                alert("All are required fields!!!");
                            }
                            else if (checkinDate < date) {
                                args.IsValid = false;
                                alert("Invalid dates!!!");
                            }
                            else {
                                args.IsValid = true;
                            }

                        }
                    }
                    else if (document.getElementById('3').className == 'active') {
                        var carDest = document.getElementById('<%=carDest.ClientID%>').value;
                        var carPickTime = document.getElementById('<%=carPickTime.ClientID%>').value;
                        var carDropTime = document.getElementById('<%=carDropTime.ClientID%>').value;
                        var carPickDate = document.getElementById('<%=carPickDate.ClientID%>').value;
                        var carDropDate = document.getElementById('<%=carDropDate.ClientID%>').value;

                        var checkinDate = new Date(carPickDate);
                        var checkoutDate = new Date(carDropDate);

                        if (carDest == '' || carPickTime == '' || carDropTime == '' || carPickDate == '' || carDropDate == '') {
                            args.IsValid = false;
                            alert("All are required fields!!!");
                        }
                        else if (checkinDate > checkoutDate || checkoutDate < checkinDate) {
                            args.IsValid = false;
                            alert("Invalid dates!!!");
                        }
                        else {
                            args.IsValid = true;
                        }

                    }
                    else if (document.getElementById('4').className == 'active') {
                        var eventLocation = document.getElementById('<%=eventLocation.ClientID%>').value;


                        if (eventLocation == '') {
                            args.IsValid = false;
                            alert("All are required fields!!!");
                        }
                        else {
                            args.IsValid = true;
                        }

                    }
                }
            </script>
<asp:CustomValidator runat="server" Text="Both the fields are blank!!" ID="customValidator1" ClientValidationFunction="validate"></asp:CustomValidator>
            </ContentTemplate>
        </asp:UpdatePanel>
    <asp:UpdateProgress runat="server" ID="prog" AssociatedUpdatePanelID="Panel1">
        <ProgressTemplate>
             <div id="preloader"></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>