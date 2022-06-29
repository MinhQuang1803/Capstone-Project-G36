namespace banhangma_be.Models.User
{
    public class UserAdd
    {
        public int Id { get; set; }
        public string Password { get; set; }
        public string Fullname { get; set; }
        public int? WardId { get; set; }
        public int? DistrictId { get; set; }
        public int? ProvinceId { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
    }
}
