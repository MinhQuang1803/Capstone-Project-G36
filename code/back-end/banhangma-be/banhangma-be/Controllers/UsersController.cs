using banhangma_be.Models;
using banhangma_be.Models.User;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Threading.Tasks;

namespace banhangma_be.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly BanHangMaContext _context;

        public UsersController(BanHangMaContext context)
        {
            _context = context;
        }

        [HttpGet("{id}")]
        [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
        [Route("getUserByToken/{id}")]
        public ActionResult<UserGetId> getUserByToken(int id)
       {
            try
            {
                var res = from a in _context.Users
                          where a.IsDeleted == false && a.Id == id
                          select new UserGetId()
                          {
                              Id = a.Id,
                              Fullname = a.Fullname,
                              WardId = a.WardId,
                              DistrictId = a.DistrictId,
                              ProvinceId = a.ProvinceId,
                              Address = a.Address,
                              UserType = a.UserType,
                              Mobile = a.Mobile,
                              Email = a.Email
                          }
                     ;
                return res.FirstOrDefault();
            }
            catch (Exception)
            {
                //TODO: Logger.Error
                return null;
            }
        }


        [HttpPost]
        [Route("UserAdd")]
        public async Task<int> UserAdd(UserAdd data)
        {
            var user = new Users();
            user.Fullname = data.Fullname;
            user.Password = data.Password;
            user.WardId = data.WardId;
            user.DistrictId = data.DistrictId;
            user.ProvinceId = data.ProvinceId;
            user.Address = data.Address;
            user.Mobile = data.Mobile;
            user.Email = data.Email;
            _context.Users.Add(user);
            _context.SaveChanges();
            return user.Id;
        }
    }
}
