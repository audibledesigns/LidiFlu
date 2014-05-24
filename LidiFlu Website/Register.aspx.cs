using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }

    protected void ContinueButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }

    protected void Login1_OnLoggedIn(object sender, EventArgs e)
    {
        //check to see if the user logging on is in admin role, if so redirects to admin page
        if (Roles.IsUserInRole(Login1.UserName, "admin"))
        {
            Response.Redirect("~/Admin/Admin.aspx");
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}