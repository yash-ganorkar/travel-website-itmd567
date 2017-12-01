using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;

namespace TravelopediaNunitHotelTest
{
    [TestFixture]
    public class TwowayFlightTest
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
        public void TheTwowayFlightTest()
        {
            driver.Navigate().GoToUrl("http://traveltoexplore.biz/");

            var timeout = 30000; // in milliseconds
            var wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));

            driver.FindElement(By.XPath("//li[@id='2']/a/span")).Click();
            driver.FindElement(By.Id("MainContent_txtSource")).Click();
            driver.FindElement(By.Id("MainContent_txtSource")).Clear();
            driver.FindElement(By.Id("MainContent_txtSource")).SendKeys("Chicago O'Hare International Airport-ORD-Chicago");
            driver.FindElement(By.Id("MainContent_txtDestination")).Click();
            driver.FindElement(By.Id("MainContent_txtDestination")).Clear();
            driver.FindElement(By.Id("MainContent_txtDestination")).SendKeys("Miami International Airport-MIA-Miami");
            driver.FindElement(By.Id("MainContent_txtStartDate")).Click();
            driver.FindElement(By.XPath("//tr[6]/td[5]")).Click();
            driver.FindElement(By.Id("MainContent_txtEndDate")).Click();
            driver.FindElement(By.XPath("//tr[6]/td[6]")).Click();
            driver.FindElement(By.Id("MainContent_dropdownNumberOfPassengers")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_dropdownNumberOfPassengers"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_dropdownNumberOfPassengers")).Click();
            driver.FindElement(By.Id("MainContent_btnSearch")).Click();
            //driver.FindElement(By.XPath("//div[@id='webservicedata5']/div/li/div/div/div[3]/div[3]/button")).Click();

            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.Name("provider")));

            driver.FindElement(By.Name("provider")).Click();

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
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='passwordNext']/content/span")));

            driver.FindElement(By.XPath("//div[@id='passwordNext']/content/span")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='MainContent_FlightDetailsRound']/div/div/div[2]/div[2]/button/span")));

            driver.FindElement(By.XPath("//div[@id='MainContent_FlightDetailsRound']/div/div/div[2]/div[2]/button/span")).Click();

            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.LinkText("Home")));

            driver.Close();
            Assert.Pass("Round Flight Test passed");
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
