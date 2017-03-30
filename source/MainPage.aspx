<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        Content2
        {
            background-image:url('Images/Stadium.jpg');
        }
    </style>
</asp:Content>
<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div  style="color:White;font-size:36pt;position:relative;top:-30vh">
 Tickets Office
 </div>
 <div style="color:White;font-size:18pt;position:relative;top:-25vh;">
       in this website you can order tickets to the best
     <br />
       events in the worlds! including music shows, soccer games.
     <br />
       the packages includes flight tickets and the best hotels!
       <br />
     <asp:Button ID="Button1" runat="server" Text="Button" BackColor="#f0f3fb" />
     <asp:Button ID="Button2" runat="server" Text="Button" />
 </div>
</asp:Content>

