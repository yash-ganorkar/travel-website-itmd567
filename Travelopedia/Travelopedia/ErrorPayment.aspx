<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ErrorPayment.aspx.cs" Inherits="Travelopedia.ErrorPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="gap"></div>


        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <i class="fa fa-exclamation round box-icon-large box-icon-center box-icon-warning mb30"></i>	
                    <h2 class="text-center">Unsuccessful Payment !! Your transaction id is <p runat="server" id="transactionid"></p> </h2>
                    <h5 class="text-center mb30">Please contact customer support at +1-312-450-9277</h5>
                  
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
