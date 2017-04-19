<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="JavaScript_EnableDisableControls.aspx.cs" Inherits="DatabaseProject.JavaScript_EnableDisableControls" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Java Script - Move Input to Output

    <br />
    <br />

    <asp:RadioButton runat="server" ID="radReds" ClientIDMode="Static" GroupName="Colours" onClick="EnableDisableControls()" Text="Reds" />
    <asp:RadioButton runat="server" ID="radGreens" ClientIDMode="Static" GroupName="Colours" onClick="EnableDisableControls()" Text="Reds" /><br /><br />

    <asp:CheckBox runat="server" ID="chkCranberry" ClientIDMode="Static" Text="Cranberry" />
    <asp:CheckBox runat="server" ID="chkStrawberry" ClientIDMode="Static" Text="Strawberry" /><br /><br />
    <asp:CheckBox runat="server" ID="chkAsparagus" ClientIDMode="Static" Text="Asparagus" />
    <asp:CheckBox runat="server" ID="chkBroccoli" ClientIDMode="Static" Text="Broccoli" />

    <script type="text/javascript">
        function EnableDisableControls() {
        
            //enable/Disable the check boxes on the page
        if (document.getElementById("radReds").checked) {
            document.getElementById("chkCranberry").disabled = false;
            document.getElementById("chkStrawberry").disabled = false;
            document.getElementById("chkAsparagus").disabled = true;
            document.getElementById("chkBroccoli").disabled = true;
        }
        else {
            document.getElementById("chkCranberry").disabled = true;
            document.getElementById("chkStrawberry").disabled = true;
            document.getElementById("chkAsparagus").disabled = false;
            document.getElementById("chkBroccoli").disabled = false;
        }
        }
        
    </script>



</asp:Content>
