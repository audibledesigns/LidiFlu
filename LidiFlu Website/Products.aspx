<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true"
    CodeFile="Products.aspx.cs" Inherits="Products" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        //display panel after add to cart
        function confirmOrder() {
            $("#options").slideToggle("slow");
            $(this).toggleClass("active");
        }
    </script>
    <div id="innercontent" class="container_12">
        <div class="grid_6">
            <div id="proddisplay">
                <asp:Image ID="imgProdImage" runat="server" Height="360px" Width="100%" />
            </div>
            <div class="productalt grid_2 alpha">
            </div>
            <div class="productalt grid_2">
            </div>
            <div class="productalt grid_2 omega">
            </div>
        </div>
        <div class="grid_6">
            <div id="prodinfo">
                <asp:Label ID="lblCategory" CssClass="prodinfocategory" runat="server" Text="Category"></asp:Label>
                <asp:Label ID="lblProdTitle" CssClass="prodinfotitle" runat="server" Text="Item Title"></asp:Label>
                <asp:Label ID="lblSubHeading" runat="server" CssClass="prodinfosubhead" Text="SubHeading"></asp:Label>
                <asp:Label ID="lblPrice" CssClass="price" runat="server" Text="£123.00"></asp:Label>
                <asp:Label ID="lblDescription" runat="server" Text="Label"></asp:Label>
            </div>
            <div id="addto">
                <asp:TextBox type="number" Width="45px" Height="45px" min="1" value="1" ID="txtQuantity"
                    runat="server"></asp:TextBox>
                <asp:Button ID="addtoCart" CssClass="btnAddToCart" runat="server" Text="+ Add to Cart"
                    OnClick="addtoCart_Click" />
            </div>
            <div id="options">
                <asp:Label ID="lblQty" CssClass="prodLabel" runat="server" Text=""></asp:Label><asp:Label
                    CssClass="prodLabel" ID="lblProduct" runat="server" Text=""></asp:Label>
                <a href="ShoppingCart.aspx">View Cart >>></a> <a href="Shop.aspx">Continue Shopping
                    >>></a>
            </div>
        </div>
    </div>
</asp:Content>
