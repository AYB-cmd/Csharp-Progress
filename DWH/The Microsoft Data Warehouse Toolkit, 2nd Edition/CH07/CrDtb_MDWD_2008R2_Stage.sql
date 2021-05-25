/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate the staging database used in the sample SSIS solutions.

The staging database contains several sets of tables. The first set correspond to the
source tables used in the MDWT2008_Extract SSIS solution. Extract first to a staging
area like this staging database, then build Transform-and-Load packages from there.

The staging database also contains decode tables.

Finally, there are a handful of staging tables that are intermediate tables, to support
some of the transform-and-load process.  
*/
DROP DATABASE MDWT_2008R2_Stage
GO
CREATE DATABASE MDWT_2008R2_Stage
GO
ALTER DATABASE MDWT_2008R2_Stage
SET RECOVERY SIMPLE
GO
USE MDWT_2008R2_Stage
;

/******************************************************************
The following tables are purely for extracting historical data, to illustrate
the design pattern for two-step E/TL packages.
StageCurrency
StageCurrencyInUse
StageSpecialOffer
StageProduct
StageProductModel
StageProductSubCategory
StageProductCategory
StageSalesReason
StageDemographics
StageCustomerIndividual
StageSalesTerritories
StageStore
StageStoreContacts
StageStoreDemographics
StageEmployee
StageDepartment
StageEmployeeTerritory
StageCurrencyRate
StageSalesOrderHeader
StageSalesOrderDetail
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageCurrency') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [StageCurrency]
;
CREATE TABLE [StageCurrency](
	[CurrencyCode] [nchar](3) NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[ModifiedDate] datetime NOT NULL,
CONSTRAINT [PK_StageCurrency] PRIMARY KEY CLUSTERED 
( [CurrencyCode] ASC )
) ON [PRIMARY]
;	


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageCurrencyInUse') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table StageCurrencyInUse
;
CREATE Table StageCurrencyInUse (
CurrencyCode nchar(3) NOT NULL,
CONSTRAINT PK_StageCurrencyInUse PRIMARY KEY CLUSTERED
( CurrencyCode ASC )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageSpecialOffer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [StageSpecialOffer]
;
CREATE TABLE [StageSpecialOffer](
	[SpecialOfferID] [int] NOT NULL,
	[Description] [nvarchar](255) NOT NULL,
	[DiscountPct] [smallmoney] NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[MinQty] [int] NOT NULL,
	[MaxQty] [int] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SpecialOffer] PRIMARY KEY CLUSTERED 
( [SpecialOfferID] ASC)
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageProduct
;
CREATE TABLE StageProduct (
	[ProductID] [int] NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[FinishedGoodsFlag] bit NOT NULL,
	[Color] [nvarchar](15) NULL,
	[SafetyStockLevel] [smallint] NOT NULL,
	[ReorderPoint] [smallint] NOT NULL,
	[StandardCost] [money] NOT NULL,
	[ListPrice] [money] NOT NULL,
	[Size] [nvarchar](5) NULL,
	[SizeUnitMeasureCode] [nchar](3) NULL,
	[WeightUnitMeasureCode] [nchar](3) NULL,
	[Weight] [decimal](8, 2) NULL,
	[DaysToManufacture] [int] NOT NULL,
	[ProductLine] [nchar](2) NULL,
	[Class] [nchar](2) NULL,
	[Style] [nchar](2) NULL,
	[ProductSubcategoryID] [int] NULL,
	[ProductModelID] [int] NOT NULL,
	[SellStartDate] [datetime] NOT NULL,
	[SellEndDate] [datetime] NULL,
	[DiscontinuedDate] [datetime] NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
( [ProductID] ASC )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageProductModel') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageProductModel
;
CREATE TABLE StageProductModel (
	[ProductModelID] [int] NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductModel] PRIMARY KEY CLUSTERED 
( [ProductModelID] ASC )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageProductSubCategory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table StageProductSubCategory
;
CREATE TABLE [dbo].[StageProductSubCategory](
	[ProductSubcategoryID] [int] NOT NULL,
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductSubCategory] PRIMARY KEY CLUSTERED 
( [ProductSubcategoryID] ASC )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageProductCategory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table StageProductCategory
;
CREATE TABLE [dbo].[StageProductCategory](
	[ProductCategoryID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
( [ProductCategoryID] ASC )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageSalesReason') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageSalesReason
;
CREATE TABLE StageSalesReason(
	[SalesReasonID] [int] NOT NULL,
	[Name] nvarchar(50) NOT NULL,
	[ReasonType] nvarchar(50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SalesReason] PRIMARY KEY CLUSTERED 
( [SalesReasonID] ASC )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageDemographics') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageDemographics
;
CREATE TABLE StageDemographics (
BusinessEntityID	int NOT NULL,
TotalPurchaseYTD	money NULL,
DateFirstPurchase	datetime NULL,
BirthDate	datetime NULL,
MaritalStatus nchar(1) NULL,
YearlyIncome nvarchar(30) NULL,
Gender nchar(1) NULL,
TotalChildren int NULL,
NumberChildrenAtHome int NULL,
Education nvarchar(30) NULL,
Occupation nvarchar(30) NULL,
HomeOwnerFlag bit NULL,
NumberCarsOwned int NULL,
 CONSTRAINT [PK_StageDemographics] PRIMARY KEY CLUSTERED 
( BusinessEntityID ASC )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageCustomerIndividual') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageCustomerIndividual
;
CREATE TABLE StageCustomerIndividual (
CustomerID INT NOT NULL,
BusinessEntityID INT NOT NULL,
AccountNumber varchar(10) NOT NULL,
AddressID int NOT NULL,
Title nvarchar(8) NULL,
FirstName nvarchar(50) NOT NULL,
MiddleName nvarchar(50) NULL,
LastName nvarchar(50) NOT NULL,
EmailAddress nvarchar(50) NULL,
PhoneNumber nvarchar(25) NULL,
AddressLine1 nvarchar(60) NOT NULL,
AddressLine2 nvarchar(60) NULL,
City nvarchar(30) NOT NULL,
PostalCode nvarchar(15) NOT NULL,
StateProvinceCode nchar(3) NOT NULL,
StateProvinceName nvarchar(50) NOT NULL,
CountryRegionCode nchar(3) NOT NULL,
CountryRegionName nvarchar(50) NOT NULL,
 CONSTRAINT [PK_StageCustomerIndividual] PRIMARY KEY CLUSTERED 
( CustomerID ASC )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageSalesTerritories') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageSalesTerritories
;
CREATE TABLE StageSalesTerritories (
BusinessEntityID INT NOT NULL,
TerritoryID INT NOT NULL,
SalesTerritory nvarchar(50) NOT NULL,
SalesTerritoryCountry nvarchar(50) NOT NULL,
SalesTerritoryGroup nvarchar(50) NOT NULL,
StartDate datetime,
EndDate datetime,
 CONSTRAINT [PK_StageSalesTerritories] PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC,
	[StartDate] ASC,
	[TerritoryID] ASC
)
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageStore') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageStore
;
CREATE TABLE StageStore (
CustomerID INT NOT NULL,
AccountNumber varchar(10) NOT NULL,
[BusinessEntityID] int NOT NULL,
[Name] nvarchar(50) NOT NULL,
[AddressLine1] nvarchar(60) NOT NULL,
[AddressLine2] nvarchar(60) NULL,
[City] nvarchar(30) NOT NULL,
StateProvinceCode nchar(3) NOT NULL,
StateProvinceName nvarchar(50) NOT NULL,
[PostalCode]  nvarchar(15),
CountryRegionCode nchar(3) NOT NULL,
CountryRegionName nvarchar(50) NOT NULL,
 CONSTRAINT [PK_StageStore] PRIMARY KEY CLUSTERED 
( CustomerID ASC )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageStoreContacts') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageStoreContacts
;
CREATE TABLE StageStoreContacts (
BusinessEntityID int NOT NULL,
ContactType nvarchar(50) NOT NULL,
Title nvarchar(8) NULL,
FirstName nvarchar(50) NOT NULL,
MiddleName nvarchar(50) NULL,
LastName nvarchar(50) NOT NULL,
EmailAddress nvarchar(50) NULL,
PhoneNumber nvarchar(25) NULL,
CONSTRAINT PK_StageStoreContacts PRIMARY KEY CLUSTERED
( BusinessEntityID ASC, ContactType )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageStoreDemographics') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageStoreDemographics
;
CREATE TABLE StageStoreDemographics (
BusinessEntityID INT NOT NULL,
AnnualSales money NULL,
AnnualRevenue money NULL,
BankName nvarchar(50) NULL,
BusinessType nvarchar(5) NULL,
YearOpened INT NULL,
NumberEmployees INT NULL,
CONSTRAINT PK_StageStoreDemographics PRIMARY KEY CLUSTERED
( BusinessEntityID )
) ON [PRIMARY]
;

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageEmployee') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageEmployee
;
CREATE TABLE StageEmployee (
BusinessEntityID INT NOT NULL,
NationalIDNumber nvarchar(15) NOT NULL,
FirstName nvarchar(50) NOT NULL,
MiddleName nvarchar(50) NULL,
LastName nvarchar(50) NOT NULL,
LoginID nvarchar(256) NOT NULL,
JobTitle nvarchar(50) NOT NULL,
BirthDate date NOT NULL,
MaritalStatus nchar(1) NOT NULL,
Gender nchar(1) NOT NULL,
HireDate date NOT NULL,
SalariedFlag bit NOT NULL,
CurrentFlag bit NOT NULL,
EmailAddress nvarchar(50) NOT NULL,
PhoneNumber nvarchar(25) NOT NULL,
CONSTRAINT PK_StageEmployee PRIMARY KEY CLUSTERED
( BusinessEntityID )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageDepartment') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageDepartment
;
CREATE TABLE StageDepartment (
BusinessEntityID int NOT NULL,
DepartmentID int NOT NULL,
DepartmentName nvarchar(50) NOT NULL,
GroupName nvarchar(50) NOT NULL,
StartDate date NOT NULL,
EndDate date NULL,
CONSTRAINT PK_StageDepartment PRIMARY KEY CLUSTERED
( BusinessEntityID, StartDate )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageEmployeeTerritory') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageEmployeeTerritory
;
CREATE TABLE StageEmployeeTerritory (
BusinessEntityID int NOT NULL,
TerritoryID int NULL,
SalesTerritory nvarchar(50),
SalesTerritoryCountry nvarchar(50),
SalesTerritoryGroup nvarchar(50),
CONSTRAINT PK_StageEmployeeTerritory PRIMARY KEY CLUSTERED
( BusinessEntityID )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageCurrencyRate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageCurrencyRate
;
CREATE TABLE StageCurrencyRate (
CurrencyRateID int not null,
CurrencyRateDate datetime not null,
FromCurrencyCode nchar(3) not null,
ToCurrencyCode nchar(3) not null,
AverageRate money not null,
EndOfDayRate money not null,
ModifiedDate datetime not null,
CONSTRAINT PK_StageCurrencyRate PRIMARY KEY CLUSTERED
( CurrencyRateID ) 
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageSalesOrderHeader') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageSalesOrderHeader
;
CREATE TABLE StageSalesOrderHeader (
SalesOrderID int not null,
RevisionNumber tinyint not null,
SalesOrderNumber nvarchar(25) not null,
PurchaseOrderNumber nvarchar(25) null,
AccountNumber nvarchar(15) null,
OrderDate datetime not null,
DueDate datetime not null,
ShipDate datetime null,
CustomerID int not null,
SalesPersonID int null,
CurrencyRateID int null,
[Status] tinyint not null,
OnlineOrderFlag bit not null,
SubTotal money not null,
TaxAmt money not null,
Freight money not null,

CONSTRAINT PK_StageSalesOrderHeader PRIMARY KEY CLUSTERED
( SalesOrderID )
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.StageSalesOrderDetail') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE StageSalesOrderDetail
;
CREATE TABLE StageSalesOrderDetail (
SalesOrderID int not null,
SalesOrderDetailID int not null,
ProductID int not null,
SpecialOfferID int not null,
OrderQty smallint not null,
UnitPrice money not null,
UnitPriceDiscount money not null,
CONSTRAINT PK_StageSalesOrderDetail PRIMARY KEY CLUSTERED
( SalesOrderID, SalesOrderDetailID )
) ON [PRIMARY]
;

/******************************************************************
The next tables are staging tables to hold error rows or intermediate results
Error_FactExchangeRates
Error_FactOrders
Stage2_FactOrders
*/
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.Error_FactExchangeRates') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Error_FactExchangeRates
;
CREATE TABLE Error_FactExchangeRates (
	CurrencyRateID int not null,
	FromCurrencyCode nchar(3),
	CurrencyRateDate datetime,
	[CurrencyKey] [smallint],
	[DateKey] [int],
	[CloseRate] [float] NULL,
	[AvgRate] [float] NULL,
	[InsertAuditKey] [int] NOT NULL,
	[UpdateAuditKey] [int] NOT NULL
) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.Error_FactOrders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Error_FactOrders
;
CREATE TABLE Error_FactOrders (
	ProductSKU int NULL,
	CustomerID int NULL,
	OrderDate datetime NULL,
	DueDate datetime NULL,
	BKSalesReasonID smallint NULL,
	BKSpecialOfferID int NULL,
	BKCurrencyCode nchar(3) NULL,
	BKEmployeeID int NULL,
	[ProductKey] [int]  NULL,
	[CustomerKey] [int]  NULL,
	[OrderDateKey] [int]  NULL,
	[DueDateKey] [int]  NULL,
	[OrderInfoKey] [smallint]  NULL,
	[PromotionKey] [smallint]  NULL,
	[CurrencyKey] [smallint]  NULL,
	[SalesRepKey] [int]  NULL,
	[InsertAuditKey] [int]  NULL,
	[UpdateAuditKey] [int]  NULL,
	[SalesOrderNum] [int]  NULL,
	[SalesOrderLineNum] [int]  NULL,
	[SalesOrderRevisionNum] [tinyint]  NULL,
	[OrderQty] [smallint] NULL,
	[UnitPriceUSD] [money] NULL,
	[ExtendedAmtUSD] [money] NULL,
	[UnitPriceDiscountPct] [float] NULL,
	[DiscountUSD] [money] NULL,
	[ProductStdCostUSD] [money] NULL,
	[TotalProductCostUSD] [money] NULL,
	[SalesAmtUSD] [money] NULL,
	[SalesAmtLocal] [money] NULL,
	[TaxUSD] [money] NULL,
	[TaxLocal] [money] NULL,
	[FreightUSD] [money] NULL,
	[FreightLocal] [money] NULL,
	[CustomerPONum] [nvarchar](25) NULL
	) ON [PRIMARY]
