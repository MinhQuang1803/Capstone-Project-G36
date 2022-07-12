namespace banhangma_be.Models.Order
{
    public class OrderDetailItem
    {
        public int? OrderId { get; set; }
        public int? ProductId { get; set; }
        public string Name { get; set; }
        public string Images { get; set; }
        public int Quantity { get; set; }
        public int Price { get; set; }
        public int TotalNote { get; set; }
        public int Total { get; set; }
        public string ColorName { get; set; }
        public string SizeName { get; set; }
    }
}
