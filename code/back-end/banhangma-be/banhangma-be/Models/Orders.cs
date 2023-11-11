using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class Orders
    {
        public Orders()
        {
            OrderDetail = new HashSet<OrderDetail>();
            OrderHistory = new HashSet<OrderHistory>();
        }

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
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public int Status { get; set; }
        public string ProvinceId { get; set; }
        public string DistrictId { get; set; }
        public string WardId { get; set; }
        public int? Companyid { get; set; }
        public int? NoteMoney { get; set; }

        public virtual Users User { get; set; }
        public virtual ICollection<OrderDetail> OrderDetail { get; set; }
        public virtual ICollection<OrderHistory> OrderHistory { get; set; }
    }
}
