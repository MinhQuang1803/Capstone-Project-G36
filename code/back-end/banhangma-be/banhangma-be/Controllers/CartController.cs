using banhangma_be.Models;
using banhangma_be.Models.Cart;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace banhangma_be.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class CartController : ControllerBase
    {
        private readonly BanHangMaContext _context;

        public CartController(BanHangMaContext context)
        {
            _context = context;
        }

        [HttpGet("{id}")]
        [Route("GetCart/{id}")]
        public async Task<ActionResult<IEnumerable<CartView>>> GetCart(int id)
        {
            var res = from a in _context.Carts
                      join b in _context.Products on a.ProductId equals b.Id
                      join c in _context.ProductPrice on a.ProductId equals c.ProductId
                      join d in _context.Colors on a.Colorid equals d.Id
                      join e in _context.ProductSize on a.SizeId equals e.Id
                      where a.IsDeleted == false && a.Ispay == false && a.Userid == id && c.SizeId == a.SizeId
                      select new CartView()
                      {
                          Id = a.Id,
                          Userid = a.Userid,
                          ProductId = a.ProductId,
                          Quantity = a.Quantity,
                          Colorid = a.Colorid,
                          Ispay = a.Ispay,
                          SizeId = a.SizeId,
                          NameSize = e.Name,
                          NameColor = d.Name,
                          NameProduct = b.Name,
                          Images = b.Images,
                          PriceProduct = c.Price,
                          Companyid = b.Companyid
                      }
                     ;
            return res.ToList();
        }

        [HttpGet("{id}")]
        [Route("GetShip/{id}")]
        public async Task<ActionResult<decimal>> GetShip(int id)
        {
            try
            {
                var productInCart = _context.Carts.Where(c => c.Userid == id && c.Ispay == false && c.IsDeleted == false).ToList();
                decimal ship = 0;
                foreach (var item in productInCart)
                {
                    var product = _context.Products.Where(c => c.Id == item.ProductId).FirstOrDefault();
                    ship += product.Width * product.Height * product.Long * item.Quantity;
                }
                return ship *1000;
            }
            catch (System.Exception)
            {

                return 0;
            }
            

        }


            [HttpPost]
        [Route("CartAdd")]
        public async Task<ActionResult<IEnumerable<CartView>>> CartAdd(CartAdd data)
        {
            var productInCart = _context.Carts.Where(c => c.Userid == data.Userid && c.Ispay == false && c.IsDeleted == false && c.ProductId == data.ProductId && c.SizeId == data.SizeId && c.Colorid == data.Colorid).FirstOrDefault();
            if (productInCart == null && data.isAdd == true)
            {
                var cartadd = new Carts();
                cartadd.Userid = data.Userid;
                cartadd.ProductId = data.ProductId;
                cartadd.SizeId = data.SizeId;
                cartadd.Quantity = data.Quantity;
                cartadd.Colorid = data.Colorid;
                cartadd.Companyid = data.Companyid;
                _context.Carts.Add(cartadd);
            }
            else
            {
                if (data.isAdd)
                {
                    productInCart.Quantity += data.Quantity;
                }
                else
                {
                    productInCart.Quantity -= data.Quantity;
                }
            }
            _context.SaveChanges();
            var res = from a in _context.Carts
                      join b in _context.Products on a.ProductId equals b.Id
                      join c in _context.ProductPrice on a.ProductId equals c.ProductId
                      join d in _context.Colors on a.Colorid equals d.Id
                      join e in _context.ProductSize on a.SizeId equals e.Id
                      where a.IsDeleted == false && a.Ispay == false && a.Userid == data.Userid && c.SizeId == a.SizeId
                      select new CartView()
                      {
                          Id = a.Id,
                          Userid = a.Userid,
                          ProductId = a.ProductId,
                          Quantity = a.Quantity,
                          Colorid = a.Colorid,
                          Ispay = a.Ispay,
                          SizeId = a.SizeId,
                          NameSize = e.Name,
                          NameColor = d.Name,
                          NameProduct = b.Name,
                          Images = b.Images,
                          PriceProduct = c.Price,
                          Companyid = b.Companyid
                      }
                     ;
            return res.ToList();
        }

        [HttpPost]
        [Route("CartDelete")]
        public async Task<ActionResult<IEnumerable<CartView>>> CartDelete(CartDelete data)
        {
            var productInCart = _context.Carts.Where(c => c.Userid == data.Userid && c.Ispay == false && c.IsDeleted == false && c.ProductId == data.ProductId && c.SizeId == data.SizeId && c.Colorid == data.Colorid).FirstOrDefault();
            if (productInCart == null)
            {
                return NoContent();
            }
            else
            {
                productInCart.IsDeleted = true;
            }
            _context.SaveChanges();
            var res = from a in _context.Carts
                      join b in _context.Products on a.ProductId equals b.Id
                      join c in _context.ProductPrice on a.ProductId equals c.ProductId
                      join d in _context.Colors on a.Colorid equals d.Id
                      join e in _context.ProductSize on a.SizeId equals e.Id
                      where a.IsDeleted == false && a.Ispay == false && a.Userid == data.Userid && c.SizeId == a.SizeId
                      select new CartView()
                      {
                          Id = a.Id,
                          Userid = a.Userid,
                          ProductId = a.ProductId,
                          Quantity = a.Quantity,
                          Colorid = a.Colorid,
                          Ispay = a.Ispay,
                          SizeId = a.SizeId,
                          NameSize = e.Name,
                          NameColor = d.Name,
                          NameProduct = b.Name,
                          Images = b.Images,
                          PriceProduct = c.Price,
                          Companyid = b.Companyid
                      }
                     ;
            return res.ToList();
        }
    }
}
