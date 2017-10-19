﻿<%@ Page Title="Home Page" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Travelopedia._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>
        <div class="top-area show-onload">
            <div class="bg-holder full">
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
                                        <li class="active"><a href="#tab-1" data-toggle="tab"><i class="fa fa-building-o"></i> <span >Hotels</span></a>
                                        </li>
                                        <li><a href="#tab-2" data-toggle="tab"><i class="fa fa-plane"></i> <span >Flights</span></a>
                                        </li>
                                        <li><a href="#tab-3" data-toggle="tab"><i class="fa fa-home"></i> <span >Rentals</span></a>
                                        </li>
                                        <li><a href="#tab-4" data-toggle="tab"><i class="fa fa-car"></i> <span >Cars</span></a>
                                        </li>
                                        <li><a href="#tab-5" data-toggle="tab"><i class="fa fa-bolt"></i> <span >Activities</span></a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade in active" id="tab-1">
                                            <h2>Search and Save on Hotels</h2>
                                            
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                            <label>Where are you going?</label>
                                                           <!-- <input class="typeahead form-control" placeholder="City, Airport, Point of Interest or U.S. Zip Code" type="text" />-->
                                                        <asp:TextBox ID="txtDest" runat="server" CssClass=" form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-daterange">
                                                            <div class="row">
                                                                
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Check-in</label>
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCheckin" />
                                                                        
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Check-out</label>
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtCheckout" />
                                                                      
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
                                                                                            <asp:DropDownList runat="server" ID="Dropdownlistguests">
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
                                                                                            <asp:DropDownList runat="server" ID="Dropdownlistchildren">
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
                                            <asp:Button runat="server" CssClass="btn btn-primary btn-lg" ID="btnSearchHotel" OnClick="btnSearchHotel_Click" Text="Search for Hotels" CausesValidation="false"/>
                                        </div>
                                        <div class="tab-pane fade" id="tab-2">
                                            <h2>Search for Cheap Flights</h2>
                                                <div class="tabbable">
                                                    <ul class="nav nav-pills nav-sm nav-no-br mb10" id="flightChooseTab">
                                                        <li class="active"><a href="#flight-search-1" data-toggle="tab">Round Trip</a>
                                                        </li>
                                                        <li><a href="#flight-search-2" data-toggle="tab">One Way</a>
                                                        </li>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <div class="tab-pane fade in active" id="flight-search-1">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>From</label>
