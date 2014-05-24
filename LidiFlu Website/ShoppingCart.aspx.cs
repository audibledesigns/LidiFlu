using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShoppingCart : System.Web.UI.Page
{
    double subTotal = 0;
    double total = 0;
    double shipping = 00;

    protected void Page_Load(object sender, EventArgs e)
    {
        Customer aCustomer = (Customer)Session["Customer"];
        //if its not a post back display orderlines
        if (!IsPostBack)
        {
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
        }
        //display totals
        subTotal = CartFunctions.getSubTotal(aCustomer);
        shipping = Convert.ToDouble(drpPostage.SelectedValue);
        cellSub.Text = "£" + Convert.ToString(subTotal);
        total = subTotal + shipping;
        cellTotal.Text = "£" + total;
    }

    //check to see if customer has increased  order numher
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "AddItem")
        {
            // Retrieve the row index stored in the 
            // CommandArgument property.
            int index = Convert.ToInt32(e.CommandArgument);

            // Retrieve the row that contains the button 
            // from the Rows collection.
            GridViewRow row = GridView1.Rows[index];

            // Add code here to add the item to the shopping cart
            Customer aCustomer = (Customer)Session["Customer"];
            aCustomer.Orders[0].OrderLines[index].Quantity += 1;
            //display orderlines
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

            subTotal = CartFunctions.getSubTotal(aCustomer);
            cellSub.Text = "£" + Convert.ToString(subTotal);
            total = subTotal + shipping;
            cellTotal.Text = "£" + total;

            GridView1.DataSource = query;
            GridView1.DataBind();
            Session["Customer"] = aCustomer;

            Label lblCost = (Label)this.Master.FindControl("lblCost");
            lblCost.Text = CartFunctions.getSubTotal(aCustomer).ToString("C");

            Label lblItem = (Label)this.Master.FindControl("lblItems");
            lblItem.Text = CartFunctions.getNumItem(aCustomer).ToString() + " items";
        }
        
        //check to see if customer has decreased order numher
        if (e.CommandName == "RemoveItem")
        {
            // Retrieve the row index stored in the 
            // CommandArgument property.
            int index = Convert.ToInt32(e.CommandArgument);

            // Retrieve the row that contains the button 
            // from the Rows collection.
            GridViewRow row = GridView1.Rows[index];
            Customer aCustomer = (Customer)Session["Customer"];
            aCustomer.Orders[0].OrderLines[index].Quantity -= 1;
            //display orderlines
            if (aCustomer.Orders[0].OrderLines[index].Quantity == 0)
            {
                aCustomer = CartFunctions.removeItem(aCustomer, index);
                if (aCustomer.Orders[0].OrderLines.Count == 0)
                {
                    HyperLink continueShop = new HyperLink();
                    continueShop.NavigateUrl = "Shop.aspx";
                    continueShop.Text = "Back to the Shop";
                    cartcontainer.InnerHtml = "You have nothing in your cart" + " ";
                    cartcontainer.Controls.Add(continueShop);
                }

            }

            //display orderlines
            var query = from goods in aCustomer.Orders[0].OrderLines
                        select new
                        {
                            Name = goods.Product.ProdName,
                            Description = goods.Product.ProdDescription,
                            Price = "£" + goods.Product.ProdPrice,
                            Qty = goods.Quantity,
                            Total = "£" + Convert.ToString(goods.Quantity * goods.Product.ProdPrice),
                            ProdImage = goods.Product.ProdImage
                        };

            subTotal = CartFunctions.getSubTotal(aCustomer);
            cellSub.Text = "£" + Convert.ToString(subTotal);
            total = subTotal + shipping;
            cellTotal.Text = "£" + total;

            GridView1.DataSource = query;
            GridView1.DataBind();
            Session["Customer"] = aCustomer;

            Label lblCost = (Label)this.Master.FindControl("lblCost");
            lblCost.Text = CartFunctions.getSubTotal(aCustomer).ToString("C");

            Label lblItem = (Label)this.Master.FindControl("lblItems");
            lblItem.Text = CartFunctions.getNumItem(aCustomer).ToString() + " items";
        }

    }

    //if row is deleted remove orderline
    protected void GridView1_RowDeleting(Object sender, GridViewDeleteEventArgs e)
    {
        Customer aCustomer = (Customer)Session["Customer"];
        int index = e.RowIndex;

        aCustomer = CartFunctions.removeItem(aCustomer, index);

        if (aCustomer.Orders[0].OrderLines.Count == 0)
        {

            HyperLink continueShop = new HyperLink();
            continueShop.NavigateUrl = "Shop.aspx";
            continueShop.Text = "Back to the Shop";
            cartcontainer.InnerHtml = "You have nothing in your cart" + " ";
            cartcontainer.Controls.Add(continueShop);

        }

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
        subTotal = CartFunctions.getSubTotal(aCustomer);
        cellSub.Text = "£" + Convert.ToString(subTotal);

        GridView1.DataSource = query;
        GridView1.DataBind();
        Session["Customer"] = aCustomer;

        Label lblCost = (Label)this.Master.FindControl("lblCost");
        lblCost.Text = CartFunctions.getSubTotal(aCustomer).ToString("C");

        Label lblItem = (Label)this.Master.FindControl("lblItems");
        lblItem.Text = CartFunctions.getNumItem(aCustomer).ToString() + " items";

    }

    //if change postage and packaging cost on change of drop down
    protected void drpPostage_SelectedIndexChanged(object sender, EventArgs e)
    {
        total = subTotal + Convert.ToDouble(drpPostage.SelectedValue);
        cellTotal.Text = "£" + Convert.ToString(total);
    }

    //calls paypal API 
    protected void btnConfirm_Click(object sender, EventArgs e)
    {

        Customer aCustomer = (Customer)Session["Customer"];

        NVPAPICaller payPalCaller = new NVPAPICaller();
        string retMsg = "";
        string token = "";
        string amt = "";
        string shippingAmt = "";
        string subAmt = "";

        shippingAmt = shipping.ToString();
        subAmt = subTotal.ToString();
        amt = total.ToString();
        Session["payment_amt"] = total;

        bool ret = payPalCaller.ShortcutExpressCheckout(subAmt, shippingAmt, amt, ref token, ref retMsg, aCustomer);
        if (ret)
        {
            Session["token"] = token;
            Response.Redirect(retMsg);
        }
        else
        {
            Response.Redirect("CheckoutError.aspx?" + retMsg);
        }
    }
}