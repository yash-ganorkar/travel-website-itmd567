using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Firefox;
using OpenQA.Selenium.Support.UI;

namespace TravelopediaTest
{
    
    [TestFixture]
    public class TravelopediaTest
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
        public void TheTravelopediaTest()
        {
            driver.Navigate().GoToUrl("http://localhost/Travelopedia/Default");
            driver.FindElement(By.Id("MainContent_txtDest")).Click();
            driver.FindElement(By.Id("MainContent_txtDest")).Clear();
            driver.FindElement(By.Id("MainContent_txtDest")).SendKeys("Chi");
            driver.FindElement(By.Id("MainContent_txtDest")).SendKeys(Keys.Down);
            driver.FindElement(By.XPath("//div[@id='Hotel']/span/span/div/span/div/p")).Click();
            driver.FindElement(By.Id("MainContent_txtDest")).Clear();
            driver.FindElement(By.Id("MainContent_txtDest")).SendKeys("Chicago-CHI");
            driver.FindElement(By.Id("MainContent_txtCheckin")).Click();
            driver.FindElement(By.XPath("//tr[5]/td[4]")).Click();
            driver.FindElement(By.Id("MainContent_txtCheckout")).Click();
            driver.FindElement(By.Id("MainContent_txtCheckout")).Click();
            driver.FindElement(By.XPath("//tr[5]/td[5]")).Click();
            driver.FindElement(By.Id("MainContent_Dropdownlistrooms")).Click();
            driver.FindElement(By.Id("MainContent_Dropdownlistrooms")).Click();
            driver.FindElement(By.Id("MainContent_Dropdownlistrooms")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_Dropdownlistrooms"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_Dropdownlistrooms")).Click();
            driver.FindElement(By.Id("MainContent_Dropdownlistguests")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_Dropdownlistguests"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_Dropdownlistguests")).Click();
            new SelectElement(driver.FindElement(By.Id("MainContent_Dropdownlistchildren"))).SelectByText("1");
            driver.FindElement(By.Id("MainContent_Dropdownlistchildren")).Click();
            driver.FindElement(By.Id("MainContent_btnSearchHotel")).Click();
            driver.FindElement(By.XPath("//div[@id='webservicedata4']/div/div/li/a/div/div[3]/button")).Click();
            driver.FindElement(By.XPath("//div[@id='view_container']/form/div[2]/div/div/div/ul/li[2]/div/div[2]/p[2]")).Click();
            driver.FindElement(By.XPath("//div[@id='MainContent_HotelDetails']/div[2]/div/div/div[2]/div/div/div[2]/button/span")).Click();
            // ERROR: Caught exception [ERROR: Unsupported command [selectFrame | index=2 | ]]
            driver.FindElement(By.Id("3367f8f0-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("3367f8f0-d22e-11e7-a306-eb4fe74ff874")).Clear();
            driver.FindElement(By.Id("3367f8f0-d22e-11e7-a306-eb4fe74ff874")).SendKeys("shrutipuranik0710@gmail.com");
            driver.FindElement(By.Id("337dcae0-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("337dcae0-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("337dcae0-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("337dcae0-d22e-11e7-a306-eb4fe74ff874")).Clear();
            driver.FindElement(By.Id("337dcae0-d22e-11e7-a306-eb4fe74ff874")).SendKeys("4242 4242 4242 4242");
            driver.FindElement(By.Id("338d5b40-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("338d5b40-d22e-11e7-a306-eb4fe74ff874")).Clear();
            driver.FindElement(By.Id("338d5b40-d22e-11e7-a306-eb4fe74ff874")).SendKeys("10 / 2020");
            driver.FindElement(By.Id("33926450-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("33926450-d22e-11e7-a306-eb4fe74ff874")).Clear();
            driver.FindElement(By.Id("33926450-d22e-11e7-a306-eb4fe74ff874")).SendKeys("404");
            driver.FindElement(By.Id("6a61eaa0-d22e-11e7-a306-eb4fe74ff874")).Click();
            driver.FindElement(By.Id("6a61eaa0-d22e-11e7-a306-eb4fe74ff874")).Clear();
            driver.FindElement(By.Id("6a61eaa0-d22e-11e7-a306-eb4fe74ff874")).SendKeys("60616");
            driver.FindElement(By.XPath("//button[@type='submit']")).Click();
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
