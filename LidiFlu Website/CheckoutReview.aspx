<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true"
    CodeFile="CheckoutReview.aspx.cs" Inherits="CheckoutReview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="title" class="container_12">
        <h1>
            Checkout</h1>
    </div>
    <div id="checkout-container" class="grid_9">
        <div id="details">
            <h2 class="checkouth2">
                1. Your Details</h2>
            <h4>
                Forename</h4>
            <asp:Label ID="lblFore" runat="server" Height="23px" Width="295px"></asp:Label>
            <h4>
                Surname</h4>
            <asp:Label ID="lblSur" runat="server" Height="23px" Width="295px"></asp:Label>
            <h4>
                Email</h4>
            <asp:Label ID="lblEmail" type="email" runat="server" Height="23px" Width="295px"></asp:Label>
        </div>
        <div id="address">
            <h2 class="checkouth2">
                2. Shipping Address</h2>
            <h4>
                Address Line 1</h4>
            <asp:Label ID="lblAddress" runat="server" Height="23px" Width="295px"></asp:Label>
            <h4>
                Town/City</h4>
            <asp:Label ID="lblCity" runat="server" Height="23px" Width="295px"></asp:Label>
            <h4>
                PostCode</h4>
            <asp:Label ID="lblPostCode" runat="server" Height="23px" Width="295px"></asp:Label>
        </div>
        <div id="confirmation">
            <h2 class="checkouth2">
                3. Order Summary</h2>
            <asp:GridView ID="GridView1" Width="100%" AutoGenerateColumns="False" runat="server"
                RowStyle-VerticalAlign="Top" RowStyle-HorizontalAlign="Left" CellPadding="5"
                BorderStyle="Dotted" BorderWidth="0px" Font-Size="8pt" Font-Names="Verdana" ForeColor="#333333">
                <HeaderStyle HorizontalAlign="Left" />
                <RowStyle BorderStyle="Dotted" BorderWidth="1px" Font-Names="Verdana" Font-Size="11px" />
                <Columns>
                    <asp:TemplateField ControlStyle-Width="140" HeaderText="Product" SortExpression="Product">
                        <ItemTemplate>
                            <asp:Label ID="lblDescript" runat="server" Text='<%#Eval("Name") %>' />
                        </ItemTemplate>
                        <ControlStyle Width="220px"></ControlStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Price" ControlStyle-Width="60" SortExpression="Price">
                        <ItemTemplate>
                            <asp:Label ID="lblPrice" runat="server" Text='<%#Eval("Price") %>' />
                        </ItemTemplate>
                        <ControlStyle Width="60px"></ControlStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty" ControlStyle-Width="80" SortExpression="Price">
                        <ItemTemplate>
                            <asp:Label Width="20px" Height="20px" ID="txtQty" runat="server" Text='<%#Eval("Qty") %>' />
                        </ItemTemplate>
                        <ControlStyle Width="80px"></ControlStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total" ControlStyle-Width="120" ItemStyle-HorizontalAlign="Right"
                        SortExpression="Total">
                        <ItemTemplate>
                            <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("Total") %>' />
                        </ItemTemplate>
                        <ControlStyle Width="120px"></ControlStyle>
                        <ItemStyle HorizontalAlign="Right"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div id="proceed" class="grid_3 prefix_6 alpha">
                <asp:Table ID="Table1" runat="server" Height="53px" Width="166px">
                    <asp:TableRow>
                        <asp:TableCell><p>Sub Total</p></asp:TableCell>
                        <asp:TableCell ID="cellSub"></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><p>Shipping</p></asp:TableCell>
                        <asp:TableCell ID="cellShipping"></asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell><p>Total</p></asp:TableCell>
                        <asp:TableCell ID="cellTotal"></asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <br />
                <asp:Button runat="server" CssClass="btnAddToCart" ID="btnConfrim" Text="Confirm Order"
                    OnClick="btnConfrim_Click" />
            </div>
        </div>
    </div>
    <div id="cartside" class="grid_3 omega">
        <h2>
            Need Help</h2>
        <p class="grey-text">
            Office Hours:<br></br>
            Mon-Fri 9.30am-6.00pm</p>
        <p>
        </p>
        <p>
            +44 (0) 1313 123 1235</p>
        <p>
        </p>
        <p>
            <a style="color: #2583B7" href="mailto:enquiries@lidiflu.com">enquiries@lidiflu.com</a></p>
        <h2>
            We Accept</h2>
        <img src="Images/paymentsmall.png" />
        <h2>
            Delivery</h2>
        <p>
            We ship with UPS and a Special delivery service from Royal mail.</p>
        <p>
            <br></br>
        </p>
        <p>
            UK ORDERS We aim to get all orders placed before 3pm out to you for a next day delivery.
        </p>
        <h2>
            Returns</h2>
        <p>
            <a href="#">Returns and Delivery >> </a>
        </p>
    </div>
</asp:Content>
