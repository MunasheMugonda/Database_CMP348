<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Supplier_Maintain.aspx.cs" Inherits="DatabaseProject.Supplier_Maintain" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <asp:SqlDataSource runat="server" ID="sdsSupplierDropDownList"
        ConnectionString="<%$ConnectionStrings:Northwind %>"
        SelectCommand="SELECT SupplierID, CompanyName
                            FROM Supplier
                            ORDER BY CompanyName;" >

   </asp:SqlDataSource>
   <asp:SqlDataSource runat="server" ID="sdsFormViewSupplier" 
        ConnectionString="<%$ConnectionStrings:Northwind %>"
        OldValuesParameterFormatString="original_{0}"
        OnInserted="sdsFormViewSupplier_Inserted"
        SelectCommand="SELECT *
                        FROM Supplier
                        Where SupplierID = @SupplierID;"
        InsertCommand="INSERT
                            INTO Supplier
                                    (
                                        CompanyName,
                                        ContactName,
                                        ContactTitle,
                                        Address,
                                        City,
                                        Region,
                                        PostalCode,
                                        Country,
                                        Phone,
                                        Fax,
                                        HomePage
                                    )
                            VALUES
                                    (
                                        @CompanyName,
                                        @ContactName,
                                        @ContactTitle,
                                        @Address,
                                        @City,
                                        @Region,
                                        @PostalCode,
                                        @Country,
                                        @Phone,
                                        @Fax,
                                        @HomePage
                                    );
                        SELECT @SupplierID = SCOPE_IDENTITY();" 
       UpdateCommand="UPDATE Supplier
                         SET CompanyName = @CompanyName,
                             ContactName = @ContactName,
                             ContactTitle = @ContactTitle,
                             Address = @Address,
                             City = @City,
                             Region = @Region,
                             PostalCode = @PostalCode,
                             Country = @Country,
                             Phone = @Phone,
                             Fax = @Fax,
                             HomePage = @HomePage
                             
                         WHERE SupplierID = @original_SupplierID" 
       DeleteCommand="DELETE
                         FROM Supplier
                     WHERE SupplierID = @original_SupplierID;">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlSupplier" Name="SupplierID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Direction="Output" Name="SupplierID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    Maintain Suppliers
    <br />
    <br />
    <asp:Label runat="server" Text="Supplier: " /><br />
    <asp:DropDownList runat="server" ID="ddlSupplier" 
        AutoPostBack="true" 
        DataSourceID="sdsSupplierDropDownList"  
        DataTextField="CompanyName"
        DataValueField="SupplierID" />
    <br />
    <br />

    <asp:FormView runat="server" ID="fovSupplier"  
        DataKeyNames="SupplierID" 
        DataSourceID="sdsFormViewSupplier" 
        EmptyDataText="No data to display."
        OnItemInserted="fovSupplier_ItemInserted"  
        OnItemUpdated="fovSupplier_ItemUpdated"
        OnItemDeleted="fovSupplier_ItemDeleted">
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
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Home Page" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtHomePage" MaxLength="40" Text='<%# Bind("HomePage") %>'/>
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
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Home Page" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtHomePage" MaxLength="40" Text='<%# Bind("HomePage") %>'/>
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
                            <asp:TableRow >
                                <asp:TableCell>
                                    <asp:Label runat="server" Text="Home Page" />
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Textbox runat="server" ID="txtHomePage" MaxLength="40" Text='<%# Bind("HomePage") %>'/>
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
