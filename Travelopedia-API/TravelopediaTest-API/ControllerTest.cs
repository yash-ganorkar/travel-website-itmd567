using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using Travelopedia_API;
using Travelopedia_API.Controllers;
using Travelopedia_API.Models;
using Google.Apis.QPXExpress.v1.Data;

namespace TravelopediaTest_API
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void Index()
        {
            //Arrange
            HomeController controller = new HomeController();
            
            //Act
            ViewResult result = controller.Index() as ViewResult;
           
            //Assert
            Assert.IsNotNull(result);
            
        }

        
        [TestMethod]
        public void CarControllerTestMethod()
        {
            CarController cr = new CarController();

            CarDetails response = cr.FetchAllCars("Chicago", "11/30/2017", "12/02/2017", "10:00", "11:30");
            //Date Exception
            CarDetails exception = cr.FetchAllCars("Chicago", "11/21/2017", "12/02/2017", "10:00", "11:30");
            CarDetails temp = response;
            Assert.IsNotNull(response);
            Assert.IsNotNull(exception.ExceptionDetails);

            Assert.AreEqual(response, temp);
            Assert.AreNotEqual(response, exception);

            Assert.IsNull(response.ExceptionDetails);
        }
        [TestMethod]
        public void ConfirmCarBooking()
        {
            CarController carBook = new CarController();
          
            CarBooking payment = new CarBooking();
            object res = carBook.ConfirmCarBooking(payment);
            
            Assert.IsNotNull(res);
            //Assert.AreNotSame(2, payment.CarType.IndexOf("Luxury"));
            Assert.IsNull(payment.paymentDetails);
        }

        [TestMethod]
        public void HotelControllerTestMethod()
        {
            HotelsController hr = new HotelsController();

            HotelDetails response = hr.FetchAllHotels("Chicago", 1, 1, 1, "12/02/2017","12/06/2017");
            //Date Exception
            HotelDetails exception = hr.FetchAllHotels("Chicago", 1, 1, 1, "12/02/2016", "12/06/2017");
            HotelDetails exception1 = hr.FetchAllHotels("gulbarga", 1, 1, 1, "12/02/2017", "12/06/2017");
            HotelDetails temp = response;
            Assert.IsNotNull(response);
            Assert.IsNotNull(exception.ExceptionDetails);
            Assert.IsNull(exception1.ExceptionDetails);
            Assert.AreEqual(response, temp);
            Assert.AreNotEqual(response, exception);

            Assert.IsNull(response.ExceptionDetails);

        }

        [TestMethod]
        public void ConfirmHotelBooking()
        {
            HotelsController hotelBook = new HotelsController();

            HotelPayment payment = new HotelPayment();
            object res = hotelBook.ConfirmHotelBooking(payment);
            payment.Location = "Chicago";
            payment.HotelName = "abc";
            Assert.IsNotNull(res);
            Assert.AreEqual("Chicago",payment.Location);
            Assert.IsNull(payment.paymentDetails);
            Assert.AreNotEqual("Michigan Ave",payment.HotelName);
        }

        [TestMethod]
        public void FlightControllerTest()
        {
            FlightsController fc = new FlightsController();
             
            TripsSearchRequest x = new TripsSearchRequest();
            x.Request = new TripOptionsRequest();
            x.Request.Passengers = new PassengerCounts { AdultCount = 1 };
            x.Request.Slice = new List<SliceInput>();
            x.Request.Slice.Add(new SliceInput() { Origin = "ORD", Destination = "JFK", Date = "2017-12-11" });
            x.Request.Slice.Add(new SliceInput() { Origin = "ORD", Destination = "JFK", Date = "2017-12-28" });
            
            var result = fc.FetchAllFlights(x);
            Assert.IsNotNull(result);

            TripsSearchRequest y = new TripsSearchRequest();
            y.Request = new TripOptionsRequest();
            y.Request.Passengers = new PassengerCounts { AdultCount = 1 };
            y.Request.Slice = new List<SliceInput>();
            //location exception
            y.Request.Slice.Add(new SliceInput() { Origin = "xyz", Destination = "JFK", Date = "2017-12-11" });
            //y.Request.Slice.Add(new SliceInput() { Origin = "ORD", Destination = "JFK", Date = "2017-12-28" });
            var exception = fc.FetchAllFlights(y);

            Assert.IsNotNull(exception);
            Assert.AreNotEqual(result, exception);
        }

        [TestMethod]
        public void BookFlight()
        {
            FlightsController fc = new FlightsController();

            FlightDetails bookdetails = new FlightDetails();
            object res = bookdetails.paymentdetails;
            bookdetails.Destination = "ORD";
            Assert.IsNull(res);
            //flightype exception
            bookdetails.FlightType = "Economy";
            Assert.AreEqual("ORD", bookdetails.Destination);
            Assert.IsNull(bookdetails.paymentdetails);
            Assert.AreNotEqual("Business", bookdetails.FlightType);
            Assert.IsNotNull(bookdetails);
        }

        [TestMethod]
        public void EventControllerTestMethod()
        {
            EventsController er = new EventsController();

            Object response = er.FetchAllEvents("Florida");
            //event location exception Exception
            Object exception = er.FetchAllEvents("gulbarga"); 
            Object exception1 = er.FetchAllEvents("gulbarga"); 
            Object temp = response;
            Assert.IsNotNull(response);
            Assert.IsNotNull(exception);
            
            Assert.AreEqual(response, temp);
            Assert.AreNotEqual(response, exception);

            Assert.IsNotNull(response.Equals(exception));

        }




    }
}
