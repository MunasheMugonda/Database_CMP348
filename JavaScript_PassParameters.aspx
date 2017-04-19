<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JavaScript_PassParameters.aspx.cs" Inherits="DatabaseProject.JavaScript_PassParameters" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Java Script - Chech All Check Boxes

    <br />
    <br />
    
    <asp:TextBox runat="server" ID="txtNumber1" ClientIDMode="Static" />
    <asp:TextBox runat="server" ID="txtNumber2" ClientIDMode="Static" />
    <asp:TextBox runat="server" ID="txtOutput" ClientIDMode="Static" />
    <asp:Button runat="server" OnClientClick="return PassParameters()" Text="Multiply" />
    <script type="text/javascript">
        
        function PassParameters() {
            
            //pass the two user inputs to the multiply function.
            //Assume that the user enters valid numbers.
            var intNumber1 = document.getElementById("txtNumber1").value;
            var intNumber2 = document.getElementById("txtNumber2").value;
            var intResult = Multiply(intNumber1, intNumber2);
            document.getElementById("txtOutput").value = intResult;         
            return false;

        }
        function Multiply(x, y) {
            var z = x * y;
            return z;

        }

    </script>



</asp:Content>
