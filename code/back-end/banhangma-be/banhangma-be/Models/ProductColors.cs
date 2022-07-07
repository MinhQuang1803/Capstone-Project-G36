using System;
using System.Collections.Generic;

namespace banhangma_be.Models
{
    public partial class ProductColors
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public int? ColorId { get; set; }
        public bool IsDeleted { get; set; }
    }
}
