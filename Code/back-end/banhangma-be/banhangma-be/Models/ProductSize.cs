using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class ProductSize
    {
        public ProductSize()
        {
            ProductPrice = new HashSet<ProductPrice>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual ICollection<ProductPrice> ProductPrice { get; set; }
    }
}
