using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class OrderDetail
    {
        public OrderDetail()
        {
            OrderDetailComment = new HashSet<OrderDetailComment>();
            OrderDetailNote = new HashSet<OrderDetailNote>();
        }

        public int Id { get; set; }
        public int? OrderId { get; set; }
        public int? ProductId { get; set; }
        public int? PriceId { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public int TotalNote { get; set; }
        public int Total { get; set; }
        public bool IsDeleted { get; set; }

        public virtual Orders Order { get; set; }
        public virtual Products Product { get; set; }
        public virtual ICollection<OrderDetailComment> OrderDetailComment { get; set; }
        public virtual ICollection<OrderDetailNote> OrderDetailNote { get; set; }
    }
}
