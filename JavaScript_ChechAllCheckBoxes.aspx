<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JavaScript_ChechAllCheckBoxes.aspx.cs" Inherits="DatabaseProject.JavaScript_ChechAllCheckBoxes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Java Script - Chech All Check Boxes

    <br />
    <br />
    <%--User onclick--%>
    <asp:CheckBox runat="server" ID="chkAll" ClientIDMode="Static" Onclick="CheckAll();" Text="Check All"/><br /><br />
        <asp:CheckBox runat="server" ID="chkRed" ClientIDMode="Static"  Text="Red"/><br /><br />
        <asp:CheckBox runat="server" ID="chkWhite" ClientIDMode="Static" Text="White" /><br /><br />
        <asp:CheckBox runat="server" ID="chkBlue" ClientIDMode="Static" Text="Blue" /><br /><br />
    <script type="text/javascript">
        
        function CheckAll() {
            //Check or uncheck all the check boxes.
            if (document.getElementById("chkAll").checked) {
                document.getElementById("chkRed").checked = true;
                document.getElementById("chkWhite").checked = true;
                document.getElementById("chkBlue").checked = true;
            }
            else {
                document.getElementById("chkRed").checked = false;
                document.getElementById("chkWhite").checked = false;
                document.getElementById("chkBlue").checked = false;
            }

        }

    </script>



</asp:Content>
