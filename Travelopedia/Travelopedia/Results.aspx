<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="Travelopedia.Results" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" ClientIDMode="Static" runat="server">
    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>

            <div class="container">
                
                    <h2 class="entry-title">Search Results</h2>
               
              <div class="row">
                 
                   
                <div class="col-md-12">
                    <ul id="flightCards" class="card-columns booking-list">

                    </ul>
                    </div>
                  </div>
            </div>
            <asp:HiddenField ID="hiddenField1" ClientIDMode="Static" runat="server"/>
            <asp:Button ID="Button2" runat="server" Visible="false" OnClick="Button2_Click" Text="Button" />
            <asp:HiddenField ID="hiddenField2" ClientIDMode="Static" runat="server" />
            <asp:TextBox runat="server" ID="hiddenTextBox1" ClientIDMode="Static" Style="display: none;" OnTextChanged="hiddenTextBox1_TextChanged"></asp:TextBox>
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

                            for (var i = 0; i < response.hotelRoomDetails.length; i++) {
                                //alert(response.hotelRoomDetails[0].state);
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
                                var img = document.createElement("img");
                                img.setAttribute("src", "images/800x600.png");
                                imagediv.appendChild(img);
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
                                var link = document.createElement("a");
                                link.setAttribute("href", res[i].deeplink);
                                var hoteltext = document.createTextNode("link");

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
                                var booknow = document.createElement("a");
                                booknow.setAttribute("class", "btn btn-primary");
                                booknow.setAttribute("href", res[i].deeplink);
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
                            }

                        },
                        error: function (xhr) {
                            alert(xhr.error);
                        }
                    });

                    //var jsonResponse = document.getElementById('hiddenField2').value;
                    //jsonResponse = JSON.parse(jsonResponse);
                    // alert(jsonResponse);
                    // console.log(jsonResponse.Hotwire.MetaData.HotelMetaData.Neighborhoods.Neighborhood[2].Name);
                    // console.log(jsonResponse.Hotwire.Result.HotelResult[0].CheckInDate);
                    // var x = jsonResponse.Hotwire.Result.HotelResult;
                    //var y = jsonResponse.Hotwire.MetaData.HotelMetaData.Neighborhoods.Neighborhood;
                    //console.log(x.Name);
                    // console.log(x.City);
                    // console.log(x.State);
                    // console.log(x.Country);





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
                    console.log(type);
                    console.log(jsonResponse.trips.tripOption.length);
                    var flightCards = document.getElementById('flightCards');

                    console.log(getParameterByName("source") + " - " + getParameterByName("destination"));

                    console.log("Trip Options Length" + jsonResponse.trips.tripOption.length);
                    console.log("Origin : " + getParameterByName("source") + ", Destination : " + getParameterByName("destination") + ", Journey Start Date : " + getParameterByName("startdate") + ", Return Date : " + getParameterByName("enddate"));

                    var tripOptions = jsonResponse.trips.tripOption;
                    console.log(tripOptions);
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
                        var selectbt = document.createElement("a");
                        selectbt.setAttribute("class", "btn btn-primary");
                        selectbt.setAttribute("href", "#");
                        var selectbttext = document.createTextNode("Select");
                        selectbt.appendChild(selectbttext);
                        coldiv4.appendChild(price);
                        coldiv4.appendChild(person);
                        coldiv4.appendChild(fclass);
                        coldiv4.appendChild(selectbt);

                        

                        
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
                    console.log(type);
                    console.log(jsonResponse.trips.tripOption.length);
                    var flightCards = document.getElementById('flightCards');

                    console.log(getParameterByName("source") + " - " + getParameterByName("destination"));

                    console.log("Trip Options Length" + jsonResponse.trips.tripOption.length);
                    console.log("Origin : " + getParameterByName("source") + ", Destination : " + getParameterByName("destination") + ", Journey Start Date : " + getParameterByName("startdate") + ", Return Date : " + getParameterByName("enddate"));

                    var tripOptions = jsonResponse.trips.tripOption;
                    console.log(tripOptions);
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
                        var selectbt = document.createElement("a");
                        selectbt.setAttribute("class", "btn btn-primary");
                        selectbt.setAttribute("href", "#");
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

                    }
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

                
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>