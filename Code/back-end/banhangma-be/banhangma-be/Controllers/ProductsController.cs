using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using banhangma_be.Models;
using Microsoft.AspNetCore.Authorization;
using banhangma_be.Models.Product;

namespace banhangma_be.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        private readonly BanHangMaContext _context;

        public ProductsController(BanHangMaContext context)
        {
            _context = context;
        }

        [HttpGet]
        [Route("GetProductsHome")]
        public async Task<ActionResult<IEnumerable<ProductList>>> GetProductsHome(int count)
        {
            var res = from a in _context.Products
                      where a.IsDeleted == false
                      select new ProductList()
                      {
                          Id = a.Id,
                          Name = a.Name,
                          Images = a.Images,
                          Price = _context.ProductPrice.Where(c => c.ProductId == a.Id).FirstOrDefault().Price
                      }
                     ;
            return res.Take(count).ToList();
        }

        [HttpGet]
        [Route("GetProductsPage")]
        public async Task<ActionResult<IEnumerable<ProductList>>> GetProductsPage(int categoryId)
        {
            var res = from a in _context.Products
                      where a.IsDeleted == false && a.CategoryId == categoryId
                      select new ProductList()
                      {
                          Id = a.Id,
                          Name = a.Name,
                          Images = a.Images,
                          Price = _context.ProductPrice.Where(c => c.ProductId == a.Id).FirstOrDefault().Price
                      }
                     ;
            return res.ToList();
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<Products>>> GetProducts()
        {
            return await _context.Products.ToListAsync();
        }


        // GET: api/Products/5
        [HttpGet("{id}")]
        [Route("GetProducts/{id}")]
        public async Task<ActionResult<ProductDetail>> GetProducts(int id)
        {
            var res = from a in _context.Products
                      join b in _context.ProductCategory on a.CategoryId equals b.Id
                      where a.IsDeleted == false && a.Id == id
                      select new ProductDetail()
                      {
                          Id = a.Id,
                          Name = a.Name,
                          Detail = a.Detail,
                          CategoryId = a.CategoryId,
                          CategoryName = b.Name,
                          Height = a.Height,
                          Long = a.Long,
                          Width = a.Width,
                          Images = a.Images,
                      }
                     ;
            var products = await res.FirstOrDefaultAsync();

            var price = from a in _context.ProductPrice
                        join b in _context.ProductSize on a.SizeId equals b.Id
                        where a.IsDeleted == false && a.ProductId == id
                        select new ProductPriceDetail()
                        {
                            Id = a.Id,
                            ProductId = a.ProductId,
                            SizeId = a.SizeId,
                            SizeName = b.Name,
                            Price = a.Price,
                        }
                     ;
            products.ProductPrice = price.ToList();

            var productSameType = from a in _context.Products
                                  where a.IsDeleted == false && a.CategoryId == products.CategoryId
                                  select new ProductList()
                                  {
                                      Id = a.Id,
                                      Name = a.Name,
                                      Images = a.Images,
                                      Price = _context.ProductPrice.Where(c => c.ProductId == a.Id).FirstOrDefault().Price
                                  }
                    ;

            products.ProductsSameType = productSameType.Take(4).ToList();

            var ProductColor = from a in _context.ProductColors
                               join b in _context.Colors on a.ColorId equals b.Id
                               where a.IsDeleted == false && a.ProductId == id
                               select new ProductColorItem()
                               {
                                   Id = a.Id,
                                   ProductId = a.ProductId,
                                   ColorId = a.ColorId,
                                   ColorName = b.Name
                               }
                   ;

            products.ProductColor = ProductColor.ToList();

            if (products == null)
            {
                return NotFound();
            }

            return products;
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> PutProducts(int id, Products products)
        {
            if (id != products.Id)
            {
                return BadRequest();
            }

            _context.Entry(products).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProductsExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        [HttpPost]
        public async Task<ActionResult<Products>> PostProducts(Products products)
        {
            _context.Products.Add(products);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetProducts", new { id = products.Id }, products);
        }

        // DELETE: api/Products/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Products>> DeleteProducts(int id)
        {
            var products = await _context.Products.FindAsync(id);
            if (products == null)
            {
                return NotFound();
            }

            _context.Products.Remove(products);
            await _context.SaveChangesAsync();

            return products;
        }

        private bool ProductsExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }
    }
}