<%--                                                                                <input class="typeahead form-control" id="myText" placeholder="City, Airport, U.S. Zip" type="text" />--%>
                                                                                <asp:TextBox ID="txtSource" OnTextChanged="txtSource_TextChanged" runat="server" CssClass="typeahead form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        </div>
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>To</label>
                                                                                <asp:TextBox ID="txtDestination" runat="server" CssClass="typeahead form-control" placeholder="Enter Destination City" TextMode="SingleLine"></asp:TextBox>
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
                                                                                    <asp:Textbox runat="server" class="form-control" ID="txtStartDate" />
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                                    <label>Returning</label>
                                                                                    <asp:Textbox runat="server" class="form-control" ID="txtEndDate" />
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group form-group-lg form-group-select-plus">
                                                                                    <label>Passengers</label>
                                                                                    <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" ID="dropdownNumberOfPassengers">
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
                                                        <div class="tab-pane fade" id="flight-search-2">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="row">
                                                                        <div class="col-md-6">
                                                                            <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>From</label>
                                                                                <asp:TextBox ID="txtFrom" runat="server" OnTextChanged="txtFrom_TextChanged" CssClass="typeahead form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-6">
                                                                            <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                                <label>To</label>
                                                                                <asp:TextBox ID="txtTo" runat="server" CssClass="typeahead form-control" placeholder="Enter Destination City" TextMode="SingleLine"></asp:TextBox>
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
                                                                                    <asp:Textbox runat="server" class="form-control" ID="txtStartDate2" />
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                                    <label>Returning</label>
                                                                                    <asp:Textbox runat="server" class="form-control" ID="txtEndDate2" />
                                                                                </div>
                                                                            </div>
                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <div class="form-group form-group-lg form-group-select-plus">
                                                                                    <label>Passengers</label>
                                                                                    <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                                            <asp:DropDownList runat="server" ID="dropdownNumberOfPassengers2">
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
                                            <asp:Button runat="server" ID="btnSearch" OnClick="btnSearch_Click" Text="Search for Flights" CausesValidation="false" CssClass="btn btn-primary btn-lg"/>
                                        </div>
                                        <div class="tab-pane fade" id="tab-3">
                                            <h2>Find Your Perfect Home</h2>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                            <label>Where are you going?</label>
                                                            <input class="typeahead form-control" placeholder="City, Airport, Point of Interest or U.S. Zip Code" type="text" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-8">
                                                        <div class="input-daterange" data-date-format="M d, D">
                                                            <div class="row">
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Check-in</label>
                                                                        <input class="form-control" name="start" type="text" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Check-out</label>
                                                                        <input class="form-control" name="end" type="text" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-select-plus">
                                                                        <label>Rooms</label>
                                                                        <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                            <label class="btn btn-primary active">
                                                                                <input type="radio" name="options" />1</label>
                                                                            <label class="btn btn-primary">
                                                                                <input type="radio" name="options" />2</label>
                                                                            <label class="btn btn-primary">
                                                                                <input type="radio" name="options" />3</label>
                                                                            <label class="btn btn-primary">
                                                                                <input type="radio" name="options" />3+</label>
                                                                        </div>
                                                                        <select class="form-control hidden">
                                                                            <option>1</option>
                                                                            <option>2</option>
                                                                            <option>3</option>
                                                                            <option selected="selected">4</option>
                                                                            <option>5</option>
                                                                            <option>6</option>
                                                                            <option>7</option>
                                                                            <option>8</option>
                                                                            <option>9</option>
                                                                            <option>10</option>
                                                                            <option>11</option>
                                                                            <option>12</option>
                                                                            <option>13</option>
                                                                            <option>14</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <div class="form-group form-group-lg form-group-select-plus">
                                                                        <label>Guests</label>
                                                                        <div class="btn-group btn-group-select-num" data-toggle="buttons">
                                                                            <label class="btn btn-primary active">
                                                                                <input type="radio" name="options" />1</label>
                                                                            <label class="btn btn-primary">
                                                                                <input type="radio" name="options" />2</label>
                                                                            <label class="btn btn-primary">
                                                                                <input type="radio" name="options" />3</label>
                                                                            <label class="btn btn-primary">
                                                                                <input type="radio" name="options" />3+</label>
                                                                        </div>
                                                                        <select class="form-control hidden">
                                                                            <option>1</option>
                                                                            <option>2</option>
                                                                            <option>3</option>
                                                                            <option selected="selected">4</option>
                                                                            <option>5</option>
                                                                            <option>6</option>
                                                                            <option>7</option>
                                                                            <option>8</option>
                                                                            <option>9</option>
                                                                            <option>10</option>
                                                                            <option>11</option>
                                                                            <option>12</option>
                                                                            <option>13</option>
                                                                            <option>14</option>
                                                                        </select>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <button class="btn btn-primary btn-lg" type="submit">Search for Vacation Rentals</button>
                                        </div>
                                        <div class="tab-pane fade" id="tab-4">
                                            <h2>Search for Cheap Rental Cars</h2>
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Pick-up Location</label>
                                                                  <!--  <input class="typeahead form-control" placeholder="City, Airport, U.S. Zip" type="text" />
                                                                <asp:TextBox ID="TextBox1" runat="server" CssClass=" form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>-->
                                                                    <asp:TextBox ID="carDest" runat="server" CssClass="form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Pick-up Time</label>
                                                                        <asp:TextBox ID="carPickTime" runat="server" CssClass="form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                                    <label>Drop Off Time</label>
                                                                         <asp:TextBox ID="carDropTime" runat="server" CssClass="form-control" placeholder="Enter Source City" TextMode="SingleLine"></asp:TextBox>
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
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="carPickDate" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>Drop-ff Date</label>
                                                                        <!-- <input class="form-control" name="end" type="text" /> -->
                                                                        <asp:TextBox runat="server" CssClass="form-control" ID="carDropDate" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                 <asp:Button runat="server" Text="Search for Cars" CssClass="btn btn-primary btn-lg" CausesValidation="false" ID="btnSearchCars" OnClick="btnSearchCars_Click"/> 
                                        </div>
                                        <div class="tab-pane fade" id="tab-5">
                                            <h2>Search for Activities</h2>
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-map-marker input-icon"></i>
                                                            <label>Where are you going?</label>
                                                            <input class="typeahead form-control" placeholder="City, Airport, Point of Interest or U.S. Zip Code" type="text" />
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="input-daterange" data-date-format="M d, D">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>From</label>
                                                                        <input class="form-control" name="start" type="text" />
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="form-group form-group-lg form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-highlight"></i>
                                                                        <label>To</label>
                                                                        <input class="form-control" name="end" type="text" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                               <button class="btn btn-primary btn-lg" type="submit">Search for Activities</button>
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
                                    <p class="thumb-desc">Risus quisque egestas venenatis potenti lobortis senectus tellus sodales commodo</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumb">
                                <header class="thumb-header"><i class="fa fa-thumbs-o-up box-icon-black round box-icon-big animate-icon-top-to-bottom"></i>
                                </header>
                                <div class="thumb-caption">
                                    <h5 class="thumb-title"><a class="text-darken" href="#">Best Travel Agent</a></h5>
                                    <p class="thumb-desc">Montes dictumst tortor a suspendisse accumsan blandit adipiscing proin ut</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="thumb">
                                <header class="thumb-header"><i class="fa fa-send box-icon-black round box-icon-big animate-icon-top-to-bottom"></i>
                                </header>
                                <div class="thumb-caption">
                                    <h5 class="thumb-title"><a class="text-darken" href="#">Best Destinations</a></h5>
                                    <p class="thumb-desc">Cubilia malesuada odio aptent est etiam mollis velit dictumst posuere</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="gap gap-small"></div>
        </div>
        <div class="bg-holder">
            <div class="bg-mask"></div>
            <div class="bg-img" style="background-image:url(images/2048x1293.png);"></div>
            <div class="bg-content">
                <div class="container">
                    <div class="gap gap-big text-center text-white">
                        <h2 class="text-uc mb20">Last Minute Deal</h2>
                        <ul class="icon-list list-inline-block mb0 last-minute-rating">
                            <li><i class="fa fa-star"></i>
                            </li>
                            <li><i class="fa fa-star"></i>
                            </li>
                            <li><i class="fa fa-star"></i>
                            </li>
                            <li><i class="fa fa-star"></i>
                            </li>
                            <li><i class="fa fa-star"></i>
                            </li>
                        </ul>
                        <h5 class="last-minute-title">The Peninsula - New York</h5>
                        <p class="last-minute-date">Fri 14 Mar - Sun 16 Mar</p>
                        <p class="mb20"><b>$120</b> / person</p><a class="btn btn-lg btn-white btn-ghost" href="#">Book Now <i class="fa fa-angle-right"></i></a>
                    </div>
                </div>
            </div>
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
                                    <img src="images/800x600.png" alt="Image Alternative text" title="196_365" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/fr.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">Paris</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Nullam potenti ac sagittis iaculis justo</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/800x600.png" alt="Image Alternative text" title="El inevitable paso del tiempo" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/hu.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">Budapest</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Sociis interdum sed a senectus porta</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/800x600.png" alt="Image Alternative text" title="Upper Lake in New York Central Park" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/us.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">New York</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Erat ultricies auctor tellus natoque cursus</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="thumb">
                            <header class="thumb-header">
                                <a class="hover-img curved" href="#">
                                    <img src="images/800x600.png" alt="Image Alternative text" title="people on the beach" />
                                </a>
                            </header>
                            <div class="img-left">
                                <img src="images/flags/32/gr.png" alt="Image Alternative text" title="Image Title" />
                            </div>
                            <div class="thumb-caption">
                                <h4 class="thumb-title"><a class="text-darken" href="#">Crete</a></h4>
                                <div class="thumb-caption">
                                    <p class="thumb-desc">Cursus parturient commodo diam donec est</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <script type="text/javascript">
                $(function () {
                    $("#<%= txtStartDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= txtEndDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= txtStartDate2.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= txtEndDate2.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= txtCheckin.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= txtCheckout.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= carPickDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                    $("#<%= carDropDate.ClientID %>").datepicker({ dateFormat: 'mm/dd/yy' });
                });
            </script>
            </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>