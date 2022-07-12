namespace banhangma_be.Models.Order
{
    public class OrderAdd
    {
        public int? Userid { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string ReceiverName { get; set; }
        public string ProvinceId { get; set; }
        public string DistrictId { get; set; }
        public string WardId { get; set; }
    }
}
