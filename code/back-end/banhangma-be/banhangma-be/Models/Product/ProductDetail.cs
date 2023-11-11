using System;
using System.Collections.Generic;

namespace banhangma_be.Models.Product
{
    public class ProductDetail
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Detail { get; set; }
        public int? CategoryId { get; set; }
        public string CategoryName { get; set; }
        public decimal Height { get; set; }
        public decimal Long { get; set; }
        public decimal Width { get; set; }
        public string Images { get; set; }
        public int? Companyid { get; set; }
        public List<ProductPriceDetail> ProductPrice { get; set; }
        public List<ProductList> ProductsSameType { get; set; }
        public List<ProductColorItem> ProductColor { get; set; }

    }
}
