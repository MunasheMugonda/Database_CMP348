<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Employee_Read.aspx.cs" Inherits="DatabaseProject.Employee_Read" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Read Employee data
    <br />
    <br />
    <asp:Button runat="server" ID="btnReadData" OnClick="btnReadData_Click" Text="Read Data" />
    <br />
    <br />
    <asp:TextBox runat="server" ID="txtOutput" TextMode="MultiLine" Rows="10" Width="500px" />
</asp:Content>
