USE [master]
GO
/****** Object:  Database [BanHangMa]    Script Date: 07/07/2022 1:39:00 AM ******/
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
/****** Object:  Table [dbo].[CartNote]    Script Date: 07/07/2022 1:39:00 AM ******/
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
/****** Object:  Table [dbo].[Carts]    Script Date: 07/07/2022 1:39:00 AM ******/
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
	[quantity] [int] NOT NULL,
	[colorid] [int] NULL,
	[ispay] [bit] NOT NULL,
	[sizeId] [int] NULL,
	[companyid] [int] NULL,
 CONSTRAINT [PK_Carts] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
 CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Companys]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Companys](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](500) NULL,
	[code] [nvarchar](10) NULL,
	[address] [nvarchar](500) NULL,
	[provinceId] [nvarchar](10) NULL,
	[districtId] [nvarchar](10) NULL,
	[wardId] [nvarchar](10) NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[mobile] [nchar](20) NULL,
	[email] [nchar](250) NULL,
 CONSTRAINT [PK_Companys] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 07/07/2022 1:39:00 AM ******/
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
	[colorid] [int] NULL,
	[sizeid] [int] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailComment]    Script Date: 07/07/2022 1:39:00 AM ******/
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
/****** Object:  Table [dbo].[OrderDetailNote]    Script Date: 07/07/2022 1:39:00 AM ******/
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
/****** Object:  Table [dbo].[OrderHistory]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHistory](
	[orderid] [int] NULL,
	[status] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[note] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
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
	[provinceId] [nvarchar](10) NULL,
	[districtId] [nvarchar](10) NULL,
	[wardId] [nvarchar](10) NULL,
	[companyid] [int] NULL,
	[noteMoney] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 07/07/2022 1:39:00 AM ******/
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
	[image] [nvarchar](500) NULL,
 CONSTRAINT [PK_productCategory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[colorId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPrice]    Script Date: 07/07/2022 1:39:00 AM ******/
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
/****** Object:  Table [dbo].[Products]    Script Date: 07/07/2022 1:39:00 AM ******/
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
	[capacity] [decimal](18, 2) NOT NULL,
	[companyid] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 07/07/2022 1:39:00 AM ******/
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
/****** Object:  Table [dbo].[Trucks]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trucks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[licensePlate] [nchar](10) NULL,
	[capacity] [decimal](18, 2) NULL,
	[IsDeleted] [bit] NOT NULL,
	[createdDate] [datetime] NOT NULL,
	[createdBy] [int] NULL,
	[updatedDate] [datetime] NULL,
	[updatedBy] [int] NULL,
	[status] [int] NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_Trucks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 07/07/2022 1:39:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nchar](50) NULL,
	[password] [nchar](250) NULL,
	[fullname] [nvarchar](500) NULL,
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
	[provinceId] [nvarchar](10) NULL,
	[districtId] [nvarchar](10) NULL,
	[wardId] [nvarchar](10) NULL,
	[companyid] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (7, 1, 0, CAST(N'2022-06-23T13:11:11.977' AS DateTime), NULL, NULL, NULL, 1, 5, 2, 1, 4, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (8, 1, 0, CAST(N'2022-06-23T13:12:06.827' AS DateTime), NULL, NULL, NULL, 2, 1, 3, 1, 6, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (9, 1, 0, CAST(N'2022-06-23T13:12:12.560' AS DateTime), NULL, NULL, NULL, 1, 1, 1, 1, 5, 2)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (10, 1, 0, CAST(N'2022-06-23T13:12:43.063' AS DateTime), NULL, NULL, NULL, 1, 1, 3, 1, 6, 2)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (11, 1, 1, CAST(N'2022-06-23T13:13:04.407' AS DateTime), NULL, NULL, NULL, 1, 1, 1, 1, 4, 3)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (13, 1, 0, CAST(N'2022-06-23T22:16:05.607' AS DateTime), NULL, NULL, NULL, 8, 2, 3, 1, 6, 3)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (14, 1, 0, CAST(N'2022-07-06T23:24:33.830' AS DateTime), NULL, NULL, NULL, 1, 2, 1, 1, 1, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (15, 1, 0, CAST(N'2022-07-06T23:24:41.800' AS DateTime), NULL, NULL, NULL, 2, 2, 3, 1, 6, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (16, 1, 0, CAST(N'2022-07-06T23:25:09.230' AS DateTime), NULL, NULL, NULL, 3, 2, 3, 1, 6, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (17, 1, 0, CAST(N'2022-07-07T01:31:22.583' AS DateTime), NULL, NULL, NULL, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (18, 1, 0, CAST(N'2022-07-07T01:31:33.453' AS DateTime), NULL, NULL, NULL, 3, 1, 3, 1, 6, 1)
INSERT [dbo].[Carts] ([id], [userid], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [productId], [quantity], [colorid], [ispay], [sizeId], [companyid]) VALUES (19, 1, 0, CAST(N'2022-07-07T01:31:47.940' AS DateTime), NULL, NULL, NULL, 4, 1, 3, 1, 6, 2)
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (1, N'Xanh', 0, CAST(N'2022-06-18T14:44:32.050' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Colors] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (2, N'Đỏ', 0, CAST(N'2022-06-18T14:44:34.987' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Colors] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (3, N'Tím', 0, CAST(N'2022-06-18T14:44:37.633' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Colors] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (4, N'Vàng', 0, CAST(N'2022-06-18T14:44:39.907' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Colors] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (5, N'Đen', 0, CAST(N'2022-06-18T14:44:50.253' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Colors] OFF
GO
SET IDENTITY_INSERT [dbo].[Companys] ON 

INSERT [dbo].[Companys] ([id], [name], [code], [address], [provinceId], [districtId], [wardId], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [mobile], [email]) VALUES (1, N'nhà cung cấp 1', N'NCC00001', N'Hà Nội', N'1', N'1', N'1', 0, CAST(N'2022-07-04T23:04:27.897' AS DateTime), NULL, NULL, NULL, N'0888448386          ', N'anhduc@gmail.com                                                                                                                                                                                                                                          ')
INSERT [dbo].[Companys] ([id], [name], [code], [address], [provinceId], [districtId], [wardId], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [mobile], [email]) VALUES (2, N'nhà cung cấp 2', N'NCC00002', N'Hà Nội', N'1', N'1', N'1', 0, CAST(N'2022-07-04T23:04:27.897' AS DateTime), NULL, NULL, NULL, N'0888448386          ', N'anhduc@gmail.com                                                                                                                                                                                                                                          ')
INSERT [dbo].[Companys] ([id], [name], [code], [address], [provinceId], [districtId], [wardId], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [mobile], [email]) VALUES (3, N'nhà cung cấp 3', N'NCC00003', N'Hà Nội', N'1', N'1', N'1', 0, CAST(N'2022-07-04T23:04:27.897' AS DateTime), NULL, NULL, NULL, N'0888448386          ', N'anhduc@gmail.com                                                                                                                                                                                                                                          ')
SET IDENTITY_INSERT [dbo].[Companys] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (19, 11, 1, 4, 5, 20000, 0, 100000, 0, 2, 4)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (20, 11, 2, 7, 1, 30000, 0, 30000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (21, 12, 1, 6, 1, 30000, 0, 30000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (22, 12, 1, 5, 1, 25000, 0, 25000, 0, 1, 5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (23, 13, 8, 13, 2, 30000, 0, 60000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (24, 13, 1, 4, 1, 20000, 0, 20000, 0, 1, 4)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (25, 14, 1, 4, 5, 20000, 0, 100000, 0, 2, 4)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (26, 14, 2, 7, 1, 30000, 0, 30000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (27, 15, 1, 6, 1, 30000, 0, 30000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (28, 15, 1, 5, 1, 25000, 0, 25000, 0, 1, 5)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (29, 16, 8, 13, 2, 30000, 0, 60000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (30, 16, 1, 4, 1, 20000, 0, 20000, 0, 1, 4)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (31, 17, 1, 1, 2, 10000, 0, 20000, 0, 1, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (32, 17, 2, 7, 2, 30000, 0, 60000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (33, 17, 3, 8, 2, 30000, 0, 60000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (34, 18, 1, 1, 1, 10000, 0, 10000, 0, 1, 1)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (35, 18, 3, 8, 1, 30000, 0, 30000, 0, 3, 6)
INSERT [dbo].[OrderDetail] ([id], [orderId], [productId], [priceId], [quantity], [price], [totalNote], [total], [IsDeleted], [colorid], [sizeid]) VALUES (36, 19, 4, 9, 1, 30000, 0, 30000, 0, 3, 6)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderHistory] ON 

INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 0, CAST(N'2022-07-06T22:19:07.057' AS DateTime), NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (12, 0, CAST(N'2022-07-06T22:19:07.080' AS DateTime), NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (13, 0, CAST(N'2022-07-06T22:19:07.093' AS DateTime), NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (14, 0, CAST(N'2022-07-06T22:46:27.580' AS DateTime), NULL, NULL, NULL, NULL, 5)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (15, 0, CAST(N'2022-07-06T22:46:27.650' AS DateTime), NULL, NULL, NULL, NULL, 6)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (16, 0, CAST(N'2022-07-06T22:46:27.670' AS DateTime), NULL, NULL, NULL, NULL, 7)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 1, CAST(N'2022-07-06T23:22:52.297' AS DateTime), NULL, NULL, NULL, N'', 8)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (12, 5, CAST(N'2022-07-07T00:22:51.307' AS DateTime), NULL, NULL, NULL, N'', 9)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (13, 5, CAST(N'2022-07-07T00:23:24.813' AS DateTime), NULL, NULL, NULL, N'', 10)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (14, 5, CAST(N'2022-07-07T00:24:06.017' AS DateTime), NULL, NULL, NULL, N'', 11)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (15, 3, CAST(N'2022-07-07T00:26:33.327' AS DateTime), NULL, NULL, NULL, N'', 12)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (16, 3, CAST(N'2022-07-07T00:27:00.763' AS DateTime), NULL, NULL, NULL, N'', 13)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:27:43.377' AS DateTime), NULL, NULL, NULL, N'', 14)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:28:46.530' AS DateTime), NULL, NULL, NULL, N'', 15)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:31:46.320' AS DateTime), NULL, NULL, NULL, N'', 16)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (12, 3, CAST(N'2022-07-07T00:32:37.070' AS DateTime), NULL, NULL, NULL, N'', 17)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:35:36.733' AS DateTime), NULL, NULL, NULL, N'', 18)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:38:01.427' AS DateTime), NULL, NULL, NULL, N'', 19)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:39:19.137' AS DateTime), NULL, NULL, NULL, N'', 20)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (11, 3, CAST(N'2022-07-07T00:42:28.167' AS DateTime), NULL, NULL, NULL, N'', 21)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (17, 0, CAST(N'2022-07-07T01:22:32.690' AS DateTime), NULL, NULL, NULL, NULL, 22)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (18, 0, CAST(N'2022-07-07T01:32:00.917' AS DateTime), NULL, NULL, NULL, NULL, 23)
INSERT [dbo].[OrderHistory] ([orderid], [status], [createdDate], [createdBy], [updatedDate], [updatedBy], [note], [id]) VALUES (19, 0, CAST(N'2022-07-07T01:32:00.933' AS DateTime), NULL, NULL, NULL, NULL, 24)
SET IDENTITY_INSERT [dbo].[OrderHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (11, 1, N'123456', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'anh đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 0, CAST(3.00 AS Decimal(18, 2)), 130000, 0, CAST(N'2022-07-06T22:19:06.857' AS DateTime), NULL, NULL, NULL, 0, N'01', N'002', N'00001', 1, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (12, 1, N'123456', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'anh đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 0, CAST(4.00 AS Decimal(18, 2)), 55000, 0, CAST(N'2022-07-06T22:19:07.070' AS DateTime), NULL, NULL, NULL, 1, N'01', N'002', N'00001', 2, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (13, 1, N'123456', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'anh đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 0, CAST(5.00 AS Decimal(18, 2)), 80000, 0, CAST(N'2022-07-06T22:19:07.083' AS DateTime), NULL, NULL, NULL, 2, N'01', N'002', N'00001', 3, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (14, 1, N'123456', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'anh đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 3, CAST(3.00 AS Decimal(18, 2)), 130000, 0, CAST(N'2022-07-06T22:46:27.170' AS DateTime), NULL, NULL, NULL, 3, N'01', N'002', N'00001', 1, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (15, 1, N'123456', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'anh đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 4, CAST(4.00 AS Decimal(18, 2)), 55000, 0, CAST(N'2022-07-06T22:46:27.613' AS DateTime), NULL, NULL, NULL, 4, N'01', N'002', N'00001', 2, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (16, 1, N'123456', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'anh đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 5, CAST(5.00 AS Decimal(18, 2)), 80000, 0, CAST(N'2022-07-06T22:46:27.657' AS DateTime), NULL, NULL, NULL, 5, N'01', N'002', N'00001', 3, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (17, 1, N'123', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'Nguyễn Anh Đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 12000, CAST(12.00 AS Decimal(18, 2)), 140000, 0, CAST(N'2022-07-07T01:22:32.537' AS DateTime), NULL, NULL, NULL, 0, N'01', N'001', N'00001', NULL, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (18, 1, N'123', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'Nguyễn Anh Đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 5000, CAST(5.00 AS Decimal(18, 2)), 40000, 0, CAST(N'2022-07-07T01:32:00.803' AS DateTime), NULL, NULL, NULL, 0, N'01', N'001', N'00001', 1, 0)
INSERT [dbo].[Orders] ([id], [userid], [address], [mobile], [email], [receiverName], [productMoney], [discount], [discountMoney], [ship], [Volume], [totalMoney], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [provinceId], [districtId], [wardId], [companyid], [noteMoney]) VALUES (19, 1, N'123', N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', N'Nguyễn Anh Đức', 0, CAST(0.00 AS Decimal(18, 2)), 0, 4000, CAST(4.00 AS Decimal(18, 2)), 30000, 0, CAST(N'2022-07-07T01:32:00.927' AS DateTime), NULL, NULL, NULL, 0, N'01', N'001', N'00001', 2, 0)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [image]) VALUES (1, N'Nhà cửa', 0, CAST(N'2022-06-16T23:38:52.110' AS DateTime), NULL, NULL, NULL, N'category1.png')
INSERT [dbo].[ProductCategory] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [image]) VALUES (2, N'Quần áo', 0, CAST(N'2022-06-16T23:38:56.567' AS DateTime), NULL, NULL, NULL, N'category2.png')
INSERT [dbo].[ProductCategory] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [image]) VALUES (3, N'Giấy tiền', 0, CAST(N'2022-06-16T23:39:00.537' AS DateTime), NULL, NULL, NULL, N'category3.png')
INSERT [dbo].[ProductCategory] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [image]) VALUES (4, N'Vàng mã', 0, CAST(N'2022-06-16T23:39:03.757' AS DateTime), NULL, NULL, NULL, N'category4.png')
INSERT [dbo].[ProductCategory] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [image]) VALUES (5, N'Ngựa', 0, CAST(N'2022-06-16T23:39:17.707' AS DateTime), NULL, NULL, NULL, N'category5.png')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColors] ON 

INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (1, 1, 1, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (2, 1, 2, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (3, 1, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (4, 2, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (5, 3, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (6, 4, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (7, 5, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (8, 6, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (9, 7, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (10, 8, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (11, 9, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (12, 10, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (13, 11, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (14, 12, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (15, 13, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (16, 14, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (17, 15, 3, 0)
INSERT [dbo].[ProductColors] ([id], [productId], [colorId], [IsDeleted]) VALUES (18, 16, 3, 0)
SET IDENTITY_INSERT [dbo].[ProductColors] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPrice] ON 

INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (1, 1, 1, 10000, 0, CAST(N'2022-06-17T20:52:15.760' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (2, 1, 2, 12000, 0, CAST(N'2022-06-17T20:52:21.550' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (3, 1, 3, 15000, 0, CAST(N'2022-06-17T20:52:26.670' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (4, 1, 4, 20000, 0, CAST(N'2022-06-17T20:52:31.867' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (5, 1, 5, 25000, 0, CAST(N'2022-06-17T20:52:40.147' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (6, 1, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (7, 2, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (8, 3, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (9, 4, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (10, 5, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (11, 6, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (12, 7, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (13, 8, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (14, 9, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (15, 10, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (16, 11, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (17, 12, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (18, 13, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (19, 14, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (20, 15, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductPrice] ([id], [productId], [sizeId], [price], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (21, 16, 6, 30000, 0, CAST(N'2022-06-17T20:52:44.860' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductPrice] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (1, N'sản phẩm 1', N'Dùng để cúng long mạch, trấn trạch, quan niệm phong thủy , bộ Tứ linh sẽ giúp trấn trạch, ngăn chặn tà khí xâm nhập và mang đến may mắn, bình an cho gia đình.', 1, CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,sanpham_2.jfif,', CAST(2.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (2, N'sản phẩm 2', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_2.jfif,sanpham_2.jfif,', CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (3, N'sản phẩm 3', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,sanpham_2.jfif,', CAST(3.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (4, N'sản phẩm 4', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_2.jfif,', CAST(4.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (5, N'sản phẩm 5', N'sản phẩm 1', 1, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,', CAST(2.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (6, N'sản phẩm 6', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_2.jfif,', CAST(2.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (7, N'sản phẩm 7', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,', CAST(1.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (8, N'sản phẩm 8', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(3.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_2.jfif,', CAST(3.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (9, N'sản phẩm 9', N'sản phẩm 1', 1, CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,', CAST(2.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (10, N'sản phẩm 10', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_2.jfif,', CAST(2.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (11, N'sản phẩm 11', N'sản phẩm 1', 1, CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,', CAST(3.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (12, N'sản phẩm 12', N'sản phẩm 1', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(4.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,', CAST(4.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (13, N'sản phẩm 1', N'Dùng để cúng long mạch, trấn trạch, quan niệm phong thủy , bộ Tứ linh sẽ giúp trấn trạch, ngăn chặn tà khí xâm nhập và mang đến may mắn, bình an cho gia đình.', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,sanpham_2.jfif,', CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (14, N'sản phẩm 1', N'Dùng để cúng long mạch, trấn trạch, quan niệm phong thủy , bộ Tứ linh sẽ giúp trấn trạch, ngăn chặn tà khí xâm nhập và mang đến may mắn, bình an cho gia đình.', 1, CAST(3.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,sanpham_2.jfif,', CAST(3.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (15, N'sản phẩm 1', N'Dùng để cúng long mạch, trấn trạch, quan niệm phong thủy , bộ Tứ linh sẽ giúp trấn trạch, ngăn chặn tà khí xâm nhập và mang đến may mắn, bình an cho gia đình.', 1, CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,sanpham_2.jfif,', CAST(2.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Products] ([id], [name], [detail], [categoryId], [height], [long], [width], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [images], [capacity], [companyid]) VALUES (16, N'sản phẩm 1', N'Dùng để cúng long mạch, trấn trạch, quan niệm phong thủy , bộ Tứ linh sẽ giúp trấn trạch, ngăn chặn tà khí xâm nhập và mang đến may mắn, bình an cho gia đình.', 1, CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(2.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-16T23:40:23.203' AS DateTime), NULL, NULL, NULL, N'sanpham_1.jfif,sanpham_2.jfif,', CAST(2.00 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

INSERT [dbo].[ProductSize] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (1, N'S', 0, CAST(N'2022-06-17T20:51:34.250' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductSize] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (2, N'M', 0, CAST(N'2022-06-17T20:51:37.290' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductSize] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (3, N'L', 0, CAST(N'2022-06-17T20:51:39.287' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductSize] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (4, N'XL', 0, CAST(N'2022-06-17T20:51:42.023' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductSize] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (5, N'XXL', 0, CAST(N'2022-06-17T20:51:47.530' AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ProductSize] ([id], [name], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy]) VALUES (6, N'XXXL', 0, CAST(N'2022-06-17T20:51:50.280' AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[Trucks] ON 

INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (9, 2, N'18A4588844', CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 2000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (10, 2, N'19B2588844', CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 3000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (11, 3, N'27V1588844', CAST(2.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 2000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (12, 3, N'34A5588844', CAST(2.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (13, 3, N'34A5588844', CAST(3.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (14, 3, N'34A5588844', CAST(4.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (15, 3, N'34A5588844', CAST(5.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (16, 3, N'34A5588844', CAST(2.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (17, 3, N'34A5588844', CAST(1.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (18, 3, N'34A5588844', CAST(2.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
INSERT [dbo].[Trucks] ([id], [userid], [licensePlate], [capacity], [IsDeleted], [createdDate], [createdBy], [updatedDate], [updatedBy], [status], [price]) VALUES (19, 3, N'34A5588844', CAST(3.00 AS Decimal(18, 2)), 0, CAST(N'2022-06-26T23:22:39.107' AS DateTime), NULL, NULL, NULL, 0, 5000)
SET IDENTITY_INSERT [dbo].[Trucks] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [fullname], [address], [userType], [mobile], [email], [IsDeleted], [discount], [createdDate], [createdBy], [updatedDate], [updatedBy], [provinceId], [districtId], [wardId], [companyid]) VALUES (1, N'admin                                             ', N'123456                                                                                                                                                                                                                                                    ', N'Nguyễn Anh Đức', N'123', 0, N'0888448386          ', N'ducna@mutosi.com                                                                                                                                                                                                                                          ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-06-12T01:24:33.267' AS DateTime), NULL, NULL, NULL, N'01', N'001', N'00001', NULL)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [address], [userType], [mobile], [email], [IsDeleted], [discount], [createdDate], [createdBy], [updatedDate], [updatedBy], [provinceId], [districtId], [wardId], [companyid]) VALUES (2, NULL, N'123456                                                                                                                                                                                                                                                    ', N'Kim Văn Chuẩn', N'Hà Nội', 1, N'0888448333          ', N'chuankv@gmail.com                                                                                                                                                                                                                                         ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-06-21T23:30:44.627' AS DateTime), NULL, NULL, NULL, N'01', N'001', N'00001', 1)
INSERT [dbo].[Users] ([id], [username], [password], [fullname], [address], [userType], [mobile], [email], [IsDeleted], [discount], [createdDate], [createdBy], [updatedDate], [updatedBy], [provinceId], [districtId], [wardId], [companyid]) VALUES (3, NULL, N'123456                                                                                                                                                                                                                                                    ', N'Vũ Tuấn Ngọc', N'123213', 2, N'0888448355          ', N'ngocvt@gmail.com                                                                                                                                                                                                                                          ', 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2022-06-21T23:50:25.673' AS DateTime), NULL, NULL, NULL, N'01', N'001', N'00001', NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
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
ALTER TABLE [dbo].[Carts] ADD  CONSTRAINT [DF_Carts_ispay]  DEFAULT ((0)) FOR [ispay]
GO
ALTER TABLE [dbo].[Colors] ADD  CONSTRAINT [DF_ProductColor_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Colors] ADD  CONSTRAINT [DF_ProductColor_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Companys] ADD  CONSTRAINT [DF_Companys_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Companys] ADD  CONSTRAINT [DF_Companys_createdDate]  DEFAULT (getdate()) FOR [createdDate]
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
ALTER TABLE [dbo].[ProductColors] ADD  CONSTRAINT [DF_ProductColors_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
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
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_capacity]  DEFAULT ((0)) FOR [capacity]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Trucks] ADD  CONSTRAINT [DF_Trucks_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Trucks] ADD  CONSTRAINT [DF_Trucks_createdDate]  DEFAULT (getdate()) FOR [createdDate]
GO
ALTER TABLE [dbo].[Trucks] ADD  CONSTRAINT [DF_Trucks_Status]  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Trucks] ADD  CONSTRAINT [DF_Trucks_price]  DEFAULT ((0)) FOR [price]
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
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Products] FOREIGN KEY([productId])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_ProductSize] FOREIGN KEY([sizeId])
REFERENCES [dbo].[ProductSize] ([id])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_ProductSize]
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
