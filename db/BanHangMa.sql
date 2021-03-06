USE [master]
GO
/****** Object:  Database [BanHangMa]    Script Date: 03/06/2022 10:57:42 AM ******/
CREATE DATABASE [BanHangMa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanHangMa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BanHangMa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BanHangMa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\BanHangMa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BanHangMa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanHangMa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanHangMa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanHangMa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanHangMa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanHangMa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanHangMa] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanHangMa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanHangMa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanHangMa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanHangMa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanHangMa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanHangMa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanHangMa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanHangMa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanHangMa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanHangMa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanHangMa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanHangMa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanHangMa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanHangMa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanHangMa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanHangMa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanHangMa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanHangMa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanHangMa] SET  MULTI_USER 
GO
ALTER DATABASE [BanHangMa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanHangMa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanHangMa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanHangMa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BanHangMa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BanHangMa] SET QUERY_STORE = OFF
GO
USE [BanHangMa]
GO
/****** Object:  Table [dbo].[CartNote]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartNote](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cartId] [int] NULL,
	[note] [nvarchar](max) NULL,
	[priceNote] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CartNote] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[productId] [int] NULL,
	[priceId] [int] NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NULL,
	[productId] [int] NULL,
	[priceId] [int] NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[totalNote] [int] NOT NULL,
	[total] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailComment]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDetailId] [int] NULL,
	[images] [nvarchar](500) NULL,
	[note] [nvarchar](max) NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetailComment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailNote]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailNote](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDetailId] [int] NULL,
	[note] [nvarchar](max) NULL,
	[price] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetailNote] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[id] [int] NOT NULL,
	[orderid] [int] NULL,
	[status] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_OrderHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[wardId] [int] NULL,
	[districtId] [int] NULL,
	[provinceId] [int] NULL,
	[address] [nvarchar](500) NULL,
	[mobile] [nchar](20) NULL,
	[email] [nchar](250) NULL,
	[receiverName] [nvarchar](500) NULL,
	[productMoney] [int] NOT NULL,
	[discount] [decimal](18, 2) NOT NULL,
	[discountMoney] [int] NOT NULL,
	[ship] [int] NOT NULL,
	[Volume] [decimal](18, 2) NOT NULL,
	[totalMoney] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_productCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPrice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[sizeId] [int] NULL,
	[price] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_ProductPrice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[detail] [ntext] NULL,
	[categoryId] [int] NULL,
	[height] [decimal](18, 2) NOT NULL,
	[long] [decimal](18, 2) NOT NULL,
	[width] [decimal](18, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[images] [nvarchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 03/06/2022 10:57:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NULL,
	[password] [nchar](250) NULL,
	[fullname] [nvarchar](500) NULL,
	[wardId] [int] NULL,
	[districtId] [int] NULL,
	[provinceId] [int] NULL,
	[address] [nvarchar](500) NULL,
	[userType] [int] NOT NULL,
	[mobile] [nchar](20) NULL,
	[email] [nchar](250) NULL,
	[IsDeleted] [bit] NOT NULL,
	[discount] [decimal](18, 2) NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CartNote] ADD  CONSTRAINT [DF_CartNote_priceNote]  DEFAULT ((0)) FOR [priceNote]
GO
ALTER TABLE [dbo].[CartNote] ADD  CONSTRAINT [DF_CartNote_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_totalNote]  DEFAULT ((0)) FOR [totalNote]
GO
ALTER TABLE [dbo].[OrderDetail] ADD  CONSTRAINT [DF_OrderDetail_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderDetailComment] ADD  CONSTRAINT [DF_OrderDetailComment_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[OrderDetailComment] ADD  CONSTRAINT [DF_OrderDetailComment_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderDetailNote] ADD  CONSTRAINT [DF_OrderDetailNote_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[OrderDetailNote] ADD  CONSTRAINT [DF_OrderDetailNote_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[OrderHistory] ADD  CONSTRAINT [DF_OrderHistory_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Table_1_totalMoney]  DEFAULT ((0)) FOR [productMoney]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_discountMoney]  DEFAULT ((0)) FOR [discountMoney]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_ship]  DEFAULT ((0)) FOR [ship]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Volume]  DEFAULT ((0)) FOR [Volume]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_totalMoney]  DEFAULT ((0)) FOR [totalMoney]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_productCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_productCategory_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_price]  DEFAULT ((0)) FOR [price]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductPrice] ADD  CONSTRAINT [DF_ProductPrice_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Table_1_high]  DEFAULT ((0)) FOR [height]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_long]  DEFAULT ((0)) FOR [long]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_width]  DEFAULT ((0)) FOR [width]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_userType]  DEFAULT ((0)) FOR [userType]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_discount]  DEFAULT ((0)) FOR [discount]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_createDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[CartNote]  WITH CHECK ADD  CONSTRAINT [FK_CartNote_Carts] FOREIGN KEY([cartId])
REFERENCES [dbo].[Carts] ([id])
GO
ALTER TABLE [dbo].[CartNote] CHECK CONSTRAINT [FK_CartNote_Carts]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_ProductPrice] FOREIGN KEY([priceId])
REFERENCES [dbo].[ProductPrice] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_ProductPrice]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Users]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Orders] FOREIGN KEY([orderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Orders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Products]
GO
ALTER TABLE [dbo].[OrderDetailComment]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailComment_OrderDetail] FOREIGN KEY([orderDetailId])
REFERENCES [dbo].[OrderDetail] ([id])
GO
ALTER TABLE [dbo].[OrderDetailComment] CHECK CONSTRAINT [FK_OrderDetailComment_OrderDetail]
GO
ALTER TABLE [dbo].[OrderDetailNote]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailNote_OrderDetail] FOREIGN KEY([orderDetailId])
REFERENCES [dbo].[OrderDetail] ([id])
GO
ALTER TABLE [dbo].[OrderDetailNote] CHECK CONSTRAINT [FK_OrderDetailNote_OrderDetail]
GO
ALTER TABLE [dbo].[OrderHistory]  WITH CHECK ADD  CONSTRAINT [FK_OrderHistory_Orders] FOREIGN KEY([orderid])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderHistory] CHECK CONSTRAINT [FK_OrderHistory_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([userid])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_Products]
GO
ALTER TABLE [dbo].[ProductPrice]  WITH CHECK ADD  CONSTRAINT [FK_ProductPrice_ProductSize] FOREIGN KEY([sizeId])
REFERENCES [dbo].[ProductSize] ([id])
GO
ALTER TABLE [dbo].[ProductPrice] CHECK CONSTRAINT [FK_ProductPrice_ProductSize]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategory] FOREIGN KEY([categoryId])
REFERENCES [dbo].[ProductCategory] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategory]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: người dùng, 1: đại lý, 2: admin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'userType'
GO
USE [master]
GO
ALTER DATABASE [BanHangMa] SET  READ_WRITE 
GO
