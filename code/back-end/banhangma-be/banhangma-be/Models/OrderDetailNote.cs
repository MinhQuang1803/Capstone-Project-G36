using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class OrderDetailNote
    {
        public int Id { get; set; }
        public int? OrderDetailId { get; set; }
        public string Note { get; set; }
        public int Price { get; set; }
        public bool IsDeleted { get; set; }

        public virtual OrderDetail OrderDetail { get; set; }
    }
}
