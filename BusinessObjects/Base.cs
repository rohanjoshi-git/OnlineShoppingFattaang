using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessObjects
{
    public class Base
    {
    }

    public class ShoppingCart
    {
        public int CategoryID;
        public string CategoryName;

        public int ProductId;
        public string ProductName;
        public string ProductImage;
        public string ProductPrice;
        public string ProductDescription;

        public int CustomerId;
        public string CustomerName;
        public string CustomerEmailId;
        public string CustomerAddress;
        public string CustomerPhoneNo;

        public string ProductList;
        public string PaymentMethod;

        public int TotalProducts;
        public int TotalPrice;
        public int StockType;
        public int Flag;

        public string OrderStatus;
        public string OrderPrice;
    }
}