;


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.Stage2_FactOrders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE Stage2_FactOrders
;
CREATE TABLE Stage2_FactOrders (
	ProductSKU int NULL,
	CustomerID int NULL,
	OrderDate datetime NULL,
	DueDate datetime NULL,
	BKSalesReasonID smallint NULL,
	BKSpecialOfferID int NULL,
	BKCurrencyCode nchar(3) NULL,
	BKEmployeeID int NULL,
	[SalesOrderNum] [int]  NULL,
	[SalesOrderLineNum] [int]  NULL,
	[SalesOrderRevisionNum] [tinyint]  NULL,
	[OrderQty] [smallint] NULL,
	[UnitPriceUSD] [money] NULL,
	[ExtendedAmtUSD] [money] NULL,
	[UnitPriceDiscountPct] [float] NULL,
	[DiscountUSD] [money] NULL,
	[ProductStdCostUSD] [money] NULL,
	[TotalProductCostUSD] [money] NULL,
	[SalesAmtUSD] [money] NULL,
	[SalesAmtLocal] [money] NULL,
	[TaxUSD] [money] NULL,
	[TaxLocal] [money] NULL,
	[FreightUSD] [money] NULL,
	[FreightLocal] [money] NULL,
	[CustomerPONum] [nvarchar](25) NULL,
	[InsertAuditKey] [int]  NULL,
	[UpdateAuditKey] [int]  NULL
	) ON [PRIMARY]
;