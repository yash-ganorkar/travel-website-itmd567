<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Travelopedia.Results" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" ClientIDMode="Static" runat="server">
    <style>
        #preloader 
{ position: fixed; left: 0; top: 0; z-index: 999; width: 100%; height: 100%; overflow: visible; background: #333 url('http://files.mimoymima.com/images/loading.gif') no-repeat center center; }
    </style>
    <asp:UpdatePanel runat="server" EnableViewState="true" ID="Panel1">
        <ContentTemplate>

            <div class="container">
                
                    <h2 class="entry-title">Search Results</h2>
                
          
              <div class="row">

                  <div class="col-md-3" id="test">
                     
                  </div>
                 
                   
                <div class="col-md-9">
                    <ul id="flightCards" class="card-columns booking-list">

                    </ul>
                    </div>
                  </div>
            </div>
            
            <asp:HiddenField ID="hiddenField1" ClientIDMode="Static" runat="server"/>
            <asp:Button ID="Button2" runat="server" Visible="false" OnClick="Button2_Click" Text="Button" />
            <asp:HiddenField ID="hiddenField2" ClientIDMode="Static" runat="server" />
            <asp:TextBox runat="server" ID="hiddenTextBox1" ClientIDMode="Static" Style="display: none;" OnTextChanged="hiddenTextBox1_TextChanged"></asp:TextBox>
            <asp:HiddenField runat="server" ID="hiddenFieldLogin" ClientIDMode="Static"/>
            <script type="text/javascript">
                var type = document.getElementById('hiddenField1').value;
                var neighborhoodData = new Array();

                if (type == "hotel") {
                    $.ajax({
                        url: "http://localhost/Travelopedia-API/api/hotels/allhotels?",
                        type: "get", //send it through get method
                        data: {
                            destination: getParameterByName("dest"),
                            rooms: getParameterByName("rooms"),
                            adults: getParameterByName("adults"),
                            children: getParameterByName("children"),
                            startdate: getParameterByName("startdate"),
                            enddate: getParameterByName("enddate")
                        },
                        cache: false,
                        success: function (response) {
                            //alert(response.hotelRoomDetails[0].city);

                            var res = response.hotelRoomDetails;
                            var flightCards = document.getElementById('flightCards');

                            



                            var filterform = document.getElementById("test");
                            var maindiv = document.createElement("form");
                            maindiv.setAttribute("class", "booking-item-dates-change mb30");
                            var filterdivwhere = document.createElement("div");
                            filterdivwhere.setAttribute("class", "form-group form-group-icon-left");
                            var mapicon = document.createElement("i");
                            mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                            filterdivwhere.appendChild(mapicon);
                            var wherelabel = document.createElement("label");
                            var where = document.createTextNode("Where");
                            wherelabel.appendChild(where);
                            filterdivwhere.appendChild(wherelabel);
                            var whereinput = document.createElement("input");
                            whereinput.setAttribute("class", "typeahead form-control");
                            whereinput.setAttribute("placeholder", "City, Hotel Name or U.S. Zip Code");
                            whereinput.setAttribute("type", "text");
                            whereinput.setAttribute("value", getParameterByName("dest"));
                            filterdivwhere.appendChild(whereinput);

                            var filterdivwhen = document.createElement("div");
                            filterdivwhen.setAttribute("class", "input-daterange");

                            var checkindiv = document.createElement("div");
                            checkindiv.setAttribute("class", "form-group form-group-icon-left");
                            filterdivwhen.appendChild(checkindiv);
                            var calendar = document.createElement("i");
                            calendar.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                            checkindiv.appendChild(calendar);
                            var whenlabel = document.createElement("label");
                            var checkin = document.createTextNode("Check In");
                            whenlabel.appendChild(checkin);
                            checkindiv.appendChild(whenlabel);
                            var checkininput = document.createElement("input");
                            checkininput.setAttribute("class", "form-control");
                            checkininput.setAttribute("name", "start");
                            checkininput.setAttribute("value", getParameterByName("startdate"));
                            checkininput.setAttribute("type", "text");
                            checkindiv.appendChild(checkininput);

                            var checkoutdiv = document.createElement("div");
                            checkoutdiv.setAttribute("class", "form-group form-group-icon-left");
                            filterdivwhen.appendChild(checkoutdiv);
                            var calendar = document.createElement("i");
                            calendar.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                            checkoutdiv.appendChild(calendar);
                            var whenlabel = document.createElement("label");
                            var checkout = document.createTextNode("Check Out");
                            whenlabel.appendChild(checkout);
                            checkoutdiv.appendChild(whenlabel);
                            var checkoutinput = document.createElement("input");
                            checkoutinput.setAttribute("class", "form-control");
                            checkoutinput.setAttribute("name", "end");
                            checkoutinput.setAttribute("value", getParameterByName("enddate"))
                            checkoutinput.setAttribute("type", "text");
                            checkoutdiv.appendChild(checkoutinput);

                            var guestdiv = document.createElement("div");
                            guestdiv.setAttribute("class", "form-group form-group- form-group-select-plus");
                            var guestlabel = document.createElement("label");
                            var guesttext = document.createTextNode("Guests");
                            guestlabel.appendChild(guesttext);
                            guestdiv.appendChild(guestlabel);
                            var dropdown = document.createElement("select");
                            dropdown.setAttribute("class", "form-control");
                            var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
                            for (var i = 0; i < array.length; i++) {
                                var option = document.createElement("option");
                                option.value = array[i];
                                option.text = array[i];
                                dropdown.appendChild(option);
                            }
                            guestdiv.appendChild(dropdown);


                            var roomdiv = document.createElement("div");
                            roomdiv.setAttribute("class", "form-group form-group- form-group-select-plus");
                            var roomlabel = document.createElement("label");
                            var roomtext = document.createTextNode("Rooms");
                            roomlabel.appendChild(roomtext);
                            roomdiv.appendChild(roomlabel);
                            var dropdown = document.createElement("select");
                            dropdown.setAttribute("class", "form-control");
                            var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
                            for (var i = 0; i < array.length; i++) {
                                var option = document.createElement("option");
                                option.value = array[i];
                                option.text = array[i];
                                dropdown.appendChild(option);
                            }
                            roomdiv.appendChild(dropdown);


                            var childiv = document.createElement("div");
                            childiv.setAttribute("class", "form-group form-group- form-group-select-plus");
                            var childlabel = document.createElement("label");
                            var childtext = document.createTextNode("children");
                            childlabel.appendChild(childtext);
                            childiv.appendChild(childlabel);
                            var dropdown = document.createElement("select");
                            dropdown.setAttribute("class", "form-control");
                            var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
                            for (var i = 0; i < array.length; i++) {
                                var option = document.createElement("option");
                                option.value = array[i];
                                option.text = array[i];
                                dropdown.appendChild(option);
                            }
                            childiv.appendChild(dropdown);

                            var updatebt = document.createElement("input");
                            updatebt.setAttribute("class", "btn btn-primary");
                            updatebt.setAttribute("type", "submit");
                            updatebt.setAttribute("value", "Update Search");


                            filterform.appendChild(maindiv);
                            maindiv.appendChild(filterdivwhere);
                            maindiv.appendChild(filterdivwhen);
                            maindiv.appendChild(guestdiv);
                            maindiv.appendChild(roomdiv);
                            maindiv.appendChild(childiv);
                            maindiv.appendChild(updatebt);


                            for (var i = 0; i < response.hotelRoomDetails.length; i++) {
                                //alert(response.hotelRoomDetails[0].state);
                                var cent = res[i].centroid;
                                var latlong = cent.split(',');
                                var lat = latlong[0];
                                var long = latlong[1];
                                //console.log("cent=" + cent + "latlong=" + latlong + "lat=" + lat + "long=" + long)    

                                var litag = document.createElement("li");
                                var bookingitem = document.createElement("a");
                                bookingitem.setAttribute("href", "#");
                                bookingitem.setAttribute("class", "booking-item");
                                var rowdiv = document.createElement("div");
                                rowdiv.setAttribute("class", "row");

                                var coldiv1 = document.createElement("div");
                                coldiv1.setAttribute("class", "col-md-3");
                                var imagediv = document.createElement("div");
                                imagediv.setAttribute("class", "booking-item-img-wrap");

                                imagediv.setAttribute("id", "map" + i);
                                imagediv.setAttribute("style", "height:130px;");
                                coldiv1.appendChild(imagediv);

                                
                               

                                var coldiv2 = document.createElement("div");
                                coldiv2.setAttribute("class", "col-md-6");
                                var ratingdiv = document.createElement("div");
                                ratingdiv.setAttribute("class", "booking-item-rating")
                                var rating = document.createElement("span");
                                rating.setAttribute("class", "booking-item-rating-number");
                                var brating = document.createElement("b");
                                var bratingtext = document.createTextNode("***");
                                //var offive = document.createTextNode("of 5");

                                var hotel = document.createElement("h5");
                                hotel.setAttribute("class", "booking-item-title");
                                var link = document.createElement("h5");
                                link.setAttribute("class", "booking-item-title");
                                var hoteltext = document.createTextNode(res[i].name);

                                var bookingadd = document.createElement("p");
                                bookingadd.setAttribute("class", "booking-item-address");
                                var map = document.createElement("i");
                                map.setAttribute("class", "fa fa-map-marker");
                                bookingadd.appendChild(map);
                                var bookingcity = document.createTextNode(res[i].city + ", " + res[i].state);
                                bookingadd.appendChild(bookingcity);

                                brating.appendChild(bratingtext);

                                rating.appendChild(brating);
                                //  rating.appendChild(offive);
                                ratingdiv.appendChild(rating);
                                coldiv2.appendChild(ratingdiv);
                                link.appendChild(hoteltext);
                                hotel.appendChild(link);

                                coldiv2.appendChild(hotel);
                                coldiv2.appendChild(bookingadd);
                                var coldiv3 = document.createElement("div");
                                var from = document.createElement("span");
                                from.setAttribute("class", "booking-item-price-from");
                                var fromtext = document.createTextNode("from");
                                from.appendChild(fromtext);

                                var price = document.createElement("span");
                                price.setAttribute("class", "booking-item-price");
                                var pricetext = document.createTextNode("$" + res[i].subtotal);
                                price.appendChild(pricetext);
                                // var night = document.createElement("span");
                                // var nighttext = document.createTextNode("/night");
                                // night.appendChild(nighttext);
                                var booknow = document.createElement("button");
                                booknow.setAttribute("class", "btn btn-primary");
                                booknow.setAttribute("href", res[i].deeplink);
                                booknow.setAttribute("hotel", res[i].city + "-" + res[i].state + "-" + res[i].subtotal + "-" + getParameterByName("rooms") + "-" + getParameterByName("adults") + "-" + getParameterByName("children"));
                                var booknowtext = document.createTextNode("Book Now");
                                booknow.appendChild(booknowtext);
                                coldiv3.appendChild(from);
                                coldiv3.appendChild(price);
                                //coldiv3.appendChild(night);
                                coldiv3.appendChild(booknow);
                                coldiv3.setAttribute("class", "col-md-3");

                                rowdiv.appendChild(coldiv1);
                                rowdiv.appendChild(coldiv2);
                                rowdiv.appendChild(coldiv3);
                                bookingitem.appendChild(rowdiv);
                                litag.appendChild(bookingitem);
                                flightCards.appendChild(litag);

                                $(booknow).click(function () {
                                    var id = $(this).attr('hotel');
                                    console.log(id);
                                    alert(id);
                                    var params = id.split('-');

                                    alert(params);

                                    var date1 = new Date(getParameterByName("startdate"));
                                    var date2 = new Date(getParameterByName("enddate"));

                                    var paramValues = "hotel" + "&" + params[0] + "&" + params[1] + "&" + params[2] + "&" + params[3] + "&" + params[4] + "&" + params[5] + "&" + getParameterByName("startdate") + "&" + getParameterByName("enddate");
                                    
                                    __doPostBack('Button2', paramValues);
                                    //window.open(url, '_self');
                                });

                                initMap(parseFloat(lat), parseFloat(long), i);

                            }

                        },
                        error: function (xhr) {
                            alert(xhr.error);
                        }
                    });
                }
                else if (type == "car") {

                    $.ajax({
                        url: "http://localhost/Travelopedia-API/api/car/allcars",
                        type: "get", //send it through get method
                        data: {
                            location: getParameterByName("dest"),
                            startdate: getParameterByName("startdate"),
                            enddate: getParameterByName("enddate"),
                            pickuptime: getParameterByName("pickuptime"),
                            dropofftime: getParameterByName("dropofftime")
                        },
                        cache: false,
                        success: function (response) {
                            // console.log(response.carResults);

                            var flightCards = document.getElementById('flightCards');
                            var carresult = response.carResults;

                            var filterform = document.getElementById("test");
                            var maindiv = document.createElement("div");
                            maindiv.setAttribute("class", "booking-item-dates-change mb30");
                            var formc = document.createElement("form");
                            formc.setAttribute("class", "input-daterange");
                            formc.setAttribute("data-date-format", "m/d");

                            var filterdivpickup = document.createElement("div");
                            filterdivpickup.setAttribute("class", "form-group form-group-icon-left");
                            var mapicon = document.createElement("i");
                            mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                            filterdivpickup.appendChild(mapicon);
                            var pickuplabel = document.createElement("label");
                            var pickup = document.createTextNode("Pickup Location");
                            pickuplabel.appendChild(pickup);
                            filterdivpickup.appendChild(pickuplabel);
                            var pickupinput = document.createElement("input");
                            pickupinput.setAttribute("class", "typeahead form-control");
                            pickupinput.setAttribute("placeholder", "City or Airport");
                            pickupinput.setAttribute("value", getParameterByName("dest"));
                            pickupinput.setAttribute("type", "text");
                            filterdivpickup.appendChild(pickupinput);

                            var filterrow = document.createElement("div");
                            filterrow.setAttribute("class", "row");

                            var filtercol = document.createElement("div");
                            filtercol.setAttribute("class", "col-md-6");
                            var checkindiv = document.createElement("div");
                            checkindiv.setAttribute("class", "form-group form-group-icon-left form-group-filled");
                            var calendar = document.createElement("i");
                            calendar.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                            checkindiv.appendChild(calendar);
                            var whenlabel = document.createElement("label");
                            var checkin = document.createTextNode("Start Date");
                            whenlabel.appendChild(checkin);
                            checkindiv.appendChild(whenlabel);
                            var checkininput = document.createElement("input");
                            checkininput.setAttribute("class", "form-control");
                            checkininput.setAttribute("name", "start");
                            checkininput.setAttribute("type", "text");
                            checkininput.setAttribute("value", getParameterByName("startdate"));
                            checkindiv.appendChild(checkininput);

                            filterrow.appendChild(filtercol);
                            filtercol.appendChild(checkindiv);


                            var filtercol = document.createElement("div");
                            filtercol.setAttribute("class", "col-md-6");
                            var checkintimediv = document.createElement("div");
                            checkintimediv.setAttribute("class", "form-group form-group-icon-left");
                            var calendar = document.createElement("i");
                            calendar.setAttribute("class", "fa fa-clock-o input-icon input-icon-hightlight");
                            checkintimediv.appendChild(calendar);
                            var whenlabel = document.createElement("label");
                            var checkintime = document.createTextNode("Pickup Time");
                            whenlabel.appendChild(checkintime);
                            checkintimediv.appendChild(whenlabel);
                            var checkintimeinput = document.createElement("input");
                            checkintimeinput.setAttribute("class", "time-pick form-control");
                            checkintimeinput.setAttribute("placeholder", "12:00 AM");
                            checkintimeinput.setAttribute("value", getParameterByName("pickuptime"));
                            checkintimeinput.setAttribute("type", "text");
                            checkintimediv.appendChild(checkintimeinput);
                            filterrow.appendChild(filtercol);
                            filtercol.appendChild(checkintimediv);

                            var filterdivdrop = document.createElement("div");
                            filterdivdrop.setAttribute("class", "form-group form-group-icon-left");
                            var mapicon = document.createElement("i");
                            mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                            filterdivdrop.appendChild(mapicon);
                            var droplabel = document.createElement("label");
                            var drop = document.createTextNode("Drop Off Location");
                            droplabel.appendChild(drop);
                            filterdivdrop.appendChild(droplabel);
                            var dropinput = document.createElement("input");
                            dropinput.setAttribute("class", "typeahead form-control");
                            dropinput.setAttribute("placeholder", "Same as drop");
                            dropinput.setAttribute("value", getParameterByName("dest"));
                            dropinput.setAttribute("type", "text");
                            filterdivdrop.appendChild(dropinput);

                            var filterrow2 = document.createElement("div");
                            filterrow2.setAttribute("class", "row");

                            var filtercol = document.createElement("div");
                            filtercol.setAttribute("class", "col-md-6");
                            var checkoutdiv = document.createElement("div");
                            checkoutdiv.setAttribute("class", "form-group form-group-icon-left form-group-filled");
                            var calendar = document.createElement("i");
                            calendar.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                            checkoutdiv.appendChild(calendar);
                            var whenlabel = document.createElement("label");
                            var checkout = document.createTextNode("End Date");
                            whenlabel.appendChild(checkout);
                            checkoutdiv.appendChild(whenlabel);
                            var checkoutinput = document.createElement("input");
                            checkoutinput.setAttribute("class", "form-control");
                            checkoutinput.setAttribute("name", "end");
                            checkoutinput.setAttribute("value", getParameterByName("enddate"));
                            checkoutinput.setAttribute("type", "text");
                            checkoutdiv.appendChild(checkoutinput);
                            filterrow2.appendChild(filtercol);
                            filtercol.appendChild(checkoutdiv);

                            var filtercol = document.createElement("div");
                            filtercol.setAttribute("class", "col-md-6");
                            var checkouttimediv = document.createElement("div");
                            checkouttimediv.setAttribute("class", "form-group form-group-icon-left");
                            var calendar = document.createElement("i");
                            calendar.setAttribute("class", "fa fa-clock-o input-icon input-icon-hightlight");
                            checkouttimediv.appendChild(calendar);
                            var whenlabel = document.createElement("label");
                            var checkouttime = document.createTextNode("Dropoff Time");
                            whenlabel.appendChild(checkouttime);
                            checkouttimediv.appendChild(whenlabel);
                            var checkouttimeinput = document.createElement("input");
                            checkouttimeinput.setAttribute("class", "time-pick form-control");
                            checkouttimeinput.setAttribute("value", getParameterByName("dropofftime"));
                            checkouttimeinput.setAttribute("type", "text");
                            checkouttimediv.appendChild(checkouttimeinput);
                            filterrow2.appendChild(filtercol);
                            filtercol.appendChild(checkouttimediv);

                            var updatebt = document.createElement("input");
                            updatebt.setAttribute("class", "btn btn-primary");
                            updatebt.setAttribute("type", "submit");
                            updatebt.setAttribute("value", "Update Search");

                            filterform.appendChild(maindiv);
                            maindiv.appendChild(formc);
                            formc.appendChild(filterdivpickup);
                            formc.appendChild(filterrow);
                            formc.appendChild(filterdivdrop);
                            formc.appendChild(filterrow2);

                            formc.appendChild(updatebt);

                            for (var i = 0; i < response.carResults.length; i++) {

                                

                                var litag = document.createElement("li");
                                var bookingitem = document.createElement("a");
                                bookingitem.setAttribute("class", "booking-item");

                                var rowd = document.createElement("div");
                                rowd.setAttribute("class", "row");

                                var coldiv1 = document.createElement("div");
                                coldiv1.setAttribute("class", "col-md-3");
                                var imgdiv = document.createElement("div");
                                imgdiv.setAttribute("class", "booking-item-car-img");
                                if (carresult[i].PossibleModels.includes("ford")) {
                                    var img = document.createElement("img");
                                    img.setAttribute("src", "images/Honda-Civic.png");
                                }
                                else if (carresult[i].PossibleModels.includes("Nissan")) {
                                    var img = document.createElement("img");
                                    img.setAttribute("src", "images/Nissan-GT-R.png");
                                }
                                else if (carresult[i].PossibleModels.includes("Toyota")) {
                                    var img = document.createElement("img");
                                    img.setAttribute("src", "images/Toyota-Prius-Plus.png");
                                }
                                else if (carresult[i].PossibleModels.includes("kia")) {
                                    var img = document.createElement("img");
                                    img.setAttribute("src", "images/Mercedes-Benz-Clasa-G-facelift.png");
                                }
                                else {
                                    var img = document.createElement("img");
                                    img.setAttribute("src", "images/Volkswagen-Touareg-Edition-X.png");
                                }
                                var carname = document.createElement("p");
                                carname.setAttribute("class", "booking-item-car-title");
                                var carnametext = document.createTextNode(carresult[i].PossibleModels); //possibleModels
                                carname.appendChild(carnametext);


                                imgdiv.appendChild(img);
                                coldiv1.appendChild(imgdiv);
                                coldiv1.appendChild(carname);


                                var coldiv2 = document.createElement("div");
                                coldiv2.setAttribute("class", "col-md-6");
                                var agency = document.createElement("h5");
                                agency.setAttribute("class", "booking-item-title");
                                var agencyname = document.createTextNode("Agency Name: " + carresult[i].RentalAgency); //RentalAgency
                                agency.appendChild(agencyname);
                                var address = document.createElement("p");
                                address.setAttribute("class", "booking-item-address");
                                var maplogo = document.createElement("i");
                                maplogo.setAttribute("class", "fa fa-map-marker");
                                address.appendChild(maplogo);
                                addresstext = document.createTextNode(carresult[i].VendorLocation); //VendorLocation
                                address.appendChild(addresstext);
                                var iconul = document.createElement("ul");
                                iconul.setAttribute("class", "booking-item-features booking-item-features-sign clearfix");

                                var iconli = document.createElement("li");
                                iconli.setAttribute("rel", "tooltip");
                                iconli.setAttribute("data-placement", "top");
                                iconli.setAttribute("data-original-title", "Passengers");
                                var maleicon = document.createElement("i");
                                maleicon.setAttribute("class", "fa fa-male");
                                iconli.appendChild(maleicon);
                                var numpas = document.createElement("span");
                                numpas.setAttribute("class", "booking-item-feature-sign");
                                numpas.setAttribute("style", "bottom:-8px");
                                var numpastext = document.createTextNode(carresult[i].TypicalSeating); //TypicalSeating
                                numpas.appendChild(numpastext);
                                iconli.appendChild(numpas);

                                var iconli2 = document.createElement("li");
                                iconli2.setAttribute("rel", "tooltip");
                                iconli2.setAttribute("data-placement", "top");
                                iconli2.setAttribute("data-original-title", "Mileage");
                                var caricon = document.createElement("i");
                                caricon.setAttribute("class", "im im-car-doors");
                                iconli2.appendChild(caricon);
                                var mileage = document.createElement("span");
                                mileage.setAttribute("class", "booking-item-feature-sign");
                                mileage.setAttribute("style", "bottom:-8px");
                                var mileagetext = document.createTextNode(carresult[i].MileageDescription); //MileageDescription
                                mileage.appendChild(mileagetext);
                                iconli2.appendChild(mileage);

                                var iconli3 = document.createElement("li");
                                iconli3.setAttribute("rel", "tooltip");
                                iconli3.setAttribute("data-placement", "top");
                                iconli3.setAttribute("data-original-title", "Air Conditioning");
                                var ac = document.createElement("i");
                                ac.setAttribute("class", "im im-air");
                                iconli3.appendChild(ac);
                                var air = document.createElement("span");
                                air.setAttribute("class", "booking-item-feature-sign");
                                air.setAttribute("style", "bottom:-8px");
                                var airtext = document.createTextNode("AC"); //airconditioningDescription
                                air.appendChild(airtext);
                                iconli3.appendChild(air);

                                var iconli4 = document.createElement("li");
                                iconli4.setAttribute("rel", "tooltip");
                                iconli4.setAttribute("data-placement", "top");
                                iconli4.setAttribute("data-original-title", "Power Steering");
                                var steeringicon = document.createElement("i");
                                steeringicon.setAttribute("class", "im im-car-wheel");
                                iconli4.appendChild(steeringicon);
                                var steering = document.createElement("span");
                                steering.setAttribute("class", "booking-item-feature-sign");
                                steering.setAttribute("style", "bottom:-8px");
                                var steeringtext = document.createTextNode("Power Steering"); //power steering
                                steering.appendChild(steeringtext);
                                iconli4.appendChild(steering);

                                var iconli5 = document.createElement("li");
                                iconli5.setAttribute("rel", "tooltip");
                                iconli5.setAttribute("data-placement", "top");
                                iconli5.setAttribute("data-original-title", "Automic Transmission");
                                var autominicon = document.createElement("i");
                                autominicon.setAttribute("class", "im im-shift-auto");
                                iconli5.appendChild(autominicon);
                                var automic = document.createElement("span");
                                automic.setAttribute("class", "booking-item-feature-sign");
                                automic.setAttribute("style", "bottom:-8px");
                                var automictext = document.createTextNode("Automic Transmission"); //Automic Transmission
                                automic.appendChild(automictext);
                                iconli5.appendChild(automic);

                                var iconli6 = document.createElement("li");
                                iconli6.setAttribute("rel", "tooltip");
                                iconli6.setAttribute("data-placement", "top");
                                iconli6.setAttribute("data-original-title", "FM Radio");
                                var fmicon = document.createElement("i");
                                fmicon.setAttribute("class", "im im-fm");
                                iconli6.appendChild(fmicon);
                                var FM = document.createElement("span");
                                FM.setAttribute("class", "booking-item-feature-sign");
                                FM.setAttribute("style", "bottom:-8px");
                                var FMtext = document.createTextNode("FM Radio"); //FM Radio
                                FM.appendChild(FMtext);
                                iconli6.appendChild(FM);


                                iconul.appendChild(iconli);
                                iconul.appendChild(iconli2);
                                iconul.appendChild(iconli3);
                                iconul.appendChild(iconli4);
                                iconul.appendChild(iconli6);
                                iconul.appendChild(iconli5);

                                /* var feature=document.createElement("p");
                                 feature.setAttribute("class","booking-item-address");
                                 var featuretext=document.createTextNode("Automatic Transmission, Power Steering, Air Conditioning, Air Bags, Cruise Control, Anti-Lock Brakes, AM/FM Stereo");
                                 feature.appendChild(featuretext);*/



                                coldiv2.appendChild(agency);
                                coldiv2.appendChild(address);
                                coldiv2.appendChild(iconul);
                                //coldiv2.appendChild(feature);

                                var coldiv3 = document.createElement("div");
                                coldiv3.setAttribute("class", "col-md-3");
                                var price = document.createElement("span");
                                price.setAttribute("class", "booking-item-price");
                                var pricetext = document.createTextNode("$"+carresult[i].DailyRate); //DailyRate
                                price.appendChild(pricetext);
                                var perday = document.createElement("span");
                                var perdaytext = document.createTextNode("/day");
                                perday.appendChild(perdaytext);
                                var cartype = document.createElement("p");
                                cartype.setAttribute("class", "booking-item-flight-class");
                                var cartypename = document.createTextNode(carresult[i].CarTypeName); //CarTypeName
                                cartype.appendChild(cartypename);
                                var selectbtn = document.createElement("button");
                                selectbtn.setAttribute("class", "btn btn-primary");
                                selectbtn.setAttribute("id",i);
                                selectbtn.setAttribute("href", carresult[i].DeepLink); // DeepLink
                                selectbtn.setAttribute("car", carresult[i].PossibleModels + "-" + carresult[i].RentalAgency + "-" + carresult[i].VendorLocation + "-" + carresult[i].DailyRate);                                 
                                $(selectbtn).click(function () {
                                    var id = $(this).attr('car');
                                    console.log(id);
                                    alert(id);
                                    var params = id.split('-');
                                    console.log(params);
                                    alert(params);
                                    var date1 = new Date(getParameterByName("startdate"));
                                    var date2 = new Date(getParameterByName("enddate"));
                                    var timeDiff = Math.abs(date2.getTime() - date1.getTime());
                                    var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                                    
                                    var paramValues = params[0] + "&" + params[1] + "&" + params[2] + "&" + params[3] + "&" + getParameterByName("startdate")+ "&" + getParameterByName("enddate") + "&" + diffDays;
                                    __doPostBack('Button2',paramValues);
                                    //window.open(url, '_self');
                                });

                                var selecttext = document.createTextNode("Select");
                                selectbtn.appendChild(selecttext);
                                coldiv3.appendChild(price);
                                coldiv3.appendChild(perday);
                                coldiv3.appendChild(cartype);
                                coldiv3.appendChild(selectbtn);

                                rowd.appendChild(coldiv1);
                                rowd.appendChild(coldiv2);
                                rowd.appendChild(coldiv3);
                                bookingitem.appendChild(rowd);
                                litag.appendChild(bookingitem);
                                flightCards.appendChild(litag);
                            }


                        },
                        error: function (xhr) {
                            alert(xhr.error);
                        }
                    });


                }                
                else if (type == "flightround") {

                    var jsonResponse = document.getElementById('hiddenField2').value;

                    jsonResponse = JSON.parse(jsonResponse);
                   // console.log(type);
                  //  console.log(jsonResponse.trips.tripOption.length);
                    var flightCards = document.getElementById('flightCards');

                    console.log(getParameterByName("source") + " - " + getParameterByName("destination"));

                   // console.log("Trip Options Length" + jsonResponse.trips.tripOption.length);
                  //  console.log("Origin : " + getParameterByName("source") + ", Destination : " + getParameterByName("destination") + ", Journey Start Date : " + getParameterByName("startdate") + ", Return Date : " + getParameterByName("enddate"));

                    var tripOptions = jsonResponse.trips.tripOption;
                  //  console.log(tripOptions);
                    var filterform = document.getElementById("test");
                    var formdiv = document.createElement("form");
                    formdiv.setAttribute("class", "booking-item-dates-change mb30");
                    var filterdivfrom = document.createElement("div");
                    filterdivfrom.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                    filterdivfrom.appendChild(mapicon);
                    var fromlabel = document.createElement("label");
                    var fromt = document.createTextNode("From");
                    fromlabel.appendChild(fromt);
                    filterdivfrom.appendChild(fromlabel);
                    var frominput = document.createElement("input");
                    frominput.setAttribute("class", "typeahead form-control");
                    frominput.setAttribute("placeholder", "City, Hotel Name or U.S. Zip Code");
                    frominput.setAttribute("type", "text");
                    frominput.setAttribute("value", getParameterByName("source"));
                    filterdivfrom.appendChild(frominput);

                    var filterdivto = document.createElement("div");
                    filterdivto.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                    filterdivto.appendChild(mapicon);
                    var tolabel = document.createElement("label");
                    var tot = document.createTextNode("To");
                    tolabel.appendChild(tot);
                    filterdivto.appendChild(tolabel);
                    var toinput = document.createElement("input");
                    toinput.setAttribute("class", "typeahead form-control");
                    toinput.setAttribute("placeholder", "City, Hotel Name or U.S. Zip Code");
                    toinput.setAttribute("type", "text");
                    toinput.setAttribute("value", getParameterByName("destination"));
                    filterdivto.appendChild(toinput);

                    var filterdivdepart = document.createElement("div");
                    filterdivdepart.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                    filterdivdepart.appendChild(mapicon);
                    var departlabel = document.createElement("label");
                    var departt = document.createTextNode("Departing");
                    departlabel.appendChild(departt);
                    filterdivdepart.appendChild(departlabel);
                    var departinput = document.createElement("input");
                    departinput.setAttribute("class", "date-pick form-control");
                    departinput.setAttribute("data-date-format", "MM d, D");
                    departinput.setAttribute("type", "text");
                    departinput.setAttribute("value", getParameterByName("startdate"));
                    filterdivdepart.appendChild(departinput);

                    var filterdivarrive = document.createElement("div");
                    filterdivarrive.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                    filterdivarrive.appendChild(mapicon);
                    var arrivelabel = document.createElement("label");
                    var arrive = document.createTextNode("Arriving");
                    arrivelabel.appendChild(arrive);
                    filterdivarrive.appendChild(arrivelabel);
                    var arriveinput = document.createElement("input");
                    arriveinput.setAttribute("class", "date-pick form-control");
                    arriveinput.setAttribute("data-date-format", "MM d, D");
                    arriveinput.setAttribute("type", "text");
                    arriveinput.setAttribute("value", getParameterByName("enddate"));
                    filterdivarrive.appendChild(arriveinput);



                    var guestdiv = document.createElement("div");
                    guestdiv.setAttribute("class", "form-group form-group-select-plus");
                    var guestlabel = document.createElement("label");
                    var guesttext = document.createTextNode("Passengers");
                    guestlabel.appendChild(guesttext);
                    guestdiv.appendChild(guestlabel);
                    var dropdown = document.createElement("select");
                    dropdown.setAttribute("class", "form-control");
                    var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
                    for (var i = 0; i < array.length; i++) {
                        var option = document.createElement("option");
                        option.value = array[i];
                        option.text = array[i];
                        dropdown.appendChild(option);
                    }
                    guestdiv.appendChild(dropdown);



                    var updatebt = document.createElement("input");
                    updatebt.setAttribute("class", "btn btn-primary");
                    updatebt.setAttribute("type", "submit");
                    updatebt.setAttribute("value", "Update Search");


                    filterform.appendChild(formdiv);
                    formdiv.appendChild(filterdivfrom);
                    formdiv.appendChild(filterdivto);
                    formdiv.appendChild(filterdivdepart);
                    formdiv.appendChild(filterdivarrive);

                    formdiv.appendChild(guestdiv);

                    formdiv.appendChild(updatebt);

                    for (var j = 0; j < tripOptions.length; j++) {

                        

                        var litag = document.createElement("li");
                        var bookingcontainer = document.createElement("div");
                        bookingcontainer.setAttribute("class", "booking-item-container");
                        var bookingitem = document.createElement("div");
                        bookingitem.setAttribute("class", "booking-item");


                        var cardBlockDiv = document.createElement("div");
                        cardBlockDiv.setAttribute("class", "row");

                       
                        var coldiv1 = document.createElement("div");
                        coldiv1.setAttribute("class", "col-md-2");
                        var airlinelogo = document.createElement("div");
                        airlinelogo.setAttribute("class", "booking-item-airline-logo");
                        var image = document.createElement("img");
                        image.setAttribute("src", "images/american-airlines.jpg");
                        var p = document.createElement("p");
                        var airlinename = document.createTextNode("American");
                        p.appendChild(airlinename);
                        airlinelogo.appendChild(p);
                        airlinelogo.appendChild(image);
                        coldiv1.appendChild(airlinelogo);


                        var coldiv2 = document.createElement("div");
                        coldiv2.setAttribute("class", "col-md-5");
                        var airlinedet = document.createElement("div");
                        airlinedet.setAttribute("class", "booking-item-flight-details");
                        var dept = document.createElement("div");
                        dept.setAttribute("class", "booking-item-departure");
                        var arrival = document.createElement("div");
                        arrival.setAttribute("class", "booking-item-arrival");
                        airlinedet.appendChild(dept);
                        airlinedet.appendChild(arrival);

                        var i = document.createElement("i");
                        i.setAttribute("class", "fa fa-plane");

                        var depart = document.createElement("h5");
                        var departText = document.createTextNode("Depart @ " + splitTime(tripOptions[j].slice[0].segment[0].leg[0].departureTime));
                        depart.appendChild(departText);
                        var startDate = document.createElement("p");
                        startDate.setAttribute("class", "booking-item-date");
                        var startDateText = document.createTextNode(getParameterByName("startdate"));
                        startDate.appendChild(startDateText);
                        var source = document.createElement("p");
                        source.setAttribute("class", " booking-item-destination");
                        var sourceText = document.createTextNode(getParameterByName("source"));
                        source.appendChild(sourceText);
                        dept.appendChild(i);
                        dept.appendChild(depart);
                        dept.appendChild(startDate);
                        dept.appendChild(source);

                        
                        var i = document.createElement("i");
                        i.setAttribute("class", "fa fa-plane fa-flip-vertical");
                        var arrive = document.createElement("h5");
                        var arriveText = document.createTextNode("Arrive @ " + splitTime(tripOptions[j].slice[0].segment[0].leg[0].arrivalTime));
                        arrive.appendChild(arriveText);
                        var startDate = document.createElement("p");
                        startDate.setAttribute("class", "booking-item-date");
                        var startDateText = document.createTextNode(getParameterByName("startdate"));
                        startDate.appendChild(startDateText);
                        var destination = document.createElement("p");
                        destination.setAttribute("class", " booking-item-destination");
                        var destinationText = document.createTextNode(getParameterByName("destination"));
                        destination.appendChild(destinationText);
                        arrival.appendChild(i);
                        arrival.appendChild(arrive);
                        arrival.appendChild(startDate);
                        arrival.appendChild(destination);
                        coldiv2.appendChild(airlinedet);

                        var coldiv3 = document.createElement("div");
                        coldiv3.setAttribute("class", "col-md-2");
                        var duration = document.createElement("h5");
                        var durationText = document.createTextNode(tripOptions[j].slice[0].duration + " mins");
                        duration.appendChild(durationText);
                        coldiv3.appendChild(duration);

                        var coldiv4 = document.createElement("div");
                        coldiv4.setAttribute("class", "col-md-3");
                        var price = document.createElement("span");
                        var pricetext = document.createTextNode("$445");
                        price.appendChild(pricetext);
                        var person = document.createElement("span");
                        var persontext = document.createTextNode("/person");
                        person.appendChild(persontext);

                        
                        coldiv4.appendChild(price);
                        coldiv4.appendChild(person);
                      

                        
                       
                        

                        
                        cardBlockDiv.appendChild(coldiv1);
                        cardBlockDiv.appendChild(coldiv2);
                        cardBlockDiv.appendChild(coldiv3);
                        cardBlockDiv.appendChild(coldiv4);


                        bookingitem.appendChild(cardBlockDiv);
                        bookingcontainer.appendChild(bookingitem);
                        litag.appendChild(bookingcontainer);
                        flightCards.appendChild(litag);

                        var cardBlockDiv = document.createElement("div");
                        cardBlockDiv.setAttribute("class", "row");

                        var coldiv1 = document.createElement("div");
                        coldiv1.setAttribute("class", "col-md-2");
                        var airlinelogo = document.createElement("div");
                        airlinelogo.setAttribute("class", "booking-item-airline-logo");
                        var image = document.createElement("img");
                        image.setAttribute("src", "images/american-airlines.jpg");
                        var p = document.createElement("p");
                        var airlinename = document.createTextNode("American");
                        p.appendChild(airlinename);
                        airlinelogo.appendChild(p);
                        airlinelogo.appendChild(image);
                        coldiv1.appendChild(airlinelogo);

                        var coldiv2 = document.createElement("div");
                        coldiv2.setAttribute("class", "col-md-5");
                        
                        var airlinedet = document.createElement("div");
                        airlinedet.setAttribute("class", "booking-item-flight-details");
                        var dept = document.createElement("div");
                        dept.setAttribute("class", "booking-item-departure");
                        var arrival = document.createElement("div");
                        arrival.setAttribute("class", "booking-item-arrival");
                        airlinedet.appendChild(dept);
                        airlinedet.appendChild(arrival);

                        var i = document.createElement("i");
                        i.setAttribute("class", "fa fa-plane");
                        var depart = document.createElement("h5");
                        var departText = document.createTextNode("Depart @ " + splitTime(tripOptions[j].slice[1].segment[0].leg[0].departureTime));
                        depart.appendChild(departText);
                        var startDate = document.createElement("p");
                        startDate.setAttribute("class", "booking-item-date");
                        var startDateText = document.createTextNode(getParameterByName("enddate"));
                        startDate.appendChild(startDateText);
                        var source = document.createElement("p");
                        source.setAttribute("class", " booking-item-destination");
                        var sourceText = document.createTextNode(getParameterByName("destination"));
                        source.appendChild(sourceText);
                        dept.appendChild(i);
                        dept.appendChild(depart);
                        dept.appendChild(startDate);
                        dept.appendChild(source);

                        var i = document.createElement("i");
                        i.setAttribute("class", "fa fa-plane fa-flip-vertical");
                        var arrive = document.createElement("h5");
                        var arriveText = document.createTextNode("Arrive @ " + splitTime(tripOptions[j].slice[1].segment[0].leg[0].arrivalTime));
                        arrive.appendChild(arriveText);
                        var startDate = document.createElement("p");
                        startDate.setAttribute("class", "booking-item-date");
                        var startDateText = document.createTextNode(getParameterByName("enddate"));
                        startDate.appendChild(startDateText);
                        var destination = document.createElement("p");
                        destination.setAttribute("class", " booking-item-destination");
                        var destinationText = document.createTextNode(getParameterByName("source"));
                        destination.appendChild(destinationText);


                        arrival.appendChild(i);
                        arrival.appendChild(arrive);
                        arrival.appendChild(startDate);
                        arrival.appendChild(destination);
                        coldiv2.appendChild(airlinedet);
                        

                        var coldiv3 = document.createElement("div");
                        coldiv3.setAttribute("class", "col-md-2");
                        
                        var duration = document.createElement("h5");
                        var durationText = document.createTextNode(tripOptions[j].slice[1].duration + " mins");
                        duration.appendChild(durationText);
                        coldiv3.appendChild(duration);
                        

                        var coldiv4 = document.createElement("div");
                        coldiv4.setAttribute("class", "col-md-3");
                        var price = document.createElement("span");
                        var pricetext = document.createTextNode("$445");
                        price.appendChild(pricetext);
                        var person = document.createElement("span");
                        var persontext = document.createTextNode("/person");
                        person.appendChild(persontext);
                        var fclass = document.createElement("p");
                        fclass.setAttribute("class", "booking-item-flight-class");
                        var selectbt = document.createElement("button");
                        selectbt.setAttribute("class", "btn btn-primary");
                        selectbt.setAttribute("href", "#");
                        selectbt.setAttribute("flightround", getParameterByName("source") + "-" + getParameterByName("destination") + "-" + splitTime(tripOptions[j].slice[0].segment[0].leg[0].departureTime) + "-" + splitTime(tripOptions[j].slice[0].segment[0].leg[0].arrivalTime) + "/" + getParameterByName("destination") + "-" + getParameterByName("source") + "-" + splitTime(tripOptions[j].slice[1].segment[0].leg[0].departureTime) + "-" + splitTime(tripOptions[j].slice[1].segment[0].leg[0].arrivalTime) + "-" + tripOptions[j].saleTotal);
                        var selectbttext = document.createTextNode("Select");
                        selectbt.appendChild(selectbttext);
                        coldiv4.appendChild(price);
                        coldiv4.appendChild(person);
                        coldiv4.appendChild(fclass);
                        coldiv4.appendChild(selectbt);

                        $(selectbt).click(function () {
                            var id = $(this).attr('flightround');
                            console.log(id);
                            alert(id);
                            var params = id.split('/');
                            var sourcetodestination = params[0].split('-');
                            var destinationtosource = params[1].split('-');
                            
                            alert(sourcetodestination);
                            alert(destinationtosource);

                            var date1 = new Date(getParameterByName("startdate"));
                            var date2 = new Date(getParameterByName("enddate"));

                            var paramValues = "flightround" + "&" + sourcetodestination[0] + "&" + sourcetodestination[1] + "&" + sourcetodestination[2] + "&" + sourcetodestination[3] + "&" + destinationtosource[0] + "&" + destinationtosource[1] + "&" + destinationtosource[2] + "&" + destinationtosource[3] + "&" + destinationtosource[4] + "&" + getParameterByName("startdate") + "&" + getParameterByName("enddate");
                            console.clear();
                            console.log(paramValues);
                            __doPostBack('Button2', paramValues);
                            //window.open(url, '_self');
                        });


                        
                        cardBlockDiv.appendChild(coldiv1);
                        cardBlockDiv.appendChild(coldiv2);
                        cardBlockDiv.appendChild(coldiv3);
                        cardBlockDiv.appendChild(coldiv4);



                        bookingitem.appendChild(cardBlockDiv);
                        bookingcontainer.appendChild(bookingitem);
                        litag.appendChild(bookingcontainer);
                        flightCards.appendChild(litag);
                        //console.log("Fare Per Person : " + tripOptions[i].pricing[0].saleFareTotal + ", Tax Per Person: " + tripOptions[i].pricing[0].saleTaxTotal + ", Total Fare:" + tripOptions[i].saleTotal);

                        //var slice = tripOptions[i].slice;
                        //for (var j = 0; j < slice.length; j++) {
                        //    console.log("Duration : " + slice[j].duration + ", Cabin: " + slice[j].segment[0].cabin + ", Arrival Time:" + slice[j].segment[0].leg[0].arrivalTime + ", Departure Time:" + slice[j].segment[0].leg[0].departureTime);
                        //}
                    }
                }
                else if (type == "flightone") {

                    var jsonResponse = document.getElementById('hiddenField2').value;

                    jsonResponse = JSON.parse(jsonResponse);
                   // console.log(type);
                   // console.log(jsonResponse.trips.tripOption.length);
                    var flightCards = document.getElementById('flightCards');

                    //console.log(getParameterByName("source") + " - " + getParameterByName("destination"));

                   // console.log("Trip Options Length" + jsonResponse.trips.tripOption.length);
                   // console.log("Origin : " + getParameterByName("source") + ", Destination : " + getParameterByName("destination") + ", Journey Start Date : " + getParameterByName("startdate") + ", Return Date : " + getParameterByName("enddate"));

                    var tripOptions = jsonResponse.trips.tripOption;
                    console.log(tripOptions);
                    var filterform = document.getElementById("test");
                    var formdiv = document.createElement("form");
                    formdiv.setAttribute("class", "booking-item-dates-change mb30");
                    var filterdivfrom = document.createElement("div");
                    filterdivfrom.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                    filterdivfrom.appendChild(mapicon);
                    var fromlabel = document.createElement("label");
                    var fromt = document.createTextNode("From");
                    fromlabel.appendChild(fromt);
                    filterdivfrom.appendChild(fromlabel);
                    var frominput = document.createElement("input");
                    frominput.setAttribute("class", "typeahead form-control");
                    frominput.setAttribute("placeholder", "City, Hotel Name or U.S. Zip Code");
                    frominput.setAttribute("type", "text");
                    frominput.setAttribute("value", getParameterByName("source"));
                    filterdivfrom.appendChild(frominput);

                    var filterdivto = document.createElement("div");
                    filterdivto.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-map-marker input-icon input-icon-hightlight");
                    filterdivto.appendChild(mapicon);
                    var tolabel = document.createElement("label");
                    var tot = document.createTextNode("To");
                    tolabel.appendChild(tot);
                    filterdivto.appendChild(tolabel);
                    var toinput = document.createElement("input");
                    toinput.setAttribute("class", "typeahead form-control");
                    toinput.setAttribute("placeholder", "City, Hotel Name or U.S. Zip Code");
                    toinput.setAttribute("type", "text");
                    toinput.setAttribute("value", getParameterByName("destination"));
                    filterdivto.appendChild(toinput);

                    var filterdivdepart = document.createElement("div");
                    filterdivdepart.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                    filterdivdepart.appendChild(mapicon);
                    var departlabel = document.createElement("label");
                    var departt = document.createTextNode("Departing");
                    departlabel.appendChild(departt);
                    filterdivdepart.appendChild(departlabel);
                    var departinput = document.createElement("input");
                    departinput.setAttribute("class", "date-pick form-control");
                    departinput.setAttribute("data-date-format", "MM d, D");
                    departinput.setAttribute("type", "text");
                    departinput.setAttribute("value", getParameterByName("startdate"));
                    filterdivdepart.appendChild(departinput);

                    var filterdivarrive = document.createElement("div");
                    filterdivarrive.setAttribute("class", "form-group form-group-icon-left");
                    var mapicon = document.createElement("i");
                    mapicon.setAttribute("class", "fa fa-calendar input-icon input-icon-hightlight");
                    filterdivarrive.appendChild(mapicon);
                    var arrivelabel = document.createElement("label");
                    var arrive = document.createTextNode("Arriving");
                    arrivelabel.appendChild(arrive);
                    filterdivarrive.appendChild(arrivelabel);
                    var arriveinput = document.createElement("input");
                    arriveinput.setAttribute("class", "date-pick form-control");
                    arriveinput.setAttribute("data-date-format", "MM d, D");
                    arriveinput.setAttribute("type", "text");
                    arriveinput.setAttribute("value", getParameterByName("enddate"));
                    filterdivarrive.appendChild(arriveinput);



                    var guestdiv = document.createElement("div");
                    guestdiv.setAttribute("class", "form-group form-group-select-plus");
                    var guestlabel = document.createElement("label");
                    var guesttext = document.createTextNode("Passengers");
                    guestlabel.appendChild(guesttext);
                    guestdiv.appendChild(guestlabel);
                    var dropdown = document.createElement("select");
                    dropdown.setAttribute("class", "form-control");
                    var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"];
                    for (var i = 0; i < array.length; i++) {
                        var option = document.createElement("option");
                        option.value = array[i];
                        option.text = array[i];
                        dropdown.appendChild(option);
                    }
                    guestdiv.appendChild(dropdown);



                    var updatebt = document.createElement("input");
                    updatebt.setAttribute("class", "btn btn-primary");
                    updatebt.setAttribute("type", "submit");
                    updatebt.setAttribute("value", "Update Search");


                    filterform.appendChild(formdiv);
                    formdiv.appendChild(filterdivfrom);
                    formdiv.appendChild(filterdivto);
                    formdiv.appendChild(filterdivdepart);
                    formdiv.appendChild(filterdivarrive);

                    formdiv.appendChild(guestdiv);

                    formdiv.appendChild(updatebt);
                    for (var j = 0; j < tripOptions.length; j++) {

                        var litag = document.createElement("li");
                        var bookingcontainer = document.createElement("div");
                        bookingcontainer.setAttribute("class", "booking-item-container");
                        var bookingitem = document.createElement("div");
                        bookingitem.setAttribute("class", "booking-item");


                        var cardBlockDiv = document.createElement("div");
                        cardBlockDiv.setAttribute("class", "row");

                        var coldiv1 = document.createElement("div");
                        coldiv1.setAttribute("class", "col-md-2");
                        var coldiv2 = document.createElement("div");
                        coldiv2.setAttribute("class", "col-md-5");
                        var coldiv3 = document.createElement("div");
                        coldiv3.setAttribute("class", "col-md-2");
                        var coldiv4 = document.createElement("div");
                        coldiv4.setAttribute("class", "col-md-3");


                        var airlinelogo = document.createElement("div");
                        airlinelogo.setAttribute("class", "booking-item-airline-logo");
                        var image = document.createElement("img");
                        image.setAttribute("src", "images/american-airlines.jpg");
                        var p = document.createElement("p");
                        var airlinename = document.createTextNode("American");
                        p.appendChild(airlinename);
                        airlinelogo.appendChild(p);
                        airlinelogo.appendChild(image);

                        var airlinedet = document.createElement("div");
                        airlinedet.setAttribute("class", "booking-item-flight-details");
                        var dept = document.createElement("div");
                        dept.setAttribute("class", "booking-item-departure");
                        var arrival = document.createElement("div");
                        arrival.setAttribute("class", "booking-item-arrival");
                        airlinedet.appendChild(dept);
                        airlinedet.appendChild(arrival);

                        var i = document.createElement("i");
                        i.setAttribute("class", "fa fa-plane");

                        var depart = document.createElement("h5");
                        var departText = document.createTextNode("Depart @ " + splitTime(tripOptions[j].slice[0].segment[0].leg[0].departureTime));
                        depart.appendChild(departText);
                        var startDate = document.createElement("p");
                        startDate.setAttribute("class", "booking-item-date");
                        var startDateText = document.createTextNode(getParameterByName("startdate"));
                        startDate.appendChild(startDateText);
                        var source = document.createElement("p");
                        source.setAttribute("class", " booking-item-destination");
                        var sourceText = document.createTextNode(getParameterByName("source"));
                        source.appendChild(sourceText);
                        dept.appendChild(i);
                        dept.appendChild(depart);
                        dept.appendChild(startDate);
                        dept.appendChild(source);

                        var i = document.createElement("i");
                        i.setAttribute("class", "fa fa-plane fa-flip-vertical");
                        var arrive = document.createElement("h5");
                        var arriveText = document.createTextNode("Arrive @ " + splitTime(tripOptions[j].slice[0].segment[0].leg[0].arrivalTime));
                        arrive.appendChild(arriveText);
                        var startDate = document.createElement("p");
                        startDate.setAttribute("class", "booking-item-date");
                        var startDateText = document.createTextNode(getParameterByName("startdate"));
                        startDate.appendChild(startDateText);
                        var destination = document.createElement("p");
                        destination.setAttribute("class", " booking-item-destination");
                        var destinationText = document.createTextNode(getParameterByName("destination"));
                        destination.appendChild(destinationText);
                        arrival.appendChild(i);
                        arrival.appendChild(arrive);
                        arrival.appendChild(startDate);
                        arrival.appendChild(destination);

                        var duration = document.createElement("h5");
                        var durationText = document.createTextNode(tripOptions[j].slice[0].duration + " mins");
                        duration.appendChild(durationText);

                        var price = document.createElement("span");
                        var pricetext = document.createTextNode("$445");
                        price.appendChild(pricetext);
                        var person = document.createElement("span");
                        var persontext = document.createTextNode("/person");
                        person.appendChild(persontext);
                        var fclass = document.createElement("p");
                        fclass.setAttribute("class", "booking-item-flight-class");
                        var selectbt = document.createElement("button");
                        selectbt.setAttribute("class", "btn btn-primary");
                        selectbt.setAttribute("href", "#");
                        selectbt.setAttribute("flightone", getParameterByName("source") + "-" + getParameterByName("destination") + "-" + splitTime(tripOptions[j].slice[0].segment[0].leg[0].departureTime) + "-" + splitTime(tripOptions[j].slice[0].segment[0].leg[0].arrivalTime) + "-" + tripOptions[j].saleTotal);
                        var selectbttext = document.createTextNode("Select");
                        selectbt.appendChild(selectbttext);
                        coldiv4.appendChild(price);
                        coldiv4.appendChild(person);
                        coldiv4.appendChild(fclass);
                        coldiv4.appendChild(selectbt);

                        coldiv3.appendChild(duration);
                        coldiv2.appendChild(airlinedet);
                        coldiv1.appendChild(airlinelogo);

                       
                        cardBlockDiv.appendChild(coldiv1);
                        cardBlockDiv.appendChild(coldiv2);
                        cardBlockDiv.appendChild(coldiv3);
                        cardBlockDiv.appendChild(coldiv4);


                        bookingitem.appendChild(cardBlockDiv);
                        bookingcontainer.appendChild(bookingitem);
                        litag.appendChild(bookingcontainer);
                        flightCards.appendChild(litag);

                        $(selectbt).click(function () {
                            var id = $(this).attr('flightone');
                            console.log(id);
                            alert(id);
                            var params = id.split('-');

                            alert(params);

                            var date1 = new Date(getParameterByName("startdate"));
                            var date2 = new Date(getParameterByName("enddate"));

                            var paramValues = "flightone" + "&" + params[0] + "&" + params[1] + "&" + params[2] + "&" + params[3] + "&" + params[4] + "&" + getParameterByName("startdate") + "&" + getParameterByName("enddate");
                            __doPostBack('Button2', paramValues);
                            //window.open(url, '_self');
                        });

                    }
                }

                //var ress = Response.hotelRoomDetails;
                //var centr = ress[1].centroid;
                //console.log("ress=" + ress);
                var map;
                var infowindow;
                function initMap(latitude, longitude,id) {
                    var pyrmont = { lat: latitude, lng: longitude };
                    map = new google.maps.Map(document.getElementById('map'+id), {
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
                function getParameterByName(name, url) {
                    if (!url) url = window.location.href;
                    name = name.replace(/[\[\]]/g, "\\$&");
                    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
                        results = regex.exec(url);
                    if (!results) return null;
                    if (!results[2]) return '';
                    return decodeURIComponent(results[2].replace(/\+/g, " "));
                }

                function splitTime(timeValue) {
                    var dateSplit = timeValue.split("T");
                    var timeZoneSplit = dateSplit[1].split("-");
                    return timeZoneSplit[0];
                } 

                var loginstatus = $("#hiddenFieldLogin").val();
                var login = document.getElementById('login').style;
                var logout = document.getElementById('logout').style;

                if (loginstatus == "login") {
                    logout.visibility = "hidden";
                    login.visibility = "visible";
                }
                else {
                    logout.visibility = "visible";
                    login.visibility = "hidden";
                }

            </script>
      <

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdateProgress runat="server" ID="prog" AssociatedUpdatePanelID="Panel1"> 
        <ProgressTemplate>
            <div id="preloader"></div>
        </ProgressTemplate>
    </asp:UpdateProgress>
</asp:Content>