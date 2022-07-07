namespace banhangma_be.Models.Product
{
    public class ProductColorItem
    {
        public int Id { get; set; }
        public int? ProductId { get; set; }
        public int? ColorId { get; set; }
        public string ColorName { get; set; }
    }
}
