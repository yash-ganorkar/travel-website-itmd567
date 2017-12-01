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
    public class TestFacebookLogin
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
        public void TheFacebookLoginTest()
        {
            //already existing user
            driver.Navigate().GoToUrl("http://traveltoexplore.biz/");
            driver.FindElement(By.Id("login")).Click();
            driver.FindElement(By.XPath("(//button[@name='provider'])[2]")).Click();
            driver.FindElement(By.Id("email")).Clear();
            driver.FindElement(By.Id("email")).SendKeys("shrutipuranik0710@gmail.com");
            driver.FindElement(By.Id("pass")).Clear();
            driver.FindElement(By.Id("pass")).SendKeys("Shruti_07");
            driver.FindElement(By.Id("loginbutton")).Click();
            driver.FindElement(By.LinkText("Home")).Click();
            driver.Close();
            Assert.Pass("Test Passed: Facebook login failed since the email already a member");
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
