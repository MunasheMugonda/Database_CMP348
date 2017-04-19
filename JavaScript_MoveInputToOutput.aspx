<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JavaScript_MoveInputToOutput.aspx.cs" Inherits="DatabaseProject.JavaScript_MoveInputToOutput" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Java Script - Move Input to Output

    <br />
    <br />

    <asp:TextBox runat="server" ID="txtInput" ClientIDMode="Static" /><br />
    <asp:TextBox runat="server" ID="txtOutput" ClientIDMode="Static" /><br />
    <asp:Button runat="server" ID="btnMove" ClientIDMode="Static" OnClientClick="return MoveInputToOutput();" Text="Move" />

    <script type="text/javascript">
        function MoveInputToOutput() {
            //Move the value in the inputtext box to the output textbox.
            document.getElementById("txtOutput").value = document.getElementById("txtInput").value;
            document.getElementById("txtInput").value = "";
            return false;
        }
    </script>



</asp:Content>
