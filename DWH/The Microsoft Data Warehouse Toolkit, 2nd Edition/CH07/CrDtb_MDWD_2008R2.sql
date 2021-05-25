/****** Object:  Database MDWT_2008R2    Script Date: 2/14/2011 11:27:15 AM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 4

You can use this Excel workbook as a data modeling tool during the logical design phase of your project.
As discussed in the book, it is in some ways preferable to a real data modeling tool during the inital design.
We expect you to move away from this spreadsheet and into a real modeling tool during the physical design phase.
The authors provide this macro so that the spreadsheet isn't a dead-end. You can 'import' into your
data modeling tool by generating a database using this script, then reverse-engineering that database into
your tool.

Uncomment the next lines if you want to drop and create the database
*/
DROP DATABASE MDWT_2008R2
GO
CREATE DATABASE MDWT_2008R2
GO
ALTER DATABASE MDWT_2008R2
SET RECOVERY SIMPLE
GO

USE MDWT_2008R2
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Default description - you should change this.'
;





-- Create a schema to hold user views (set schema name on home page of workbook).
-- It would be good to do this only if the schema doesn't exist already.
GO
CREATE SCHEMA MDWT
GO






/* Drop table dbo.DimCustomer */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCustomer') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCustomer 
;

/* Create table dbo.DimCustomer */
CREATE TABLE dbo.DimCustomer (
   [CustomerKey]  int IDENTITY  NOT NULL
,  [CustomerID]  int   NOT NULL
,  [AccountNumber]  varchar(10)   NOT NULL
,  [CustomerType]  nchar(10)   NOT NULL
,  [CustomerIDName]  nvarchar(100)   NOT NULL
,  [CustomerTitle]  nchar(8)   NOT NULL
,  [FirstName]  nvarchar(50)   NOT NULL
,  [MiddleName]  nvarchar(50)   NOT NULL
,  [LastName]  nvarchar(50)   NOT NULL
,  [CustomerFullName]  nvarchar(100)   NOT NULL
,  [BirthDate]  datetime   NOT NULL
,  [MaritalStatus]  nchar(7)   NOT NULL
,  [Gender]  nchar(7)   NOT NULL
,  [EmailAddress]  nvarchar(50)   NOT NULL
,  [IncomeRange]  nvarchar(50)   NOT NULL
,  [TotalChildren]  tinyint   NOT NULL
,  [NumberChildrenAtHome]  tinyint   NOT NULL
,  [Education]  nvarchar(30)   NOT NULL
,  [Occupation]  nvarchar(30)   NOT NULL
,  [HomeOwnerStatus]  nvarchar(15)   NOT NULL
,  [NumberCarsOwned]  tinyint   NOT NULL
,  [DateFirstPurchase]  date   NOT NULL
,  [CustomerValueScore]  nvarchar(15)   NOT NULL
,  [Phone]  nvarchar(20)   NOT NULL
,  [AddressLine1]  nvarchar(60)   NOT NULL
,  [AddressLine2]  nvarchar(60)   NOT NULL
,  [PostalCode]  nvarchar(15)   NOT NULL
,  [City]  nvarchar(100)   NOT NULL
,  [CityAsRecorded]  nvarchar(100)   NOT NULL
,  [StateProvinceCode]  nchar(3)   NOT NULL
,  [StateProvince]  nvarchar(50)   NOT NULL
,  [CountryCode]  nchar(3)   NOT NULL
,  [Country]  nvarchar(50)   NOT NULL
,  [ResellerName]  nvarchar(50)   NOT NULL
,  [BusinessType]  nvarchar(20)   NOT NULL
,  [NumberEmployees]  int   NOT NULL
,  [AnnualSales]  money   NOT NULL
,  [AnnualRevenue]  money   NOT NULL
,  [YearOpened]  int   NOT NULL
,  [BankName]  nvarchar(50)   NOT NULL
,  [OrderFrequency]  nchar(15)   NOT NULL
,  [CurrentStoreValueScore]  nchar(15)   NOT NULL
,  [FirstOrderDate]  datetime   NOT NULL
,  [LastOrderDate]  datetime   NOT NULL
,  [RowIsCurrent]  nchar(1)   NOT NULL
,  [RowStartDate]  date   NOT NULL
,  [RowEndDate]  date  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimCustomer] PRIMARY KEY CLUSTERED 
( [CustomerKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Customer', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'The Customer dimension includes all Adventure Works customers, both resellers and individuals', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCustomer
;

SET IDENTITY_INSERT dbo.DimCustomer ON
;
INSERT INTO dbo.DimCustomer (CustomerKey, CustomerID, AccountNumber, CustomerType, CustomerIDName, CustomerTitle, FirstName, MiddleName, LastName, CustomerFullName, BirthDate, MaritalStatus, Gender, EmailAddress, IncomeRange, TotalChildren, NumberChildrenAtHome, Education, Occupation, HomeOwnerStatus, NumberCarsOwned, DateFirstPurchase, CustomerValueScore, Phone, AddressLine1, AddressLine2, PostalCode, City, CityAsRecorded, StateProvinceCode, StateProvince, CountryCode, Country, ResellerName, BusinessType, NumberEmployees, AnnualSales, AnnualRevenue, YearOpened, BankName, OrderFrequency, CurrentStoreValueScore, FirstOrderDate, LastOrderDate, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, 0, 'AW00000000', 'Unk type', 'Unk customer', '', 'No name', '', 'No name', 'No name', '', 'Unknown', 'Unknown', 'No email', 'Unknown income', 0, 0, 'Unknown education', 'Unknown occupation', 'Unknown status', 0, '12/31/9999', '0', 'Unk phone', 'Unk address', '', 'Unknown', 'Unknown', 'Unknown', 'N/A', 'Unknown', 'N/A', 'Unknown', 'Unknown', 'Unknown', 0, 0, 0, 0, 'Unknown', 'Unknown', 'Unknown', '12/31/9999', '12/31/9999', 'Y', '12/31/1899', '12/31/9999', 'Unknown member row', -1, -1)
;
SET IDENTITY_INSERT dbo.DimCustomer OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Customer]'))
DROP VIEW [MDWT].[Customer]
GO
CREATE VIEW [MDWT].[Customer] AS 
SELECT [CustomerKey] AS [CustomerKey]
, [CustomerID] AS [CustomerID]
, [AccountNumber] AS [AccountNumber]
, [CustomerType] AS [CustomerType]
, [CustomerIDName] AS [CustomerIDName]
, [CustomerTitle] AS [CustomerTitle]
, [FirstName] AS [FirstName]
, [MiddleName] AS [MiddleName]
, [LastName] AS [LastName]
, [CustomerFullName] AS [CustomerFullName]
, [BirthDate] AS [BirthDate]
, [MaritalStatus] AS [MaritalStatus]
, [Gender] AS [Gender]
, [EmailAddress] AS [EmailAddress]
, [IncomeRange] AS [IncomeRange]
, [TotalChildren] AS [TotalChildren]
, [NumberChildrenAtHome] AS [NumberChildrenAtHome]
, [Education] AS [Education]
, [Occupation] AS [Occupation]
, [HomeOwnerStatus] AS [HomeOwnerStatus]
, [NumberCarsOwned] AS [NumberCarsOwned]
, [DateFirstPurchase] AS [DateFirstPurchase]
, [CustomerValueScore] AS [CustomerValueScore]
, [Phone] AS [Phone]
, [AddressLine1] AS [AddressLine1]
, [AddressLine2] AS [AddressLine2]
, [PostalCode] AS [PostalCode]
, [City] AS [City]
, [CityAsRecorded] AS [CityAsRecorded]
, [StateProvinceCode] AS [StateProvinceCode]
, [StateProvince] AS [StateProvince]
, [CountryCode] AS [CountryCode]
, [Country] AS [Country]
, [ResellerName] AS [ResellerName]
, [BusinessType] AS [BusinessType]
, [NumberEmployees] AS [NumberEmployees]
, [AnnualSales] AS [AnnualSales]
, [AnnualRevenue] AS [AnnualRevenue]
, [YearOpened] AS [YearOpened]
, [BankName] AS [BankName]
, [OrderFrequency] AS [OrderFrequency]
, [CurrentStoreValueScore] AS [CurrentStoreValueScore]
, [FirstOrderDate] AS [FirstOrderDate]
, [LastOrderDate] AS [LastOrderDate]
FROM dbo.DimCustomer
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AccountNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerIDName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerIDName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerTitle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MiddleName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerFullName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFullName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BirthDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MaritalStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Gender', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmailAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IncomeRange', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TotalChildren', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NumberChildrenAtHome', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Education', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Occupation', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'HomeOwnerStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NumberCarsOwned', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateFirstPurchase', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerValueScore', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerValueScore'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Phone', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AddressLine1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AddressLine2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PostalCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CityAsRecorded', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'StateProvinceCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'StateProvince', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CountryCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ResellerName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BusinessType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NumberEmployees', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AnnualSales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AnnualRevenue', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'YearOpened', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BankName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderFrequency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'OrderFrequency'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrentStoreValueScore', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CurrentStoreValueScore'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FirstOrderDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LastOrderDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowIsCurrent', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowStartDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowEndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowChangeReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Source system key; Numeric account number from the transaction system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Account Number from the transaction system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The type of the customer based on our relationship', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer full name (Store name for resellers) prepended with CustomerID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerIDName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Courtesy title, eg Ms., Mr. Often blank.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'First name of the customer or reseller contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Middle name of the customer or reseller contact (often blank)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Last name of the customer or reseller contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Full name of the customer as Last, First Middle (Store name for resellers)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFullName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date of birth for an internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Marital status of an internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Gender of an internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s email address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Annual income of an internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Total number of children for an internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of children at home, internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Education level, internet customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'General occupation for an internet customer, eg Managerial', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is the internet customer a homeowner?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of cars the internet customer owns', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date internet customer first purchased a bike (self-reported)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s current lifetime value score to AdventureWorks', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerValueScore'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Customer''s phone number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'First line of customer''s address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'2nd line of customer''s address (usually blank)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Postal code, eg zip code', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'City, cleaned up by way of postal code', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'City as it actually exists in the source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State or Province code', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'State or province name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country code', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Country name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Reselling store''s name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Reseller''s business type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of employees at the store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Store''s annual sales, self-reported', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Store''s annual revenue, self-reported', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Year the store opened', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Store''s bank name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Does this reseller tend to order Annually, Semiannually, or Quarterly?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'OrderFrequency'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Current store value to Adventure Works', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CurrentStoreValueScore'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date store first ordered from us', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date store most recently ordered from us', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4 …', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'AW00000001', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Reseller, Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Ms., Mr.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Tom, Dick, Harry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Married, Single, Unknown', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Male, Female, Unknown', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Homeowner, Not Homeowner', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'3/19/2004', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerIDName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFullName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerValueScore'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'OrderFrequency'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CurrentStoreValueScore'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstOrderDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Account', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Account', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Account', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerIDName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFullName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Individual demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerValueScore'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Contact info', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'OrderFrequency'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CurrentStoreValueScore'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Reseller demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode CustomerType from S/I to Reseller/Individual else Unknown', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'AcctNum + '' '' + DW.FullName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerIDName'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'LastName + '', '' + FirstName + '' '' + MiddleName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFullName'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <BirthDate>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <MaritalStatus>. Decode to Single/Married', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <Gender>. Decode to Female/Male/Unknown', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <YearlyIncome>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <TotalChildren>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <NumberChildrenAtHome>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <Education>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <Occupation>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <HouseOwnerFlag>. Decode to Homeowner / Not Homeowner', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <NumberCarsOwned>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <DateFirstPurchase>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Out of scope for Phase 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerValueScore'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from Person.Contact on CustomerID; pick up the most recent address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'see notes for AddrLine1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'see notes for AddrLine1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Out of scope for Phase 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'see notes for AddrLine1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from Person.Address.StateProvinceId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from Person.Address.StateProvinceId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from Person.StateProvince.CountryRegionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from Person.StateProvince.CountryRegionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <BusinessType>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <NumberEmployees>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <AnnualSales>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <AnnualRevenue>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <YearOpened>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Shred Demographics: <BankName>', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Out of scope for Phase 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'OrderFrequency'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Out of scope for Phase 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CurrentStoreValueScore'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Derived from order trxns. Post-load update.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstOrderDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Derived from order trxns. Post-load update.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastOrderDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerIDName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerFullName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerValueScore'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'OrderFrequency'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CurrentStoreValueScore'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastOrderDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Individual', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'CustomerAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'CustomerAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StateProvince', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'StateProvince', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'CountryRegion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Store', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AccountNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CustomerType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MiddleName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmailAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Phone', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AddressLine1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'AddressLine2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'PostalCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'City', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'StateProvinceCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CountryRegionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'ResellerName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'varchar(10)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AccountNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(8)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CustomerTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'FirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'LastName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'EmailAddress'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'IncomeRange'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'TotalChildren'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberChildrenAtHome'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Education'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Occupation'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'HomeOwnerStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberCarsOwned'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'DateFirstPurchase'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(25)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Phone'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(60)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine1'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(60)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AddressLine2'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(15)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'PostalCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(30)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'City'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(30)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CityAsRecorded'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(3)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvinceCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'StateProvince'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(3)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'CountryCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'Country'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BusinessType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'NumberEmployees'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualSales'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'AnnualRevenue'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'YearOpened'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'xml', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCustomer', @level2type=N'COLUMN', @level2name=N'BankName'; 
;





/* Drop table dbo.DimCurrency */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimCurrency') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimCurrency 
;

/* Create table dbo.DimCurrency */
CREATE TABLE dbo.DimCurrency (
   [CurrencyKey]  smallint IDENTITY  NOT NULL
,  [BKCurrencyCode]  nchar(3)   NOT NULL
,  [Currency]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [IsCurrencyInUse]  nchar(1)  DEFAULT 'N' NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimCurrency] PRIMARY KEY CLUSTERED 
( [CurrencyKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCurrency
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Currency', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCurrency
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Dimension table that itemizes different currencies', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimCurrency
;

SET IDENTITY_INSERT dbo.DimCurrency ON
;
INSERT INTO dbo.DimCurrency (CurrencyKey, BKCurrencyCode, Currency, IsCurrencyInUse, InsertAuditKey, UpdateAuditKey)
VALUES (-1, 'UNK', 'Unknown', 'Y', -1, -1)
;
SET IDENTITY_INSERT dbo.DimCurrency OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Currency]'))
DROP VIEW [MDWT].[Currency]
GO
CREATE VIEW [MDWT].[Currency] AS 
SELECT [CurrencyKey] AS [CurrencyKey]
, [BKCurrencyCode] AS [CurrencyCode]
, [Currency] AS [Currency]
, [IsCurrencyInUse] AS [IsCurrencyInUse]
FROM dbo.DimCurrency
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrencyKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrencyCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsCurrencyInUse', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'IsCurrencyInUse'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Currency Code from trxn system, eg USD, EUR', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Currency name, eg US Dollar, EURO', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this currency currently in use in the system?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'IsCurrencyInUse'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Dollar, Euro', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'IsCurrencyInUse'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'IsCurrencyInUse'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'IsCurrencyInUse'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CurrencyCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(3)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'BKCurrencyCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimCurrency', @level2type=N'COLUMN', @level2name=N'Currency'; 
;





/* Drop table dbo.DimDate */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimDate') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimDate 
;

/* Create table dbo.DimDate */
CREATE TABLE dbo.DimDate (
   [DateKey]  int   NOT NULL
,  [FullDate]  date   NULL
,  [DateName]  nchar(11)   NOT NULL
,  [DayOfWeek]  tinyint   NOT NULL
,  [DayNameOfWeek]  nchar(10)   NOT NULL
,  [DayOfMonth]  tinyint   NOT NULL
,  [DayOfYear]  smallint   NOT NULL
,  [WeekdayWeekend]  nchar(10)   NOT NULL
,  [WeekOfYear]  tinyint   NOT NULL
,  [MonthName]  nchar(10)   NOT NULL
,  [MonthOfYear]  tinyint   NOT NULL
,  [IsLastDayOfMonth]  nchar(1)   NOT NULL
,  [CalendarQuarter]  tinyint   NOT NULL
,  [CalendarYear]  smallint   NOT NULL
,  [CalendarYearMonth]  nchar(10)   NOT NULL
,  [CalendarYearQtr]  nchar(10)   NOT NULL
,  [FiscalMonthOfYear]  tinyint   NOT NULL
,  [FiscalQuarter]  tinyint   NOT NULL
,  [FiscalYear]  int   NOT NULL
,  [FiscalYearMonth]  nchar(10)   NOT NULL
,  [FiscalYearQtr]  nchar(10)   NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimDate] PRIMARY KEY CLUSTERED 
( [DateKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Date', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Date dimension contains one row for every day, beginning at 1/1/2005. There may also be rows for "hasn''t happened yet."', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimDate
;

INSERT INTO dbo.DimDate (DateKey, FullDate, DateName, DayOfWeek, DayNameOfWeek, DayOfMonth, DayOfYear, WeekdayWeekend, WeekOfYear, MonthName, MonthOfYear, IsLastDayOfMonth, CalendarQuarter, CalendarYear, CalendarYearMonth, CalendarYearQtr, FiscalMonthOfYear, FiscalQuarter, FiscalYear, FiscalYearMonth, FiscalYearQtr, InsertAuditKey, UpdateAuditKey)
VALUES (-1, '', 'Unk date', 0, 'Unk date', 0, 0, 'Unk date', 0, 'Unk month', 0, 'N', 0, 0, 'Unk year', 'Unk qtr', 0, 0, 0, 'Unk FY', 'Unk FQ', -1, -1)
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Date]'))
DROP VIEW [MDWT].[Date]
GO
CREATE VIEW [MDWT].[Date] AS 
SELECT [DateKey] AS [DateKey]
, [FullDate] AS [FullDate]
, [DateName] AS [DateName]
, [DayOfWeek] AS [DayOfWeek]
, [DayNameOfWeek] AS [DayNameOfWeek]
, [DayOfMonth] AS [DayOfMonth]
, [DayOfYear] AS [DayOfYear]
, [WeekdayWeekend] AS [WeekdayWeekend]
, [WeekOfYear] AS [WeekOfYear]
, [MonthName] AS [MonthName]
, [MonthOfYear] AS [MonthOfYear]
, [IsLastDayOfMonth] AS [IsLastDayOfMonth]
, [CalendarQuarter] AS [CalendarQtrOfYear]
, [CalendarYear] AS [CalendarYear]
, [CalendarYearMonth] AS [CalendarYearMonth]
, [CalendarYearQtr] AS [CalendarYearQtr]
, [FiscalMonthOfYear] AS [FiscalMonthOfYear]
, [FiscalQuarter] AS [FiscalQtrOfYear]
, [FiscalYear] AS [FiscalYear]
, [FiscalYearMonth] AS [FiscalYearMonth]
, [FiscalYearQtr] AS [FiscalYearQtr]
FROM dbo.DimDate
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FullDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayNameOfWeek', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DayOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeekdayWeekend', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekdayWeekend'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeekOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MonthOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsLastDayOfMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsLastDayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CalendarQtrOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CalendarYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CalendarYearMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CalendarYearQtr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FiscalMonthOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalMonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FiscalQtrOfYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalQuarter'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FiscalYear', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYear'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FiscalYearMonth', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FiscalYearQtr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Full date as a SQL date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'String expression of the full date, eg 2010/03/22', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day of week; Sunday = 1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Day name of week, eg Monday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day in the month', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Number of the day in the year', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is today a weekday or a weekend, {Weekday, Weekend}', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekdayWeekend'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Week of year, 1..53', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Month name, eg January', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Month of year, 1..12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the last day of the calendar month? {Y, N}', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsLastDayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar quarter, 1..4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar year, eg 2010', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar year and month, eg 2010-02', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Calendar year and quarter, eg 2010Q2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Fiscal month of year (1..12). FY starts in July', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalMonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Fiscal quarter, 1..4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalQuarter'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Fiscal year. Fiscal year begins in July.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYear'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Fiscal year and month, eg FY2010-07', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Fiscal year and quarter, eg FY2010Q3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'20041123', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'38314', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'23-Nov-2004', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..7', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Sunday', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..31', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..365', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Weekday, Weekend', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekdayWeekend'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1..52 or 53', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'November', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, …, 12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsLastDayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2004', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2004-01', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2004Q1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, …, 12', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalMonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalQuarter'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2004', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYear'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'FY2004-01', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'FY2004Q1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearQtr'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekdayWeekend'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsLastDayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearMonth'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearQtr'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalMonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalQuarter'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYear'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearMonth'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekdayWeekend'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Day', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsLastDayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Calendar', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Fiscal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalMonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Fiscal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalQuarter'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Fiscal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYear'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Fiscal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Fiscal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'In the form: yyyymmdd', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FullDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DateName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayNameOfWeek'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'DayOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekdayWeekend'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'WeekOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'MonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'IsLastDayOfMonth'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarQuarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'CalendarYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalMonthOfYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalQuarter'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYear'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearMonth'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'FiscalYearQtr'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimDate', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
;





/* Drop table dbo.DimEmployee */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimEmployee') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimEmployee 
;

/* Create table dbo.DimEmployee */
CREATE TABLE dbo.DimEmployee (
   [EmployeeKey]  int IDENTITY  NOT NULL
,  [BKEmployeeID]  int   NOT NULL
,  [NationalIDNumber]  nchar(15)   NOT NULL
,  [EmployeeIDName]  nvarchar(125)   NOT NULL
,  [EmployeeFullName]  nvarchar(100)   NOT NULL
,  [EmployeeFirstName]  nvarchar(50)   NOT NULL
,  [EmployeeLastName]  nvarchar(50)   NOT NULL
,  [EmployeeMiddleName]  nvarchar(50)   NOT NULL
,  [BirthDate]  datetime   NULL
,  [MaritalStatus]  nchar(7)   NOT NULL
,  [Gender]  nchar(7)   NOT NULL
,  [IsSalaried]  nchar(1)   NOT NULL
,  [IsCurrentEmployee]  nchar(1)   NOT NULL
,  [IsSalesPerson]  nchar(1)   NOT NULL
,  [JobTitle]  nvarchar(50)   NOT NULL
,  [DepartmentID]  int   NOT NULL
,  [Department]  nvarchar(50)   NOT NULL
,  [DepartmentGroup]  nvarchar(50)   NOT NULL
,  [BKCurrentSalesTerritoryId]  int   NOT NULL
,  [CurrentSalesTerritory]  nvarchar(50)   NOT NULL
,  [CurrentSalesTerritoryCountry]  nvarchar(50)   NOT NULL
,  [CurrentSalesTerritoryGroup]  nvarchar(50)   NOT NULL
,  [BKHistoricalSalesTerritoryId]  int   NOT NULL
,  [HistoricalSalesTerritory]  nvarchar(50)   NOT NULL
,  [HistoricalSalesTerritoryCountry]  nvarchar(50)   NOT NULL
,  [HistoricalSalesTerritoryGroup]  nvarchar(50)   NOT NULL
,  [HireDate]  date   NULL
,  [EmploymentEndDate]  date  DEFAULT '12/31/9999' NOT NULL
,  [LoginID]  nvarchar(50)   NOT NULL
,  [EmployeeEmail]  nvarchar(50)   NOT NULL
,  [EmployeePhone]  nvarchar(25)   NOT NULL
,  [RowIsCurrent]  nchar(1)   NOT NULL
,  [RowStartDate]  date  DEFAULT '12/31/1899' NOT NULL
,  [RowEndDate]  date  DEFAULT '12/31/9999' NOT NULL
,  [RowChangeReason]  nvarchar(200)   NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimEmployee] PRIMARY KEY CLUSTERED 
( [EmployeeKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimEmployee
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Employee', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimEmployee
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Employee info, including sales territory for sales reps', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimEmployee
;

SET IDENTITY_INSERT dbo.DimEmployee ON
;
INSERT INTO dbo.DimEmployee (EmployeeKey, BKEmployeeID, NationalIDNumber, EmployeeIDName, EmployeeFullName, EmployeeFirstName, EmployeeLastName, EmployeeMiddleName, BirthDate, MaritalStatus, Gender, IsSalaried, IsCurrentEmployee, IsSalesPerson, JobTitle, DepartmentID, Department, DepartmentGroup, BKCurrentSalesTerritoryId, CurrentSalesTerritory, CurrentSalesTerritoryCountry, CurrentSalesTerritoryGroup, BKHistoricalSalesTerritoryId, HistoricalSalesTerritory, HistoricalSalesTerritoryCountry, HistoricalSalesTerritoryGroup, HireDate, EmploymentEndDate, LoginID, EmployeeEmail, EmployeePhone, RowIsCurrent, RowStartDate, RowEndDate, RowChangeReason, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unknown ID Num', 'No Name', 'No Name', 'No Name', 'No Name', '', '12/31/1899', 'Unknown', 'Unknown', 'U', 'U', 'U', 'No title', -2, 'Unk department', 'Unk department', -2, 'Unk sales territory', 'Unk country', 'Unk sales group', -2, 'Unk sales territory', 'Unk country', 'Unk sales group', '', '12/31/9999', 'Unk login', 'Unk email', 'Unk phone', 'Y', '12/31/1899', '12/31/9999', 'N/A', -1, -1)
;
SET IDENTITY_INSERT dbo.DimEmployee OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Employee]'))
DROP VIEW [MDWT].[Employee]
GO
CREATE VIEW [MDWT].[Employee] AS 
SELECT [EmployeeKey] AS [EmployeeKey]
, [BKEmployeeID] AS [EmployeeID]
, [NationalIDNumber] AS [NationalIDNumber]
, [EmployeeIDName] AS [EmployeeIDName]
, [EmployeeFullName] AS [EmployeeFullName]
, [EmployeeFirstName] AS [EmployeeFirstName]
, [EmployeeLastName] AS [EmployeeLastName]
, [EmployeeMiddleName] AS [EmployeeMiddleName]
, [BirthDate] AS [BirthDate]
, [MaritalStatus] AS [MaritalStatus]
, [Gender] AS [Gender]
, [IsSalaried] AS [IsSalaried]
, [IsCurrentEmployee] AS [IsCurrentEmployee]
, [IsSalesPerson] AS [IsSalesPerson]
, [JobTitle] AS [JobTitle]
, [DepartmentID] AS [DepartmentID]
, [Department] AS [Department]
, [DepartmentGroup] AS [DepartmentGroup]
, [BKCurrentSalesTerritoryId] AS [CurrentSalesTerritoryId]
, [CurrentSalesTerritory] AS [CurrentSalesTerritory]
, [CurrentSalesTerritoryCountry] AS [CurrentSalesTerritoryCountry]
, [CurrentSalesTerritoryGroup] AS [CurrentSalesTerritoryGroup]
, [BKHistoricalSalesTerritoryId] AS [HistoricalSalesTerritoryId]
, [HistoricalSalesTerritory] AS [HistoricalSalesTerritory]
, [HistoricalSalesTerritoryCountry] AS [HistoricalSalesTerritoryCountry]
, [HistoricalSalesTerritoryGroup] AS [HistoricalSalesTerritoryGroup]
, [HireDate] AS [HireDate]
, [EmploymentEndDate] AS [EmploymentEndDate]
, [LoginID] AS [LoginID]
, [EmployeeEmail] AS [EmployeeEmail]
, [EmployeePhone] AS [EmployeePhone]
FROM dbo.DimEmployee
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'NationalIDNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeIDName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeFullName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeFirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeLastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeMiddleName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'BirthDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MaritalStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Gender', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsSalaried', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsCurrentEmployee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsSalesPerson', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'JobTitle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DepartmentID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Department', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DepartmentGroup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrentSalesTerritoryId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrentSalesTerritory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrentSalesTerritoryCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrentSalesTerritoryGroup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'HistoricalSalesTerritoryId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'HistoricalSalesTerritory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'HistoricalSalesTerritoryCountry', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'HistoricalSalesTerritoryGroup', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'HireDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmploymentEndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmploymentEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'LoginID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeeEmail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'EmployeePhone', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowIsCurrent', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowStartDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowEndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RowChangeReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee ID used in the transaction system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'National ID Number (eg SSN) for employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee full name prepended with national ID# (eg SSN)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee full name: last, first middle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s first name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s last name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s middle name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s birth date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What is the employee''s marital status?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What is the employee''s gender?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is the employee salaried?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this person currently an employee?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is the employee a sales person?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s job title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Department ID from the source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Department name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Department group', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Source system key for the employee''s current sales territory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Current sales territory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Current sales territory country', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Current sales territory group', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Source system key for the employee''s historical sales territory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales territory at the time the transaction occurred', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales territory country at the time the transaction occurred', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales territory group at the time the transaction occurred', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date employee was hired', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date employment ended; 12/31/9999 if a current employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmploymentEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s login ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Employee''s email address', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Phone number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is this the current row for this member (Y/N)?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become valid for this member?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'When did this row become invalid? (12/31/9999 if current row)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Why did the row change last?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'273', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'112432117', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'273 Welcker, Brian S ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Welcker, Brian S', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Brian', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Welcker', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'S', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/7/1975', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Married, Single, Unknown', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Male, Female, Unknown', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Design Engineer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Sales and Marketing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'adventure-works\brian3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'brian3@adventure-works.com', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'716-555-0127', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/1/2009', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1/14/1998, 12/31/9999', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmploymentEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee demographics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Position', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Position', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Position', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Position', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Organization', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmploymentEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Employee contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Strip out all spaces and hyphens', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Last, First Middle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode M/S to Married/Single', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode M/F to Male/Femeale', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode 1/0 to Y/N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode 1/0 to Y/N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Sales person if HumanResources.Employee. EmployeeID IN Sales.SalesPerson.SalesPersonID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on DepartmentID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on DepartmentID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on EmployeeID=SalesPersonID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join to Sales.SalesPerson on TerritoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from SalesTerritory to CountryRegion on CountryRegionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'see note for Current_Sales_Territory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on EmployeeID=SalesPersonID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join to Sales.SalesPerson on TerritoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join from SalesTerritory to CountryRegion on CountryRegionCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'see note for Historical_Sales_Territory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Capture event when CurrentInd switches to zero. In the absence of better info, it''s the ModifiedDate of the row when the change', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmploymentEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard SCD-2', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalesPerson'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmploymentEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowIsCurrent'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'RowChangeReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'HumanResources', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Person', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'EmployeeDepartmentHistory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Department', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Department', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesPerson', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesTerritory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'CountryRegion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesTerritory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesPerson', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesTerritory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'CountryRegion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesTerritory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Employee', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmployeeId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'NationalIdNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'several', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeIDName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'several', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFullName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'FirstName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LastName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MiddleName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'BirthDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MaritalStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Gender', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SalariedFlag', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'CurrentFlag', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Title', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'JobTitle'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DepartmentId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'GroupName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TerritoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Group', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TerritoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Group', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'HireDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LoginId', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EmailAddress', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Phone', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKEmployeeID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(15)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'NationalIDNumber'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeFirstName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeLastName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeMiddleName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BirthDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(1)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'MaritalStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(1)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Gender'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsSalaried'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'IsCurrentEmployee'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'smallint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'Department'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'DepartmentGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKCurrentSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'CurrentSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'BKHistoricalSalesTerritoryId'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritory'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryCountry'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HistoricalSalesTerritoryGroup'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'HireDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(100)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'LoginID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeeEmail'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(25)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimEmployee', @level2type=N'COLUMN', @level2name=N'EmployeePhone'; 
;





/* Drop table dbo.DimOrderInfo */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimOrderInfo') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimOrderInfo 
;

/* Create table dbo.DimOrderInfo */
CREATE TABLE dbo.DimOrderInfo (
   [OrderInfoKey]  smallint IDENTITY  NOT NULL
,  [BKSalesReasonID]  smallint   NOT NULL
,  [Channel]  nchar(8)   NULL
,  [SalesReason]  nvarchar(30)   NULL
,  [SalesReasonType]  nchar(10)   NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimOrderInfo] PRIMARY KEY CLUSTERED 
( [OrderInfoKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrderInfo
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderInfo', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrderInfo
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Channel and sales reason', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimOrderInfo
;

SET IDENTITY_INSERT dbo.DimOrderInfo ON
;
INSERT INTO dbo.DimOrderInfo (OrderInfoKey, BKSalesReasonID, Channel, SalesReason, SalesReasonType, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unkown', 'Unk sales reason', 'Unk type', -1, -1)
;
SET IDENTITY_INSERT dbo.DimOrderInfo OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[OrderInfo]'))
DROP VIEW [MDWT].[OrderInfo]
GO
CREATE VIEW [MDWT].[OrderInfo] AS 
SELECT [OrderInfoKey] AS [OrderInfoKey]
, [BKSalesReasonID] AS [SalesReasonID]
, [Channel] AS [Channel]
, [SalesReason] AS [SalesReason]
, [SalesReasonType] AS [SalesReasonType]
FROM dbo.DimOrderInfo
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderInfoKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesReasonID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Channel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesReasonType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales reason ID from source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales channel (Reseller or Internet)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Reason for the sale, as reported by the customer', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Type of sales reason (eg Marketing Promotion)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Reseller, Internet', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Marketing, Promotion, Other', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard surrogate key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Convert to char; left-pad with zero. R for reseller row.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Internet'' for real sales reasons. ''Reseller'' for reseller row.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'''Reseller'' for reseller row.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'''Reseller'' for reseller row', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesReason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SalesReasonID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'Channel'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ReasonType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'BKSalesReasonID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReason'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimOrderInfo', @level2type=N'COLUMN', @level2name=N'SalesReasonType'; 
;





/* Drop table dbo.DimProduct */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimProduct') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimProduct 
;

/* Create table dbo.DimProduct */
CREATE TABLE dbo.DimProduct (
   [ProductKey]  int IDENTITY  NOT NULL
,  [ProductSKU]  int   NOT NULL
,  [ProductName]  nvarchar(50)   NOT NULL
,  [ProductDescr]  nvarchar(50)   NOT NULL
,  [ProductModelID]  int  DEFAULT -1 NOT NULL
,  [Model]  nvarchar(50)   NOT NULL
,  [ProductSubcategoryID]  int  DEFAULT -1 NOT NULL
,  [ProductSubcategory]  nvarchar(50)   NOT NULL
,  [ProductCategoryID]  int   NOT NULL
,  [ProductCategory]  nvarchar(50)   NOT NULL
,  [ProductLine]  nchar(10)  DEFAULT 'Bike part' NOT NULL
,  [Color]  nvarchar(20)  DEFAULT 'No color' NOT NULL
,  [Class]  nvarchar(20)  DEFAULT 'No product class' NOT NULL
,  [Style]  nvarchar(20)  DEFAULT 'No product style' NOT NULL
,  [IsFinishedGood]  nvarchar(20)  DEFAULT 'Not known' NOT NULL
,  [Size]  nvarchar(20)  DEFAULT 'No size' NOT NULL
,  [SizeUnitOfMeasureCode]  nchar(3)  DEFAULT 'N/A' NOT NULL
,  [Weight]  decimal(8,2)   NOT NULL
,  [WeightUnitOfMeasureCode]  nchar(5)  DEFAULT 'N/A' NOT NULL
,  [DaysToManufacture]  int  DEFAULT 0 NOT NULL
,  [StandardCost]  money   NOT NULL
,  [ListPrice]  money  DEFAULT 0 NOT NULL
,  [SafetyStockLevel]  smallint  DEFAULT 0 NOT NULL
,  [ReorderPoint]  smallint  DEFAULT 0 NOT NULL
,  [SellStartDate]  date  DEFAULT '12/31/1899' NOT NULL
,  [SellEndDate]  date  DEFAULT '12/31/9999' NOT NULL
,  [ProductCurrentStatus]  nchar(12)   NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimProduct] PRIMARY KEY CLUSTERED 
( [ProductKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Product', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Information about the products we sell', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimProduct
;

SET IDENTITY_INSERT dbo.DimProduct ON
;
INSERT INTO dbo.DimProduct (ProductKey, ProductSKU, ProductName, ProductDescr, ProductModelID, Model, ProductSubcategoryID, ProductSubcategory, ProductCategoryID, ProductCategory, ProductLine, Color, Class, Style, IsFinishedGood, Size, SizeUnitOfMeasureCode, Weight, WeightUnitOfMeasureCode, DaysToManufacture, StandardCost, ListPrice, SafetyStockLevel, ReorderPoint, SellStartDate, SellEndDate, ProductCurrentStatus, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk product', 'Unk product', -1, 'Unk product model', -1, 'Unk subcategory', -1, 'Unk category', 'Unk P Line', 'Unk color', 'Unk class', 'Unk style', 'Unk product', 'Unk size', 'N/A', -1, 'N/A', 0, 0, 0, 0, 0, '12/31/1899', '12/31/9999', 'Unknown', -1, -1)
;
SET IDENTITY_INSERT dbo.DimProduct OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Product]'))
DROP VIEW [MDWT].[Product]
GO
CREATE VIEW [MDWT].[Product] AS 
SELECT [ProductKey] AS [ProductKey]
, [ProductSKU] AS [ProductSKU]
, [ProductName] AS [ProductName]
, [ProductDescr] AS [ProductDescr]
, [ProductModelID] AS [ProductModelID]
, [Model] AS [Model]
, [ProductSubcategoryID] AS [ProductSubcategoryID]
, [ProductSubcategory] AS [ProductSubcategory]
, [ProductCategoryID] AS [ProductCategoryID]
, [ProductCategory] AS [ProductCategory]
, [ProductLine] AS [ProductLine]
, [Color] AS [Color]
, [Class] AS [Class]
, [Style] AS [Style]
, [IsFinishedGood] AS [IsFinishedGood]
, [Size] AS [Size]
, [SizeUnitOfMeasureCode] AS [SizeUnitOfMeasureCode]
, [Weight] AS [Weight]
, [WeightUnitOfMeasureCode] AS [WeightUnitOfMeasureCode]
, [DaysToManufacture] AS [DaysToManufacture]
, [StandardCost] AS [StandardCost]
, [ListPrice] AS [ListPrice]
, [SafetyStockLevel] AS [SafetyStockLevel]
, [ReorderPoint] AS [ReorderPoint]
, [SellStartDate] AS [SellStartDate]
, [SellEndDate] AS [SellEndDate]
, [ProductCurrentStatus] AS [ProductCurrentStatus]
FROM dbo.DimProduct
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductDescr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductModelID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Model', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSubcategoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductSubcategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCategoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Color', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Class', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Style', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'IsFinishedGood', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Size', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SizeUnitOfMeasureCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Weight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'WeightUnitOfMeasureCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DaysToManufacture', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'StandardCost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ListPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SafetyStockLevel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ReorderPoint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SellStartDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SellEndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductCurrentStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product SKU, also known as Product ID or Product Number. Natural key from source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product description (same as name at the moment)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product model ID from source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Model name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product subcategory ID from the source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product subcategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product category ID from the source system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product category', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product line', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product color', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product class (H/M/L)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product style (Men/Women/Unisex)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is the product classified as a finished good?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Item size', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'How is size measured', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Item weight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'How is weight measured?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Average days to manufacture', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Current standard cost of production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Current suggested list price', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'For AW warehouse, comfortable level of inventory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'For AW warehouse, reorder when stock falls below this point', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date product first available', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date product last available', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product current status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Mountain, Road, Touring', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Silver, Red, Multi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'High, Medium, Low', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Men, Women, Unisex', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Finished Good, Unfinished good', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Large, Medium, Small, 46, 70', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'CM, N/A', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1050', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'gram, pound, N/A', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3, 4', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'2171.29', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'3578.27', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1000', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'750', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Current, Discontinued', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'SKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'SKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'SKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Product categories', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Physical chars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'SKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'SKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'SKU', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Populate with the product name for now', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'NULL to -1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on Product.ProductModelID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'NULL to -1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on Product. ProductSubcategoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Join on ProductCategoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode T=Touring, M=Mountain, R=Road, S=Accessory, NULL=Bike Part', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Replace NULL with ''No color''', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode H/M/L/NULL as High/Medium/Low/No Pclass', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode M/W/U/NULL as Men/Women/Unisex/No Pstyle', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode 1/0 to Finished Good/Unfinished good', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode L/M/S/NULL to Large/Medium/Small/No Size; else keep Size', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode NULL to N/A', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Decode G=gram, LB=pound, NULL=N/A', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'If DiscontinuedDate <> NULL then ''Discontinued'' ELSE ''Current''', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Production', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ProductModel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ProductSubcategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ProductSubcategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'ProductCategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'Product', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductModelID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductSubcategoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductCategoryID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ProductLine', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Color', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Class', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Style', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'FinishedGoodsFlag', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Size', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SizeUnitMeasureCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Weight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'WeightUnitMeasureCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DaysToManufacture', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'StandardCost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ListPrice', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SafetyStockLevel', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'ReorderPoint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SellStartDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SellEndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DiscontinuedDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSKU'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductDescr'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductModelID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Model'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductSubcategory'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategoryID'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductLine'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(15)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Color'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Class'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Style'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'bit', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'IsFinishedGood'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(5)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Size'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(3)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SizeUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'decimal(8,2)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'Weight'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nchar(3)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'WeightUnitOfMeasureCode'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'DaysToManufacture'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'StandardCost'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ListPrice'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'smallint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SafetyStockLevel'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'smallint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ReorderPoint'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'SellEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimProduct', @level2type=N'COLUMN', @level2name=N'ProductCurrentStatus'; 
;





/* Drop table dbo.DimPromotion */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimPromotion') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimPromotion 
;

/* Create table dbo.DimPromotion */
CREATE TABLE dbo.DimPromotion (
   [PromotionKey]  smallint IDENTITY  NOT NULL
,  [BKSpecialOfferID]  int   NOT NULL
,  [PromotionName]  nvarchar(50)   NOT NULL
,  [PromotionType]  nvarchar(20)   NOT NULL
,  [PromotionCategory]  nvarchar(20)   NOT NULL
,  [DiscountPct]  smallmoney   NULL
,  [PromotionStartDate]  date   NULL
,  [PromotionEndDate]  date   NULL
,  [MinQty]  int   NULL
,  [MaxQty]  int   NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
, CONSTRAINT [PK_dbo.DimPromotion] PRIMARY KEY CLUSTERED 
( [PromotionKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPromotion
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Promotion', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPromotion
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Information about marketing promotions.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimPromotion
;

SET IDENTITY_INSERT dbo.DimPromotion ON
;
INSERT INTO dbo.DimPromotion (PromotionKey, BKSpecialOfferID, PromotionName, PromotionType, PromotionCategory, DiscountPct, PromotionStartDate, PromotionEndDate, MinQty, MaxQty, InsertAuditKey, UpdateAuditKey)
VALUES (-1, -1, 'Unk promotion', 'Unk promo type', 'Unk promo category', NULL, '', '', NULL, NULL, -1, -1)
;
SET IDENTITY_INSERT dbo.DimPromotion OFF
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Promotion]'))
DROP VIEW [MDWT].[Promotion]
GO
CREATE VIEW [MDWT].[Promotion] AS 
SELECT [PromotionKey] AS [PromotionKey]
, [BKSpecialOfferID] AS [SpecialOfferID]
, [PromotionName] AS [PromotionName]
, [PromotionType] AS [PromotionType]
, [PromotionCategory] AS [PromotionCategory]
, [DiscountPct] AS [DiscountPct]
, [PromotionStartDate] AS [PromotionStartDate]
, [PromotionEndDate] AS [PromotionEndDate]
, [MinQty] AS [MinQty]
, [MaxQty] AS [MaxQty]
FROM dbo.DimPromotion
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SpecialOfferID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'BKSpecialOfferID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionType', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionCategory', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DiscountPct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionStartDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionEndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MinQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'MaxQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Source system identifier', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'BKSpecialOfferID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Promotion Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Promo type, eg Volume Discount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Is promotion offered to resellers or directly to customers?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Promotion discount percent', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Promotion start date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Promotion end date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Minimum quantity required for promotion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Maximum quantity permitted for promotion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process loaded this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'What process most recently updated this row?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'BKSpecialOfferID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Mountain Tire Sale', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Volume Discount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Reseller, Customer, No Discount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Check for overflows', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Convert NULL to MaxInt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard Audit dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'BKSpecialOfferID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'BKSpecialOfferID'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'BKSpecialOfferID'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SpecialOffers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Description', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Category', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'DiscountPct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'StartDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'EndDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MinQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'MaxQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(255)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionName'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionType'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'nvarchar(50)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionCategory'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'smallmoney', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'DiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionStartDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'datetime', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'PromotionEndDate'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MinQty'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimPromotion', @level2type=N'COLUMN', @level2name=N'MaxQty'; 
;





/* Drop table dbo.DimAudit */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DimAudit') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DimAudit 
;

/* Create table dbo.DimAudit */
CREATE TABLE dbo.DimAudit (
   [AuditKey]  int IDENTITY  NOT NULL
,  [ParentAuditKey]  int   NOT NULL
,  [TableName]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [PkgName]  nvarchar(50)  DEFAULT 'Unknown' NOT NULL
,  [PkgGUID]  uniqueidentifier   NULL
,  [PkgVersionGUID]  uniqueidentifier   NULL
,  [PkgVersionMajor]  smallint   NULL
,  [PkgVersionMinor]  smallint   NULL
,  [ExecStartDT]  datetime  DEFAULT getdate() NOT NULL
,  [ExecStopDT]  datetime   NULL
,  [ExecutionInstanceGUID]  uniqueidentifier   NULL
,  [ExtractRowCnt]  bigint   NULL
,  [InsertRowCnt]  bigint   NULL
,  [UpdateRowCnt]  bigint   NULL
,  [ErrorRowCnt]  bigint   NULL
,  [TableInitialRowCnt]  bigint   NULL
,  [TableFinalRowCnt]  bigint   NULL
,  [TableMaxSurrogateKey]  bigint   NULL
,  [SuccessfulProcessingInd]  nchar(1)  DEFAULT 'N' NOT NULL
, CONSTRAINT [PK_dbo.DimAudit] PRIMARY KEY CLUSTERED 
( [AuditKey] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Audit', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Audit', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAudit
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Audit dimension tags each data row with the the process that added or updated it.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DimAudit
;

SET IDENTITY_INSERT dbo.DimAudit ON
;
INSERT INTO dbo.DimAudit (AuditKey, ParentAuditKey, TableName, PkgName, PkgGUID, PkgVersionGUID, PkgVersionMajor, PkgVersionMinor, ExecStartDT, ExecStopDT, ExecutionInstanceGUID, ExtractRowCnt, InsertRowCnt, UpdateRowCnt, ErrorRowCnt, TableInitialRowCnt, TableFinalRowCnt, TableMaxSurrogateKey, SuccessfulProcessingInd)
VALUES (-1, -1, 'Audit', 'None: Dummy row', NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y')
;
SET IDENTITY_INSERT dbo.DimAudit OFF
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ParentAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgName', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgName'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgGUID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionGUID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionMajor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMajor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PkgVersionMinor', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMinor'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecStartDT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStartDT'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecStopDT', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStopDT'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExecutionInstanceGUID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecutionInstanceGUID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExtractRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExtractRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'InsertRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'UpdateRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ErrorRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ErrorRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableInitialRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableInitialRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableFinalRowCnt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableFinalRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TableMaxSurrogateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableMaxSurrogateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SuccessfulProcessingInd', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate primary key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Foreign key to self, to identify calling package execution', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the main table loaded by this package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the SSIS package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgName'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the package version', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Major version number for the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMajor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Minor version number for the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'PkgVersionMinor'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date-time the package started executing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStartDT'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date-time the package finished executing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecStopDT'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Identifier for the execution of the package', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExecutionInstanceGUID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows extracted from the source(s)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ExtractRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows inserted in the destination table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'InsertRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows updated in the destination table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'UpdateRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of error rows', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ErrorRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows in target table before we begin', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableInitialRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Count of rows in target table after package ends', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableFinalRowCnt'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Maximum surrogate key value in table (if we''re maintaining ourselves)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'TableMaxSurrogateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Did the package finish executing successfully?', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'SuccessfulProcessingInd'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'AuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DimAudit', @level2type=N'COLUMN', @level2name=N'ParentAuditKey'; 
;





/* Drop table dbo.FactOrders */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactOrders') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactOrders 
;

/* Create table dbo.FactOrders */
CREATE TABLE dbo.FactOrders (
   [ProductKey]  int   NOT NULL
,  [CustomerKey]  int   NOT NULL
,  [OrderDateKey]  int   NOT NULL
,  [DueDateKey]  int   NOT NULL
,  [OrderInfoKey]  smallint   NOT NULL
,  [PromotionKey]  smallint   NOT NULL
,  [CurrencyKey]  smallint   NOT NULL
,  [SalesRepKey]  int   NOT NULL
,  [InsertAuditKey]  int  DEFAULT -1 NOT NULL
,  [UpdateAuditKey]  int  DEFAULT -1 NOT NULL
,  [SalesOrderNum]  int   NOT NULL
,  [SalesOrderLineNum]  int   NOT NULL
,  [SalesOrderRevisionNum]  tinyint   NOT NULL
,  [OrderQty]  smallint   NULL
,  [UnitPriceUSD]  money   NULL
,  [ExtendedAmtUSD]  money   NULL
,  [UnitPriceDiscountPct]  float   NULL
,  [DiscountUSD]  money   NULL
,  [ProductStdCostUSD]  money   NULL
,  [TotalProductCostUSD]  money   NULL
,  [SalesAmtUSD]  money   NULL
,  [SalesAmtLocal]  money   NULL
,  [TaxUSD]  money   NULL
,  [TaxLocal]  money   NULL
,  [FreightUSD]  money   NULL
,  [FreightLocal]  money   NULL
,  [CustomerPONum]  nvarchar(25)  DEFAULT 'Unknown PO num' NOT NULL
, CONSTRAINT [PK_dbo.FactOrders] PRIMARY KEY NONCLUSTERED 
( [SalesOrderNum], [SalesOrderLineNum], [SalesOrderRevisionNum] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrders
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Orders', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrders
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Order transactions at the order line item level', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactOrders
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[Orders]'))
DROP VIEW [MDWT].[Orders]
GO
CREATE VIEW [MDWT].[Orders] AS 
SELECT [ProductKey] AS [ProductKey]
, [CustomerKey] AS [CustomerKey]
, [OrderDateKey] AS [OrderDateKey]
, [DueDateKey] AS [DueDateKey]
, [OrderInfoKey] AS [OrderInfoKey]
, [PromotionKey] AS [PromotionKey]
, [CurrencyKey] AS [CurrencyKey]
, [SalesRepKey] AS [SalesRepKey]
, [OrderQty] AS [OrderQty]
, [UnitPriceUSD] AS [UnitPriceUSD]
, [ExtendedAmtUSD] AS [ExtendedAmtUSD]
, [UnitPriceDiscountPct] AS [UnitPriceDiscountPct]
, [DiscountUSD] AS [DiscountUSD]
, [ProductStdCostUSD] AS [ProductStdCostUSD]
, [TotalProductCostUSD] AS [TotalProductCostUSD]
, [SalesAmtUSD] AS [SalesAmtUSD]
, [SalesAmtLocal] AS [SalesAmtLocal]
, [TaxUSD] AS [TaxUSD]
, [TaxLocal] AS [TaxLocal]
, [FreightUSD] AS [FreightUSD]
, [FreightLocal] AS [FreightLocal]
FROM dbo.FactOrders
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderDateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DueDateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DueDateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderInfoKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'PromotionKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrencyKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesRepKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesRepKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesOrderNum', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesOrderLineNum', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesOrderRevisionNum', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'OrderQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UnitPriceUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExtendedAmtUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ExtendedAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UnitPriceDiscountPct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DiscountUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ProductStdCostUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductStdCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TotalProductCostUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TotalProductCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesAmtUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'SalesAmtLocal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtLocal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TaxUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'TaxLocal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FreightUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'FreightLocal', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CustomerPONum', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Product dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Customer dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Date dim for the date the order was placed', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to the date the order is expected to be filled (at the time the order was placed)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DueDateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to OrderInfo dimension describing channel and sales reason', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Promotion dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Currency dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to the salesperson role of the employee dimension', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesRepKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dim for row last updated', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales order number from trxn system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales order line number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales order revision number', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Quantity of this item in this order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Standard price for this item', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Price * Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ExtendedAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Discount % applied to this line item in this order, if any', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Discount in US Dollars', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Product''s cost of goods sold', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductStdCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Std Cost * Quantity', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TotalProductCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'ExtendedAmt adjusted for discounts (LineTotal from the trxn system)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Sales Amount, in local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtLocal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tax Amount, prorated across items in the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Tax Amount, in local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Freight Amount, prorated across items in the order', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightUSD'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Freight Amount, in local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Purchase Order Number from the transaction system', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DueDateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesRepKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DueDateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesRepKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Counts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ExtendedAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Percentages', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductStdCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TotalProductCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Local amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtLocal'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Local amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'USD amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightUSD'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'Local amounts', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderDetail.ProductID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderHeader.CustomerID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderHeader.OrderDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderHeader.DueDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DueDateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderHeaderSalesReason.SalesReasonID (first reason)', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderDetail.SpecialOfferID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderHeader.CurrencyRateID to Sales.CurrencyRate; pick up FromCurrencyCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from SalesOrderHeader.SalesPersonID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesRepKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'UnitPriceUSD * OrderQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ExtendedAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Convert currency to float', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'UnitPriceDiscountPct * ExtendedAmtUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'ProductStdCostUSD * OrderQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TotalProductCostUSD'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'ExtendedAmtUSD - DiscountUSD', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Convert SalesAmtUSD to local currency based on lookup to DimCurrency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtLocal'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Allocate TaxAmt to line item level based on this item''s $ contribution to the total sale', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'ConvertTaxUSD to local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Allocate Freight to line item level based on this item''s $ contribution to the total sale', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightUSD'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Convert FreightUSD to local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderDateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DueDateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderInfoKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'PromotionKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesRepKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL Process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ExtendedAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'DW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductStdCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TotalProductCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesAmtLocal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightUSD'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'AW', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderHeader', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderHeader', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'DimProduct', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductStdCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderDetail', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderHeader', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderHeader', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'SalesOrderHeader', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'SalesOrderID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'RevisionNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'LineNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'OrderQty', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'OrderQty'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'UnitPriceDiscount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'UnitPriceDiscount', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'StandardCost', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'ProductStdCostUSD'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TaxAmt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxUSD'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'TaxAmt', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'TaxLocal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'Freight', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'FreightLocal'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'PurchaseOrderNumber', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'CustomerPONum'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'int', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderNum'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'tinyint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderLineNum'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'tinyint', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'SalesOrderRevisionNum'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'UnitPriceDiscountPct'; 
exec sys.sp_addextendedproperty @name=N'Source Datatype', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactOrders', @level2type=N'COLUMN', @level2name=N'DiscountUSD'; 
;





/* Drop table dbo.FactExchangeRates */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.FactExchangeRates') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.FactExchangeRates 
;

/* Create table dbo.FactExchangeRates */
CREATE TABLE dbo.FactExchangeRates (
   [CurrencyKey]  smallint   NOT NULL
,  [DateKey]  int   NOT NULL
,  [InsertAuditKey]  int   NOT NULL
,  [UpdateAuditKey]  int   NOT NULL
,  [CloseRate]  float   NULL
,  [AvgRate]  float   NULL
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactExchangeRates
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ExchangeRates', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactExchangeRates
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Daily exchange rates to/from USD', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=FactExchangeRates
;

-- User-oriented view definition
GO
IF EXISTS (select * from sys.views where object_id=OBJECT_ID(N'[MDWT].[ExchangeRates]'))
DROP VIEW [MDWT].[ExchangeRates]
GO
CREATE VIEW [MDWT].[ExchangeRates] AS 
SELECT [CurrencyKey] AS [CurrencyKey]
, [DateKey] AS [DateKey]
, [CloseRate] AS [CloseRate]
, [AvgRate] AS [AvgRate]
FROM dbo.FactExchangeRates
GO

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CurrencyKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DateKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'InsertAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'UpdateAuditKey', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'CloseRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CloseRate'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'AvgRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'AvgRate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Currency dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Date dim', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dimension for row insertion', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Key to Audit dim for row last updated', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Market close (end of day) exchange rate from USD to local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CloseRate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Average daily exchange rate from USD to local currency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'AvgRate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Display Folder', @value=N'exclude', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.FromCurrencyCode', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Key lookup from Sales.CurrencyRate.CurrencyRateDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'ETL Rules', @value=N'Standard auditing', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CurrencyKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'DateKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'InsertAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'ETL process', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'UpdateAuditKey'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CloseRate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Sales', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'AvgRate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'CurrencyRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CloseRate'; 
exec sys.sp_addextendedproperty @name=N'Source Schema', @value=N'CurrencyRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'AvgRate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'EndOfDayRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CloseRate'; 
exec sys.sp_addextendedproperty @name=N'Source Table', @value=N'AverageRate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'AvgRate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'CloseRate'; 
exec sys.sp_addextendedproperty @name=N'Source Field Name', @value=N'money', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'FactExchangeRates', @level2type=N'COLUMN', @level2name=N'AvgRate'; 
;
ALTER TABLE dbo.DimCustomer ADD CONSTRAINT
   FK_dbo_DimCustomer_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimCustomer ADD CONSTRAINT
   FK_dbo_DimCustomer_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimCurrency ADD CONSTRAINT
   FK_dbo_DimCurrency_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimCurrency ADD CONSTRAINT
   FK_dbo_DimCurrency_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimDate ADD CONSTRAINT
   FK_dbo_DimDate_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimDate ADD CONSTRAINT
   FK_dbo_DimDate_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimEmployee ADD CONSTRAINT
   FK_dbo_DimEmployee_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimEmployee ADD CONSTRAINT
   FK_dbo_DimEmployee_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimOrderInfo ADD CONSTRAINT
   FK_dbo_DimOrderInfo_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimOrderInfo ADD CONSTRAINT
   FK_dbo_DimOrderInfo_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimProduct ADD CONSTRAINT
   FK_dbo_DimProduct_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimProduct ADD CONSTRAINT
   FK_dbo_DimProduct_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimPromotion ADD CONSTRAINT
   FK_dbo_DimPromotion_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimPromotion ADD CONSTRAINT
   FK_dbo_DimPromotion_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.DimAudit ADD CONSTRAINT
   FK_dbo_DimAudit_ParentAuditKey FOREIGN KEY
   (
   ParentAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_ProductKey FOREIGN KEY
   (
   ProductKey
   ) REFERENCES DimProduct
   ( ProductKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_CustomerKey FOREIGN KEY
   (
   CustomerKey
   ) REFERENCES DimCustomer
   ( CustomerKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_OrderDateKey FOREIGN KEY
   (
   OrderDateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_DueDateKey FOREIGN KEY
   (
   DueDateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_OrderInfoKey FOREIGN KEY
   (
   OrderInfoKey
   ) REFERENCES DimOrderInfo
   ( OrderInfoKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_PromotionKey FOREIGN KEY
   (
   PromotionKey
   ) REFERENCES DimPromotion
   ( PromotionKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_CurrencyKey FOREIGN KEY
   (
   CurrencyKey
   ) REFERENCES DimCurrency
   ( CurrencyKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_SalesRepKey FOREIGN KEY
   (
   SalesRepKey
   ) REFERENCES DimEmployee
   ( EmployeeKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactOrders ADD CONSTRAINT
   FK_dbo_FactOrders_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactExchangeRates ADD CONSTRAINT
   FK_dbo_FactExchangeRates_CurrencyKey FOREIGN KEY
   (
   CurrencyKey
   ) REFERENCES DimCurrency
   ( CurrencyKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactExchangeRates ADD CONSTRAINT
   FK_dbo_FactExchangeRates_DateKey FOREIGN KEY
   (
   DateKey
   ) REFERENCES DimDate
   ( DateKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactExchangeRates ADD CONSTRAINT
   FK_dbo_FactExchangeRates_InsertAuditKey FOREIGN KEY
   (
   InsertAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
ALTER TABLE dbo.FactExchangeRates ADD CONSTRAINT
   FK_dbo_FactExchangeRates_UpdateAuditKey FOREIGN KEY
   (
   UpdateAuditKey
   ) REFERENCES DimAudit
   ( AuditKey )
     ON UPDATE  NO ACTION
     ON DELETE  NO ACTION
;
 
