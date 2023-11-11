using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class Products
    {
        public Products()
        {
            Carts = new HashSet<Carts>();
            OrderDetail = new HashSet<OrderDetail>();
            ProductPrice = new HashSet<ProductPrice>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public string Detail { get; set; }
        public int? CategoryId { get; set; }
        public decimal Height { get; set; }
        public decimal Long { get; set; }
        public decimal Width { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public string Images { get; set; }
        public decimal Capacity { get; set; }
        public int? Companyid { get; set; }

        public virtual ProductCategory Category { get; set; }
        public virtual ICollection<Carts> Carts { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        public virtual ICollection<ProductPrice> ProductPrice { get; set; }
    }
}
