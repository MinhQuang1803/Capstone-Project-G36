namespace banhangma_be.Models.User
{
    public class UserLogin
    {
        public int Id { get; set; }
        public string Fullname { get; set; }
        public int UserType { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }
        public string token { get; set; }
    }
}
