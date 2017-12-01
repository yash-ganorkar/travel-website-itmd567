<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Travelopedia.Blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
            <h1 class="page-title">Travelopedia Blog</h1>
        </div>




        <div class="container">
            <article class="post">
                <header class="post-header">
                    <div class="fotorama" data-allowfullscreen="true">
                        <img src="images/backgrounds/beach.jpg" alt="Image Alternative text" title="196_365" />
                        <img src="images/backgrounds/phone.jpg" alt="Image Alternative text" title="196_365" />
                        <img src="images/backgrounds/nature.jpg" alt="Image Alternative text" title="196_365" />
                        <img src="images/backgrounds/bridge.jpg" alt="Image Alternative text" title="196_365" />
                        <img src="images/backgrounds/road.jpg" alt="Image Alternative text" title="196_365" />
                    </div>
                </header>
                <div class="post-inner">
                    <h4 class="post-title text-darken"><a href="https://travelopediablogspot.wordpress.com/">Travel to Explore</a></h4>
                    <ul class="post-meta">
                        <li><i class="fa fa-calendar"></i><a href="#">30 November, 2017</a>
                        </li>
                        <li><i class="fa fa-user"></i><a href="#">Shruti and Yash</a>
                        </li>
                        <li><i class="fa fa-tags"></i><a href="#">Lifestyle</a>, <a href="https://travelopediablogspot.wordpress.com/">Design</a>
                        </li>
                        
                    </ul>
                    <p>Tired of searching for flight tickets, hotel, restaurants and events from all different application? or printing emails for every booking? or adding all the events to the calendar?</p>
                    <h5>Time for travel organization app.</h5>
                    <p> A centralized or single application which helps to personalize your trip by picking your favorite place, booking flight tickets, hotels, cars and events and book them all from our application.
                     We hope to come up with a better solution and make travel easy.
                        Thank you.</p>

                    <h5><a href="https://travelopediablogspot.wordpress.com/">Travel Blog </a></h5> 
                </div>
            </article>
           
            
            
        </div>



        <div class="gap"></div>
</asp:Content>
