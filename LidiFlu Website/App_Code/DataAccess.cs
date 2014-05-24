using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Dataaccess of shop
/// </summary>
public class DataAccess
{

    //create new datacontext
    protected ShopDataContext shopDC;
    public DataAccess()
    {
        shopDC = new ShopDataContext();

    }
    //gets products list from database
    public List<Product> getProducts()
    {
        var productsList = from p in shopDC.Products
                           select p;

        return productsList.ToList<Product>();

    }
    //adds customer to database
    public void addCustomer(Customer custIn)
    {
        shopDC.InsertCustomer(custIn.CUSTID, custIn.FName, custIn.SName, custIn.StreetAddress, custIn.CityAddress, custIn.PostCode, custIn.Email);
    }
    //adds order to database
    public void addOrder(Customer custIn)
    {
        shopDC.InsertOrder(custIn.Orders[0].OrderID, custIn.CUSTID, custIn.Orders[0].OrderDate);
    }
    //adds orderline to database
    public void addOrderline(Customer custIn)
    {
        for (int i = 0; i < custIn.Orders[0].OrderLines.Count; i++)
        {
            shopDC.InsertOrderLine(custIn.Orders[0].OrderLines[i].ProdID, custIn.Orders[0].OrderLines[i].OrderID, custIn.Orders[0].OrderLines[i].Quantity);

        }
    }

}
