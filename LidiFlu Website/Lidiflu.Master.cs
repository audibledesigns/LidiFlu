using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lidiflu : System.Web.UI.MasterPage
{
    public String SharedInfo
    {
        get { return (String)Session["SharedInfo"]; }
        set { Session["SharedInfo"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        int noItems = 0;
        double dbCostost = 0.00;

        

        Customer aCustomer = (Customer)Session["Customer"];
        //check if there are orderlines to begin with
        if (aCustomer.Orders[0].OrderLines.Count <= 0)
        {
            //set to default values
            lblItems.Text = noItems.ToString();
            lblCost.Text = dbCostost.ToString("C");
        }
        else
        {
            //get number of items and total and set labels to them
            noItems = CartFunctions.getNumItem(aCustomer);
            dbCostost = CartFunctions.getSubTotal(aCustomer);

        }//end if else
        lblCost.Text = dbCostost.ToString("C");
        lblItems.Text = noItems.ToString() + " items";


    }//end event

}
