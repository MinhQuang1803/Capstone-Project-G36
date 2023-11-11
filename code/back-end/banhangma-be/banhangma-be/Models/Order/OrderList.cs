using System.Collections.Generic;

namespace banhangma_be.Models.Order
{
    public class OrderList
    {
        public int Id { get; set; }
        public int? Userid { get; set; }
        public int TotalMoney { get; set; }
        public int? Companyid { get; set; }
        public int Status { get; set; }
        public string Companyname { get; set; }
        public int? NoteMoney { get; set; }

        public List<OrderDetailItem> OrderDetailItem { get; set; }
    }
}
