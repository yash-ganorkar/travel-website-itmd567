<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SuccessPayment.aspx.cs" Inherits="Travelopedia.SuccessPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="gap"></div>


        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <i class="fa fa-check round box-icon-large box-icon-center box-icon-success mb30"></i>	
                    <h2 class="text-center"><asp:LoginName ID="LoginName1" FormatString="Your payment was successful {0} !" runat="server"/></h2>
                    <h5 class="text-center mb30">Booking details has been send to johndoe@gmail.com</h5>
                  
                    <h4 class="text-center">You might also need </h4>
                    <ul class="list list-inline list-center">
                        <li><a class="btn btn-primary" href="Default.aspx"><i class="fa fa-building-o"></i> Hotels</a>
                            <p class="text-center lh1em mt5"><small>398 offers<br /> </small>
                            </p>
                        </li>
                        <li><a class="btn btn-primary" href="Default.aspx"><i class="fa fa-plane"></i> Flights</a>
                            <p class="text-center lh1em mt5"><small>229 offers<br /> </small>
                            </p>
                        </li>
                        <li><a class="btn btn-primary" href="Default.aspx"><i class="fa fa-dashboard"></i> Cars</a>
                            <p class="text-center lh1em mt5"><small>180 offers<br /> </small>
                            </p>
                        </li>
                        <li><a class="btn btn-primary" href="Default.aspx"><i class="fa fa-bolt"></i> Events</a>
                            <p class="text-center lh1em mt5"><small>274 offers<br /> </small>
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="gap"></div>
        </div>
</asp:Content>
