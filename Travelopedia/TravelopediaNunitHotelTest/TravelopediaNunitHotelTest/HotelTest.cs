using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using System.Threading.Tasks;

namespace TravelopediaNunitHotelTest
{
    [TestFixture]
    public class HotelTest
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
        public void TheHotelTest()
        {
            driver.Navigate().GoToUrl("http://traveltoexplore.biz/");

            var timeout = 30000; // in milliseconds
            var wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));

            driver.FindElement(By.Id("MainContent_txtDest")).Click();
            driver.FindElement(By.Id("MainContent_txtDest")).Clear();
            driver.FindElement(By.Id("MainContent_txtDest")).SendKeys("Chicago");
            driver.FindElement(By.Id("MainContent_txtCheckin")).Click();
            driver.FindElement(By.Id("MainContent_txtCheckin")).Clear();
            driver.FindElement(By.Id("MainContent_txtCheckin")).SendKeys("12/06/2017");
            driver.FindElement(By.Id("MainContent_txtCheckout")).Click();
            driver.FindElement(By.Id("MainContent_txtCheckout")).Clear();
            driver.FindElement(By.Id("MainContent_txtCheckout")).SendKeys("12/08/2017");
            driver.FindElement(By.Id("MainContent_Dropdownlistrooms")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_Dropdownlistrooms"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_Dropdownlistrooms")).Click();
            driver.FindElement(By.Id("MainContent_Dropdownlistguests")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_Dropdownlistguests"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_Dropdownlistguests")).Click();
            driver.FindElement(By.Id("MainContent_Dropdownlistchildren")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_Dropdownlistchildren"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_Dropdownlistchildren")).Click();
            driver.FindElement(By.Id("MainContent_btnSearchHotel")).Click();
            //driver.FindElement(By.XPath("//div[@id='webservicedata4']/div/div[3]/li/a/div/div[3]/button")).Click();

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
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='passwordNext']/div[2]")));

            driver.FindElement(By.XPath("//div[@id='passwordNext']/content/span")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='MainContent_HotelDetails']/div[2]/div/div/div[2]/div/div/div[2]/button/span")));

            driver.FindElement(By.XPath("//div[@id='MainContent_HotelDetails']/div[2]/div/div/div[2]/div/div/div[2]/button/span")).Click();
            // ERROR: Caught exception [ERROR: Unsupported command [selectFrame | index=0 | ]]


            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.LinkText("Home")));

            //driver.FindElement(By.Id("afe44de0-d57e-11e7-af4d-4fc9152085e7")).Clear();
            //driver.FindElement(By.Id("afe44de0-d57e-11e7-af4d-4fc9152085e7")).SendKeys("shrutipuranik0710@gmail.com");
            //driver.FindElement(By.Id("afeb79d0-d57e-11e7-af4d-4fc9152085e7")).Clear();
            //driver.FindElement(By.Id("afeb79d0-d57e-11e7-af4d-4fc9152085e7")).SendKeys("4242 4242 4242 4242");
            //driver.FindElement(By.Id("afed4e90-d57e-11e7-af4d-4fc9152085e7")).Click();
            //driver.FindElement(By.Id("afed4e90-d57e-11e7-af4d-4fc9152085e7")).Clear();
            //driver.FindElement(By.Id("afed4e90-d57e-11e7-af4d-4fc9152085e7")).SendKeys("10 / 2020");
            //driver.FindElement(By.Id("afeeae20-d57e-11e7-af4d-4fc9152085e7")).Click();
            //driver.FindElement(By.Id("afeeae20-d57e-11e7-af4d-4fc9152085e7")).Clear();
            //driver.FindElement(By.Id("afeeae20-d57e-11e7-af4d-4fc9152085e7")).SendKeys("404");
            //driver.FindElement(By.Id("b86c9990-d57e-11e7-af4d-4fc9152085e7")).Click();
            //driver.FindElement(By.Id("b86c9990-d57e-11e7-af4d-4fc9152085e7")).Clear();
            //driver.FindElement(By.Id("b86c9990-d57e-11e7-af4d-4fc9152085e7")).SendKeys("60616");
            //driver.FindElement(By.XPath("//button[@type='submit']")).Click();
            driver.FindElement(By.LinkText("Home")).Click();
            driver.Close();
            Assert.Pass("Hotel Test Passed");
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
