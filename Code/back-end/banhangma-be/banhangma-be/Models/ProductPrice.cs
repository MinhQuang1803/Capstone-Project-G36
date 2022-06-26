using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class ProductPrice
    {
        public ProductPrice()
        {
            Carts = new HashSet<Carts>();
        }

        public int Id { get; set; }
        public int? ProductId { get; set; }
        public int? SizeId { get; set; }
        public int Price { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }

        public virtual Products Product { get; set; }
        public virtual ProductSize Size { get; set; }
        public virtual ICollection<Carts> Carts { get; set; }
    }
}
