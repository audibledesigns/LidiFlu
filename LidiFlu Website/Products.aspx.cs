using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //get id from query string if not empty
        if (Request.QueryString["id"] != null)
        {
            int id = Convert.ToInt16(Request.QueryString["id"]);
            List<Product> p = (List<Product>)Session["Products"];
        
            foreach (Product product in p)
            {
                //if the product in product list matches id display product information
                if (product.ProdID == id)
                {

                    lblPrice.Text = "£" + Convert.ToString(product.ProdPrice);
                    lblProdTitle.Text = product.ProdName;
                    imgProdImage.ImageUrl = product.ProdImage;
                    lblSubHeading.Text = product.ProdDescription;
                    lblDescription.Text = product.ProdDescriptionFull;

                    lblCategory.Text = CartFunctions.getCategory(product.ProdID);

                }
            }
        }
    }

    protected void addtoCart_Click(object sender, EventArgs e)
    {
        //add certain number of selected product to cart
        List<Product> p = (List<Product>)Session["Products"];
        Customer aCustomer = (Customer)Session["Customer"];

        int qty = Convert.ToInt16(txtQuantity.Text);
        int prodId = Convert.ToInt16(Request.QueryString["id"]);
        aCustomer = CartFunctions.addItemtoCart(p, aCustomer, prodId, qty);

        lblQty.Text = txtQuantity.Text + " ";
        lblProduct.Text = "x " + lblProdTitle.Text + " added to your cart";
        Session["Customer"] = aCustomer;

        //displays products bought with 
        ClientScript.RegisterStartupScript(GetType(), "hwa", "confirmOrder();", true);

        Label lblCost = (Label)this.Master.FindControl("lblCost");
        lblCost.Text = CartFunctions.getSubTotal(aCustomer).ToString("C");

        Label lblItem = (Label)this.Master.FindControl("lblItems");
        lblItem.Text = CartFunctions.getNumItem(aCustomer).ToString() + " items";
    }
}