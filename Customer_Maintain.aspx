<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Customer_Maintain.aspx.cs" Inherits="DatabaseProject.Customer_Maintain" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <asp:SqlDataSource runat="server" ID="sdsCustomerDropDownList"
        ConnectionString="<%$ConnectionStrings:Northwind %>"
        SelectCommand="SELECT CustomerID, CompanyName
                            FROM Customer
                            ORDER BY CompanyName;" >

   </asp:SqlDataSource>
   <asp:SqlDataSource runat="server" ID="sdsFormViewCustomer" 
        ConnectionString="<%$ConnectionStrings:Northwind %>"
        OldValuesParameterFormatString="original_{0}"
        OnInserted="sdsFormViewCustomer_Inserted"
        SelectCommand="SELECT *
                        FROM Customer
                        Where CustomerID = @CustomerID;"
        InsertCommand="INSERT
                            INTO Customer
                                    (
                                        Customer,
                                        CompanyName,
                                        ContactName,
                                        ContactTitle,
                                        Address,
                                        City,
                                        Region,
                                        PostalCode,
                                        Country,
                                        Phone,
                                        Fax
                                       
                                    )
                            VALUES
                                    (
                                        @Customer,
                                        @CompanyName,
                                        @ContactName,
                                        @ContactTitle,
                                        @Address,
                                        @City,
                                        @Region,
                                        @PostalCode,
                                        @Country,
                                        @Phone,
                                        @Fax
                                       
                                    );
                        SELECT @CustomerID = SCOPE_IDENTITY();" 
       UpdateCommand="UPDATE Customer
                         SET CompanyName = @CompanyName,
                             ContactName = @ContactName,
                             ContactTitle = @ContactTitle,
                             Address = @Address,
                             City = @City,
                             Region = @Region,
                             PostalCode = @PostalCode,
                             Country = @Country,
                             Phone = @Phone,
                             Fax = @Fax
                             
                         WHERE CustomerID = @original_CustomerID" 
       DeleteCommand="DELETE
                         FROM Customer
                     WHERE CustomerID = @original_CustomerID;">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlCustomer" Name="CustomerID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Direction="Output" Name="CustomerID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    Maintain Customers
    <br />
    <br />
    <asp:Label runat="server" Text="Customer: " /><br />
    <asp:DropDownList runat="server" ID="ddlCustomer" 
        AutoPostBack="true" 
        DataSourceID="sdsCustomerDropDownList"  
        DataTextField="CompanyName"
        DataValueField="CustomerID" />
    <br />
    <br />

    <asp:FormView runat="server" ID="fovCustomer"  
        DataKeyNames="CustomerID" 
        DataSourceID="sdsFormViewCustomer" 
        EmptyDataText="No data to display."
        OnItemInserted="fovCustomer_ItemInserted"  
        OnItemUpdated="fovCustomer_ItemUpdated"
        OnItemDeleted="fovCustomer_ItemDeleted">
        <ItemTemplate> 
            <asp:Button runat="server" ID="btnAdd" CommandName="New" Text="Add" />
            <asp:Button runat="server" ID="btnModify" CommandName="Edit" Text="Modify" />
            <asp:Button runat="server" ID="btnDelete" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this item? Click OK to delete or Cancel to keep it.');" />
            <br />
            <br />

            <asp:Table runat="server" Enabled="false">
                <%--Copy Area Start--%>
                <asp:TableRow VerticalAlign="Top" >
                    <asp:TableCell >

                        <asp:Table runat="server">
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Company Name" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCompanyName" MaxLength="40" Text='<%# Bind("CompanyName") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Contact Name" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtContactName" MaxLength="40" Text='<%# Bind("ContactName") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Contact Title" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtContactTitle" MaxLength="40" Text='<%# Bind("ContactTitle") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Address" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtAddress" MaxLength="40" Text='<%# Bind("Address") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="City" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCity" MaxLength="40" Text='<%# Bind("City") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Region" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtRegion" MaxLength="40" Text='<%# Bind("Region") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Postal Code" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtPostalCode" MaxLength="40" Text='<%# Bind("PostalCode") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Country" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCountry" MaxLength="40" Text='<%# Bind("Country") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Phone" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtPhone" MaxLength="40" Text='<%# Bind("Phone") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Fax" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtFax" MaxLength="40" Text='<%# Bind("Fax") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <%--Copy Area End--%>
            </asp:Table>
        </ItemTemplate>
        <InsertItemTemplate>
            <asp:Button runat="server" ID="btnAddSave" CommandName="Insert" Text="Insert" />
            <asp:Button runat="server" ID="btnAddCancel" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            <asp:Table  runat="server" Enabled="true" >
                <%--Copy Area Start--%>
                <asp:TableRow VerticalAlign="Top" >
                    <asp:TableCell >

                        <asp:Table runat="server">
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Company Name" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCompanyName" MaxLength="40" Text='<%# Bind("CompanyName") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Contact Name" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtContactName" MaxLength="40" Text='<%# Bind("ContactName") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Contact Title" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtContactTitle" MaxLength="40" Text='<%# Bind("ContactTitle") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Address" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtAddress" MaxLength="40" Text='<%# Bind("Address") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="City" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCity" MaxLength="40" Text='<%# Bind("City") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Region" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtRegion" MaxLength="40" Text='<%# Bind("Region") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Postal Code" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtPostalCode" MaxLength="40" Text='<%# Bind("PostalCode") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Country" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCountry" MaxLength="40" Text='<%# Bind("Country") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Phone" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtPhone" MaxLength="40" Text='<%# Bind("Phone") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Fax" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtFax" MaxLength="40" Text='<%# Bind("Fax") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <%--Copy Area End--%>
            </asp:Table>
        </InsertItemTemplate>
        <EditItemTemplate>
            <asp:Button runat="server" ID="btnModifySave" CommandName="Update" Text="Save" />
            <asp:Button runat="server" ID="btnModifyCancel" CommandName="Cancel" Text="Cancel" />
            <br />
            <br />
            <asp:Table  runat="server" Enabled="true" >
                <%--Copy Area Start--%>
                <asp:TableRow VerticalAlign="Top" >
                    <asp:TableCell >

                        <asp:Table runat="server">
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Company Name" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCompanyName" MaxLength="40" Text='<%# Bind("CompanyName") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Contact Name" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtContactName" MaxLength="40" Text='<%# Bind("ContactName") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Contact Title" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtContactTitle" MaxLength="40" Text='<%# Bind("ContactTitle") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Address" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtAddress" MaxLength="40" Text='<%# Bind("Address") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="City" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCity" MaxLength="40" Text='<%# Bind("City") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Region" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtRegion" MaxLength="40" Text='<%# Bind("Region") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Postal Code" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtPostalCode" MaxLength="40" Text='<%# Bind("PostalCode") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Country" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtCountry" MaxLength="40" Text='<%# Bind("Country") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Phone" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtPhone" MaxLength="40" Text='<%# Bind("Phone") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Fax" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtFax" MaxLength="40" Text='<%# Bind("Fax") %>'/>
                                </asp:TableCell>
                            </asp:TableRow>
                         </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <%--Copy Area End--%>
            </asp:Table>
         
        </EditItemTemplate>
    </asp:FormView>
</asp:Content>
