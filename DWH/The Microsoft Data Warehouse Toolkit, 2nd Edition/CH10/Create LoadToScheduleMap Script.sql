/****** Object:  Database DW_Metadata    Script Date: 8/13/2008 10:30:50 AM ******/
/*
Kimball Group, The Microsoft Data Warehouse Toolkit
Generate a database from the datamodel worksheet, version: 3.3

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
*/
USE DW_Metadata
GO

/* Drop table dbo.ETL_Job_To_RS_Schedule_Map */
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'dbo.ETL_Job_To_RS_Schedule_Map') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE dbo.ETL_Job_To_RS_Schedule_Map 
GO

/* Create table dbo.ETL_Job_To_RS_Schedule_Map */
CREATE TABLE dbo.ETL_Job_To_RS_Schedule_Map (
   [ETL_Job_ID]  int   NOT NULL
,  [RS_Schedule_ID]  int   NOT NULL
,  [ETL_Job_Name]  varchar(250)   NULL
,  [ETL_Job_Type]  varchar(50)   NULL
,  [RS_Schedule_Name]  varchar(250)   NULL
,  [RS_ScheduleStatus]  varchar(50)   NULL
,  [ModifiedDate]  datetime   NULL
, CONSTRAINT [PK_dbo.ETL_Job_To_RS_Schedule_Map] PRIMARY KEY CLUSTERED 
( [ETL_Job_ID], [RS_Schedule_ID] )
) ON [PRIMARY]
GO

exec sys.sp_addextendedproperty @name=N'Table Name', @value=N'ETL_Job_To_RS_Schedule_Map', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=ETL_Job_To_RS_Schedule_Map
exec sys.sp_addextendedproperty @name=N'Table Type', @value=N'Utility', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=ETL_Job_To_RS_Schedule_Map
exec sys.sp_addextendedproperty @name=N'View Name', @value=N'v_ETL_Job_To_RS_Schedule_Map', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=ETL_Job_To_RS_Schedule_Map
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ETL_Job_To_RS_Schedule_Map', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=ETL_Job_To_RS_Schedule_Map
exec sys.sp_addextendedproperty @name=N'Table Description', @value=N'The ETL_Job_To_RS_Schedule_Map table ties ETL load jobs to Reporting Services schedules, allowing you to automatically kick off a set of reports when a load is finished.', @level0type=N'SCHEMA', @level0name=dbo, @level1type=N'TABLE', @level1name=ETL_Job_To_RS_Schedule_Map
GO

exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ETL_Job_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RS_Schedule_ID', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_ID'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ETL_Job_Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ETL_Job_Type', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Type'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RS_Schedule_Name', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_Name'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'RS_ScheduleStatus', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_ScheduleStatus'; 
exec sys.sp_addextendedproperty @name=N'Display Name', @value=N'ModifiedDate', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ModifiedDate'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'ELT Load primary key.  This is a made-up key that must be unique for each ETL job in the table', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Reporting Services schedule primary key.  This is a made-up key that must be unique for each reporting services schedule in the table.  If you like, you could declare this a GUID and use the actual schedule ID from the Reporting Services Schedule table.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_ID'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the Data Warehouse ETL Load job', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Type of Data Warehouse load - Regular, Test', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Type'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Name of the Reporting Services schedule.  This needs to match the schedule name in the Reporting Services Schedule table.', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_Name'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Status of the schedule set here in this table -- Active or Inactive', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_ScheduleStatus'; 
exec sys.sp_addextendedproperty @name=N'Description', @value=N'Date this row was most recently changed', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ModifiedDate'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'1, 2, 3…', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_ID'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Orders Data Load', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Regular, Test', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Type'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Sales Org Orders Reports; Orders Data Load Complete', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_Name'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'Active', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_ScheduleStatus'; 
exec sys.sp_addextendedproperty @name=N'Example Values', @value=N'7/2/2008 1:31:07 PM', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ModifiedDate'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Type'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_Name'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_ScheduleStatus'; 
exec sys.sp_addextendedproperty @name=N'SCD  Type', @value=N'1', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ModifiedDate'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Hand Entered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Hand Entered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_ID'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Hand Entered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Hand Entered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ETL_Job_Type'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Hand Entered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_Schedule_Name'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Hand Entered', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'RS_ScheduleStatus'; 
exec sys.sp_addextendedproperty @name=N'Source System', @value=N'Derived in ETL', @level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'ETL_Job_To_RS_Schedule_Map', @level2type=N'COLUMN', @level2name=N'ModifiedDate'; 
GO


INSERT INTO dbo.ETL_Job_To_RS_Schedule_Map VALUES(1,23,'Orders Data Load', 'Regular', 'Orders Data Load Complete', 'Active', '7/21/2008')
INSERT INTO dbo.ETL_Job_To_RS_Schedule_Map VALUES(1,25,'Orders Data Load', 'Test', 'Orders Data Load Test', 'Active', '7/23/2008')
INSERT INTO dbo.ETL_Job_To_RS_Schedule_Map VALUES(2,27,'KU Data Load', 'Regular', 'KU Data Load Complete', 'Active', '8/12/2008')

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[RS_Link_Test_Data]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [dbo].[RS_Link_Test_Data] 
GO
CREATE TABLE [dbo].[RS_Link_Test_Data](
	[Date] [datetime] NULL
) ON [PRIMARY]