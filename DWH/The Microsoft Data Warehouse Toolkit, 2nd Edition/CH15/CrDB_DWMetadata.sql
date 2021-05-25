/****** Object:  Database DW_Metadata    Script Date: 2/20/2011 11:59:42 AM ******/
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
/*
DROP DATABASE DW_Metadata
GO
CREATE DATABASE DW_Metadata
GO
ALTER DATABASE DW_Metadata
SET RECOVERY SIMPLE
GO
*/
USE DW_Metadata
;
IF EXISTS (SELECT Name from sys.extended_properties where Name = 'Description')
    EXEC sys.sp_dropextendedproperty @name = 'Description'
EXEC sys.sp_addextendedproperty @name = 'Description', @value = 'Simple schema to hold business metadata from The Microsoft Data Warehouse Toolkit 2nd edition, Chapter 15'
;





/* Drop table dbo.DW_Databases */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Databases') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Databases 
;

/* Create table dbo.DW_Databases */
CREATE TABLE dbo.DW_Databases (
   [Database_Key]  Int IDENTITY  NOT NULL
,  [Database_ID]  sysname   NOT NULL
,  [Database_Name]  sysname   NOT NULL
,  [Database_Short_Descr]  nvarchar(255)   NULL
,  [Database_Long_Descr]  nvarchar(2000)   NULL
,  [Gen_Metadata_Ind]  nchar(1)   NULL
,  [Database_Type]  nvarchar(100)   NULL
,  [Database_Status]  nvarchar(25)   NULL
,  [Instance_Name]  SysName   NULL
,  [Server_Name]  SysName   NULL
, CONSTRAINT [PK_dbo.DW_Databases] PRIMARY KEY CLUSTERED 
( [Database_Key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Databases
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Databases', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Databases
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'BI System database (either relational or AS based)', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Databases
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Short Descr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Long Descr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Gen Metadata Ind', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Gen_Metadata_Ind'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Type'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Status'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Instance Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Instance_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Server Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Server_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate, unique key across instances and servers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The ID of the database -- INT for rdbms, char for SSAS', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Y/N Indicator to determine if the Metadata generator should try and parse the extended properties to fill in the rest of the met', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Gen_Metadata_Ind'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The underlying database platform', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Type'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'An Active Database is still in the physical source.  A Cancelled Database is no longer in the physical source.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Status'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the instance in which the database resides', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Instance_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the server on which the database resides', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Server_Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Y, N', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Gen_Metadata_Ind'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Relational, Analysis Services', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Type'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Active, Cancelled', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Database_Status'; 
exec sys.sp_addextendedproperty @name=N'Comments', @value=N'Default to N for all system databases and Y for all User databases', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Databases', @level2type=N'COLUMN', @level2name=N'Gen_Metadata_Ind'; 
;





/* Drop table dbo.DW_Database_Contents */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Database_Contents') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Database_Contents 
;

/* Create table dbo.DW_Database_Contents */
CREATE TABLE dbo.DW_Database_Contents (
   [Database_Key]  Int   NOT NULL
,  [Subject_Area_Key]  Int   NOT NULL
, CONSTRAINT [PK_dbo.DW_Database_Contents] PRIMARY KEY NONCLUSTERED 
( [Database_Key], [Subject_Area_Key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Database_Contents
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Database_Contents', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Database_Contents
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Many to many mapping table between Databases and Subject Areas', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Database_Contents
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Database_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Database_Contents', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Unique database key across instances and servers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Database_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Unique subject area key across instances and servers', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Database_Contents', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'FK To', @value=N'DW_Databases.Database_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Database_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'FK To', @value=N'DW_Subject_Areas.Subject_Area_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Database_Contents', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
;





/* Drop table dbo.DW_Subject_Areas */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Subject_Areas') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Subject_Areas 
;

/* Create table dbo.DW_Subject_Areas */
CREATE TABLE dbo.DW_Subject_Areas (
   [Subject_Area_Key]  Int IDENTITY  NOT NULL
,  [Database_Key]  int   NOT NULL
,  [Primary_Fact_Table_ID]  Int   NULL
,  [Subject_Area_Name]  sysname   NOT NULL
,  [Subject_Area_Short_Descr]  nvarchar(255)   NULL
,  [Subject_Area_Long_Descr]  nvarchar(2000)   NULL
,  [Business_Process_Area]  nvarchar(128)   NOT NULL
,  [Subject_Area_Status]  nvarchar(25)   NOT NULL
,  [Subject_Area_Image]  image   NULL
, CONSTRAINT [PK_dbo.DW_Subject_Areas] PRIMARY KEY CLUSTERED 
( [Subject_Area_Key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Subject_Areas
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Subject_Areas', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Subject_Areas
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Subject areas groups of objects, like business process data models, or Analysis Services cubes', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Subject_Areas
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Primary Fact Table ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Primary_Fact_Table_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Short Descr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Long Descr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Business Process Area', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Business_Process_Area'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Status'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Image', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Image'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'This is an Identity field that assigns a key for each Subject Area', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Metadata key of the database where the subject area was found', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'If the subject area centers around a fact table or measure group or cube, put the object''s object ID here.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Primary_Fact_Table_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the Subject Area - usually the business process captured in the Fact table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'One or two sentences that are easily displayed in the summary level browser reports', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A longer description that may include user guidance on what the Subject Area contains and how to use it.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the Business Process Area to which this Subject Area belongs.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Business_Process_Area'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'An Active Subject Area is still in the physical source.  A Cancelled Subject Area is no longer in the physical source.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Status'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The image is typically a screen capture of the subject area star schema data model.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Image'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Sales, Finance, Logistics', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Business_Process_Area'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Active, Cancelled', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Areas', @level2type=N'COLUMN', @level2name=N'Subject_Area_Status'; 
;





/* Drop table dbo.DW_Subject_Area_Contents */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Subject_Area_Contents') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Subject_Area_Contents 
;

/* Create table dbo.DW_Subject_Area_Contents */
CREATE TABLE dbo.DW_Subject_Area_Contents (
   [Subject_Area_Key]  Int   NOT NULL
,  [Object_Key]  Int   NOT NULL
,  [Join_Column]  sysname   NOT NULL
,  [Database_Key]  int   NOT NULL
, CONSTRAINT [PK_dbo.DW_Subject_Area_Contents] PRIMARY KEY NONCLUSTERED 
( [Subject_Area_Key], [Object_Key], [Join_Column] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Subject_Area_Contents
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Subject_Area_Contents', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Subject_Area_Contents
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Many to many mapping table between Subject Areas and Objects', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Subject_Area_Contents
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Subject Area Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Join Column', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Join_Column'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'This is an Identity field assigned in the Subject_Area table.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The object_id of the object - this is at the table level in the RDBMS.  In the RDBMS, Object_ID is only unique within a given da', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The name of the foreign key column from the fact table. This is needed to identify role playing tables that point to the same un', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Join_Column'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Metadata key for the database this subject area is in', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Comments', @value=N'Useful for cleaning out the metadata contents for a database, though implied by the Subject Area', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'FK To', @value=N'DW_Subject_Areas.Subject_Area_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Subject_Area_Key'; 
exec sys.sp_addextendedproperty @name=N'FK To', @value=N'DW_Objects.Object_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Subject_Area_Contents', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
;





/* Drop table dbo.DW_Objects */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Objects') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Objects 
;

/* Create table dbo.DW_Objects */
CREATE TABLE dbo.DW_Objects (
   [Object_Key]  int IDENTITY  NOT NULL
,  [Object_ID]  int   NOT NULL
,  [Database_Key]  int   NOT NULL
,  [Object_Display_Name]  sysname   NULL
,  [Object_Physical_Name]  sysname   NULL
,  [Object_Type]  nvarchar(100)   NULL
,  [Object_Purpose]  nvarchar(255)   NULL
,  [Object_Short_Descr]  nvarchar(255)   NULL
,  [Object_Long_Descr]  nvarchar(2000)   NULL
,  [Object_Usage_Tips]  nvarchar(2000)   NULL
,  [Object_Steward_Contact]  nvarchar(255)   NULL
,  [Last_refresh_date]  datetime   NULL
,  [Update_Frequency]  nvarchar(50)   NULL
,  [Object_Status]  nvarchar(25)   NOT NULL
, CONSTRAINT [PK_dbo.DW_Objects] PRIMARY KEY CLUSTERED 
( [Object_Key], [Object_ID] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Objects
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Objects', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Objects
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'List of DW related objects, such as relational tables or Analysis Services dimensions & measure groups', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Objects
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Display Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Display_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Physical Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Physical_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Type'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Purpose', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Purpose'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Short Description', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Long Description', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Usage Tips', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Usage_Tips'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Steward Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Steward_Contact'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Last Refresh Date', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Last_refresh_date'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Update Frequency', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Update_Frequency'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Status'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate, unique key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The object_id of the object - this is at the table level in the RDBMS, or the dimension/measure group level in AS. ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Metadata key of the database where the object was found', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The object name that is exposed to the business users.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Display_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The object name that is used internally in the database.  We generally try to keep the display and physical names the same.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Physical_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Object Type depends on the source of the object.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Type'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Object_Purpose is defined in the extended properties and is sourced from the initial design spreadsheet. ', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Purpose'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A short, business-oriented description of the object.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A longer, more detailed description of the object, potentially including information about where it came from, how it is defined', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Usage tips to help the users figure out how to work with this object.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Usage_Tips'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business owner of the content data quality for this object.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Steward_Contact'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'This could be from the ETL process or the Analysis Services object model', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Last_refresh_date'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'This could be from the ETL process or the Analysis Services object model', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Update_Frequency'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'An Active Object still in the physical source.  A Cancelled Object is no longer in the physical source.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Objects', @level2type=N'COLUMN', @level2name=N'Object_Status'; 
;





/* Drop table dbo.DW_Object_Contents */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Object_Contents') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Object_Contents 
;

/* Create table dbo.DW_Object_Contents */
CREATE TABLE dbo.DW_Object_Contents (
   [Object_Key]  Int   NOT NULL
,  [Attribute_Key]  int   NOT NULL
,  [Content_Map_Name]  nvarchar(250)   NULL
,  [Database_Key]  int   NOT NULL
, CONSTRAINT [PK_dbo.DW_Object_Contents] PRIMARY KEY NONCLUSTERED 
( [Object_Key], [Attribute_Key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Fact', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Object_Contents
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Object_Contents', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Object_Contents
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'Many to many mapping table between Objects and Attributes', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Object_Contents
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Attribute_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Content Map Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Content_Map_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate, unique key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate, unique key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Attribute_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'This allows the creation of multiple mappings between Objects and Attributes.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Content_Map_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Metadata key for the database this object is in', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Full Map, Sales Map', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Content_Map_Name'; 
exec sys.sp_addextendedproperty @name=N'Comments', @value=N'Useful for cleaning out the metadata contents for a database, though implied by the Object', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'FK To', @value=N'DW_Objects.Object_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Object_Key'; 
exec sys.sp_addextendedproperty @name=N'FK To', @value=N'DW_Attributes.Attribute_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Object_Contents', @level2type=N'COLUMN', @level2name=N'Attribute_Key'; 
;





/* Drop table dbo.DW_Attributes */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.DW_Attributes') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.DW_Attributes 
;

/* Create table dbo.DW_Attributes */
CREATE TABLE dbo.DW_Attributes (
   [Attribute_Key]  Int IDENTITY  NOT NULL
,  [Attribute_ID]  nvarchar(255)   NOT NULL
,  [Database_Key]  int   NOT NULL
,  [Object_ID]  Int   NOT NULL
,  [Attribute_Sequence]  Int   NOT NULL
,  [Attribute_Display_Name]  nvarchar(255)   NULL
,  [Attribute_Physical_Name]  sysname   NULL
,  [Attribute_Group_Name]  nvarchar(255)   NOT NULL
,  [Datatype]  nvarchar(20)   NULL
,  [Attribute_Length]  Int   NULL
,  [Attribute_Short_Descr]  nvarchar(255)   NULL
,  [Attribute_Long_Descr]  nvarchar(2000)   NULL
,  [Attribute_Example_Values]  nvarchar(512)   NULL
,  [Attribute_Comment]  nvarchar(2000)   NULL
,  [Attribute_Default_Value]  nvarchar(512)   NULL
,  [Attribute_ETL_Rules]  nvarchar(2000)   NULL
,  [Source_System]  nvarchar(255)   NULL
,  [Attribute_Usage_Tips]  nvarchar(2000)   NULL
,  [Attribute_Steward_Contact]  nvarchar(255)   NULL
,  [Attribute_Status]  nvarchar(25)   NOT NULL
, CONSTRAINT [PK_dbo.DW_Attributes] PRIMARY KEY CLUSTERED 
( [Attribute_Key] )
) ON [PRIMARY]
;

--Table extended properties...
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Dimension', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Attributes
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'DW_Attributes', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Attributes
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'DW_Attributes contains the columns or attributes in the data warehouse dim/fact table, or the SSAS dimension or measure group.  ', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=DW_Attributes
;

--Column extended properties
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Database_Key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Object ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Object_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Sequence', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Sequence'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Display Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Display_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Physical Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Physical_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Group Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Group_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Datatype', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Datatype'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Length', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Length'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Short Descr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Long Descr', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Example Values', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Example_Values'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Comment', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Comment'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Default Value', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Default_Value'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute ETL Rules', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_ETL_Rules'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Source System', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Source_System'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Usage Tips', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Usage_Tips'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Steward Contact', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Steward_Contact'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'Attribute Status', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Status'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Surrogate, unique key', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Attribute_ID is a combination of the Object_ID and the Attribute_Sequence (the Column_ID in the RDBMS).', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The Metadata key of the database where the object was found', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Database_Key'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The object_id of the object that owns this attribute - this is at the table level in the RDBMS.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Object_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The attribute sequence - this is the column_id in the RDBMS.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Sequence'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The attribute name that is exposed to the business users.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Display_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The attribute name that is used internally in the database.  We generally try to keep the display and physical names the same.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Physical_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The group to which this attribute belongs.  This corresponds to Display Folders in Analysis Services', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Group_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The data type of the attribute', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Datatype'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'The maximum length of the attribute', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Length'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A short, business-oriented description of the attribute.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Short_Descr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'A longer, more detailed description of the attribute, potentially including information about where it came from, how it is defi', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Long_Descr'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Relevant example values of the contents of this attribute.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Example_Values'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Contents of the Comment field from the original data model design spreadsheet.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Comment'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Default value, if specified.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Default_Value'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'ETL rules from the original data model design spreadsheet.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_ETL_Rules'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Source system for this attribute', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Source_System'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Usage tips to help the users figure out how to work with this attribute.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Usage_Tips'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Business owner of the content data quality for this attribute.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Steward_Contact'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'An Active Attribute still in the physical source.  A Cancelled Attribute is no longer in the physical source.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Status'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Active, Cancelled', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'DW_Attributes', @level2type=N'COLUMN', @level2name=N'Attribute_Status'; 
;
