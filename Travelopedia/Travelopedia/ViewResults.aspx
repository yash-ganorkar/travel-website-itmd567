<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResults.aspx.cs" Inherits="Travelopedia.ViewResults" %>

<!DOCTYPE html>
<html>
<head>
      <title>Hello AngularJS - Hello World</title>

      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/angular-ui/bower-ui-grid/master/ui-grid.min.css">
      <link rel="stylesheet" href="Content/font-awesome.css">
      <link rel="stylesheet" href="Content/icomoon.css">
      <link rel="stylesheet" href="Content/styles.css">
      <link rel="stylesheet" href="Content/mystyles.css">
       <script src="Scripts/angular.min.js"></script>
          <style type="text/css">
         .grid {
         width: 1500px;
         height: 250px;
         }
         .panel-body {
         width: 100%;
         max-height: 800px;
         overflow-y: scroll;
         }
         #veil {
         position: absolute;
         top: 0;
         left: 0;
         height: 100%;
         width: 100%;
         cursor: not-allowed;
         filter: alpha(opacity=60);
         opacity: 0.6;
         background: #000000 url(https://www.w3schools.com/angular/pic_angular.jpg) no-repeat center;
         }
         #feedLoading {
         position: absolute;
         top: 200px;
         width: 100%;
         text-align: center;
         font-size: 4em;
         color: white;
         text-shadow: 2px 2px 2px #021124;
         }
      </style>
