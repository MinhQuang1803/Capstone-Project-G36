using System.Collections.Generic;

namespace banhangma_be.Models.Order
{
    public class OrderGetDetail
    {
        public int Id { get; set; }
        public int? Userid { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string ReceiverName { get; set; }
        public int ProductMoney { get; set; }
        public decimal Discount { get; set; }
        public int DiscountMoney { get; set; }
        public int Ship { get; set; }
        public decimal Volume { get; set; }
        public int TotalMoney { get; set; }
        public int Status { get; set; }
        public string ProvinceId { get; set; }
        public string DistrictId { get; set; }
        public string WardId { get; set; }
        public int? Companyid { get; set; }
        public string CompanyName { get; set; }
        public int? NoteMoney { get; set; }
        public List<OrderDetailItem> OrderDetailItem { get; set; }
        public List<OrderDetailHistory> OrderDetailHistory { get; set; }

    }
}
