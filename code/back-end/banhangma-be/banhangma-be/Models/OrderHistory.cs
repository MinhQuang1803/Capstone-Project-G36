using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class OrderHistory
    {
        public int? Orderid { get; set; }
        public int Status { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public string Note { get; set; }
        public int Id { get; set; }

        public virtual Orders Order { get; set; }
    }
}
