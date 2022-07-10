namespace banhangma_be.Models.Cart
{
    public class CartView
    {
        public int Id { get; set; }
        public int? Userid { get; set; }
        public int? ProductId { get; set; }
        public int Quantity { get; set; }
        public int? Colorid { get; set; }
        public bool Ispay { get; set; }
        public int? SizeId { get; set; }
        public string NameSize { get; set; }
        public string NameColor { get; set; }
        public string NameProduct { get; set; }
        public string Images { get; set; }
        public int PriceProduct { get; set; }

        public int? Companyid { get; set; }
    }
}
