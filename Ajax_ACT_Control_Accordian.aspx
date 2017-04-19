<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Ajax_ACT_Control_Accordian.aspx.cs" Inherits="DatabaseProject.Ajax_ACT_Control_Accordian" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    Ajax Control Toolkit – Accordion Conntrol
    <asp:ScriptManager runat="server" />

    <br  />
    <br  />
   
    <ajaxToolkit:Accordion runat="server" ID="accAccordion" 
                                   ContentCssClass="AccordianContentCssClass"
                                   FadeTransitions="true"
                                   Transitionduration="1000"
                                   HeaderCssClass="AccordianHeaderCssClass">
	<Panes>
	 	<ajaxToolkit:AccordionPane runat="server">
		<header>
				Part 1
		</header >
	    <Content>
				This is line 1 of Part 1 .<br />
                This is line 2 of Part 1.<br />
				This is line 3 of Part 1.<br />
                This is line 4 of Part 1.<br />

			</Content >

		</ajaxToolkit:AccordionPane>	

	</Panes>
    <Panes>
	 	<ajaxToolkit:AccordionPane runat="server" >
		<header>
				Part 2
		</header >
	    <Content>
				This is line 1 of Part 2.<br />
                This is line 2 of Part 2.<br />
				This is line 3 of Part 2.<br />
                This is line 4 of Part 2.<br />

			</Content >

		</ajaxToolkit:AccordionPane>	

	</Panes>
    </ajaxToolkit:Accordion>

</asp:Content>
