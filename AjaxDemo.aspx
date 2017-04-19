<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AjaxDemo.aspx.cs" Inherits="DatabaseProject.AjaxDemo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    This is an Ajax Demo.<br /><br />

    <asp:ScriptManager runat="server" />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Label runat="server" ID="lblCurrentTime" />
            <asp:Timer runat="server" ID="timCurrentTime" Interval="60000" OnTick="timCurrentTime_Tick" />
        </ContentTemplate>
   
    </asp:UpdatePanel>

    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:TextBox runat="server"  ID="txtInput"/><br /><br />
            <asp:Label runat="server" ID="lbloutput" /><br /><br />
            <asp:Button runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" text="Submit"  />
        </ContentTemplate>
   
    </asp:UpdatePanel>

    
</asp:Content>
