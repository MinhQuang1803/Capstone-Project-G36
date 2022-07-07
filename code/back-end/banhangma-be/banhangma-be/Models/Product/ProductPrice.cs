namespace banhangma_be.Models.Product
{
    public class ProductPriceDetail
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public int? SizeId { get; set; }
        public string SizeName { get; set; }
        public int Price { get; set; }
    }
}
