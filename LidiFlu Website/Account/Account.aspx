<%@ Page Title="" Language="C#" MasterPageFile="~/Lidiflu.Master" AutoEventWireup="true" CodeFile="Account.aspx.cs" Inherits="Account_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="title" class="container_12">
        <h1>
            Account</h1>
    </div>
    <div class="grid_5">
        <h2 class="registerh2">
            Change Password</h2>
        <div class="registerformwrap">     
            <asp:ChangePassword ID="ChangePassword1" runat="server">
            </asp:ChangePassword>           
        </div>
    </div>

</asp:Content>
