using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class Carts
    {
        public Carts()
        {
            CartNote = new HashSet<CartNote>();
        }

        public int Id { get; set; }
        public int? Userid { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public int? ProductId { get; set; }
        public int? PriceId { get; set; }
        public int Quantity { get; set; }

        public virtual ProductPrice Price { get; set; }
        public virtual Products Product { get; set; }
        public virtual Users User { get; set; }
        public virtual ICollection<CartNote> CartNote { get; set; }
    }
}
