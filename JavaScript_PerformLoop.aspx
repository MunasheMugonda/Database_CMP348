<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JavaScript_PerformLoop.aspx.cs" Inherits="DatabaseProject.JavaScript_PerformLoop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Java Script - Chech All Check Boxes

    <br />
    <br />
    
    <asp:TextBox runat="server" ID="txtInput" ClientIDMode="Static" />
    <asp:TextBox runat="server" ID="txtOutput" ClientIDMode="Static" />
    <asp:Button runat="server" OnClientClick="return PerformLoop()" Text="Perform Loop" />

    <script type="text/javascript">
        
        function PerformLoop() {
            
            /* count from one to whatever the user enters into the first textbox.Assume the user enters
            a valid number between 1 and 10 */
            var intNumber = document.getElementById("txtInput").value;
            var strNumberList = "";
            for (i = 1; i <= intNumber; i++) {
                strNumberList = strNumberList + i + " ";
            }
            document.getElementById("txtOutPut").value = strNumberList;
            return false;
        }

    </script>



</asp:Content>
