using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace banhangma_be.Models
{
    public partial class BanHangMaContext : DbContext
    {
        public BanHangMaContext(DbContextOptions<BanHangMaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<CartNote> CartNote { get; set; }
        public virtual DbSet<Carts> Carts { get; set; }
        public virtual DbSet<Colors> Colors { get; set; }
        public virtual DbSet<OrderDetail> OrderDetail { get; set; }
        public virtual DbSet<OrderDetailComment> OrderDetailComment { get; set; }
        public virtual DbSet<OrderDetailNote> OrderDetailNote { get; set; }
        public virtual DbSet<OrderHistory> OrderHistory { get; set; }
        public virtual DbSet<Orders> Orders { get; set; }
        public virtual DbSet<ProductCategory> ProductCategory { get; set; }
        public virtual DbSet<ProductColors> ProductColors { get; set; }
        public virtual DbSet<ProductPrice> ProductPrice { get; set; }
        public virtual DbSet<ProductSize> ProductSize { get; set; }
        public virtual DbSet<Products> Products { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CartNote>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CartId).HasColumnName("cartId");

                entity.Property(e => e.Note).HasColumnName("note");

                entity.Property(e => e.PriceNote).HasColumnName("priceNote");

                entity.HasOne(d => d.Cart)
                    .WithMany(p => p.CartNote)
                    .HasForeignKey(d => d.CartId)
                    .HasConstraintName("FK_CartNote_Carts");
            });

            modelBuilder.Entity<Carts>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Colorid).HasColumnName("colorid");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Ispay).HasColumnName("ispay");

                entity.Property(e => e.ProductId).HasColumnName("productId");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.SizeId).HasColumnName("sizeId");

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");

                entity.Property(e => e.Userid).HasColumnName("userid");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_Carts_Products");

                entity.HasOne(d => d.Size)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.SizeId)
                    .HasConstraintName("FK_Carts_ProductSize");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Carts)
                    .HasForeignKey(d => d.Userid)
                    .HasConstraintName("FK_Carts_Users");
            });

            modelBuilder.Entity<Colors>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.OrderId).HasColumnName("orderId");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.PriceId).HasColumnName("priceId");

                entity.Property(e => e.ProductId).HasColumnName("productId");

                entity.Property(e => e.Quantity).HasColumnName("quantity");

                entity.Property(e => e.Total).HasColumnName("total");

                entity.Property(e => e.TotalNote).HasColumnName("totalNote");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK_OrderDetail_Orders");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.OrderDetail)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_OrderDetail_Products");
            });

            modelBuilder.Entity<OrderDetailComment>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Images)
                    .HasColumnName("images")
                    .HasMaxLength(500);

                entity.Property(e => e.Note).HasColumnName("note");

                entity.Property(e => e.OrderDetailId).HasColumnName("orderDetailId");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.OrderDetailComment)
                    .HasForeignKey(d => d.OrderDetailId)
                    .HasConstraintName("FK_OrderDetailComment_OrderDetail");
            });

            modelBuilder.Entity<OrderDetailNote>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Note).HasColumnName("note");

                entity.Property(e => e.OrderDetailId).HasColumnName("orderDetailId");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.OrderDetailNote)
                    .HasForeignKey(d => d.OrderDetailId)
                    .HasConstraintName("FK_OrderDetailNote_OrderDetail");
            });

            modelBuilder.Entity<OrderHistory>(entity =>
            {
                entity.Property(e => e.Id)
                    .HasColumnName("id")
                    .ValueGeneratedNever();

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Note).HasColumnName("note");

                entity.Property(e => e.Orderid).HasColumnName("orderid");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.OrderHistory)
                    .HasForeignKey(d => d.Orderid)
                    .HasConstraintName("FK_OrderHistory_Orders");
            });

            modelBuilder.Entity<Orders>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasColumnName("address")
                    .HasMaxLength(500);

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Discount)
                    .HasColumnName("discount")
                    .HasColumnType("decimal(18, 2)");

                entity.Property(e => e.DiscountMoney).HasColumnName("discountMoney");

                entity.Property(e => e.DistrictId).HasColumnName("districtId");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasMaxLength(250)
                    .IsFixedLength();

                entity.Property(e => e.Mobile)
                    .HasColumnName("mobile")
                    .HasMaxLength(20)
                    .IsFixedLength();

                entity.Property(e => e.ProductMoney).HasColumnName("productMoney");

                entity.Property(e => e.ProvinceId).HasColumnName("provinceId");

                entity.Property(e => e.ReceiverName)
                    .HasColumnName("receiverName")
                    .HasMaxLength(500);

                entity.Property(e => e.Ship).HasColumnName("ship");

                entity.Property(e => e.Status).HasColumnName("status");

                entity.Property(e => e.TotalMoney).HasColumnName("totalMoney");

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");

                entity.Property(e => e.Userid).HasColumnName("userid");

                entity.Property(e => e.Volume).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.WardId).HasColumnName("wardId");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.Userid)
                    .HasConstraintName("FK_Orders_Users");
            });

            modelBuilder.Entity<ProductCategory>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Image)
                    .HasColumnName("image")
                    .HasMaxLength(500);

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(500);

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<ProductColors>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ColorId).HasColumnName("colorId");

                entity.Property(e => e.ProductId).HasColumnName("productId");
            });

            modelBuilder.Entity<ProductPrice>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Price).HasColumnName("price");

                entity.Property(e => e.ProductId).HasColumnName("productId");

                entity.Property(e => e.SizeId).HasColumnName("sizeId");

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");

                entity.HasOne(d => d.Product)
                    .WithMany(p => p.ProductPrice)
                    .HasForeignKey(d => d.ProductId)
                    .HasConstraintName("FK_ProductPrice_Products");

                entity.HasOne(d => d.Size)
                    .WithMany(p => p.ProductPrice)
                    .HasForeignKey(d => d.SizeId)
                    .HasConstraintName("FK_ProductPrice_ProductSize");
            });

            modelBuilder.Entity<ProductSize>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(50);

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");
            });

            modelBuilder.Entity<Products>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.CategoryId).HasColumnName("categoryId");

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Detail)
                    .HasColumnName("detail")
                    .HasColumnType("ntext");

                entity.Property(e => e.Height)
                    .HasColumnName("height")
                    .HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Images)
                    .HasColumnName("images")
                    .HasMaxLength(500);

                entity.Property(e => e.Long)
                    .HasColumnName("long")
                    .HasColumnType("decimal(18, 2)");

                entity.Property(e => e.Name)
                    .HasColumnName("name")
                    .HasMaxLength(500);

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");

                entity.Property(e => e.Width)
                    .HasColumnName("width")
                    .HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.Category)
                    .WithMany(p => p.Products)
                    .HasForeignKey(d => d.CategoryId)
                    .HasConstraintName("FK_Products_ProductCategory");
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Address)
                    .HasColumnName("address")
                    .HasMaxLength(500);

                entity.Property(e => e.CreatedBy).HasColumnName("createdBy");

                entity.Property(e => e.CreatedDate)
                    .HasColumnName("createdDate")
                    .HasColumnType("datetime")
                    .HasDefaultValueSql("(getdate())");

                entity.Property(e => e.Discount)
                    .HasColumnName("discount")
                    .HasColumnType("decimal(18, 2)");

                entity.Property(e => e.DistrictId).HasColumnName("districtId");

                entity.Property(e => e.Email)
                    .HasColumnName("email")
                    .HasMaxLength(250)
                    .IsFixedLength();

                entity.Property(e => e.Fullname)
                    .HasColumnName("fullname")
                    .HasMaxLength(500);

                entity.Property(e => e.Mobile)
                    .HasColumnName("mobile")
                    .HasMaxLength(20)
                    .IsFixedLength();

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(250)
                    .IsFixedLength();

                entity.Property(e => e.ProvinceId).HasColumnName("provinceId");

                entity.Property(e => e.UpdatedBy).HasColumnName("updatedBy");

                entity.Property(e => e.UpdatedDate)
                    .HasColumnName("updatedDate")
                    .HasColumnType("datetime");

                entity.Property(e => e.UserType)
                    .HasColumnName("userType")
                    .HasComment("0: người dùng, 1: đại lý, 2: admin");

                entity.Property(e => e.Username)
                    .HasColumnName("username")
                    .HasMaxLength(50)
                    .IsFixedLength();

                entity.Property(e => e.WardId).HasColumnName("wardId");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