</head>
<body>
    <form id="form1">
      <div class="container" ng-app="myApp">
        <div class="panel-body">
            <div ng-controller="DataCtrl" ng-init="loadData()">
               <div id="veil" ng-show="isLoading"></div>
               <div id="feedLoading" ng-show="isLoading">Loading...</div>
               <div class="row" id="cardata">
                  <div class="col-md-3" id="test">
                     <div class="booking-item-dates-change mb30">
                        <form class="input-daterange" data-date-format="m/d">
                           <div class="form-group form-group-icon-left"><i class="fa fa-map-marker input-icon input-icon-hightlight"></i>
                              <label>Pickup Location</label>
                              <input class="typeahead form-control" id="startcity" placeholder="City or Airport" value="Chicago-Illinois" type="text">
                           </div>
                           <div class="row">
                              <div class="col-md-6">
                                 <div class="form-group form-group-icon-left form-group-filled"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
                                    <label>Start Date</label>
                                    <input class="form-control" id="startdate" name="start" type="text" value="11/16/2017">
                                 </div>
                              </div>
                              <div class="col-md-6">
                                 <div class="form-group form-group-icon-left"><i class="fa fa-clock-o input-icon input-icon-hightlight"></i>
                                    <label>Pickup Time</label>
                                    <input class="time-pick form-control" id="starttime" placeholder="12:00 AM" value="10:00" type="text">
                                 </div>
                              </div>
                           </div>
                           <div class="form-group form-group-icon-left"><i class="fa fa-map-marker input-icon input-icon-hightlight"></i>
                              <label>Drop Off Location</label>
                              <input class="typeahead form-control" id="endcity" placeholder="Same as drop" value="Chicago-Illinois" type="text">
                           </div>
                           <div class="row">
                              <div class="col-md-6">
                                 <div class="form-group form-group-icon-left form-group-filled"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
                                    <label>End Date</label>
                                    <input class="form-control" name="end" id="enddate" value="11/17/2017" type="text">
                                 </div>
                              </div>
                              <div class="col-md-6">
                                 <div class="form-group form-group-icon-left"><i class="fa fa-clock-o input-icon input-icon-hightlight"></i>
                                    <label>Dropoff Time</label>
                                    <input class="time-pick form-control" id="endtime" value="11:30" type="text">
                                 </div>
                              </div>
                           </div>
                           <input class="btn btn-primary" type="submit" ng-click="loadFilteredData()" value="Update Search">
                        </form>
                     </div>
                  </div>
                  <div class="col-md-9" id="webservicedata">
                     <div ng-repeat="item in items | startFrom:currentPage*pageSize | limitTo:pageSize" class="card-columns booking-list">
                        <li>
                           <a class="booking-item" href="#">
                              <div class="row">
                                 <div class="col-md-3">
                                    <div ng-if="item.CarTypeName == 'Economy'">
                                       <div class="booking-item-car-img">
                                          <img src="img/spark.png" alt="Car" title="Car" />
                                          <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                    </div>
                                    <div ng-if="item.CarTypeName == 'Compact'">
                                       <div class="booking-item-car-img">
                                          <img src="img/versa.png" alt="Car" title="Car" />
                                          <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                    </div>
                                    <div ng-if="item.CarTypeName == 'Midsize'">
                                       <div class="booking-item-car-img">
                                          <img src="img/corolla.png" alt="Car" title="Car" />
                                          <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                    </div>
                                    <div ng-if="item.CarTypeName == 'Premium'">
                                       <div class="booking-item-car-img">
                                          <img src="img/maxima.png" alt="Car" title="Car" />
                                          <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                    </div>
                                    <div ng-if="item.CarTypeName == 'Luxury'">
                                       <div class="booking-item-car-img">
                                          <img src="img/luxury.png" alt="Car" title="Car" />
                                          <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                    </div>
                                     <div ng-if="item.CarTypeName == 'Full Size SUV'">
                                       <div class="booking-item-car-img">
                                           <img src="img/NissanFullSizeSUV.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                       <div ng-if="item.CarTypeName == 'Standard'">
                                       <div class="booking-item-car-img">
                                           <img src="img/StandardSUV.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                       <div ng-if="item.CarTypeName == 'Midsize SUV'">
                                       <div class="booking-item-car-img">
                                           <img src="img/Mid-Size-SUV.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                      <div ng-if="item.CarTypeName == 'Standard SUV'">
                                       <div class="booking-item-car-img">
                                           <img src="img/StandardSUV.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                     <div ng-if="item.CarTypeName == 'Minivan'">
                                       <div class="booking-item-car-img">
                                           <img src="img/minivan.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                       <div ng-if="item.CarTypeName == 'Convertible'">
                                       <div class="booking-item-car-img">
                                           <img src="img/Convertible.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                     <div ng-if="item.CarTypeName == 'Full Size'">
                                       <div class="booking-item-car-img">
                                           <img src="img/NissanFullSizeSUV.png" alt="Car" title="Car" />
                                           <p class="booking-item-car-title">{{ item.PossibleModels }}</p>
                                       </div>
                                       </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="row">
                                       <h5 class="booking-item-title">Agency Name: {{ item.RentalAgency }}</h5>
                                       <p class="booking-item-address"><i class="fa fa-map-marker"></i>
                                          <br/>{{ item.VendorLocation }}
                                       </p>
                                       <ul class="booking-item-features booking-item-features-sign clearfix">
                                          <li rel="tooltip" data-placement="top" title="Passengers"><i class="fa fa-male"></i><span style="bottom:-8px;" class="booking-item-feature-sign">{{ item.TypicalSeating }}</span>
                                          </li>
                                          <li rel="tooltip" data-placement="top" title="Doors"><i class="im im-car-doors"></i><span class="booking-item-feature-sign" style="bottom: -8px;">{{ item.MileageDescription }}</span>
                                          </li>
                                          <li rel="tooltip" data-placement="top" data-original-title="Air Conditioning"><i class="im im-air"></i><span class="booking-item-feature-sign" style="bottom:-8px">AC</span>
                                          </li>
                                          <li rel="tooltip" data-placement="top" data-original-title="Power Steering"><i class="im im-car-wheel"></i><span class="booking-item-feature-sign" style="bottom:-8px">Power Steering</span>
                                          </li>
                                          <li rel="tooltip" data-placement="top" data-original-title="FM Radio"><i class="im im-fm"></i><span class="booking-item-feature-sign" style="bottom:-8px">FM Radio</span>
                                          </li>
                                          <li rel="tooltip" data-placement="top" data-original-title="Automic Transmission"><i class="im im-shift-auto"></i><span class="booking-item-feature-sign" style="bottom:-8px">Automic Transmission</span>
                                          </li>
                                       </ul>
                                    </div>
                                 </div>
                                 <div class="col-md-3">
                                    <span class="booking-item-price">${{ item.DailyRate }}</span><span>/day</span>
                                    <p class="booking-item-flight-class">{{ item.CarTypeName }}</p>
                                    <button class="btn btn-primary" ng-click="selectCar(item)">
                                       Select</button>
                                 </div>
                              </div>
                           </a>
                        </li>
                     </div>
                     <div class="row">
                     <button  ng-click="currentPage=currentPage-1">
                     Previous
                     </button>
                     {{currentPage+1}}/{{numberOfPages()}}
                     <button  ng-click="currentPage=currentPage+1">
                     Next
                     </button>
                     </div>
                  </div>
               </div>
               <div class="row" id="hoteldata">
                  <div class="col-md-3" id="test">
                     <form class="booking-item-dates-change mb30">
                        <div class="form-group form-group-icon-left"><i class="fa fa-map-marker input-icon input-icon-hightlight"></i>
                           <label>Where</label>
                           <input class="typeahead form-control" id="city" placeholder="City, Hotel Name or U.S. Zip Code" type="text" value="Chicago-Illinois">
                        </div>
                        <div class="input-daterange">
                           <div class="form-group form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
                              <label>Check In</label>
                              <input class="form-control" id="checkindate" name="start" value="11/16/2017" type="text">
                           </div>
                           <div class="form-group form-group-icon-left"><i class="fa fa-calendar input-icon input-icon-hightlight"></i>
                              <label>Check Out</label>
                              <input class="form-control" name="end" id="checkoutdate" value="11/17/2017" type="text">
                           </div>
                        </div>
                        <div class="form-group form-group- form-group-select-plus">
                           <label>Guests</label>
                           <select id="guests" class="form-control">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                           </select>
                        </div>
                        <div class="form-group form-group- form-group-select-plus">
                           <label>Rooms</label>
                           <select id="rooms" class="form-control">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                           </select>
                        </div>
                        <div class="form-group form-group- form-group-select-plus">
                           <label>children</label>
                           <select id="children" class="form-control">
                              <option value="1">1</option>
                              <option value="2">2</option>
                              <option value="3">3</option>
                              <option value="4">4</option>
                              <option value="5">5</option>
                              <option value="6">6</option>
                              <option value="7">7</option>
                              <option value="8">8</option>
                              <option value="9">9</option>
                           </select>
                        </div>
                        <input class="btn btn-primary" type="submit" ng-click="loadFilteredData()" value="Update Search">
                     </form>
                  </div>
                  <div class="col-md-9" id="webservicedata">
                     <div ng-repeat="item in items | startFrom:currentPage*pageSize | limitTo:pageSize" class="card-columns booking-list">
                        <li>
                           <a class="booking-item" href="#">
                              <div class="row">
                                 <div class="col-md-3">
                                    <div ng-if="item.subtotal <= '200'">
                                       <div class="booking-item-img-wrap">
                                          <img src="img/hotel4.jpg" alt="Hotel" title="Hotel" />
                                       </div>
                                    </div>
                                    <div ng-if="item.subtotal <= '300' && item.subtotal > '200'">
                                       <div class="booking-item-img-wrap">
                                          <img src="img/hotel5.jpg" alt="Hotel" title="Hotel" />
                                       </div>
                                    </div>
                                    <div ng-if="item.subtotal <= '400' && item.subtotal > '300'">
                                       <div class="booking-item-img-wrap">
                                          <img src="img/hotel1.jpg" alt="Hotel" title="Hotel" />
                                       </div>
                                    </div>
                                    <div ng-if="item.subtotal <= '500' && item.subtotal > '400'">
                                       <div class="booking-item-img-wrap">
                                          <img src="img/hotel6.jpg" alt="Car" title="Car" />
                                       </div>
                                    </div>
                                    <div ng-if="item.subtotal <= '600' && item.subtotal > '500'">
                                       <div class="booking-item-img-wrap">
                                          <img src="img/hotel2.jpg" alt="Car" title="Car" />
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-md-6">
                                    <div class="booking-item-rating">
                                       <span class="booking-item-rating-number"><b>***</b></span>
                                    </div>
                                    <h5 class="booking-item-title">{{ item.name }}</h5>
                                    <p class="booking-item-address"><i class="fa fa-map-marker"></i>{{ item.city }}, {{ item.state }}</p>
                                 </div>
                                 <div class="col-md-3">
                                    <span class="booking-item-price-from">from</span>
                                    <span class="booking-item-price">${{ item.subtotal }}</span>
                                    <button class="btn btn-primary" ng-click="selectHotel(item)">Book Now
                                    </button>
                                 </div>
                              </div>
                           </a>
                        </li>
                     </div>
                     <div class="row">
                        <button type="button" ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">
                        Previous
                        </button>
                        {{currentPage+1}}/{{numberOfPages()}}
                        <button type="button" ng-disabled="currentPage == data.length -1" ng-click="currentPage=currentPage+1">
                        Next
                        </button>
                     </div>
                  </div>
               </div>
               <div class="row" id="eventdata">
                  <div class="col-md-3" id="test">
                     <div class="booking-item-dates-change mb30">
                        <form class="input-daterange" data-date-format="m/d">
                           <div class="form-group form-group-icon-left"><i class="fa fa-map-marker input-icon input-icon-hightlight"></i>
                              <label>Where</label>
                              <input class="typeahead form-control" placeholder="City or Airport" value="Chicago-Illinois" type="text" id="eventlocation">
                           </div>
                           <input class="btn btn-primary" type="submit" ng-click="loadFilteredData()" value="Update Search">
                        </form>
                     </div>
                  </div>
                  <div class="col-md-9" id="webservicedata2">
                    <div ng-repeat="item in items | startFrom:currentPage*pageSize | limitTo:pageSize" class="card-columns booking-list">
                        <li>
                           <div class="row">
                              <div class="col-md-4">
                                 <img src="{{item.logo.url}}" alt="Image Alternative text" title="Trebbiano Ristorante - japenese breakfast" />
                              </div>
                              <div class="col-md-5">
                                 <div class="booking-item-rating">
                                    <ul class="icon-group booking-item-rating-stars">
                                       <li><i class="fa fa-star"></i>
                                       </li>
                                    </ul>
                                    <span class="booking-item-rating-number">{{item.status}}</span>
                                 </div>
                                 <h5 class="booking-item-title">{{ item.name.text }}</h5>
                                 <p class="booking-item-address"><i class="fa fa-map-marker"></i> {{ item.start.timezone }}</p>
                                 <p class="booking-item-description" >Event Start: {{ item.start.local | date : "EEEE, MMM d, y hh:mm a" }}</p>
                                 <p class="booking-item-description" >Event End: {{ item.end.local | date : "EEEE, MMM d, y hh:mm a" }}</p>
                              </div>
                              <div class="col-md-3"><span class="booking-item-price">{{item.capacity}}</span><span>capacity</span><a class="btn btn-primary" href="{{item.url}}">Add to Trip</a>
                              </div>
                           </div>
                        </li>
                     </div>
                     <div class="row">
                        <button ng-click="currentPage=currentPage-1">
                        Previous
                        </button>
                        {{currentPage+1}}/{{numberOfPages()}}
                        <button ng-click="currentPage=currentPage+1">
                        Next
                        </button>
                     </div>                     
                  </div>
               </div>
            </div>
        </div>
      </div>
      <script type="text/javascript">
         document.getElementById('hoteldata').style.display = "none";                
         document.getElementById('cardata').style.display = "none";  
         document.getElementById('eventdata').style.display = "none";      
         
         var App = angular.module('myApp', []);
         
         var data = {
         
         };
         
         App.controller("DataCtrl", function($scope, $http) {
         
             $scope.selectCar = function(car){
                 alert(car.DailyRate);
             }
         
             $scope.selectHotel = function(hotel){
                 alert(hotel.subtotal);
             }
             $scope.selectEvents = function(events){
                 alert(events.capacity);
             }
         
             $scope.setLoading = function(loading) {
                 $scope.isLoading = loading;
             }
             if(window.location.href.includes('hotel'))
         {
             if(document.getElementById('hoteldata').style.display == "none"){
                 document.getElementById('hoteldata').style.display = "block"
                 document.getElementById('cardata').style.display = "none";
                 document.getElementById('eventdata').style.display = "none";
             }
         
             $scope.loadData = function() {
                 
                 $scope.setLoading(true);
                 document.getElementById('webservicedata').style.display = "none";
                 
                 document.getElementById('city').disabled = true;
                 document.getElementById('checkindate').disabled = true;
                 document.getElementById('checkoutdate').disabled = true;
                 document.getElementById('guests').disabled = true;
                 document.getElementById('rooms').disabled = true;
                 document.getElementById('children').disabled = true;
         
                 var httpRequest = $http({
                     method: 'GET',
                     url: 'http://localhost/Travelopedia-API/api/hotels/allhotels',
                     params: {
                         destination: "Chicago",
                         rooms: "1",
                         adults: "1",
                         children: "1",
                         startdate: "11/20/2017",
                         enddate: "11/26/2017"
                     }
         
                     //data: mockData
         
                 }).then(function (response) {
                     console.log(response.data);
                     var dataLength = response.data.hotelRoomDetails.length;
                     $scope.items = response.data.hotelRoomDetails;
                     $scope.currentPage = 0;
                     $scope.pageSize = 4;
         
                     $scope.numberOfPages = function () {
                         return Math.ceil(dataLength / $scope.pageSize);
                     }
                     $scope.setLoading(false);
                 document.getElementById('webservicedata').style.display = "block";
         
                 document.getElementById('city').disabled = false;
                 document.getElementById('checkindate').disabled = false;
                 document.getElementById('checkoutdate').disabled = false;
                 document.getElementById('guests').disabled = false;
                 document.getElementById('rooms').disabled = false;
                 document.getElementById('children').disabled = false;
         
                 }, function(error) {
                     alert(error);
                     //    $scope.setLoading(false);
                 });
         
             };
         
         
             $scope.loadFilteredData = function() {
         
         
                 document.getElementById('city').disabled = true;
                 document.getElementById('checkindate').disabled = true;
                 document.getElementById('checkoutdate').disabled = true;
                 document.getElementById('guests').disabled = true;
                 document.getElementById('rooms').disabled = true;
                 document.getElementById('children').disabled = true;
         
         
                 $scope.setLoading(true);
                 document.getElementById('webservicedata').style.display = "none";
         
                 var httpRequest = $http({
                     method: 'GET',
                     url: 'http://localhost/Travelopedia-API/api/hotels/allhotels',
                     params: {
                         destination: document.getElementById('city').value.split('-')[0],
                         rooms: document.getElementById('rooms').value,
                         adults: document.getElementById('guests').value,
                         children: document.getElementById('children').value,
                         startdate: document.getElementById('checkindate').value,
                         enddate: document.getElementById('checkoutdate').value
                     }
         
                     //data: mockData
         
                 }).then(function(data, status) {
                     $scope.items = data.hotelRoomDetails;
                     $scope.currentPage = 0;
                     $scope.pageSize = 4;
         
                     $scope.numberOfPages = function() {
                         return Math.ceil($scope.items.length / $scope.pageSize);
                     }
                     $scope.setLoading(false);
                 document.getElementById('webservicedata').style.display = "block";
         
                 document.getElementById('city').disabled = false;
                 document.getElementById('checkindate').disabled = false;
                 document.getElementById('checkoutdate').disabled = false;
                 document.getElementById('guests').disabled = false;
                 document.getElementById('rooms').disabled = false;
                 document.getElementById('children').disabled = false;
         
                 }, function(error) {
                     alert(error);
                     //    $scope.setLoading(false);
                 });
         
             };    
         }            
         
             else if(window.location.href.includes('car'))
         {            
             
         
             if(document.getElementById('cardata').style.display == "none"){
                 document.getElementById('hoteldata').style.display = "none";
                 document.getElementById('cardata').style.display = "block";
                 document.getElementById('eventdata').style.display = "none";

             }
         
             $scope.loadData = function() {
                 $scope.setLoading(true);
         
                 document.getElementById('webservicedata').style.display = "none";
         
                 document.getElementById('startcity').disabled = true;
                 document.getElementById('endcity').disabled = true;
                 document.getElementById('startdate').disabled = true;
                 document.getElementById('enddate').disabled = true;
                 document.getElementById('starttime').disabled = true;
                 document.getElementById('endtime').disabled = true;
         
                 var httpRequest = $http({
                     method: 'GET',
                     url: 'http://10.0.0.248/Travelopedia-API/api/car/allcars',
                     params: {
                         location: "Chicago",
                         startdate: "11/20/2017",
                         enddate: "11/26/2017",
                         pickuptime: "10:00",
                         dropofftime: "10:00"
                     }
                     //data: mockData
         
                 }).success(function(data, status) {
                     $scope.items = data.carResults;
                     $scope.currentPage = 0;
                     $scope.pageSize = 4;
         
                     $scope.numberOfPages = function() {
                         return Math.ceil($scope.items.length / $scope.pageSize);
                     }
                     $scope.setLoading(false);
         
                 document.getElementById('webservicedata').style.display = "block";
         
                     document.getElementById('startcity').disabled = false;
                     document.getElementById('endcity').disabled = false;
                     document.getElementById('startdate').disabled = false;
                     document.getElementById('enddate').disabled = false;
                     document.getElementById('starttime').disabled = false;
                     document.getElementById('endtime').disabled = false;
         
                 }).error(function(error) {
                     alert(error);
                     //    $scope.setLoading(false);
                 });
         
             };
         
         
             $scope.loadFilteredData = function() {
         
         
                 document.getElementById('startcity').disabled = true;
                 document.getElementById('endcity').disabled = true;
                 document.getElementById('startdate').disabled = true;
                 document.getElementById('enddate').disabled = true;
                 document.getElementById('starttime').disabled = true;
                 document.getElementById('endtime').disabled = true;
         
         
                 $scope.setLoading(true);
         
                 document.getElementById('webservicedata').style.display = "none";
         
                 var httpRequest = $http({
                     method: 'GET',
                     url: 'http://10.0.0.248/Travelopedia-API/api/car/allcars',
                     params: {
                         location: document.getElementById('startcity').value.split('-')[0],
                         startdate: document.getElementById('startdate').value,
                         enddate: document.getElementById('enddate').value,
                         pickuptime: document.getElementById('starttime').value,
                         dropofftime: document.getElementById('endtime').value
                     }
                     //data: mockData
         
                 }).success(function(data, status) {
                     $scope.items = data.carResults;
                     $scope.currentPage = 0;
                     $scope.pageSize = 4;
         
                     $scope.numberOfPages = function() {
                         return Math.ceil($scope.items.length / $scope.pageSize);
                     }
                     $scope.setLoading(false);
         
                 document.getElementById('webservicedata').style.display = "block";
         
                     document.getElementById('startcity').disabled = false;
                     document.getElementById('endcity').disabled = false;
                     document.getElementById('startdate').disabled = false;
                     document.getElementById('enddate').disabled = false;
                     document.getElementById('starttime').disabled = false;
                     document.getElementById('endtime').disabled = false;
                 }).error(function(error) {
                     alert(error);
                     //    $scope.setLoading(false);
                 });
         
             };    
         }            
         
         else if(window.location.href.includes('events'))
         {            
             
         
             if(document.getElementById('eventdata').style.display == "none"){
                 document.getElementById('hoteldata').style.display = "none";
                 document.getElementById('cardata').style.display = "none";
                 document.getElementById('eventdata').style.display = "block";
             }
         
             $scope.loadData = function() {
                 $scope.setLoading(true);
         
                 document.getElementById('webservicedata2').style.display = "none";
         
                 document.getElementById('eventlocation').disabled = true;
                 
         
                 var httpRequest = $http({
                     method: 'GET',
                     url: 'http://10.0.0.248/Travelopedia-API/api/events/allevents',
                     params: {
                         location: "Chicago",
                         
                     }
                     //data: mockData
         
                 }).success(function(data, status) {
                     data = JSON.parse(data)
                     $scope.items = data.events;
                     $scope.currentPage = 0;
                     $scope.pageSize = 4;
         
                     $scope.numberOfPages = function() {
                         return Math.ceil($scope.items.length / $scope.pageSize);
                     }
                     $scope.setLoading(false);
         
                 document.getElementById('webservicedata2').style.display = "block";
         
                     document.getElementById('eventlocation').disabled = false;
                     
         
                 }).error(function(error) {
                     alert(error);
                     //    $scope.setLoading(false);
                 });
         
             };
         
         
             $scope.loadFilteredData = function() {
         
                $scope.setLoading(true);
                
                 document.getElementById('eventlocation').disabled = true;
                 
                document.getElementById('webservicedata2').style.display = "none";
         
                 
         
                 
         
                 var httpRequest = $http({
                     method: 'GET',
                     url: 'http://10.0.0.248/Travelopedia-API/api/events/allevents',
                     params: {
                         location: document.getElementById('eventlocation').value.split('-')[0]
                     }
                     //data: mockData
         
                 }).success(function(data, status) {
                     data = JSON.parse(data)
                     $scope.items = data.events;
                     $scope.currentPage = 0;
                     $scope.pageSize = 4;
                    
                    console.log(data.events);
                     $scope.numberOfPages = function() {
                         return Math.ceil($scope.items.length / $scope.pageSize);
                     }
                     $scope.setLoading(false);
         
                 document.getElementById('webservicedata2').style.display = "block";
         
                     document.getElementById('eventlocation').disabled = false;
                     
                 }).error(function(error) {
                     alert(error);
                     //    $scope.setLoading(false);
                 });
         
             };    
         }            
         
         
         });
         
         App.filter('startFrom', function() {
             return function(input, start) {
                 if (!input || !input.length) {
                     return;
                 }
                 start = +start; //parse to int
                 return input.slice(start);
             }
         });
         
         //url = http://10.0.0.248/Travelopedia-API/api/hotels/allhotels
      </script>
      <script src="Scripts/jquery.js"></script>
      <script src="Scripts/bootstrap.js"></script>
      <script src="Scripts/slimmenu.js"></script>
      <script src="Scripts/bootstrap-datepicker.js"></script>
      <script src="Scripts/bootstrap-timepicker.js"></script>
      <script src="Scripts/nicescroll.js"></script>
      <script src="Scripts/dropit.js"></script>
      <script src="Scripts/ionrangeslider.js"></script>
      <script src="Scripts/icheck.js"></script>
      <script src="Scripts/fotorama.js"></script>
      <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>
      <script src="Scripts/typeahead.js"></script>
      <script src="Scripts/card-payment.js"></script>
      <script src="Scripts/magnific.js"></script>
      <script src="Scripts/owl-carousel.js"></script>
      <script src="Scripts/fitvids.js"></script>
      <script src="Scripts/tweet.js"></script>
      <script src="Scripts/countdown.js"></script>
      <script src="Scripts/gridrotator.js"></script>
      <pagination ng-model="currentPage" total-items="todos.length" max-size="maxSize" boundary-links="true">
      </pagination>
    </form>
</body>
</html>
