USE [master]
GO
/****** Object:  Database [Test]    Script Date: 2/17/2021 4:53:43 PM ******/
CREATE DATABASE [Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.REVATUREJT\MSSQL\DATA\Test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.REVATUREJT\MSSQL\DATA\Test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Test] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Test] SET RECOVERY FULL 
GO
ALTER DATABASE [Test] SET  MULTI_USER 
GO
ALTER DATABASE [Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Test', N'ON'
GO
ALTER DATABASE [Test] SET QUERY_STORE = OFF
GO
USE [Test]
GO
/****** Object:  Table [dbo].[brgRestaurantCuisine]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brgRestaurantCuisine](
	[restaurantCuisineID] [int] IDENTITY(1,1) NOT NULL,
	[restaurantID] [int] NULL,
	[cuisineID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurantCuisineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brgRestaurantHighlight]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brgRestaurantHighlight](
	[restaurantHighlightID] [int] IDENTITY(1,1) NOT NULL,
	[restaurantID] [int] NULL,
	[highlightID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurantHighlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimCuisine]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimCuisine](
	[cuisineID] [int] IDENTITY(1,1) NOT NULL,
	[cuisineName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[cuisineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimGenre]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimGenre](
	[genreID] [int] IDENTITY(1,1) NOT NULL,
	[genreName] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[genreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimHighlight]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimHighlight](
	[highlightID] [int] IDENTITY(1,1) NOT NULL,
	[highlightName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[highlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimLocation]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimLocation](
	[locationID] [int] IDENTITY(1,1) NOT NULL,
	[countryName] [varchar](25) NULL,
	[stateName] [varchar](25) NULL,
	[cityName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimPriceRange]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimPriceRange](
	[priceRangeID] [int] IDENTITY(1,1) NOT NULL,
	[costForTwo] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[priceRangeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[dimRestaurant]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dimRestaurant](
	[restaurantID] [int] IDENTITY(1,1) NOT NULL,
	[storeName] [varchar](50) NULL,
	[restaurantAddress] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[restaurantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factTable]    Script Date: 2/17/2021 4:53:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factTable](
	[factID] [int] IDENTITY(1,1) NOT NULL,
	[restaurantID] [int] NULL,
	[locationID] [int] NULL,
	[genreID] [int] NULL,
	[priceRangeID] [int] NULL,
	[averageRating] [numeric](5, 1) NULL,
	[numberOfVotes] [int] NULL,
	[numberOfPhotots] [int] NULL,
 CONSTRAINT [PK__factTabl__CFC94ABF6B800014] PRIMARY KEY CLUSTERED 
(
	[factID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[brgRestaurantCuisine] ON 
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (2, 1, 2)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (3, 1, 3)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (4, 2, 3)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (5, 2, 4)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (6, 3, 1)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (7, 3, 2)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (8, 4, 5)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (9, 4, 6)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (10, 4, 7)
GO
INSERT [dbo].[brgRestaurantCuisine] ([restaurantCuisineID], [restaurantID], [cuisineID]) VALUES (11, 5, 8)
GO
SET IDENTITY_INSERT [dbo].[brgRestaurantCuisine] OFF
GO
SET IDENTITY_INSERT [dbo].[brgRestaurantHighlight] ON 
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (2, 1, 2)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (3, 1, 3)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (4, 1, 4)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (5, 1, 6)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (6, 2, 4)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (7, 2, 7)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (8, 3, 1)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (9, 3, 3)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (10, 3, 6)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (11, 4, 2)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (12, 4, 7)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (13, 5, 2)
GO
INSERT [dbo].[brgRestaurantHighlight] ([restaurantHighlightID], [restaurantID], [highlightID]) VALUES (14, 5, 4)
GO
SET IDENTITY_INSERT [dbo].[brgRestaurantHighlight] OFF
GO
SET IDENTITY_INSERT [dbo].[dimCuisine] ON 
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (1, N'Pizza')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (2, N'Pasta')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (3, N'Sub')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (4, N'Chips')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (5, N'Burgers')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (6, N'Fries')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (7, N'Chicken')
GO
INSERT [dbo].[dimCuisine] ([cuisineID], [cuisineName]) VALUES (8, N'Coffee')
GO
SET IDENTITY_INSERT [dbo].[dimCuisine] OFF
GO
SET IDENTITY_INSERT [dbo].[dimGenre] ON 
GO
INSERT [dbo].[dimGenre] ([genreID], [genreName]) VALUES (1, N'Fast Food')
GO
INSERT [dbo].[dimGenre] ([genreID], [genreName]) VALUES (2, N'Beverage')
GO
INSERT [dbo].[dimGenre] ([genreID], [genreName]) VALUES (3, N'Dine In')
GO
SET IDENTITY_INSERT [dbo].[dimGenre] OFF
GO
SET IDENTITY_INSERT [dbo].[dimHighlight] ON 
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (1, N'Delivery')
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (2, N'Drive-thru')
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (3, N'Open Late')
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (4, N'Open Kitchen')
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (5, N'Dummy Value')
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (6, N'Specials')
GO
INSERT [dbo].[dimHighlight] ([highlightID], [highlightName]) VALUES (7, N'Fountain Drinks')
GO
SET IDENTITY_INSERT [dbo].[dimHighlight] OFF
GO
SET IDENTITY_INSERT [dbo].[dimLocation] ON 
GO
INSERT [dbo].[dimLocation] ([locationID], [countryName], [stateName], [cityName]) VALUES (1, N'United States', N'Alabama', N'Mobile')
GO
INSERT [dbo].[dimLocation] ([locationID], [countryName], [stateName], [cityName]) VALUES (2, N'United States', N'Alabama', N'Birmingham')
GO
INSERT [dbo].[dimLocation] ([locationID], [countryName], [stateName], [cityName]) VALUES (3, N'United States', N'Alabama', N'Huntsville')
GO
INSERT [dbo].[dimLocation] ([locationID], [countryName], [stateName], [cityName]) VALUES (4, N'United States', N'Alabama', N'Mobile')
GO
INSERT [dbo].[dimLocation] ([locationID], [countryName], [stateName], [cityName]) VALUES (5, N'United States', N'Florida', N'Jacksonville')
GO
INSERT [dbo].[dimLocation] ([locationID], [countryName], [stateName], [cityName]) VALUES (6, N'United States', N'Florida', N'Orlando')
GO
SET IDENTITY_INSERT [dbo].[dimLocation] OFF
GO
SET IDENTITY_INSERT [dbo].[dimPriceRange] ON 
GO
INSERT [dbo].[dimPriceRange] ([priceRangeID], [costForTwo]) VALUES (1, 450)
GO
INSERT [dbo].[dimPriceRange] ([priceRangeID], [costForTwo]) VALUES (2, 999)
GO
INSERT [dbo].[dimPriceRange] ([priceRangeID], [costForTwo]) VALUES (3, 1900)
GO
INSERT [dbo].[dimPriceRange] ([priceRangeID], [costForTwo]) VALUES (4, 30000)
GO
SET IDENTITY_INSERT [dbo].[dimPriceRange] OFF
GO
SET IDENTITY_INSERT [dbo].[dimRestaurant] ON 
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (1, N'Domino''s', N'dAddress 1')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (2, N'Domino''s', N'dAddress 2')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (3, N'Domino''s', N'dAddress 3')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (4, N'Subway', N'sAddress 1')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (5, N'Subway', N'sAddress 2')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (6, N'Pizza Hut', N'pAddress 1')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (7, N'Burger King', N'bAddress 1')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (8, N'Burger King', N'bAddress 2')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (9, N'Burger King', N'bAddress 3')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (10, N'Burger King', N'bAddress 4')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (11, N'Starbucks', N'cAddress 1')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (12, N'Starbucks', N'cAddress 1')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (13, N'Starbucks', N'cAddress 2')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (14, N'Starbucks', N'cAddress 3')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (15, N'Starbucks', N'cAddress 4')
GO
INSERT [dbo].[dimRestaurant] ([restaurantID], [storeName], [restaurantAddress]) VALUES (16, N'Starbucks', N'cAddress 5')
GO
SET IDENTITY_INSERT [dbo].[dimRestaurant] OFF
GO
SET IDENTITY_INSERT [dbo].[factTable] ON 
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (4, 4, 3, 3, 2, CAST(0.7 AS Numeric(5, 1)), 897, 9)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (12, 12, 5, 2, 4, CAST(0.8 AS Numeric(5, 1)), 86, 42)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (14, 14, 2, 2, 4, CAST(0.9 AS Numeric(5, 1)), 16, 23)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (15, 1, 1, 1, 1, CAST(3.8 AS Numeric(5, 1)), 450, 23)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (16, 2, 1, 1, 1, CAST(1.7 AS Numeric(5, 1)), 123, 12)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (17, 3, 5, 1, 1, CAST(4.5 AS Numeric(5, 1)), 632, 69)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (18, 4, 3, 3, 2, CAST(0.7 AS Numeric(5, 1)), 897, 9)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (19, 5, 3, 3, 2, CAST(2.4 AS Numeric(5, 1)), 146, 45)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (20, 6, 6, 1, 3, CAST(1.9 AS Numeric(5, 1)), 245, 36)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (21, 7, 2, 1, 3, CAST(4.7 AS Numeric(5, 1)), 12, 67)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (22, 8, 2, 1, 3, CAST(2.3 AS Numeric(5, 1)), 420, 45)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (23, 9, 3, 1, 3, CAST(2.2 AS Numeric(5, 1)), 57, 78)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (24, 10, 2, 1, 3, CAST(4.1 AS Numeric(5, 1)), 75, 15)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (25, 11, 3, 2, 4, CAST(2.9 AS Numeric(5, 1)), 41, 89)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (26, 12, 5, 2, 4, CAST(0.8 AS Numeric(5, 1)), 86, 42)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (27, 13, 6, 2, 4, CAST(1.1 AS Numeric(5, 1)), 186, 123)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (28, 14, 2, 2, 4, CAST(0.9 AS Numeric(5, 1)), 16, 23)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (29, 15, 1, 2, 4, CAST(1.9 AS Numeric(5, 1)), 40, 29)
GO
INSERT [dbo].[factTable] ([factID], [restaurantID], [locationID], [genreID], [priceRangeID], [averageRating], [numberOfVotes], [numberOfPhotots]) VALUES (30, 16, 3, 2, 4, CAST(2.5 AS Numeric(5, 1)), 50, 123)
GO
SET IDENTITY_INSERT [dbo].[factTable] OFF
GO
ALTER TABLE [dbo].[brgRestaurantCuisine]  WITH CHECK ADD FOREIGN KEY([cuisineID])
REFERENCES [dbo].[dimCuisine] ([cuisineID])
GO
ALTER TABLE [dbo].[brgRestaurantCuisine]  WITH CHECK ADD  CONSTRAINT [fk_restaurantID] FOREIGN KEY([restaurantID])
REFERENCES [dbo].[dimRestaurant] ([restaurantID])
GO
ALTER TABLE [dbo].[brgRestaurantCuisine] CHECK CONSTRAINT [fk_restaurantID]
GO
ALTER TABLE [dbo].[brgRestaurantHighlight]  WITH CHECK ADD FOREIGN KEY([highlightID])
REFERENCES [dbo].[dimHighlight] ([highlightID])
GO
ALTER TABLE [dbo].[brgRestaurantHighlight]  WITH CHECK ADD  CONSTRAINT [fk_restaurantID2] FOREIGN KEY([restaurantID])
REFERENCES [dbo].[dimRestaurant] ([restaurantID])
GO
ALTER TABLE [dbo].[brgRestaurantHighlight] CHECK CONSTRAINT [fk_restaurantID2]
GO
ALTER TABLE [dbo].[factTable]  WITH CHECK ADD  CONSTRAINT [FK__factTable__genre__66603565] FOREIGN KEY([genreID])
REFERENCES [dbo].[dimGenre] ([genreID])
GO
ALTER TABLE [dbo].[factTable] CHECK CONSTRAINT [FK__factTable__genre__66603565]
GO
ALTER TABLE [dbo].[factTable]  WITH CHECK ADD  CONSTRAINT [FK__factTable__locat__656C112C] FOREIGN KEY([locationID])
REFERENCES [dbo].[dimLocation] ([locationID])
GO
ALTER TABLE [dbo].[factTable] CHECK CONSTRAINT [FK__factTable__locat__656C112C]
GO
ALTER TABLE [dbo].[factTable]  WITH CHECK ADD  CONSTRAINT [FK__factTable__price__6754599E] FOREIGN KEY([priceRangeID])
REFERENCES [dbo].[dimPriceRange] ([priceRangeID])
GO
ALTER TABLE [dbo].[factTable] CHECK CONSTRAINT [FK__factTable__price__6754599E]
GO
ALTER TABLE [dbo].[factTable]  WITH CHECK ADD  CONSTRAINT [fk_restaurantID3] FOREIGN KEY([restaurantID])
REFERENCES [dbo].[dimRestaurant] ([restaurantID])
GO
ALTER TABLE [dbo].[factTable] CHECK CONSTRAINT [fk_restaurantID3]
GO
USE [master]
GO
ALTER DATABASE [Test] SET  READ_WRITE 
GO
