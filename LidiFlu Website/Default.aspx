<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>
    <%@ MasterType VirtualPath="~/Lidiflu.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.slides.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#slides").slidesjs({
                width: 940,
                height: 470,
                play: {
                    active: false,
                    // [boolean] Generate the play and stop buttons.
                    // You cannot use your own buttons. Sorry.
                    effect: "slide",
                    // [string] Can be either "slide" or "fade".
                    interval: 6000,
                    // [number] Time spent on each slide in milliseconds.
                    auto: true,
                    // [boolean] Start playing the slideshow on load.
                    swap: false,
                    // [boolean] show/hide stop and play buttons
                    pauseOnHover: false,
                    // [boolean] pause a playing slideshow on hover
                    restartDelay: 2500
                    // [number] restart delay on inactive slideshow
                }
            });
        });
    </script>
     <script type="text/javascript">
     //set call function interval
        setInterval(getTweets, 42000);
        //function to get twitter feed
        function getTweets() {
            $.getJSON("https://api.twitter.com/1/statuses/user_timeline/Glinner.json?count=5&include_rts=1&callback=?", function (tweetdata) {
                var tl = $("#tweet-list");
                tl.empty();
                $.each(tweetdata, function (i, tweet) {
                    
                    tl.append("<li class=tweetli>“" + urlToLink(tweet.text) + "”– " + "</br>" + "</br>" + relTime(tweet.created_at) + "</li>");
                });

            });
        }
        //converts url to links
        function urlToLink(text) {
            var exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig;
            return text.replace(exp, "<a href='$1'>$1</a>");
        }
        //converts post time into twitter style
        function relTime(time_value) {
            time_value = time_value.replace(/(\+[0-9]{4}\s)/ig, "");
            var parsed_date = Date.parse(time_value);
            var relative_to = (arguments.length > 1) ? arguments[1] : new Date();
            var timeago = parseInt((relative_to.getTime() - parsed_date) / 1000);
            if (timeago < 60) return 'less than a minute ago';
            else if (timeago < 120) return 'about a minute ago';
            else if (timeago < (45 * 60)) return (parseInt(timeago / 60)).toString() + ' minutes ago';
            else if (timeago < (90 * 60)) return 'about an hour ago';
            else if (timeago < (24 * 60 * 60)) return 'about ' + (parseInt(timeago / 3600)).toString() + ' hours ago';
            else if (timeago < (48 * 60 * 60)) return '1 day ago';
            else return (parseInt(timeago / 86400)).toString() + ' days ago';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="home-content" class="container_12">
        <div id="slides">
            <img src="Images/black-law-wind-farm crop.jpg" width="960" height="470" alt="windfarmslide1" />
            <img src="Images/SSE-turbines.jpg" width="960" height="470" alt="windfarmslide2" />
            <img src="Images/windfarm.jpg" width="960" height="470" alt="windfarmslide3" />
        </div>
        <asp:Panel ID="pnlWeather" CssClass="container_12" Visible="false" runat="server">
            <div id="news_ticker">
                <ul>
                    <li>
                        <p>
                            Looks like its getting pretty windy! It is
                            <asp:Label ID="lblWindSpeed" runat="server" Text="Label"></asp:Label>
                            mph at your location</p>
                    </li>
                    <li><a href="Shop.aspx#category5">Maybe its time to call an engineer!</a> </li>
                </ul>
            </div>
        </asp:Panel>
        <div id="products" class="container_12">
            <div class="grid_3">
                <div class="product-line">
                    <h2 class="product-header">
                        Generators</h2>
                    <a href="Shop.aspx#category1">
                        <img src="Images/generator.gif" alt="generator" class="product" /></a>
                    <div class="see-more">
                        <a href="Shop.aspx#category1">See Product >>></a></div>
                </div>
            </div>
            <div class="grid_3">
                <div class="product-line">
                    <h2 class="product-header">
                        Gearing</h2>
                    <a href="Shop.aspx#category2">
                        <img class="product" src="Images/466116680_485fafec8c_z.jpg" /></a>
                    <div class="see-more">
                        <a href="Shop.aspx#category2">See Product >>></a></div>
                </div>
            </div>
            <div class="grid_3">
                <div class="product-line">
                    <h2 class="product-header">
                        Turbine</h2>
                    <a href="Shop.aspx#category3">
                        <img src="Images/turbine.jpg" class="product" /></a>
                    <div class="see-more">
                        <a href="Shop.aspx#category3">See Product >>></a></div>
                </div>
            </div>
            <div class="grid_3">
                <div class="product-line">

                    <h2 class="product-header">
                        Repair Serivces</h2>
                    <img src="Images/EngineeringServices.png" class="product" alt="engineering services" />
                    <div class="see-more">
                        <a href="#">See Service >>></a></div>
                </div>
            </div>
        </div>
        <div id="down" class="container_12">
            <div id="latests" class="grid_9 clearfix ">
                <h2>
                    Latest Products</h2>
                <ul runat="server" class="clearfix" id="latestProducts">
                </ul>
            </div>
            <div id="twitter" class="grid_3 omega">
                <div id="twitter-header">
                    <img src="img/twitter-bird-blue-on-white.png" style="height: 57px; width: 59px" />
                    <h2>
                        @lifidlu</h2>
                </div>
                <ul id="tweet-list">
                </ul>
                <a href="https://twitter.com/ladyinradiator" class="twitter-follow-button" data-show-count="false">
                    Follow</a>
                <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } } (document, 'script', 'twitter-wjs');</script>
            </div>
        </div>
    </div>
</asp:Content>
