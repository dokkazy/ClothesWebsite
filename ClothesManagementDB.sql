USE [master]
GO
/****** Object:  Database [ClothesManagementDB]    Script Date: 8/21/2023 1:24:40 AM ******/
CREATE DATABASE [ClothesManagementDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClothesManagementDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SABER\MSSQL\DATA\ClothesManagementDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClothesManagementDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SABER\MSSQL\DATA\ClothesManagementDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ClothesManagementDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClothesManagementDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClothesManagementDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClothesManagementDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClothesManagementDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClothesManagementDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClothesManagementDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ClothesManagementDB] SET  MULTI_USER 
GO
ALTER DATABASE [ClothesManagementDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClothesManagementDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClothesManagementDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClothesManagementDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClothesManagementDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClothesManagementDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ClothesManagementDB', N'ON'
GO
ALTER DATABASE [ClothesManagementDB] SET QUERY_STORE = OFF
GO
USE [ClothesManagementDB]
GO
/****** Object:  Table [dbo].[tblCategories]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategories](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomers]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomers](
	[ID] [varchar](50) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Phone] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[DOB] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [varchar](50) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[Total] [money] NULL,
	[OrderDate] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[ID] [varchar](45) NOT NULL,
	[CateID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [money] NULL,
	[Quantity] [int] NULL,
	[Image] [varchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](15) NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 8/21/2023 1:24:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategories] ([ID], [Name]) VALUES (1, N'ADIDAS')
INSERT [dbo].[tblCategories] ([ID], [Name]) VALUES (2, N'NIKE')
INSERT [dbo].[tblCategories] ([ID], [Name]) VALUES (3, N'NEW BALANCE')
INSERT [dbo].[tblCategories] ([ID], [Name]) VALUES (4, N'HARD ROCK')
INSERT [dbo].[tblCategories] ([ID], [Name]) VALUES (5, N'CHOCOPIE')
GO
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'1', 1, N'CLUB 3-STRIPES TENNIS POLO SHIRT', 600.0000, 10, N'img\9.jpg', N'Style and performance for the tennis court. Part of the adidas Club collection, this polo shirt will keep you comfortable when you need to be on top of your game. Extra material under the arm ensures you have a full range of motion for booming forehands. Moisture-absorbing AEROREADY and breathable mesh panels keep you confident all the way to match point.', 0)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'10', 2, N'Nike Dri-FIT ADV AeroSwift', 160.0000, 70, N'img\10.png', N'You have pushed through the worst to compete with the best. So, let the breathable feel of the Nike Dri-FIT ADV AeroSwift Vest take you across the finish. Lightweight and silky smooth, the vest uses our most innovative technologies to get you to your personal best. This product is made with at least 75% recycled polyester fibres.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'12', 1, N'ADIDAS REKIVE GRAPHIC TEE', 140.0000, 89, N'img\12.jpg', N'Be who you want to be. This simple yet striking adidas Rekive tee shows off your creative side with a classic adidas logo on the front and a bold metaverse-inspired Trefoil graphic around the back. The soft cotton build guarantees easygoing comfort all day or night. Do not be surprised when you find yourself reaching for this one again and again.', 0)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'13', 1, N'ADIDAS BASKETBALL TEE', 110.0000, 150, N'img\13.jpg', N'The game of basketball is as much about performance as it is about style. This t-shirt from adidas Basketball is made of cotton single jersey fabric that is soft to the touch and super comfortable. Badges on the front, back and sleeves provide a signature finish.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'14', 4, N'GUITAR CITY ART TEE', 350.0000, 34, N'img\14.jpg', N'City landmarks from some of your favorite Hard Rock locations are brought to life in vivid color on the back of this comfortable tee. The front left chest bears a simple Hard Rock logo and city name.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'15', 3, N'New Balance 610 Relaxed Tee', 450.0000, 77, N'img\15.jpg', N'A classic cotton t-shirt updated with a modern silhouette and a fresh graphic print for effortless style.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'16', 2, N'F.C. Barcelona 2023/24 Stadium Fourth', 740.0000, 12, N'img\16.png', N'Our Stadium collection pairs replica design details with sweat-wicking technology to give you a game-ready look inspired by your favourite team.', 0)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'17', 2, N'Jordan Flight Essentials', 110.0000, 120, N'img\17.png', N'Designed with an intentionally oversized fit, this tee is ready for whatever the day brings. With a Jumpman woven patch on the chest, no one will question what you are about.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'18', 1, N'ULTIMATE365 ALLOVER PRINT GOLF POLO SHIRT', 160.0000, 78, N'img\18.jpg', N'Designed for year-round play. This adidas golf polo shirt is made of soft, stretchy piqué fabric to keep you comfortable whether you are attempting a high-pressure shot or walking long stretches on the course. The allover print gives it a dynamic vibe.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'19', 2, N'Nike Sport Wear', 160.0000, 78, N'img\19.png', N'Designed for year-round play. This adidas golf polo shirt is made of soft, stretchy piqué fabric to keep you comfortable whether you are attempting a high-pressure shot or walking long stretches on the course. The allover print gives it a dynamic vibe.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'2', 2, N'Jordan Flight Essentials', 110.0000, 120, N'img\17.png', N'Designed with an intentionally oversized fit, this tee is ready for whatever the day brings. With a Jumpman woven patch on the chest, no one will question what you are about.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'4', 4, N'HARD ROCK ADULT FIT POP OF COLOR TEE IN DEEP TEAL GREEN', 360.0000, 34, N'img\11.jpg', N'Looking for a tee that is both stylish and unique? The Hard Rock Adult Fit Pop of Color Tee in Deep Teal Green is designed to catch your eye. The tee features a pop of color design, with a bold and striking logo that makes a statement. The deep teal green color is vibrant and eye-catching, ensuring that you stand out in any setting.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'5', 3, N'NYC Marathon Impact Run Singlet', 100.0000, 78, N'img\5.jpg', N'For runners that demand cooling and breathability, this premium mesh singlet wicks sweat and looks good doing it.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'6', 2, N'Paris Saint-Germain Max90', 500.0000, 40, N'img\6.png', N'Show everyone who you stand with. Cut for comfort, our roomy PSG Max90 tee gives you a relaxed and casual look so you can cheer on your team in style.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'7', 4, N'Black classic logo tee', 300.0000, 45, N'img\7.jpg', N'The same iconic logo that started it all now brands the chest of a casual black tee made from a soft cotton fabric. A new twist on timeless style, this tee will become a staple in your ever-evolving wardrobe. Check out entire Black Classic Logo Collection.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'8', 3, N'New Balance Mountain Relaxed T-Shirt', 290.0000, 30, N'img\8.png', N'Inspired by the great outdoors to give your everyday casual wear a fresh look.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'9', 1, N'CLUB 3-STRIPES TENNIS POLO SHIRT', 600.0000, 10, N'img\9.jpg', N'Style and performance for the tennis court. Part of the adidas Club collection, this polo shirt will keep you comfortable when you need to be on top of your game. Extra material under the arm ensures you have a full range of motion for booming forehands. Moisture-absorbing AEROREADY and breathable mesh panels keep you confident all the way to match point.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'P20230819011240', 2, N'Nike Dri-FIT', 30.0000, 12, N'img\P20230819011240.png', N'Not all workouts have to be serious. Strive to have fun with your favourite exercise in this Nike Dri-FIT fitness tee. The goal: not to always win or chase PRs, but to get joy from staying active. Our playful and colourful graphics represent that mission, plus smooth, sweat-wicking fabric helps you stay fresh while you reach your goals.', 1)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'P20230819113250', 3, N'hhhh', 67.0000, 45, N'img\P20230819113250.jpg', N'asdfasdfasdf', 0)
INSERT [dbo].[tblProducts] ([ID], [CateID], [Name], [Price], [Quantity], [Image], [Description], [Status]) VALUES (N'P20230820115832', 5, N'Why you leave me ?', 50.0000, 15, N'img/P20230820115832.png', N'ádfasdfsadfsadfsadf', 1)
GO
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (0, N'Admin')
INSERT [dbo].[tblRoles] ([RoleID], [RoleName]) VALUES (1, N'User')
GO
INSERT [dbo].[tblUsers] ([Username], [Password], [Role]) VALUES (N'a', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Role]) VALUES (N'admin@admin', N'845af5e2f9c955b36c4718575e4a27ba', 0)
INSERT [dbo].[tblUsers] ([Username], [Password], [Role]) VALUES (N'b', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Role]) VALUES (N'c', N'202cb962ac59075b964b07152d234b70', 1)
INSERT [dbo].[tblUsers] ([Username], [Password], [Role]) VALUES (N'user', N'202cb962ac59075b964b07152d234b70', 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblCusto__5C7E359EC378265D]    Script Date: 8/21/2023 1:24:40 AM ******/
ALTER TABLE [dbo].[tblCustomers] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblCusto__A9D1053450437D6B]    Script Date: 8/21/2023 1:24:40 AM ******/
ALTER TABLE [dbo].[tblCustomers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ClothesManagementDB] SET  READ_WRITE 
GO
