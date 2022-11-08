USE [Orders]
GO

/****** Object:  Table [dbo].[MasterTableOrder]    Script Date: 05-10-2022 19:09:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[MasterTableOrder](
	[Customer Id] [int] NOT NULL,
	[Customer Name] [varchar](50) NOT NULL,
	[Billing Address] [varchar](50) NOT NULL,
	[Shipping Address] [varchar](50) NOT NULL,
	[Phone] [bigint] NOT NULL,
	[Email] [nchar](10) NOT NULL,
	[IsActive] [varchar](10) NOT NULL,
	[LastOrderedOn] [date] NOT NULL,
	[Product Id] [int] NOT NULL,
	[Product Name] [varchar](50) NOT NULL,
	[Value] [nchar](10) NOT NULL,
	[InStockQty] [bigint] NOT NULL,
	[Order Id] [int] NOT NULL,
	[Order Date] [date] NOT NULL,
	[Order Amount] [money] NOT NULL,
	[Order Total Qty] [bigint] NOT NULL,
	[Payment Mode] [nchar](10) NOT NULL,
	[Order Detail Id] [int] NOT NULL,
	[Quantity] [nchar](10) NOT NULL,
	[Delivery Date] [date] NOT NULL,
	[Feedback] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
alter table [MasterTableOrder]
alter column email varchar(20)

alter table [MasterTableOrder]
add Amount money

alter table [Customer]
alter column Phone bigint

alter table product
alter column [value] money


Insert into[dbo].[MasterTableOrder] values 
( 1101, 'Sanath', 'Gorakhpur','Deoria', 9123445500,'sanath@database.com','True',
'10-12-2022',1204,'HealthInfotech',10,20000,1315,'9-10-2022',250000.00,1200,'Cash',
11315, 5000, '10-11-2023','Great',14000)

Insert into[dbo].[MasterTableOrder] values 
( 1102, 'Aditya', 'Deoria','Gorakhpur', 9123445501,'aditya@database.com','False',
'01-11-2022',1205,'TechInfotech',11,30000,1316,'10-09-2022',550000.00,12000,'Online',
11316, 10000, '05-07-2023','Good',24000)

insert into [dbo].[Customer] values (1101,'Sanath','Gorakhpur', 'Deoria',9123445500,'sanath@database.com','True','10-12-2022')
insert into [dbo].[OrderMaster] ( CustomerId) values (1101)
insert into [dbo].[OrderDetailMaster] (OrderDetailId, ProductId,DeliveryDate)values (1501,1204,'11-10-2023')
insert into [dbo].[Product] (ProductId,[ProductName], [Rate], InStockQty)values (1204,'GalaxyWatch4',10000,20000)

insert into [dbo].[Customer] values (1102,'Aditya','Lucknow','Deoria',9123445501,'aditya@database.com','False','01-11-2022')
insert into [dbo].[OrderMaster] ( CustomerId) values (1102)
insert into [dbo].[OrderDetailMaster] (OrderDetailId, ProductId,DeliveryDate)values (1502,1205,'11-10-2023')
insert into [dbo].[Product] (ProductId,[ProductName], [Rate], InStockQty)values (1205,'AppleEarpods',25000,2000)

insert into [dbo].[Customer] values (1103,'Yash','Gurgaon','Varanasi',9123442301,'yash@database.com','True','09-30-2022')
insert into [dbo].[OrderMaster] ( CustomerId) values (1103)
insert into [dbo].[OrderDetailMaster] (OrderDetailId, ProductId,DeliveryDate)values (1503,1206,'06-20-2023')
insert into [dbo].[Product] (ProductId,[ProductName], [Rate], InStockQty)values (1206,'IPhone 14',129999,500)

insert into [dbo].[Customer] values (1108,'Amar','Noida','Bangalore',9123445501,'amar@database.com','False','01-11-2022')
insert into [dbo].[OrderMaster] ( CustomerId) values (1104)
insert into [dbo].[OrderDetailMaster] (OrderDetailId, ProductId,DeliveryDate)values (1504,1207,'11-10-2023')
insert into [dbo].[Product] (ProductId,[ProductName], [Rate], InStockQty)values (1214,'BlackBerry',9999999,1)

select * from [MasterTableOrder]
select * from Customer
select  * from Product
select * from OrderMaster
select * from [OrderDetailMaster]
go
drop table Product

Create Procedure  proc_OrderDetails
@OrderId int,
@ProductId int,
@OrderDate Date,
@OrderTotalQty BigInt
As 
Begin Transaction
   insert into[dbo].[Product] 
   ([ProductId]) values (@ProductId)
   insert into [dbo].[OrderMaster]
(OrderId, OrderDate,OrderTotalQty) values (@OrderId,getdate(),@OrderTotalQty)
Commit Transaction
 Go


select ProductId from product
where ProductName = 'GalaxyWatch4'

USE [Orders]
GO

/****** Object:  Table [dbo].[OrderDetail]    Script Date: 08-10-2022 15:34:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [int] NULL,
	[CustomerName] [varchar](20) NULL,
	[ShippingAddress] [varchar](50) NULL,
	[OrderDate] [date] NULL,
	[ProductId] [int] NULL,
	[ProductName] [varchar](20) NULL,
	[Quantity] [bigint] NULL,
	[OrderAount] [money] NULL,
	[TotalAmount] [money] NULL
) ON [PRIMARY]
GO


Create Procedure proc_OrderDetail
@Action varchar(15),
@OrderId int,
@CustomerName varchar(20),
@ShippingAddress varchar(50),
@OrderDate date,
@ProductId int,
@ProductName varchar(20),
@Quantity bigint,
@OrderAmount money,
@TotalAmount money
As
Begin
 if
 @Action='Add'   --used to insert records  
Begin 
Insert into OrderDetail values (@OrderId,@CustomerName,@ShippingAddress,@OrderDate,@ProductId,@ProductName,@Quantity,@OrderAmount,@TotalAmount)
End
 else if @Action='Select'   --used to Select records  
Begin  
    select *from [OrderDetail] 
	end
 Else If @Action='delete'  --used to delete records  
 Begin  
   delete from [OrderDetail] where orderId=@OrderID 
 end 
  ELSE IF(@Action='Update')  
    BEGIN  
UPDATE OrderDetail SET 
CustomerName=@CustomerName,ShippingAddress=@ShippingAddress,
OrderDate=@OrderDate,ProductId=@ProductId,ProductName=@ProductName,Quantity=@Quantity,OrderAount=@OrderAmount,TotalAmount=@TotalAmount where OrderId=@OrderId
END
End


select * from   OrderDetail 

Go

Create View View_OrderDetails
As
Select OrderId, CustomerName, ShippingAddress, OrderDate, ProductId, ProductName, Quantity, OrderAount, TotalAmount
from OrderDetail

select * from View_OrderDetails

Drop proc proc_OrderDetail
Go
create procedure proc_Customer
 
@Customer_Name varchar(20)

As
Begin
select * from Customer where Customer_Name = @Customer_Name
End

exec proc_Customer yash
drop proc_Customer

select * from orderInfo

create proc proc_orderInfo
@ProductName varchar(15), 
@ProductId int,
@Rate money, 
@Quantity bigint, 
@TotalAmount money

As
begin
Select productId,rate from orderInfo where ProductName= @ProductName
End

select * from product
select * from OrderInfo
insert into orderInfo (ProductName,ProductId,Rate) values('Galaxy Watch 4' , 1204, 10000)

drop table orderInfo
drop proc proc_orderInfo


create view view_OrderInfo
As 
Select * from orderInfo where Productname = ''



CREATE TABLE GRIDs
(ProductId  INT PRIMARY KEY IDENTITY,ProductName  VARCHAR (50) NOT NULL,Quantity  INT NOT NULL,PriceOfProduct  FLOAT NOT NULL,TotalAmount  INT NOT NULL)

Input data type table