using System.Collections.Generic;

namespace banhangma_be.Models.Cart
{
    public class ListCartView
    {
        public decimal Ship { get; set; }
        public int countProduct { get; set; }
        public int total { get; set; }

        public List<CartView> CartView { get; set; }
    }
}
