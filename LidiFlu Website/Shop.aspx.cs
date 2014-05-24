using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class Shop : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        List<Product> p = (List<Product>)Session["Products"];

        //for every product in product list create html controls for them to be displayed
        foreach (Product product in p)
        {
            Image img = new Image();
            HyperLink link = new HyperLink();
            HtmlGenericControl a = new HtmlGenericControl("a");
            HtmlGenericControl h3 = new HtmlGenericControl("h3");
            HtmlGenericControl para = new HtmlGenericControl("p");
            HtmlGenericControl newLi = new HtmlGenericControl("li");

            string prodID = Convert.ToString(product.ProdID);

            img.ImageUrl = product.ProdImage;
            img.ID = prodID;

            para.InnerHtml = "£" + Convert.ToString(product.ProdPrice);

            h3.InnerHtml = product.ProdName;

            link.NavigateUrl = "Products.aspx?id=" + prodID;
            link.Controls.Add(img);
            link.Controls.Add(h3);
            link.Controls.Add(para);

            newLi.Controls.Add(link);
            //depending on product id, display product control in category sections
            if (product.ProdID <= 8)
            {
                shopcat1.Controls.Add(newLi);
            }
            else if (product.ProdID > 8 && product.ProdID <= 16)
            {
                shopcat2.Controls.Add(newLi);
            }
            else if (product.ProdID > 16 && product.ProdID <= 24)
            {
                shopcat3.Controls.Add(newLi);
            }
            else if (product.ProdID > 24 && product.ProdID <= 32)
            {
                shopcat4.Controls.Add(newLi);
            }
            else if (product.ProdID > 30)
            {
                shopcat5.Controls.Add(newLi);
            }
        }//end foreach
    }//end page load event
}//end class