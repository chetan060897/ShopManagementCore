USE [ShopManagement]
GO
/****** Object:  Table [dbo].[TblOrder]    Script Date: 13/07/2025 12:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOrder](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[ProductSizeID] [int] NULL,
	[Date] [datetime] NULL,
	[CustomerID] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[Discount] [int] NULL,
	[IsDeleted] [int] NULL,
 CONSTRAINT [PK_TblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProductRagistration]    Script Date: 13/07/2025 12:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProductRagistration](
	[ProductNameID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ProductName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblProductSize]    Script Date: 13/07/2025 12:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblProductSize](
	[ProductSizeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductNameID] [int] NULL,
	[ProductSize] [nvarchar](50) NULL,
	[ProductPrice] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblProductSize] PRIMARY KEY CLUSTERED 
(
	[ProductSizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblRagistration]    Script Date: 13/07/2025 12:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblRagistration](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblType]    Script Date: 13/07/2025 12:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductType] [nvarchar](50) NULL,
 CONSTRAINT [PK_TblType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblOrder] ON 

INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (1, 4, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 4, N'Confirmed', 50, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2, 5, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 4, N'Confirmed', 40, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (1002, 4, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 1, N'Confirmed', 40, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (1003, 6, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 1, N'Confirmed', 5, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (1004, 5, CAST(N'2024-01-04T00:00:00.000' AS DateTime), 1, N'Confirmed', 30, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (1005, 7, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 1, N'Confirmed', NULL, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2004, 1008, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 4, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2005, 1008, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 4, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2006, 1008, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 4, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2007, 1007, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 1, N'Confirmed', 50, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2008, 1007, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 1, N'Confirmed', NULL, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2009, 4, CAST(N'2024-01-05T00:00:00.000' AS DateTime), 5, N'Confirmed', 50, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2010, 1008, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 4, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2011, 7, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 5, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2012, 6, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 5, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2013, 3, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 6, N'Confirmed', 50, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2014, 4, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 6, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (2015, 5, CAST(N'2024-01-06T00:00:00.000' AS DateTime), 6, N'Confirmed', NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3010, 2009, CAST(N'2024-01-09T00:03:41.750' AS DateTime), 1, N'Confirmed', NULL, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3011, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3012, 1009, CAST(N'2024-01-19T20:21:59.723' AS DateTime), 1, N'Confirmed', NULL, 1)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3013, 4, CAST(N'2025-05-30T15:40:26.383' AS DateTime), 1, N'Confirmed', 0, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3014, 7, CAST(N'2025-05-30T15:40:26.383' AS DateTime), 1, N'Confirmed', 0, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3015, 4, CAST(N'2025-06-07T12:13:37.580' AS DateTime), 1, N'Confirmed', 0, 0)
INSERT [dbo].[TblOrder] ([OrderID], [ProductSizeID], [Date], [CustomerID], [Status], [Discount], [IsDeleted]) VALUES (3016, 1007, CAST(N'2025-06-16T19:26:15.973' AS DateTime), 1, N'Confirmed', 0, 0)
SET IDENTITY_INSERT [dbo].[TblOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[TblProductRagistration] ON 

INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (2007, 1, N'TShirt')
INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (2008, 1, N'JeansPant')
INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (2009, 8, N'Swisssirt')
INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (3009, 5, N'Saree')
INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (4009, 6, N'Cap')
INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (5009, 5, N'Saree 9')
INSERT [dbo].[TblProductRagistration] ([ProductNameID], [ProductTypeID], [ProductName]) VALUES (5010, 1, N'T-Shirt')
SET IDENTITY_INSERT [dbo].[TblProductRagistration] OFF
GO
SET IDENTITY_INSERT [dbo].[TblProductSize] ON 

INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (3, 2007, N'S', N'400')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (4, 2007, N'M', N'500')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (5, 2007, N'L', N'600')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (6, 2007, N'XL', N'700')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (7, 2007, N'XXL', N'800')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (1006, 2008, N'30"', N'700')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (1007, 2008, N'32"', N'800')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (1008, 2008, N'34"', N'900')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (1009, 3009, N'Free', N'2000')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (2009, 2009, N'M', N'700')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (3009, 4009, N'Small', N'90')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (4009, 5009, N'MMM', N'1500')
INSERT [dbo].[TblProductSize] ([ProductSizeID], [ProductNameID], [ProductSize], [ProductPrice]) VALUES (4010, 2007, N'MMM', N'678')
SET IDENTITY_INSERT [dbo].[TblProductSize] OFF
GO
SET IDENTITY_INSERT [dbo].[TblRagistration] ON 

INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (1, N'Customer', N'MAYUR KOLI', N'mayur@gmail.com', N'Male', N'MH', N'Pass@123')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (2, N'Admin', N'CHETAN KOLI', N'chetan@gmail.com', N'Male', N'MH', N'Pass@123')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (5, N'Customer', N'vishal Chauhan', N'vishal@123', N'Male', N'MH', N'Pass@123')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (4, N'Customer', N'1234', N'1234', N'Male', N'MH', N'1234')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (6, N'Customer', N'Avinash Kumbhar', N'avinash@gmail.com', N'Male', N'MH', N'Pass@123')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (1006, N'Customer', N'Akash Koli', N'akash@gmail.com', N'Male', N'Gujarat', N'Pass@123')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (2006, N'Admin', N'chetan koli', N'chetan06@gmail.com', N'Male', N'Maharashtra', N'Chetan@123')
INSERT [dbo].[TblRagistration] ([CustomerID], [Type], [Name], [Email], [Gender], [State], [Password]) VALUES (2007, N'Customer', N'Devanshi koli', N'devanshi@gmail.com', N'Female', N'Maharashtra', N'devanshi@12')
SET IDENTITY_INSERT [dbo].[TblRagistration] OFF
GO
SET IDENTITY_INSERT [dbo].[TblType] ON 

INSERT [dbo].[TblType] ([ProductTypeID], [ProductType]) VALUES (1, N'Male')
INSERT [dbo].[TblType] ([ProductTypeID], [ProductType]) VALUES (5, N'Female')
INSERT [dbo].[TblType] ([ProductTypeID], [ProductType]) VALUES (6, N'Kids')
INSERT [dbo].[TblType] ([ProductTypeID], [ProductType]) VALUES (7, N'Winter')
INSERT [dbo].[TblType] ([ProductTypeID], [ProductType]) VALUES (8, N'Rain Season')
INSERT [dbo].[TblType] ([ProductTypeID], [ProductType]) VALUES (1006, N'Summer')
SET IDENTITY_INSERT [dbo].[TblType] OFF
GO
/****** Object:  StoredProcedure [dbo].[Ragistration]    Script Date: 13/07/2025 12:41:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Ragistration](

@Type nvarchar(50) = null,
@Name nvarchar(50) = null,
@Email nvarchar(50) = null,
@Gender nvarchar(10) = null,
@State nvarchar(50) = null,
@Password nvarchar(50) = null,
@SelectProductType nvarchar(50) = null,
@ProductTypeID int = null,
@ProductName nvarchar(50) = null,
@ProductNameID int= null,
@ProductSize nvarchar(50) = null,
@ProductPrice nvarchar(50) = null,
@ProductSizeID int = null,
@OrderID int = null,
@Date DateTime = null,
@CustomerID int = null,
@TotalPrice decimal = null,
@Status nvarchar(50) = null,
@Discount int = null,
@IsDeleted int = null,
@Flag nvarchar(50) = null
)
as 
begin
if(@flag = 'CountAdmin')
begin
SELECT COUNT(*) FROM TblRagistration WHERE Type = 'Admin'
end

if(@Flag = 'RagisterData')
begin
insert into TblRagistration values(@Type,@Name,@Email,@Gender,@State,@Password)
end

if(@Flag ='ValidateCredentials')
begin
select * from TblRagistration where Type=@Type AND Email=@Email AND Password=@Password
end

if(@Flag = 'SelectType')
begin
insert into TblType values(@SelectProductType)
end

if(@Flag = 'SelectAllType')
begin
select *from TblType
end

if(@Flag = 'SaveProductName')
begin
insert into TblProductRagistration values(@ProductTypeID,@ProductName)
end

if(@Flag = 'SelectAllTypeAndName')
begin
select ProductTypeID,ProductType from TblType 
end

if(@Flag = 'SelectAllProductName')
begin
select * from TblProductRagistration where ProductTypeID =@ProductTypeID
end

if(@Flag = 'SaveProductSize')
begin
insert into TblProductSize values(@ProductNameID,@ProductSize,@ProductPrice)
end

if(@Flag = 'FetchProductSize')
begin
select ProductSizeID, ProductSize from TblProductSize where ProductNameID =@ProductNameID
end
if(@Flag = 'FetchProductPrice')
begin 
select ProductPrice from TblProductSize where ProductSizeID= @ProductSizeID
end

if(@Flag = 'FetchProductDetailsInListView')
begin
SELECT
    TblType.ProductType,
    TblProductRagistration.ProductName,
    TblProductSize.ProductSize,
    TblProductSize.ProductPrice
FROM
    TblType
INNER JOIN
    TblProductRagistration ON TblType.productTypeID = TblProductRagistration.productTypeID
INNER JOIN
    TblProductSize ON TblProductRagistration.ProductNameID = TblProductSize.ProductNameID
WHERE
    TblProductSize.ProductSizeID = @ProductSizeID
end
if(@Flag = 'SaveOrderDetails')
begin
insert into TblOrder values(@ProductSizeID,@Date,@CustomerID,@Status,@Discount,@IsDeleted)
end
if(@Flag ='FetchOrderProductInformation')
begin
SELECT
   
	TblOrder.OrderID,
    TblProductSize.ProductSizeID,
    TblRagistration.Name,
    TblRagistration.Email,
    TblType.ProductType,
    TblProductRagistration.ProductName,
    TblProductSize.ProductSize,
    TblProductSize.ProductPrice,
	(TblProductSize.ProductPrice)-(TblProductSize.ProductPrice *  TblOrder.Discount / 100) AS RealPrice
FROM
    TblOrder
INNER JOIN
    TblProductSize ON TblOrder.ProductSizeID = TblProductSize.ProductSizeID
INNER JOIN
    TblProductRagistration ON TblProductSize.ProductNameID = TblProductRagistration.ProductNameID
INNER JOIN
    TblType ON TblProductRagistration.ProductTypeID = TblType.ProductTypeID
INNER JOIN
    TblRagistration ON TblOrder.CustomerID = TblRagistration.CustomerID
	WHERE
    TblOrder.IsDeleted <> 1
end
if(@Flag ='UpdateIsDeleted')
begin
Update TblOrder set IsDeleted = 1 where OrderID = @OrderID
end
if(@Flag ='FetchAllProductDetails')
begin
SELECT
    TblType.ProductType,
    TblProductRagistration.ProductName,
    TblProductSize.ProductSize,
    TblProductSize.ProductPrice
FROM
    TblType
INNER JOIN
    TblProductRagistration ON TblType.productTypeID = TblProductRagistration.productTypeID
INNER JOIN
    TblProductSize ON TblProductRagistration.ProductNameID = TblProductSize.ProductNameID
end
if(@Flag = 'FetchUnOrderProduct')
begin
SELECT
    TblProductRagistration.ProductNameID,
    TblType.ProductType,
    TblProductRagistration.ProductName,
    TblProductSize.ProductSize
FROM
    TblType
INNER JOIN
    TblProductRagistration ON TblType.productTypeID = TblProductRagistration.productTypeID
INNER JOIN
    TblProductSize ON TblProductRagistration.ProductNameID = TblProductSize.ProductNameID

LEFT JOIN
    TblOrder ON TblProductSize.ProductSizeID = TblOrder.ProductSizeID
WHERE
    TblOrder.ProductSizeID IS NULL;
end
if(@Flag = 'UpdateDiscount')
begin
Update TblOrder set Discount = @Discount where OrderID=@OrderID
end
end			
GO
