<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true"
    CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="title" class="container_12">
        <h1>
            Contact</h1>
    </div>
    <div class="grid_7">
        <h2 class="contacth2 grid_3 alpha">
            Get in touch</h2>
        <h2 class="contacth2 grid_4 omega">
            Find Us</h2>
        <div class="grid_7 dottedline alpha">
        </div>
        <div class="grid_3 intouch alpha">
            <h3 class="contacth3">
                Lanarkshire</h3>
            <p class="grey-text">
                Office Hours:</br>Mon-Fri 9.30am-6.00pm</p>
            <p>
            </p>
            <p>
                +44 (0) 1313 123 1235</p>
            <p>
            </p>
            <p>
            </p>
            <p>
                <a style="color: #2583B7" href="mailto:enquiries@lidiflu.com">enquiries@lidiflu.com</a></p>
            <ul class="contactul">
                <li class="contactli">Address Line1</li>
                <li class="contactli">Address Line2</li>
                <li class="contactli">Address Line3</li>
            </ul>
        </div>
        <div class="grid_4 findus omega">
            <iframe width="290" height="300" frameborder="0" scrolling="no" marginheight="0"
                marginwidth="0" src="https://maps.google.co.uk/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=&amp;aq=&amp;sll=55.78362,-3.994217&amp;sspn=0.026207,0.084543&amp;ie=UTF8&amp;t=m&amp;ll=55.804995,-3.998423&amp;spn=0.006753,0.011973&amp;z=15&amp;output=embed">
            </iframe>
            <br />
        </div>
        <div class="grid_7 dottedline alpha">
        </div>
        <div class="intouch grid_3 alpha">
            <h3 class="contacth3">
                Birmingham</h3>
            <p class="grey-text">
                Office Hours:</br>Mon-Fri 9.30am-6.00pm</p>
            <p>
            </p>
            <p>
                +44 (0) 3423 123 1235</p>
            <p>
            </p>
            <p>
            </p>
            <p>
                <a style="color: #2583B7" href="mailto:enquiries@lidiflu.com">enquiries@lidiflu.com</a></p>
            <ul class="contactul">
                <li class="contactli">Address Line1</li>
                <li class="contactli">Address Line2</li>
                <li class="contactli">Address Line3</li>
            </ul>
        </div>
        <div class="findus grid_4 omega">
            <iframe width="290" height="300" frameborder="0" scrolling="no" marginheight="0"
                marginwidth="0" src="https://maps.google.co.uk/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=&amp;aq=&amp;sll=55.78362,-3.994217&amp;sspn=0.026207,0.084543&amp;ie=UTF8&amp;t=m&amp;ll=55.804995,-3.998423&amp;spn=0.006753,0.011973&amp;z=15&amp;output=embed">
            </iframe>
        </div>
    </div>
    <div class="grid_5 messageus float-right">
        <h2 class="contacth2 grid_5 alpha">
            Contact Us</h2>
        <div class="grid_5 dottedline alpha">
        </div>
        <div id="formWrap" class="grid_5">
            <div class="row">
                <div class="label">
                    Name</div>
            </div>
            <div class="row">
                <!--endlabel-->
                <div class="input">
                    <asp:TextBox type="text" ID="name" class="details" runat="server" required="required"
                        placeholder="Your Full Name"></asp:TextBox>
                </div>
                <!--end of class-->
            </div>
            <div class="row">
                <div class="label">
                    Email</div>
            </div>
            <div class="row">
                <!--endlabel-->
                <div class="input">
                    <asp:TextBox type="email" ID="email" class="details" runat="server" required="required"
                        placeholder="Email Address"></asp:TextBox>
                </div>
                <!--end of class-->
            </div>
            <div class="row">
                <div class="label">
                    Telephone</div>
            </div>
            <div class="row">
                <!--endlabel-->
                <div class="input">
                    <asp:TextBox type="text" ID="tel" class="details" runat="server" required="required"
                        placeholder="Telephone Number"></asp:TextBox>
                </div>
                <!--end of class-->
            </div>
            <!--end row-->
            <div class="row">
                <div class="label">
                    Query</div>
            </div>
            <!--endlabel-->
            <div class="row">
                <div class="input">
                    <asp:TextBox runat="server" ID="query" class="mess" TextMode="MultiLine" required="required"
                        placeholder="Whats your query?"></asp:TextBox>
                </div>
            </div>
            <!--end of class-->
            <asp:RequiredFieldValidator class="servervalidator" ForeColor="Red" Display="Dynamic"
                ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" ErrorMessage="Please Enter Your Name"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator class="servervalidator" ID="RequiredFieldValidator2"
                runat="server" ControlToValidate="email" ErrorMessage="Please Enter a Valid Email Address"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator class="servervalidator" ID="RequiredFieldValidator3"
                runat="server" ControlToValidate="query" ErrorMessage="Please Enter Your Query"></asp:RequiredFieldValidator>
            <asp:Panel ID="pnlConfirmation" Visible="false" runat="server">
                <p>
                    Thank you For Enquiry</p>
            </asp:Panel>
            <asp:Panel ID="pnlFailed" Visible="false" runat="server">
                <p>
                    Sorry message was not sent!</p>
            </asp:Panel>
            <asp:Button ID="submit" class="button-link" runat="server" Height="36px" Width="65px"
                Text="Submit" OnClick="submit_Click" />
        </div>
    </div>
</asp:Content>
