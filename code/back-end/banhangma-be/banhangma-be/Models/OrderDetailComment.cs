using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class OrderDetailComment
    {
        public int Id { get; set; }
        public int? OrderDetailId { get; set; }
        public string Images { get; set; }
        public string Note { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public bool IsDeleted { get; set; }

        public virtual OrderDetail OrderDetail { get; set; }
    }
}
