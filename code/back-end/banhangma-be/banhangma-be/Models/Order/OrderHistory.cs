using System;

namespace banhangma_be.Models.Order
{
    public class OrderDetailHistory
    {
        public int? Orderid { get; set; }
        public int Status { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public string Note { get; set; }
        public int Id { get; set; }
    }
}
