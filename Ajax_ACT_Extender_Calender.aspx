<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ajax_ACT_Extender_Calender.aspx.cs" Inherits="DatabaseProject.Ajax_ACT_Extender_Calender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    Ajax Control ToolKit - Balloon Popup Extender

    <asp:ScriptManager runat="server" />
    <br />
    <br />

    <asp:Label runat="server" Text="Date:" />
    <asp:TextBox runat="server" ID="txtDate" Width="70px" />
    <act:CalendarExtender runat="server" CssClass="CalendarExtenderCssClass" TargetControlID="txtDate" />
    
</asp:Content>
