using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class CartNote
    {
        public int Id { get; set; }
        public int? CartId { get; set; }
        public string Note { get; set; }
        public int PriceNote { get; set; }
        public bool IsDeleted { get; set; }

        public virtual Carts Cart { get; set; }
    }
}
