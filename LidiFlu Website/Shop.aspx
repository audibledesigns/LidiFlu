<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true"
    CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript">
        //script for smooth scroll
        $(function () {
            $('ul.shopul a').bind('click', function (event) {

                var $anchor = $(this);

                $('html, body').stop().animate({
                    scrollTop: $($anchor.attr('href')).offset().top
                }, 1000, 'easeInOutExpo');
                /*
                if you don't want to use the easing effects:
                $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
                }, 1000);
                */
                event.preventDefault();
            });
        });
        

    </script>
    <script type="text/javascript">
        $(function () {
            $('a.scroll').bind('click', function (event) {

                var $anchor = $(this);

                $('html, body').stop().animate({
                    scrollTop: $($anchor.attr('href')).offset().top
                }, 1000, 'easeInOutExpo');
                /*
                if you don't want to use the easing effects:
                $('html, body').stop().animate({
                scrollTop: $($anchor.attr('href')).offset().top
                }, 1000);
                */
                event.preventDefault();
            });
        });
        

    </script>
    <div id="title" class="container_12">
        <h1>
            Shop</h1>
    </div>
    <div id="shopheader" class="container_12">
        <div class="shopcategory grid_3">
            <div class="shoph2">
                Shop by category</div>
            <ul class="shopul">
                <li><a href="#category1">Generators</a></li>
                <li><a href="#category2">Gearing</a></li>
                <li><a href="#category3">Turbines</a></li>
                <li><a href="#category4">Rotors</a></li>
                <li><a href="#category5">R</a>epair Services</li>
            </ul>
        </div>
        <div id="shopimage" class="grid_9">
            <img src="Images/wind_farm.jpg" alt="windfamrm" width="700px" height="400px" />
        </div>
    </div>
    <div id="category1" class="container_12">
        <div class="shopcategory grid_3">
            <div class="shoph2">
                Generators</div>
            <p class="shoppara">
                Blurb about Category 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Sed sodales consectetur facilisis. Nunc justo turpis, laoreet ac posuere sit amet,
                frsem lorem.
            </p>
        </div>
        <div class="shoplist grid_8">
            <ul id="shopcat1" runat="server">
            </ul>
        </div>
        <div class="shopbutton grid_1 omega">
            <a class="scroll" href="#category2">
                <img src="img/downarrow.png" /></a></div>
    </div>
    <div id="category2" class="container_12">
        <div class="shopcategory grid_3">
            <div class="shoph2">
                Gearing</div>
            <p class="shoppara">
                Blurb about Category 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Sed sodales consectetur facilisis. Nunc justo turpis, laoreet ac posuere sit amet,
                frsem lorem.
            </p>
        </div>
        <div class="shoplist grid_8">
            <ul id="shopcat2" runat="server">
            </ul>
        </div>
        <div class="shopbutton grid_1">
            <a class="scroll" href="#category1">
                <img src="img/upparrow1.png" /></a><a class="scroll" href="#category3"><img src="img/downarrow1.png" /></a></div>
    </div>
    <div id="category3" class="container_12">
        <div class="shopcategory grid_3">
            <div class="shoph2">
                Turbines</div>
            <p class="shoppara">
                Blurb about Category 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Sed sodales consectetur facilisis. Nunc justo turpis, laoreet ac posuere sit amet,
                frsem lorem.
            </p>
        </div>
        <div class="shoplist grid_8">
            <ul id="shopcat3" runat="server">
            </ul>
        </div>
        <div class="shopbutton grid_1">
            <a class="scroll" href="#category2">
                <img src="img/upparrow1.png" /></a><a class="scroll" href="#category4"><img src="img/downarrow1.png" /></a></div>
    </div>
    <div id="category4" class="container_12">
        <div class="shopcategory grid_3">
            <div class="shoph2">
                Rotors</div>
            <p class="shoppara">
                Blurb about Category 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Sed sodales consectetur facilisis. Nunc justo turpis, laoreet ac posuere sit amet,
                frsem lorem.
            </p>
        </div>
        <div class="shoplist grid_8">
            <ul id="shopcat4" runat="server">
            </ul>
        </div>
        <div class="shopbutton grid_1">
            <a href="#category3" class="scroll">
                                <img src="img/upparrow1.png" /></a><a class="scroll" href="#category4"><img src="img/downarrow1.png" /></a></div>
    </div>
    <div id="category5" class="container_12">
        <div class="shopcategory grid_3">
            <div class="shoph2">
                Engineering Services</div>
            <p class="shoppara">
                Blurb about Category 1 Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                Sed sodales consectetur facilisis. Nunc justo turpis, laoreet ac posuere sit amet,
                frsem lorem.
            </p>
        </div>
        <div class="shoplist grid_8">
            <ul id="shopcat5" runat="server">
            </ul>
        </div>
        <div class="shopbutton grid_1">
            <a href="#category3" class="scroll">
                <img src="img/uparrow.png" /></a></div>
    </div>
</asp:Content>
