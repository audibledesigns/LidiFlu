using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void SendMail()
    {
        // Gmail Address from where you send the mail
        var fromAddress = email.Text.ToString();
        // any address where the email will be sending
        var toAddress = "niall.ferguson@gmail.com";
        //Password of your gmail address
        const string fromPassword = "kissme9";
        // Passing the values and make a email formate to display
        string subject = "Lidiflu Enquiry";
        string body = "From: " + name.Text + "\n";
        body += "Email: " + email.Text + "\n";
        body += "Telephone: " + tel.Text + "\n";
        body += "Query: " + query.Text + "\n";

        // smtp settings
        var smtp = new System.Net.Mail.SmtpClient();
        {
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;
            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
            smtp.Credentials = new NetworkCredential(toAddress, fromPassword);
            smtp.Timeout = 20000;
        }
        // Passing values to smtp object
        smtp.Send(fromAddress, toAddress, subject, body);
    }

    protected void clearForm()
    {
        email.Text = "";
        name.Text = "";
        tel.Text = "";
        query.Text = "";
    }

    protected void submit_Click(object sender, EventArgs e)
    {



        try
        {
            //here on button click what will done 
            SendMail();
            clearForm();
            pnlConfirmation.Visible = true;

        }
        catch (Exception)
        {
            pnlFailed.Visible = true;
        }
    }

}