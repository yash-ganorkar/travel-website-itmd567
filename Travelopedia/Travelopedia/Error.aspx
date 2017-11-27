<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="Travelopedia.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="gap"></div>


        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <i class="fa fa-exclamation-triangle round box-icon-large box-icon-center box-icon-warning mb30"></i>	
                    <h2 class="text-center">Oops! Something Went Wrong!</h2>
                    <div id="exception" runat="server"></div>
                    <div class="text-center">
                        <a class="btn btn-primary text-center btn-ghost btn-lg mt5" href="Default.aspx"><i class="fa fa-long-arrow-left text-center"></i>Homepage</a>
                    </div>
                   
                </div>
            </div>
            <div class="gap"></div>
        </div>
</asp:Content>