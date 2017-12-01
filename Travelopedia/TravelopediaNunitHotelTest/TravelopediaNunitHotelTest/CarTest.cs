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
    public class CarTest
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
        public void TheCarTest()
        {
            driver.Navigate().GoToUrl("http://traveltoexplore.biz/");

            var timeout = 30000; // in milliseconds
            var wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));

            driver.FindElement(By.LinkText("Cars")).Click();
            driver.FindElement(By.Id("carDest")).Click();
            
            driver.FindElement(By.Id("carDest")).Clear();
            driver.FindElement(By.Id("carDest")).SendKeys("Chicago-Illinois");
            driver.FindElement(By.Id("carPickTime")).Click();
            driver.FindElement(By.Id("carPickTime")).Clear();
            driver.FindElement(By.Id("carPickTime")).SendKeys("10:00");
            driver.FindElement(By.Id("MainContent_carDropTime")).Click();
            driver.FindElement(By.Id("MainContent_carDropTime")).Clear();
            driver.FindElement(By.Id("MainContent_carDropTime")).SendKeys("11:00");
            driver.FindElement(By.Id("MainContent_carPickDate")).Click();
            driver.FindElement(By.Id("MainContent_carPickDate")).Clear();
            driver.FindElement(By.Id("MainContent_carPickDate")).SendKeys("12/02/2017");
            driver.FindElement(By.Id("MainContent_carDropDate")).Click();
            driver.FindElement(By.Id("MainContent_carDropDate")).Clear();
            driver.FindElement(By.Id("MainContent_carDropDate")).SendKeys("12/05/2017");
            driver.FindElement(By.Id("MainContent_btnSearchCars")).Click();

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
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='passwordNext']/div[2]")));

            driver.FindElement(By.XPath("//div[@id='passwordNext']/div[2]")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='MainContent_CarDetails']/div[2]/div/div/div[2]/div/div/div[2]/button/span")));

            driver.FindElement(By.XPath("//div[@id='MainContent_CarDetails']/div[2]/div/div/div[2]/div/div/div[2]/button/span")).Click();


            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.LinkText("Home")));

            driver.FindElement(By.LinkText("Home")).Click();
            driver.Close();
            Assert.Pass("Car Test Passed");
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
