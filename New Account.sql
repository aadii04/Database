Create Table [Account](
    Account_Number INT PRIMARY KEY,
    Customer_Id INT NOT NULL,
    Branch_Id INT NOT NULL,
    Opening_Balance INT ,
    Opening_Date Date NOT NULL,
    Account_Type VARCHAR (10) ,
    Account_Status VARCHAR (10) ,
    MaxDailyTransAmt NUMERIC (10, 2)
 CONSTRAINT [account_Branch_Id_Fk] 
 FOREIGN KEY(Branch_Id) References Branch(Branch_Id)) 
 select * from Account

 INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt]) 
 VALUES (N'N0001', N'X0001', N'NW0001', 5000, CAST(N'2022-12-15' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt]) 
VALUES (N'N0002', N'X0002', N'NW0002', 10000, CAST(N'2022-06-12' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt]) 
VALUES (N'N0003', N'X0003', N'NW0003', 5000, CAST(N'2022-05-17' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt]) 
VALUES (N'N0004', N'X0002', N'NW0004', 5000, CAST(N'2022-01-27' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt])
VALUES (N'N0005', N'X0006', N'NW0006', 10000, CAST(N'2022-12-17' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt])
VALUES (N'N0006', N'X0007', N'NW0007', 5000, CAST(N'2022-08-12' AS Date), N'Saving', N'Suspended', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt])
VALUES (N'N0007', N'X0007', N'NW0001', 5000, CAST(N'2022-10-02' AS Date), N'Saving', N'Active', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt]) 
VALUES (N'N0008', N'X0001', N'NW0003', 10000, CAST(N'2022-11-09' AS Date), N'corporate', N'Terminated', CAST(100000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt])
VALUES (N'N0009', N'X0003', N'NW0007', 5000, CAST(N'2022-11-30' AS Date), N'savings', N'Terminated', CAST(50000.00 AS Numeric(10, 2)))
INSERT [dbo].[account] ([Account_Number], [Customer_Id], [Branch_Id], [Opening_Balance], [Opening_Date], [Account_Type], [Account_Status], [MaxDailyTransAmt])
VALUES (N'N0010', N'X0004', N'NW0002', 10000, CAST(N'2022-03-01' AS Date), N'corporate', N'Active', CAST(100000.00 AS Numeric(10, 2)))