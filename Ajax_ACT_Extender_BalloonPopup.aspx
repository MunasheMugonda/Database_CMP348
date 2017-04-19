<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ajax_ACT_Extender_BalloonPopup.aspx.cs" Inherits="DatabaseProject.Ajax_ACT_Extender_BalloonPopup" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >

    Ajax Control ToolKit - Balloon Popup Extender

    <asp:ScriptManager runat="server" />
    <br />
    <br />

    <asp:Label runat="server" Text="Amount:" />
    <asp:TextBox runat="server" ID="txtAmount" />
    <act:BalloonPopupExtender runat="server" BalloonPopupControlID="panAmount" TargetControlID="txtAmount" />
    <asp:Panel runat="server" ID="panAmount" CssClass="BalloonPopupExtenderPanelCssClass" >
        <asp:Label runat="server" Text="Please enter an amount between $0 and $10" />
    </asp:Panel>
</asp:Content>
