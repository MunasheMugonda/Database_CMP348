<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Region_Read.aspx.cs" Inherits="DatabaseProject.Region_Read" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Read Region data
    <br />
    <br />
    <asp:Button runat="server" ID="btnGenerateReports" OnClick="btnGenerateReports_Click" Text="Generate Reports" />
    <br />
    <br />
    <asp:TextBox runat="server" ID="txtOutput" TextMode="MultiLine" Rows="10" Width="500px" />
</asp:Content>
