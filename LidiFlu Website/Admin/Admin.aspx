<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true"
    CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var selectedFiles;
        var success = new Boolean("true");

        $(document).ready(function () {

            //            if (!Modernizr.draganddrop) {
            //                alert("This browser doesn't support File API and Drag & Drop features of HTML5!");
            //                return;
            //            } //end if

            var box;
            box = document.getElementById("box");
            box.addEventListener("dragenter", OnDragEnter, false);
            box.addEventListener("dragover", OnDragOver, false);
            box.addEventListener("drop", OnDrop, false);
            box.addEventListener("dragleave", OnLeave, false);

            $("#upload").click(function () {

                if (success) {

                    var data = new FormData();
                    for (var i = 0; i < selectedFiles.length; i++) {
                        data.append(selectedFiles[i].name, selectedFiles[i]);
                    } //end for
                    $.ajax({
                        type: "POST",
                        url: "FileHandler.ashx",
                        contentType: false,
                        processData: false,
                        data: data,
                        success: function (result) {
                            alert(result);
                            success = true;
                        },
                        error: function () {
                            alert("There was error uploading files!");
                        }
                    }); //end ajax
                } //end if
                else {
                    $("#box").text("the files you have selected are not valid");

                } //end else
            }); //end function ready     

        });  //end click

        function OnDragEnter(e) {
            this.style.opacity = '0.4';
            $("#box").addClass("dragEnterBox");
            e.stopPropagation();
            e.preventDefault();

        } //end OnDragEnter

        function OnDragOver(e) {
            $("#box").addClass("dragEnterBox");
            e.stopPropagation();
            e.preventDefault();
        } //end OnDragOver

        function OnLeave(e) {
            this.style.opacity = '1';
            e.stopPropagation();
            e.preventDefault();
        }

        var mimeType
        function OnDrop(e) {
            this.style.opacity = '1';
            $("#box").addClass("dragEnterBox");
            e.stopPropagation();
            e.preventDefault();
            selectedFiles = e.dataTransfer.files;

            for (var i = 0; i < selectedFiles.length; i++) {

                mimeType = selectedFiles[i].type;
                typeValidate = (mimeType.substring(0, 5));
                if (typeValidate == "image") {
                    $("#box").text(selectedFiles.length + " file(s) selected for uploading!");
                    success = true;
                }
                else {
                    $("#box").text("some or all of your files are not images");
                    success = false;
                    //selectedFiles.length=0;
                } //end if else
            } //end for
        } //end OnDrop

  

    </script>
    <div id="title" class="container_12">
        <h1>
            Admin</h1> 
             <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="EngineeringDataContext"
                        EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
                        TableName="Jobs">
                    </asp:LinqDataSource>
    </div>
    <div id="admin-container" class="container_12">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="3">
            <asp:TabPanel runat="server" ID="AddImage" HeaderText="Add Image">
                <ContentTemplate>
                    <div id="box">
                        Drag &amp; Drop files from your machine on this box.</div>
                    <br />
                    <input id="upload" type="button" value="Upload Selected Files" class="button-link" />
                    </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel runat="server" ID="AddJob" HeaderText="Add Job">
                <ContentTemplate>
                   <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" 
            Width="125px" AllowPaging="True" AutoGenerateRows="true" DataSourceID="LinqDataSource1">
                 <Fields>
                     <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                         ShowInsertButton="True" />
                 </Fields>
                    </asp:DetailsView>
        
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel runat="server" ID="AddProduct" HeaderText="Add Product">
                <ContentTemplate>
                    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False"
                        CellPadding="4" DataKeyNames="ProdID" DataSourceID="ProductLinqDataSource1" ForeColor="#333333"
                        GridLines="None">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <EditRowStyle BackColor="#999999" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <Fields>
                            <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True"
                                SortExpression="ProdID" />
                            <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                            <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
                            <asp:BoundField DataField="ProdImage" HeaderText="ProdImage" SortExpression="ProdImage" />
                            <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                            <asp:BoundField DataField="ProdDescriptionFull" HeaderText="ProdDescriptionFull"
                                SortExpression="ProdDescriptionFull" />
                            <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                        </Fields>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    </asp:DetailsView>
                    <asp:LinqDataSource ID="ProductLinqDataSource1" runat="server" ContextTypeName="ShopDataContext"
                        EnableInsert="True" EntityTypeName="" TableName="Products">
                    </asp:LinqDataSource>
                </ContentTemplate>
            </asp:TabPanel>
            <asp:TabPanel ID="EditProduct" runat="server" HeaderText="Edit/Delete Product">
                <ContentTemplate>
                    <div id="editProduct">
                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                            DataKeyNames="ProdID" DataSourceID="ProductDataSource1" AllowPaging="True" PageSize="5"
                            CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="ProdID" HeaderText="ProdID" ReadOnly="True" SortExpression="ProdID" />
                                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                                <asp:BoundField DataField="ProdPrice" HeaderText="ProdPrice" SortExpression="ProdPrice" />
                                <asp:BoundField DataField="ProdImage" HeaderText="ProdImage" SortExpression="ProdImage" />
                                <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                                <asp:BoundField DataField="ProdDescriptionFull" HeaderText="ProdDescriptionFull"
                                    SortExpression="ProdDescriptionFull" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <asp:LinqDataSource ID="ProductDataSource1" runat="server" ContextTypeName="ShopDataContext"
                            EnableDelete="True" EnableUpdate="True" EnableInsert="True" EntityTypeName=""
                            TableName="Products">
                        </asp:LinqDataSource>
                    </div>
                </ContentTemplate>
            </asp:TabPanel>
        </asp:TabContainer>
    </div>
</asp:Content>
