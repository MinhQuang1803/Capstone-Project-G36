using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class Trucks
    {
        public int Id { get; set; }
        public int? Userid { get; set; }
        public string LicensePlate { get; set; }
        public decimal? Capacity { get; set; }
        public bool IsDeleted { get; set; }
        public DateTime CreatedDate { get; set; }
        public int? CreatedBy { get; set; }
        public DateTime? UpdatedDate { get; set; }
        public int? UpdatedBy { get; set; }
        public int Status { get; set; }
        public int Price { get; set; }
    }
}
