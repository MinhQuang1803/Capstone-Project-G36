namespace banhangma_be.Models.Cart
{
    public class CartAdd
    {
        public int? Userid { get; set; }
        public int? ProductId { get; set; }
        public int? SizeId { get; set; }
        public int Quantity { get; set; }
        public int? Colorid { get; set; }
        public bool isAdd { get; set; }
        public int? Companyid { get; set; }
    }
}
