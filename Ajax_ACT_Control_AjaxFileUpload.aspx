<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ajax_ACT_Control_AjaxFileUpload.aspx.cs" Inherits="DatabaseProject.Ajax_ACT_Control_AjaxFileUpload" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    Ajas Control Toolkit - Ajax File Upload Control
    <asp:ScriptManager runat="server"  />
    <br />
    <br />
   
    <ajaxToolkit:AjaxFileUpload runat="server" ID="afuDocuments" OnUploadComplete="afuDocuments_UploadComplete"
        AllowedFileTypes="doc,docx,pdf"
        CssClass="AjaxFileploadCssClass"
        MaximumNumberOfFiles="1"
        MaxFileSize="64000000" 
      />
        

</asp:Content>
