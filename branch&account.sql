Create Table branch (
    bid varchar(10) NOT NULL,
    baddress varchar(30) NULL,
    bcity varchar(20) NULL,
 CONSTRAINT [branch_bid_pk] PRIMARY KEY CLUSTERED
(
    [bid] ASC
)
) ON [PRIMARY]

INSERT branch ([bid],[baddress],[bcity]) VALUES ('NW0001', '492 West 42nd Street','NewYork')
INSERT [branch] ([bid], [baddress], [bcity]) VALUES ('NW0002','1300 I Street','California')
INSERT [branch] ([bid], [baddress], [bcity]) VALUES ('NW0003', '350 New York Avenue Northwest ','Washington')
select * from branch

drop table branch

create view b_branch as select bid, baddress,bcity from branch
Insert into b_branch values('NW012','Rome','California')

 Alter View b_branch 
as
Select bid,baddress,bcity  from branch 
Insert into b_branch values('NW013','Texas','California')

select * from b_branch
select * from branch

drop view b_branch

create PROCEDURE proc_Branch_insert
AS
BEGIN Transaction
   declare  @b_bid varchar(10)
   declare @b_baddress varchar(50)
   declare @b_bcity varchar(10)
    insert into branch(bid,baddress,bcity) values(@b_bid,@b_bcity,@b_baddress)
Commit Transaction

exec Proc_Branch_Insert'NW004' ,'Manhattan','Washington'

drop proc Proc_account_Insert
select * from branch
ALTER PROCEDURE proc_branch_insert
AS
BEGIN
   declare  @b_bid varchar(10)
   declare @b_baddress varchar(50)
   declare @b_bcity varchar(10)
    insert into proc_branch_insert values(@b_bid,@b_bcity,@b_baddress)
   insert into branch(bid,baddress,bcity) values('NW0007','West 42nd Avenue','California')
	/*insert into branch(bid,baddress,bcity) values('NW0006','east 34th Avenue','New York')
	insert into branch(bid,baddress,bcity) values('NW0005','West 42nd Avenue','Washington')*/
END

exec proc_branch_insert 'NW0008', 'Avenue','California'
select * from branch

/*Alter Procedure B_branch
@b_bid varchar(6),
@b_bname varchar(30),
@b_bcity varchar(30)
As
Begin
  Begin Transaction
    if ((len(@b_bname) >= 0) And (len(@b_bcity) >= 0))
    Begin
      Insert into B_Branch(bid, bname, bcity) values(@b_bid, @b_bname, @b_bcity)
    End
    Else
    Begin
      Print 'Cannot insert blank Branch Name and / City'
    End
  Commit Transaction
End*/

----------------------------------------------------------------------------------------------------------------
Create Table [dbo].[Account](
    [acnumber] [varchar](6) NOT NULL,
    [customer_id] [varchar](6) NULL,
    [bid] [varchar](6) NULL,
    [opening_bal] [int] NULL,
    [opening_date] [date] NULL,
    [acc_type] [varchar](10) NULL,
    [acc_status] [varchar](10) NULL,
    [MaxDailyTransAmt] [numeric](10, 2) NULL
  CONSTRAINT [account_acnumber_pk] PRIMARY KEY CLUSTERED
(
    [acnumber] ASC
)
) ON [PRIMARY]
select *from Account
drop table Account


INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0001', N'X0001', N'NW0001', 5000, CAST(N'2022-12-15' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0002', N'X0002', N'NW0002', 10000, CAST(N'2022-06-12' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0003', N'X0003', N'NW0003', 5000, CAST(N'2022-05-17' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0004', N'X0002', N'NW0004', 5000, CAST(N'2022-01-27' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0005', N'X0006', N'NW0006', 10000, CAST(N'2022-12-17' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0006', N'X0007', N'NW0007', 5000, CAST(N'2022-08-12' AS Date), N'Saving', N'Suspended', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0007', N'X0007', N'NW0001', 5000, CAST(N'2022-10-02' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0008', N'X0001', N'NW0003', 10000, CAST(N'2022-11-09' AS Date), N'corporate', N'Terminated', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0009', N'X0003', N'NW0007', 5000, CAST(N'2022-11-30' AS Date), N'savings', N'Terminated', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) VALUES (N'N0010', N'X0004', N'NW0002', 10000, CAST(N'2022-03-01' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))

create view b_account as select [acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]from Account
Select * from b_account
drop view b_account

Insert into b_account 
values ('NW0011', N'X0006', N'NW0002', '10000','2022-03-01' , N'corporate', N'Active','100000')

Delete from b_account where bid= 'NW0011'
Delete from b_account where acc_type = 'Corporate'
Select * from b_account

Create Procedure Proc_account_Insert
   @acnumber [varchar](6),
    @customer_id [varchar](6),
    @bid[varchar](6),
    @opening_bal [int],
    @opening_date [date],
    @acc_type [varchar](10),
    @acc_status[varchar](10),
    @MaxDailyTransAmt[numeric](10, 2)
    AS
	Begin Transaction
  Insert into account([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) 
  values( @acnumber, @customer_id, @bid, @opening_bal, @opening_date, @acc_type, @acc_status, @MaxDailyTransAmt)
Commit Transaction

Exec Proc_account_Insert 'N0010', N'X0004', N'NW0002', '10000', '2022-03-01', N'corporate', N'Active', '100000.00'
Exec proc_account_insert 'N0003', 'X0006', 'NW0001', '10000', '2022-04-10', 'savings', 'Active','200000'
Select * from Branch
select * from Account
drop proc Proc_account_Insert

Alter Procedure Proc_account_Insert
@acnumber [varchar](6),
    @customer_id [varchar](6),
    @bid[varchar](6),
    @opening_bal [int],
    @opening_date [date],
    @acc_type [varchar](10),
    @acc_status[varchar](10),
    @MaxDailyTransAmt[numeric](10, 2)
As
Begin
 Begin Transaction
   if ((len(@acc_type) > 0) And (len(@acnumber) > 0))
   Begin
  Insert into account([acnumber], [customer_id], [bid], [opening_bal], [opening_date], [acc_type], [acc_status], [MaxDailyTransAmt]) 
  values( @acnumber, @customer_id, @bid, @opening_bal, @opening_date, @acc_type, @acc_status, @MaxDailyTransAmt)
   End
    Else
      Begin
          Print 'Cannot insert blank Account number / Type'
   End
 Commit Transaction
End

Exec Proc_account_Insert N'N0007', N'X0007', N'NW0001','5000','2022-10-02','Corporate', 'Terminated','50000.00' 
Exec Proc_account_Insert '', N'X0007', N'NW0001','5000','2022-10-02','', 'Terminated','50000.00' 

 select * from account