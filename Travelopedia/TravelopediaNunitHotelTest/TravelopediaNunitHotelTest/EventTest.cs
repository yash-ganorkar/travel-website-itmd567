using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;
using System.Threading.Tasks;

namespace TravelopediaNunitHotelTest
{
    [TestFixture]
    public class EventTest
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
        public void TheEventTest()
        {
            driver.Navigate().GoToUrl("http://traveltoexplore.biz/");

            var timeout = 30000; // in milliseconds
            var wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(d => ((IJavaScriptExecutor)d).ExecuteScript("return document.readyState").Equals("complete"));

            driver.FindElement(By.Id("login")).Click();
         //   driver.FindElement(By.Id("MainContent_Email")).Click();
        //    driver.FindElement(By.Id("MainContent_Email")).Clear();
          //  driver.FindElement(By.Id("MainContent_Email")).SendKeys("shrutipuranik0710@gmail.com");
           // driver.FindElement(By.Id("MainContent_Password")).Click();
           // driver.FindElement(By.Id("MainContent_Password")).Clear();
           // driver.FindElement(By.Id("MainContent_Password")).SendKeys("Shruti_07");
           // driver.FindElement(By.Name("ctl00$MainContent$ctl05")).Click();
            driver.FindElement(By.Name("provider")).Click();

            timeout = 90000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.Id("identifierId")));

            driver.FindElement(By.Id("identifierId")).Clear();
            driver.FindElement(By.Id("identifierId")).SendKeys("shrutipuranik0710" + Keys.Enter);

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.Name("password")));

            driver.FindElement(By.Name("password")).SendKeys("Shruti_07");

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//div[@id='passwordNext']/div[2]")));


            driver.FindElement(By.XPath("//div[@id='passwordNext']/div[2]")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("//li[@id='4']/a/span")));

            driver.FindElement(By.XPath("//li[@id='4']/a/span")).Click();
            driver.FindElement(By.Id("eventLocation")).Click();
            //driver.FindElement(By.XPath("//div[@id='Activities']/span/span/div/span/div/p")).Click();
            driver.FindElement(By.Id("eventLocation")).Clear();

            driver.FindElement(By.Id("eventLocation")).SendKeys("Miami");
            driver.FindElement(By.Id("eventLocation")).SendKeys(Keys.Down);
            driver.FindElement(By.Id("eventLocation")).SendKeys(Keys.Enter);
            driver.FindElement(By.Id("MainContent_btnSearchEvents")).Click();

            timeout = 60000; // in milliseconds
            wait = new WebDriverWait(driver, TimeSpan.FromMilliseconds(timeout));
            wait.Until(ExpectedConditions.ElementIsVisible(By.XPath("(//button[@type='button'])[6]")));


            driver.FindElement(By.XPath("(//button[@type='button'])[6]")).Click();
            driver.FindElement(By.XPath("(//button[@type='button'])[6]")).Click();
            
           
            driver.Close();
            Assert.Pass("Event Test Passed");
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
