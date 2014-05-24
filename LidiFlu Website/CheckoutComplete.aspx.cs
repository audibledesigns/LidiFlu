﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckoutComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // Verify user has completed the checkout process.
            if (Session["userCheckoutCompleted"] != "true")
            {
                Session["userCheckoutCompleted"] = "";
                Response.Redirect("CheckoutError.aspx?" + "Desc=Unvalidated%20Checkout.");
            }

            NVPAPICaller payPalCaller = new NVPAPICaller();

            string retMsg = "";
            string token = "";
            string finalPaymentAmount = "";
            string PayerID = "";
            NVPCodec decoder = new NVPCodec();

            token = Session["token"].ToString();
            PayerID = Session["payerId"].ToString();
            finalPaymentAmount = Session["payment_amt"].ToString();

            bool ret = payPalCaller.DoCheckoutPayment(finalPaymentAmount, token, PayerID, ref decoder, ref retMsg);
            if (ret)
            {
                // Retrieve PayPal confirmation value.
                string PaymentConfirmation = decoder["PAYMENTINFO_0_TRANSACTIONID"].ToString();
                TransactionId.Text = PaymentConfirmation;

                // Get dataaccess context.
                DataAccess da = new DataAccess();
                Customer aCustomer = (Customer)Session["Customer"];
                aCustomer.Orders[0].OrderID = PaymentConfirmation;
                aCustomer = CartFunctions.setOrderId(aCustomer, PaymentConfirmation);
                // Add order to DB.

                da.addCustomer(aCustomer);
                da.addOrder(aCustomer);
                da.addOrderline(aCustomer);

                // Clear Order

                aCustomer = CartFunctions.clearOrder(aCustomer);


            }
            else
            {
                Response.Redirect("CheckoutError.aspx?" + retMsg);
            }
        }
    }

    protected void Continue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}