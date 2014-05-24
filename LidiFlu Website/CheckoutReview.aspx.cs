using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckoutReview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        double subTotal = 0;
        double total = 0;
        double shipping = 00;

        if (!IsPostBack)
        {
            NVPAPICaller payPalCaller = new NVPAPICaller();

            string retMsg = "";
            string token = "";
            string PayerID = "";
            string foreName = "";
            string surName = "";
            string email = "";
            string address = "";
            string postcode = "";
            string town = "";

            NVPCodec decoder = new NVPCodec();
            token = Session["token"].ToString();

            bool ret = payPalCaller.GetCheckoutDetails(token, ref PayerID, ref decoder, ref retMsg);
            if (ret)
            {

                //get user information from papal
                Session["payerId"] = PayerID;

                foreName = decoder["FIRSTNAME"].ToString();
                surName = decoder["LASTNAME"].ToString();
                address = decoder["SHIPTOSTREET"].ToString();
                town = decoder["SHIPTOCITY"].ToString();
                postcode = decoder["SHIPTOZIP"].ToString();
                email = decoder["EMAIL"].ToString();

                //display user information
                lblFore.Text = foreName;
                lblSur.Text = surName;
                lblCity.Text = town;
                lblEmail.Text = email;
                lblPostCode.Text = postcode;
                lblAddress.Text = address;


                //set customer object with information from paypal
                Customer aCustomer = (Customer)Session["Customer"];
                aCustomer.CityAddress = town;
                aCustomer.Email = email;
                aCustomer.FName = foreName;
                aCustomer.SName = surName;
                aCustomer.StreetAddress = address;
                aCustomer.PostCode = postcode;


                // Verify total payment amount as set on CheckoutStart.aspx.
                try
                {
                    decimal paymentAmountOnCheckout = Convert.ToDecimal(Session["payment_amt"].ToString());
                    decimal paymentAmoutFromPayPal = Convert.ToDecimal(decoder["AMT"].ToString());
                    shipping = Convert.ToDouble(decoder["SHIPPINGAMT"].ToString());
                    if (paymentAmountOnCheckout != paymentAmoutFromPayPal)
                    {
                        Response.Redirect("CheckoutError.aspx?" + "Desc=Amount%20total%20mismatch.");
                    }
                }
                catch (Exception)
                {
                    Response.Redirect("CheckoutError.aspx?" + "Desc=Amount%20total%20mismatch.");
                }

                // Display Order information.                   

                var query = from goods in aCustomer.Orders[0].OrderLines
                            select new
                            {
                                Name = goods.Product.ProdName,
                                Description = goods.Product.ProdDescription,
                                Price = goods.Product.ProdPrice,
                                Qty = goods.Quantity,
                                Total = "£" + Convert.ToString(goods.Quantity * goods.Product.ProdPrice),
                                ProdImage = goods.Product.ProdImage
                            };


                GridView1.DataSource = query;
                GridView1.DataBind();

                subTotal = CartFunctions.getSubTotal(aCustomer);

                cellSub.Text = "£" + Convert.ToString(subTotal);
                total = subTotal + shipping;
                cellTotal.Text = "£" + total;
                cellShipping.Text = shipping.ToString();


            }
            else
            {
                Response.Redirect("CheckoutError.aspx?" + retMsg);
            }
        }
    }

    protected void btnConfrim_Click(object sender, EventArgs e)
    {
        Session["userCheckoutCompleted"] = "true";
        Response.Redirect("~/CheckoutComplete.aspx");
    }

}