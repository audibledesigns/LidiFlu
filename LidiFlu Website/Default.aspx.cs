using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Web.Security;
using System.Xml;

public partial class _Default : System.Web.UI.Page
{
    protected DataAccess da;

    protected void Page_Load(object sender, EventArgs e)
    {
     
        ClientScript.RegisterStartupScript(GetType(), "hwa", "getTweets();", true);
        //create customer if customer does not exist in session
        try
        {
            if (HttpContext.Current.Session["Customer"] == null)
            {
                Customer aCustomer;
                aCustomer = CartFunctions.createCustomer();
                Session["Customer"] = aCustomer;
            }//end if
        }//end try
        catch (Exception)
        {
        }//end catch

        try
        {
            //check to see if user is logged on, if so assigns user id to CUSTID in customer object
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                string custID;
                Customer aCustomer = (Customer)Session["Customer"];

                MembershipUser user = Membership.GetUser();
                custID = user.ProviderUserKey.ToString();
                aCustomer.CUSTID = custID;
            }//end if
        }//end try
        catch (Exception)
        {
        }//end catch

        try
        {
            //getWeather();
        }//end try
        catch (Exception)
        {

        }//end catch

        try
        {
            //if its a new session get products list from database and add it so session variable
            if (Session.IsNewSession)
            {
                ShopDataContext dc = new ShopDataContext();
                
                da = new DataAccess();
                List<Product> p = da.getProducts();
                Session["Products"] = p;

            }//endif
        }//end try
        catch (Exception)
        {

        }//end catch

        getLatestProducts();
    }


    //gets the first 8 products in the products list and displays them on the latest products section
    public void getLatestProducts()
    {
        List<Product> p = (List<Product>)Session["Products"];

        try
        {
            for (int i = 0; i < 8; i++)
            {
                Product product = p[i];
                Image img = new Image();
                HyperLink link = new HyperLink();
                HtmlGenericControl a = new HtmlGenericControl("a");
                HtmlGenericControl newLi = new HtmlGenericControl("li");

                string prodID = Convert.ToString(product.ProdID);

                img.ImageUrl = product.ProdImage;
                img.ID = prodID;

                link.NavigateUrl = "Product.aspx?id=" + prodID;
                link.Controls.Add(img);

                newLi.Controls.Add(link);

                latestProducts.Controls.Add(newLi);
            }
        }
        catch (Exception)
        {

        }

    }

    //gets the weather from yahoo and parses it for wind speed. if wind speed is greater than ten will display message to get engineering
    public void getWeather()
    {
        XmlDocument myXmlDocument = new XmlDocument();
        myXmlDocument.Load("http://weather.yahooapis.com/forecastrss?w=21125");

        XmlNamespaceManager ns = new XmlNamespaceManager(myXmlDocument.NameTable);
        ns.AddNamespace("yweather", "http://xml.weather.yahoo.com/ns/rss/1.0");

        XmlNode node = myXmlDocument.SelectSingleNode("/rss/channel/yweather:wind", ns);


        string windSpeed = node.Attributes.GetNamedItem("speed").Value;
        int windSpeedInt = Convert.ToInt16(windSpeed);


        if (windSpeedInt > 10)
        {
            lblWindSpeed.Text = windSpeed;
            pnlWeather.Visible = true;
        }


    }//end getWeather



}