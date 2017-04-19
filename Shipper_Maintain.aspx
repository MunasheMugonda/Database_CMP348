<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Shipper_Maintain.aspx.cs" Inherits="DatabaseProject.Shipper_Maintain" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
   <asp:SqlDataSource runat="server" ID="sdsListViewShipper"  
        ConnectionString="<%$ConnectionStrings:Northwind %>"
        OldValuesParameterFormatString="original_{0}"
        OnUpdated="sdsListViewShipper_Updated"
        SelectCommand="SELECT *
                        FROM Shipper
                        ORDER BY CompanyName;"
        InsertCommand="INSERT
                            INTO Shipper
                                    (
                                        CompanyName,
                                        Phone,
                                        EmailAddress                                       
                                    )
                            VALUES
                                    (
                                        @CompanyName,
                                        @Phone,
                                        @EmailAddress 
                                    );"
       UpdateCommand="UPDATE Shipper
                         SET CompanyName = @CompanyName,
                             Phone = @Phone,
                             EmailAddress = @EmailAddress 
                         WHERE ShipperID = @original_ShipperID" 
       DeleteCommand="DELETE
                         FROM Shipper
                     WHERE ShipperID = @original_ShipperID;">
        
    </asp:SqlDataSource>

    Maintain Shippers
    <br />
    <br />
    

    <asp:ListView runat="server" ID="livShipper" 
        DataKeyNames="ShipperID" 
        DataSourceID="sdsListViewShipper" 
        EmptyDataText="No data to display."
        InsertItemPosition="FirstItem" >
        
        <LayoutTemplate>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <table id="itemPlaceholderContainer">
                            <tr>
                                <th> </th>
                                <th><asp:LinkButton runat="server" CommandArgument="CompanyName" CommandName="Sort">Campany Name</asp:LinkButton></th>
                                <th><asp:LinkButton runat="server" CommandArgument="Phone" CommandName="Sort">Phone</asp:LinkButton></th>
                                <th><asp:LinkButton runat="server" CommandArgument="EmailAddress" CommandName="Sort">EmailAddress</asp:LinkButton></th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder" />
                        </table>
                    </asp:TableCell>
                </asp:TableRow>
                
            </asp:Table>
        </LayoutTemplate>
            
        <ItemTemplate> 
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnModify" CommandName="Edit" SkinID="skiListViewButton" Text="Modify" />
                    <asp:Button runat="server" ID="btnDelete" CommandName="Delete" SkinID="skiListViewButton" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item? Click OK to delete or Cancel to keep it.');" />
                </td>
                <%--Copy Area Start(Enabled="false")--%>
                <td>
                     <asp:Textbox runat="server" ID="txtCompanyName" Enabled="false" MaxLength="40" Text='<%# Bind("CompanyName") %>'/>
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtPhone" Enabled="false" MaxLength="40" Text='<%# Bind("Phone") %>'/>
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtEmailAddress" Enabled="false" MaxLength="40" Text='<%# Bind("EmailAddress") %>'/>
                </td>
                <%--Copy Area End--%>
            </tr>
        </ItemTemplate>
        <InsertItemTemplate>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnAddSave" CommandName="Insert" SkinID="skiListViewButton" Text="Insert" />
                    <asp:Button runat="server" ID="btnAddCancel" CommandName="Cancel" SkinID="skiListViewButton" Text="Cancel" />
                </td>
                <%--Copy Area Start(Enabled="true")--%>
                <td>
                     <asp:Textbox runat="server" ID="txtCompanyName" Enabled="true" MaxLength="40" Text='<%# Bind("CompanyName") %>'/>
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtPhone" Enabled="true" MaxLength="40" Text='<%# Bind("Phone") %>'/>
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtEmailAddress" Enabled="true" MaxLength="40" Text='<%# Bind("EmailAddress") %>'/>
                </td>
                <%--Copy Area End--%>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnModifySave" CommandName="Update" SkinID="skiListViewButton" Text="Save" />
                    <asp:Button runat="server" ID="btnModifyCancel" CommandName="Cancel" SkinID="skiListViewButton" Text="Cancel" />
                </td>
                <%--Copy Area Start(Enabled="true")--%>
                <td>
                     <asp:Textbox runat="server" ID="txtCompanyName" Enabled="true" MaxLength="40" Text='<%# Bind("CompanyName") %>'/>
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtPhone" Enabled="true" MaxLength="40" Text='<%# Bind("Phone") %>'/>
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtEmailAddress" Enabled="true" MaxLength="40" Text='<%# Bind("EmailAddress") %>'/>
                </td>
                <%--Copy Area End--%>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    <asp:DataPager runat="server" PagedControlID="livShipper" PageSize="4">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="false"  ShowLastPageButton="false" />
            <asp:NumericPagerField ButtonCount="3" />
            <asp:NextPreviousPagerField ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowNextPageButton="false" ShowLastPageButton="true" />
        </Fields>
    </asp:DataPager>
 </asp:Content>
