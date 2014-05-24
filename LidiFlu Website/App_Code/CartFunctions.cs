using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Function relating to cart
/// </summary>
public class CartFunctions
{
    //get the subtotal of customers order
    public static double getSubTotal(Customer custIn)
    {
        double subtotal = 00;

        foreach (var item in custIn.Orders[0].OrderLines)
        {

            subtotal += Convert.ToDouble(item.Product.ProdPrice * item.Quantity);

        }//end foreach

        return subtotal;
    }
    //get the number of items of customers order
    public static int getNumItem(Customer custIn)
    {
        int noItems = 0;
        foreach (var item in custIn.Orders[0].OrderLines)
        {
            noItems += Convert.ToInt32(item.Quantity);
        }//end foreach
        return noItems;
    }

    //adds products to customers
    public static Customer addItemtoCart(List<Product> prodIn, Customer custIn, int prodId, int qtyIn)
    {
        try
        {

            foreach (Product item in prodIn)
            {
                if (item.ProdID == prodId)
                {

                    bool alreadyOrdered = false;
                    int foundWhere = 0;
                    for (int i = 0; i < custIn.Orders[0].OrderLines.Count; i++)
                    {


                        if (custIn.Orders[0].OrderLines[i].ProdID == Convert.ToInt16(prodId))
                        {
                            foundWhere = i;
                            alreadyOrdered = true;
                        }//end if
                    }//end for

                    if (alreadyOrdered == true)//update the QTY
                    {
                        custIn.Orders[0].OrderLines[foundWhere].Quantity += qtyIn;
                    }
                    else
                    {
                        OrderLine orderLine = new OrderLine();
                        orderLine.Product = item;
                        orderLine.Quantity = qtyIn;
                        custIn.Orders[0].OrderLines.Add(orderLine);
                    }
                }
            }

        }
        catch (Exception)
        {
        }
        return custIn;
    }
    //removes product from customer
    public static Customer removeItem(Customer custIn, int indexIn)
    {

        try
        {
            custIn.Orders[0].OrderLines.Remove(custIn.Orders[0].OrderLines[indexIn]);

        }
        catch (Exception)
        {

        }
        return custIn;
    }
    // get the cateogry of the product
    public static string getCategory(int prodIdIn)
    {
        string category = "";

        if (prodIdIn <= 8)
        {
            category = "Generator";
        }
        else if (prodIdIn > 8 && prodIdIn <= 16)
        {
            category = "Gearing";
        }
        else if (prodIdIn > 16 && prodIdIn <= 24)
        {
            category = "Turbine";
        }
        else if (prodIdIn > 24 && prodIdIn <= 32)
        {
            category = "Rotor";
        }

        return category;
    }
    //sets the order id after purchase
    public static Customer setOrderId(Customer custIn, string orderIdIn)
    {
        for (int i = 0; i < custIn.Orders[0].OrderLines.Count; i++)
        {

            custIn.Orders[0].OrderLines[i].OrderID = orderIdIn;

        }//end
        return custIn;
    }
    //clears orders
    public static Customer clearOrder(Customer custIn)
    {
        Order removeOrder = custIn.Orders[0];
        custIn.Orders.Remove(removeOrder);

        Order anOrder = new Order();

        custIn.Orders.Add(anOrder);

        return custIn;
    }
    //creates new customer
    public static Customer createCustomer()
    {
        Customer aCustomer = new Customer();

        //if (HttpContext.Current.Session["UserEmail"] != null)
        //{
        //    //contact db, get user information
        //}

        aCustomer.CUSTID = "01";
        Order anOrder = new Order();
        DateTime orderDate = new DateTime();
        orderDate = DateTime.Now;

        anOrder.OrderDate = orderDate;

        aCustomer.Orders.Add(anOrder);

        return aCustomer;
    }
    //creates new order
    public static Order createOrder()
    {
        Order anOrder = new Order();
        DateTime orderDate = new DateTime();
        orderDate = DateTime.Now;
        anOrder.OrderDate = orderDate;
        return anOrder;
    }


}//end class
