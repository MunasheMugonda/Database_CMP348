<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Category_Maintain.aspx.cs" Inherits="DatabaseProject.Category_Maintain" %>
<%@ MasterType VirtualPath="~/MasterPage.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
   <asp:SqlDataSource runat="server" ID="sdsListViewCategory" 
        ConnectionString="<%$ConnectionStrings:Northwind %>"
        OldValuesParameterFormatString="original_{0}"
        SelectCommand="SELECT *
                        FROM Category
                        ORDER BY CategoryName;"
        InsertCommand="INSERT
                            INTO Category
                                    (
                                        CategoryName,
                                        Description,  
                                        Picture
                                    )
                            VALUES
                                    (
                                        @CategoryName,
                                        @Description,
                                        @Picture
                                    );"
       UpdateCommand="UPDATE Category
                         SET CategoryName = @CategoryName,
                             Description = @Description,
                             Picture = @Picture
                         WHERE CategoryID = @original_CategoryID" 
       DeleteCommand="DELETE
                         FROM Category
                     WHERE CategoryID = @original_CategoryID;">
        
    </asp:SqlDataSource>

    Maintain Category
    <br />
    <br />
    

    <asp:ListView runat="server" ID="livCategory" 
        DataKeyNames="CategoryID" 
        DataSourceID="sdsListViewCategory" 
        EmptyDataText="No data to display."
        InsertItemPosition="FirstItem" >
        
        <LayoutTemplate>
            <asp:Table runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <table id="itemPlaceholderContainer">
                            <tr>
                                <th> </th>
                                <th><asp:LinkButton runat="server" CommandArgument="CategoryName" CommandName="Sort">Category Name</asp:LinkButton></th>
                                <th>Description</th>
                                <th>Picture</th>
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
                    <asp:Button runat="server" ID="btnDelete" CommandName="Delete" SkinID="skiListViewButton" Text="Delete"
                                               OnClientClick="return confirm('Are you sure you want to delete this item? Click OK to delete or Cancel to keep it.');" />
                </td>
                <%--Copy Area Start(Enabled="false")--%>
                <td>
                     <asp:Textbox runat="server" ID="txtCategoryName" Enabled="false" MaxLength="40" Text='<%# Bind("CategoryName") %>' />
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtDescription" Enabled="false" MaxLength="40" TextMode="MultiLine" Text='<%# Bind("Description") %>' />
                </td>
                <td>
                    <asp:Image runat="server" ID="imgPicture" Enabled="false" Width="40" EnableViewState="true" ImageUrl='<%# Bind("Picture") %>' />
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
                <%--Copy Area Start(Enabled="false")--%>
                <td>
                     <asp:Textbox runat="server" ID="txtCategoryName" Enabled="false" MaxLength="40" Text='<%# Bind("CategoryName") %>' />
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtDescription" Enabled="true" MaxLength="40" TextMode="MultiLine" Text='<%# Bind("Description") %>' />
                </td>
                <td>
                    <asp:Image runat="server" ID="imgPicture" Enabled="true" Width="40" EnableViewState="true" ImageUrl='<%# Bind("Picture") %>' />
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
                <%--Copy Area Start(Enabled="false")--%>
                <td>
                     <asp:Textbox runat="server" ID="txtCategoryName" Enabled="true" MaxLength="40" Text='<%# Bind("CategoryName") %>' />
                </td>
                <td>
                    <asp:Textbox runat="server" ID="txtDescription" Enabled="true" MaxLength="40" TextMode="MultiLine" Text='<%# Bind("Description") %>' />
                </td>
                <td>
                    <asp:Image runat="server" ID="imgPicture" Enabled="true" Width="40" EnableViewState="true" ImageUrl='<%# Bind("Picture") %>' />
                </td>
                <%--Copy Area End--%>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    <asp:DataPager runat="server" PagedControlID="livCategory" PageSize="4">
        <Fields>
            <asp:NextPreviousPagerField ShowFirstPageButton="true" ShowPreviousPageButton="false" ShowNextPageButton="false"  ShowLastPageButton="false" />
            <asp:NumericPagerField ButtonCount="3" />
            <asp:NextPreviousPagerField ShowFirstPageButton="false" ShowPreviousPageButton="false" ShowNextPageButton="false" ShowLastPageButton="true" />
        </Fields>
    </asp:DataPager>
 </asp:Content>
