using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;

namespace TravelopediaNunitHotelTest
{
    [TestFixture]
    public class OnewayFlightTest
    {
        private IWebDriver driver;
        private StringBuilder verificationErrors;
        private string baseURL;
        private bool acceptNextAlert = true;

        [SetUp]
        public void SetupTest()
        {
            driver = new FirefoxDriver();
            baseURL = "https://www.katalon.com/";
            verificationErrors = new StringBuilder();
        }

        [TearDown]
        public void TeardownTest()
        {
            try
            {
                driver.Quit();
            }
            catch (Exception)
            {
                // Ignore errors if unable to close the browser
            }
            Assert.AreEqual("", verificationErrors.ToString());
        }

        [Test]
        public void TheOnewayFlightTest()
        {
            driver.Navigate().GoToUrl("http://traveltoexplore.biz/");

            var timeout = 30000; // in milliseconds
            var wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));

            driver.FindElement(By.XPath("//li[@id='2']/a/span")).Click();
            driver.FindElement(By.LinkText("One Way")).Click();
            driver.FindElement(By.Id("MainContent_txtFrom")).Click();
            //driver.FindElement(By.XPath("//div[@id='OneWayFrom']/span/span/div/span/div/p")).Click();
            driver.FindElement(By.Id("MainContent_txtFrom")).Clear();
            driver.FindElement(By.Id("MainContent_txtFrom")).SendKeys("Chicago O'Hare International Airport-ORD-Chicago");
            driver.FindElement(By.Id("MainContent_txtTo")).Click();
            //driver.FindElement(By.XPath("//div[@id='OneWayTo']/span/span/div/span/div/p")).Click();
            driver.FindElement(By.Id("MainContent_txtTo")).Clear();
            driver.FindElement(By.Id("MainContent_txtTo")).SendKeys("John F Kennedy International Airport-JFK-Jamaica");
            driver.FindElement(By.Id("MainContent_txtStartDate2")).Click();
            driver.FindElement(By.Id("MainContent_txtStartDate2")).Clear();
            driver.FindElement(By.Id("MainContent_txtStartDate2")).SendKeys("12/02/2017");
            driver.FindElement(By.XPath("//div[@id='flight-search-2']/div/div[2]/div/div/div[2]/div")).Click();
            driver.FindElement(By.Id("MainContent_dropdownNumberOfPassengers2")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_dropdownNumberOfPassengers2"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_dropdownNumberOfPassengers2")).Click();
            driver.FindElement(By.XPath("//div[@id='flight-search-2']/div/div/div/div")).Click();
            driver.FindElement(By.Id("MainContent_btnSearch")).Click();

            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("(//button[@id='selectFlight'])[3]")));

            driver.FindElement(By.XPath("(//button[@id='selectFlight'])[3]")).Click();

            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.Id("identifierId")));

            driver.FindElement(By.Id("identifierId")).Clear();
            driver.FindElement(By.Id("identifierId")).SendKeys("shrutipuranik0710");
            driver.FindElement(By.XPath("//div[@id='identifierNext']/content/span")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.Name("password")));

            driver.FindElement(By.Name("password")).Clear();
            driver.FindElement(By.Name("password")).SendKeys("Shruti_07");

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='passwordNext']/content")));

            driver.FindElement(By.XPath("//div[@id='passwordNext']/content")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='MainContent_FlightDetailsOne']/div/div/div[2]/div[2]/button/span")));

            driver.FindElement(By.XPath("//div[@id='MainContent_FlightDetailsOne']/div/div/div[2]/div[2]/button/span")).Click();

            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.LinkText("Home")));
            driver.Close();
            Assert.Pass("Oneway Flight Test Passed");
        }
        private bool IsElementPresent(By by)
        {
            try
            {
                driver.FindElement(by);
                return true;
            }
            catch (NoSuchElementException)
            {
                return false;
            }
        }

        private bool IsAlertPresent()
        {
            try
            {
                driver.SwitchTo().Alert();
                return true;
            }
            catch (NoAlertPresentException)
            {
                return false;
            }
        }

        private string CloseAlertAndGetItsText()
        {
            try
            {
                IAlert alert = driver.SwitchTo().Alert();
                string alertText = alert.Text;
                if (acceptNextAlert)
                {
                    alert.Accept();
                }
                else
                {
                    alert.Dismiss();
                }
                return alertText;
            }
            finally
            {
                acceptNextAlert = true;
            }
        }
    }
}
