using banhangma_be.Models;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Net;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using banhangma_be.Models.Order;

namespace banhangma_be.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]
    public class OrderController : ControllerBase
    {
        private readonly BanHangMaContext _context;

        public OrderController(BanHangMaContext context)
        {
            _context = context;
        }

        [HttpGet("{id}")]
        [Route("GetOrderPage/{id}")]
        public async Task<ActionResult<IEnumerable<OrderList>>> GetOrderPage(int id, int status = 0)
        {
            try
            {
                var user = _context.Users.Where(c => c.Id == id).FirstOrDefault();
                var res = from a in _context.Orders
                          join b in _context.Companys on a.Companyid equals b.Id
                          where a.IsDeleted == false && ((a.Userid == user.Id && user.UserType == 0) || (a.Companyid == user.Companyid && user.UserType == 1) || (user.UserType == 2)) && a.Status == status
                          select new OrderList()
                          {
                              Id = a.Id,
                              Userid = a.Userid,
                              TotalMoney = a.TotalMoney,
                              Companyid = a.Companyid,
                              Status = a.Status,
                              Companyname = b.Name,
                              NoteMoney = a.NoteMoney
                          }
                         ;
                var orderlist = res.ToList();
                foreach (var item in orderlist)
                {
                    var res1 = from a in _context.OrderDetail
                               join b in _context.Products on a.ProductId equals b.Id
                               join c in _context.Colors on a.Colorid equals c.Id
                               join d in _context.ProductSize on a.Sizeid equals d.Id
                               where a.IsDeleted == false && a.OrderId == item.Id
                               select new OrderDetailItem()
                               {
                                   OrderId = a.OrderId,
                                   ProductId = a.ProductId,
                                   Name = b.Name,
                                   Images = b.Images,
                                   Quantity = a.Quantity,
                                   Price = a.Price,
                                   TotalNote = a.TotalNote,
                                   Total = a.Total,
                                   ColorName = c.Name,
                                   SizeName = d.Name
                               }
                        ;

                    item.OrderDetailItem = res1.ToList();

                }
                return orderlist;
            }
            catch (System.Exception)
            {

                throw;
            }

        }

        [HttpPost]
        [Route("OrderAdd")]
        public async Task<ActionResult<int>> OrderAdd(OrderAdd data)
        {
            try
            {
                var cart = _context.Carts.Where(c => c.Userid == data.Userid && c.Ispay == false).ToList();
                if (cart.Count == 0)
                {
                    return 0;
                }
                var companylist = cart.GroupBy(c => c.Companyid).Select(group => new { group.FirstOrDefault().Companyid }).ToList();
                foreach (var companyid in companylist)
                {
                    var cartByCompanyid = cart.Where(c => c.Companyid == companyid.Companyid);
                    var productMoney = 0;
                    decimal volume = 0;


                    var order = new Orders();
                    order.Userid = data.Userid;
                    order.Address = data.Address;
                    order.Mobile = data.Mobile;
                    order.Email = data.Email;
                    order.ReceiverName = data.ReceiverName;
                    order.ProductMoney = productMoney;
                    order.Discount = 0;
                    order.DiscountMoney = 0;
                    order.Ship = 0;
                    order.Volume = volume;
                    order.TotalMoney = productMoney;
                    order.ProvinceId = data.ProvinceId;
                    order.DistrictId = data.DistrictId;
                    order.WardId = data.WardId;
                    order.Status = 0;
                    order.Companyid = companyid.Companyid;
                    order.NoteMoney = 0;
                    var orderNew = _context.Orders.Add(order);
                    _context.SaveChanges();

                    var orderHistory = new OrderHistory();
                    orderHistory.Orderid = order.Id;
                    orderHistory.Status = 0;
                    _context.OrderHistory.Add(orderHistory);

                    var listDetail = new List<OrderDetail>();
                    foreach (var item in cartByCompanyid)
                    {
                        var product = _context.Products.Where(c => c.Id == item.ProductId).FirstOrDefault();
                        var price = _context.ProductPrice.Where(c => c.ProductId == item.ProductId && c.SizeId == item.SizeId && c.IsDeleted == false).FirstOrDefault();
                        volume += product.Width * product.Height * product.Long * item.Quantity;
                        var detailItem = new OrderDetail();
                        detailItem.OrderId = order.Id;
                        detailItem.ProductId = item.ProductId;
                        detailItem.PriceId = price.Id;
                        detailItem.Quantity = item.Quantity;
                        detailItem.Price = price.Price;
                        detailItem.TotalNote = 0;
                        detailItem.Total = detailItem.Price * detailItem.Quantity;
                        detailItem.Colorid = item.Colorid;
                        detailItem.Sizeid = item.SizeId;
                        listDetail.Add(detailItem);
                        _context.OrderDetail.Add(detailItem);
                        productMoney += detailItem.Total;
                    }
                    order.Volume = volume;
                    order.Ship = (int)volume * 1000;
                    order.TotalMoney = productMoney;

                    //Tính ship
                    //var ship = 0;
                    //int i = 0;
                    //while (i < volume + 1)
                    //{
                    //    var truck = _context.Trucks.Where(c=>c.)
                    //}

                    foreach (var item in cart)
                    {
                        item.Ispay = true;
                    }
                    _context.SaveChanges();
                }
                return data.Userid;
            }
            catch (System.Exception)
            {

                throw;
            }

        }
        [HttpGet("{id}")]
        [Route("UpdateStatus/{id}")]
        public async Task<ActionResult<int>> UpdateStatus(int id, int status = 0, string note = "")
        {
            try
            {
                var order = _context.Orders.Where(c => c.Id == id).FirstOrDefault();
                order.Status = status;

                var orderHistory = new OrderHistory();
                orderHistory.Orderid = order.Id;
                orderHistory.Status = status;
                orderHistory.Note = note;
                _context.OrderHistory.Add(orderHistory);
                _context.SaveChanges();
                return id;
            }
            catch (System.Exception)
            {

                throw;
            }


        }
    }
}
