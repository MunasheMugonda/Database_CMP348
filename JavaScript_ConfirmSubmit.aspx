<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JavaScript_ConfirmSubmit.aspx.cs" Inherits="DatabaseProject.JavaScript_ConfirmSubmit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Java Script - Move Input to Output

    <br />
    <br />

    <asp:Button runat="server" ID="btnMove" ClientIDMode="Static" OnClientClick="return ConfirmSubmit();" Text="Confirm" />

    <script type="text/javascript">
        
    function ConfirmSubmit() {
        //Check to see if the user wants to submit the page.
        var booConfirm;
        booConfirm = confirm("Are you sure you want to submit this page? Click OK to submit the page. Click cancel to stay on this page");
        if (booConfirm) {
            alert("You clicked OK.");
            return true;
        }
        else {
            alert("You clicked Cancel.");
            return false;
        }

    }

    </script>



</asp:Content>
