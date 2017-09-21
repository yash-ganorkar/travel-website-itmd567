<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Travelopedia.Home" %>

<asp:Content ID="HomeContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel runat="server" EnableViewState="true">
        <ContentTemplate>
            <asp:LoginName ID="LoginName1" FormatString="Welcome {0}!" runat="server"/>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </ContentTemplate>
</asp:UpdatePanel>
    </asp:Content>