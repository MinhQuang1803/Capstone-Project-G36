namespace banhangma_be.Models.User
{
    public class UserGetId
    {
        public int Id { get; set; }
        public string Fullname { get; set; }
        public string WardId { get; set; }
        public string DistrictId { get; set; }
        public string ProvinceId { get; set; }
        public string Address { get; set; }
        public int UserType { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
    }
}
