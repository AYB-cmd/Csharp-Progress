/* 
Copyright (C) 2011 - Kimball Group - All Rights Reserved
Version 4.0 - February 18, 2011

The stored procedures defined in this script perform the initial
population of the DW_Metadata database. This database, and the script
to populate it, are very closely tied to the naming conventions 
described in the Microsoft Data Warehouse Toolkit book and implemented
in the associated dimensional data modeling spreadsheet (which you can 
obtain from the book's website).

This script creates the following SPs:
- updDtbList, to update the list of databases registered in DW_Metadata. It
picks up only relational databases. SSAS databases are populated via a different
mechanism.

- dtbClear, clears out all the metadata in DW_Metadata, for a single database

- dtbLoad, loads (or re-loads) all the metadata in DW_Metadata, for a single database.

- LoadAllDtbs, loads all databases (calls updDtbList and then calls dtbLoad for all 
databases with Gen_Metadata_Dtb = 'Y'
*/

use DW_Metadata
go
/****** Object:  StoredProcedure [dbo].[updDtbList] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[updDtbList]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[updDtbList]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updDtbList]
/*
This stored procedure refreshes the list of databases in DW_Metadata. It will add new databases, and 
the status of dropped databases to 'Deleted'.
*/ 
@Debug bit = 'False'
--, @SrvName nvarchar(100) 
AS
BEGIN

IF @Debug = 'False' SET NOCOUNT ON

/*
This temp table #DBDescr contains a list of database IDs and the value
of the extended property named "Description," for all the databases on this server.
We get rows only for the databases that have an extended property called Description.
*/
Create Table #DBDescr (
  DatabaseID int,
  DtbDescription nvarchar(1000)
)

DECLARE
	@DBID int,
	@DBIDString sysname,
	@DBName sysname,
	@DatabaseKey int,
	@ParmDefinition nvarchar(500)

SET @ParmDefinition = N'@DatabaseName sysname, @DatabaseID int'

DECLARE DBCursor CURSOR FOR 
SELECT database_id, name from sys.databases
where owner_sid <> 1

OPEN DBCursor

FETCH NEXT FROM DBCursor 
INTO   @DBID, @DBName

WHILE @@FETCH_STATUS = 0
BEGIN
     EXEC sp_executesql N'EXECUTE (N''INSERT INTO #DBDescr SELECT '''''' + @DatabaseID + '''''' DBID, 
     CAST(value AS nvarchar(1000)) from ['' + @DatabaseName + ''].sys.extended_properties
	 WHERE Class=0 AND name = ''''Description'''' '')', @ParmDefinition, @DatabaseName = @DBName, @DatabaseID = @DBID
	-- Could put the database-specific queries in here...

	FETCH NEXT FROM DBCursor 
	INTO   @DBID, @DBName
END  
CLOSE DBCursor
DEALLOCATE DBCursor

-- Insert any new databases into the Database table
INSERT INTO DW_Databases
(Database_ID, Database_Name, Database_Short_Descr, Database_Long_Descr, 
 Gen_Metadata_Ind, Database_Type, Database_Status, Instance_Name, Server_Name)
SELECT 
Cast(a.database_id AS NVARCHAR(100)) AS Database_ID  -- Database_ID is char to support SSAS cubes
, '[' + a.name + ']' AS Database_Name
, b.DtbDescription AS Database_Short_Descr
, b.DtbDescription AS Database_Long_Descr
-- Any database that came from the MDWT modeling spreadsheet will have a database description. So by 
-- default, set the flag to generate metadata to FALSE (N) if the database description is NULL.
, CASE WHEN b.DatabaseID IS NULL THEN 'N' ELSE 'Y' END AS Gen_Metadata_Ind
, 'Relational' AS Database_Type -- This script is for relational DW databases only
, 'Active' AS Database_Status
, CAST(SERVERPROPERTY('InstanceName') AS Varchar) AS Instance_Name
, CAST(SERVERPROPERTY('ServerName') AS Varchar) AS Server_Name
FROM sys.databases a
LEFT OUTER JOIN  #DBDescr b
ON a.database_id = b.DatabaseID
WHERE a.owner_sid <> 1 -- non-system databases
AND CAST(a.Database_ID AS INT) NOT IN (select Database_ID from DW_Databases) -- Only new databases

-- Look for any databases that used to exist but are gone now... set their status to Deleted
UPDATE DW_Databases
SET Database_Status = 'Deleted'
WHERE Database_Status = 'Active' AND
Database_Type = 'Relational' AND
CAST(Database_ID AS INT) NOT IN (select Database_ID FROM sys.databases)

-- Clean up
DROP TABLE #DBDescr

IF @Debug = 'TRUE' 
BEGIN
  Select * from DW_Databases
END

IF @Debug = 'False' SET NOCOUNT OFF

END

GO



/****** Object:  StoredProcedure [dbo].[DtbClear] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DtbClear]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DtbClear]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DtbClear]
/*
This stored procedure clears out the metadata contents for a database in DW_Metadata.
It doesn't affect the actual database, merely its metadata contents as they are 
reflected in DW_Metadata.
*/ 
@DtbKey int
, @Debug bit = 'False'
--, @SrvName nvarchar(100) 
AS
BEGIN

IF @Debug = 'False' SET NOCOUNT ON

-- Clear out the metadata already in the metadata tables
DELETE FROM DW_Database_Contents
WHERE Database_Key = @DtbKey

DELETE FROM DW_Subject_Area_Contents 
WHERE Database_Key = @DtbKey

DELETE FROM DW_Object_Contents
WHERE Database_Key = @DtbKey

DELETE FROM DW_Subject_Areas
WHERE Database_Key = @DtbKey

DELETE FROM DW_Objects
WHERE Database_Key = @DtbKey

DELETE FROM DW_Attributes
WHERE Database_Key = @DtbKey



IF @Debug = 'TRUE' 
BEGIN
  Select * from DW_Databases
  SELECT 'DW_Databases' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Databases UNION
  SELECT 'DW_Database_Contents' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Database_Contents UNION
  SELECT 'DW_Subject_Area_Contents' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Subject_Area_Contents UNION
  SELECT 'DW_Object_Contents' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Object_Contents UNION
  SELECT 'DW_Subject_Areas' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Subject_Areas UNION
  SELECT 'DW_Objects' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Objects UNION
  SELECT 'DW_Attributes' AS [DtbName], COUNT(*) AS [RowCount] FROM DW_Attributes
END

IF @Debug = 'False' SET NOCOUNT OFF

END
GO
/****** Object:  StoredProcedure [dbo].[DtbLoad] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DtbLoad]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[DtbLoad]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DtbLoad]
/*
This stored procedure clears out the metadata contents for a database in DW_Metadata.
It doesn't affect the actual database, merely its metadata contents as they are 
reflected in DW_Metadata.
*/ 
@DtbKey int = 13
, @Debug bit = 'False'
--, @SrvName nvarchar(100) 
AS 
BEGIN

IF @Debug = 'False' SET NOCOUNT ON

DECLARE
@DBID int = (SELECT CAST(Database_ID AS INT) FROM DW_Databases WHERE Database_Key = @DtbKey)
,@DBIDString sysname = (SELECT Database_ID FROM DW_Databases WHERE Database_Key = @DtbKey)
, @DBName sysname = (SELECT Database_Name FROM DW_Databases WHERE Database_Key = @DtbKey)
, @ParmDefinition nvarchar(500) = N'@DatabaseName sysname, @DatabaseID int'
, @DtbKeyString nvarchar(10) = CAST(@DtbKey AS nvarchar(10))

-- Clear out the metadata already in the metadata tables
EXEC dtbClear @DtbKey

/* 
Create Subject Areas for a given database.                                  
We used an Identity column for the Subject_Area_ID to accomodate a range of 
subject areas, but that means we have to populate the Subject_Area table first  
in order to have Subject_Area_IDs to use in the Subject_Area_Contents table.  
We'll have to keep mapping back to the Subject_Area table to get the    
current Subject Area ID 
We identify subject areas based on naming conventions for the central   
Fact tables.  If there is an extended property called Table Type with   
the value of Fact, we use that as the core table in a subject area.   
*/
DECLARE
	@SQLString nvarchar(4000)

/* Fill in the subject areas by finding the fact tables.  Every fact table */
/* gets its own subject area as a starting point.  */

SET @SQLString = 'INSERT INTO DW_Subject_Areas 
(Database_Key, Primary_Fact_Table_ID, Subject_Area_Name, Subject_Area_Short_Descr, 
Subject_Area_Long_Descr, Business_Process_Area, Subject_Area_Status, Subject_Area_Image) 
SELECT DISTINCT ' + CAST(@DtbKey AS nvarchar(10)) + '
, a.object_id AS Primary_Fact_Table_ID
, CASE WHEN UPPER(LEFT(a.name, 4)) = ''FACT'' THEN RIGHT(a.name, LEN(a.name)-4) ELSE a.name END AS SubjectAreaName
, NULL AS Subject_Area_Short_Descr
, NULL AS Subject_Area_Long_Descr
, ''Please group subject areas into business process areas.'' AS Business_Process_Area
, ''Active'' AS SubjectAreaStatus
, Null AS SubjectAreaImage 
FROM ' + @DBName + '.sys.objects a
INNER JOIN ' + @DBName + '.sys.extended_properties b ON a.object_id = b.major_id
WHERE b.name = ''Table Type'' AND b.value IN (''Fact'')'
EXECUTE (@SQLString)
IF @Debug = 'TRUE' SELECT @SQLString

-- Put in default values for subject area descriptions.
SET @SQLString = 'UPDATE DW_Subject_Areas SET
Subject_Area_Short_Descr = ''The '' + Subject_Area_Name + '' subject area is about '' + Subject_Area_Name
, Subject_Area_Long_Descr = ''Please provide a lengthy description of the subject area: '' + Subject_Area_Name'
EXECUTE (@SQLString)

-- Create a Utility subject area if there are any tables with a Utility table type
SET @SQLString = 'INSERT INTO DW_Subject_Areas 
(Database_Key, Primary_Fact_Table_ID, Subject_Area_Name, Subject_Area_Short_Descr, 
Subject_Area_Long_Descr, Business_Process_Area, Subject_Area_Status) 
SELECT DISTINCT ' + @DtbKeyString + '
, NULL AS Primary_Fact_Table_ID
, ''Utility'' AS Subject_Area_Name
, ''Utility tables are used to build the final Fact and Dimension tables.'' AS Subject_Area_Short_Descr
, ''The Utility tables are typically lookup tables or mapping tables that the ETL process uses to create the user queryable star schema. They are not usually made available for direct user query. '' AS Subject_Area_Long_Descr
, ''Data Warehouse'' AS Business_Process_Area
, ''Active'' AS Subject_Area_Status
WHERE EXISTS (SELECT Name FROM ' + @DBName + '.sys.extended_properties 
WHERE Name = ''Table Type'' and Value = ''Utility'')'
IF @Debug = 'TRUE' SELECT @SQLString

-- Create an Audit subject area if there are any tables with an Audit table type
SET @SQLString = 'INSERT INTO DW_Subject_Areas 
(Database_Key, Primary_Fact_Table_ID, Subject_Area_Name, Subject_Area_Short_Descr, 
Subject_Area_Long_Descr, Business_Process_Area, Subject_Area_Status) 
SELECT DISTINCT ' + @DtbKeyString + '
, NULL AS Primary_Fact_Table_ID
, ''Audit'' AS Subject_Area_Name
, ''Audit tables are used to track the ETL process and to capture specific data quality measures.'' AS Subject_Area_Short_Descr
, ''The ETL process writes out entries to the Audit tables which can then be used to identify the load process that was responsible for a given row in the star schema. The Audit tables also capture process metadata such as start times and stop times for the various steps in the ETL job stream.'' AS Subject_Area_Long_Descr
, ''Data Warehouse'' AS Business_Process_Area
, ''Active'' Subject_Area_Status
WHERE EXISTS (SELECT Name FROM ' + @DBName + '.sys.extended_properties 
WHERE Name = ''Table Type'' and Value = ''Audit'')'
EXECUTE (@SQLString)
IF @Debug = 'TRUE' SELECT 'At end of Subject_Area section for ' + @DBName

-- Map the Databases to the Subject Areas in the DW_Database_Contents table
Insert into DW_Database_Contents
Select Database_Key, Subject_Area_Key 
FROM DW_Subject_Areas SA
WHERE Database_Key = @DtbKey 

/*
Insert all the Objects in to the DW_Objects table.  Even
though some of them are not contained in the DW_Object_Content
table.  This will allow you to add the un-mapped objects to 
the appropriate subject areas later.                        
   Note that you need to add role playing tables once for each role 
   they play.  The Subject_Area_Contents table will need to map 
   the different roles to the subject area. 
*/

SET @SQLString = 'INSERT INTO DW_Objects (Object_ID, Database_Key, Object_Display_Name, Object_Physical_Name,
Object_Type, Object_Purpose, Object_Short_Descr, Object_Long_Descr, Object_Usage_Tips, Object_Steward_Contact,
Last_Refresh_Date, Update_Frequency, Object_Status)
SELECT a.object_id AS Object_ID
, ' + @DtbKeyString + ' AS Database_Key 
, a.name AS Object_Display_Name -- initial population only from RDBMS - do not overwrite on update
, a.name AS Object_Physical_Name
, ''Table'' AS Object_Type
, CONVERT(nvarchar(255),MAX(CASE WHEN b.name=''Table Type'' THEN b.value ELSE '''' END)) AS Object_Purpose
, CONVERT(nvarchar(255),MAX(CASE WHEN b.name=''Table Description'' THEN b.value ELSE '''' END)) AS Object_Short_Descr
, CONVERT(nvarchar(2000),MAX(CASE WHEN b.name=''Table Description'' THEN b.value ELSE '''' END)) AS Object_Long_Descr
, ''Provide object usage tips'' AS Object_Usage_Tips
, ''Provide object steward contact info'' AS Object_Steward_Contact
, getdate() AS Last_refresh_date
, ''Daily'' Update_Frequency
, ''Active'' Object_Status
FROM ' + @DBName + '.sys.objects a
LEFT OUTER JOIN ' + @DBName + '.sys.extended_properties b  -- to find the Tables in each Subject Area
ON b.Major_ID = a.object_id
where b.minor_id = 0
--where A.type = ''U''
GROUP BY a.object_id, a.name'
If @Debug='True' select @SQLString
EXECUTE (@SQLString)
IF @Debug = 'TRUE' select 'At end of Objects section for ' + @DBName

/* 
Load the Subject Area Contents table based on 'FK To' extended property  
   from the original spreadsheet model.  This section starts with fact tables 
   as the root because it is based on the existence of the Primary_Fact_Table_ID 
   in the DW_Subject_Area table.  
*/

-- Start with the fact tables
INSERT INTO DW_Subject_Area_Contents
SELECT Subject_Area_Key, Object_Key, O.Object_Physical_Name, sa.Database_Key
FROM DW_Subject_Areas SA INNER JOIN 
DW_Metadata.dbo.DW_Objects O on
SA.Database_Key = O.Database_Key AND
SA.Primary_Fact_Table_ID = O.Object_ID
WHERE SA.Database_Key = @DtbKey

-- Now get the associated dimension tables
SET @SQLString = 'USE ' + @DBName + ' 
INSERT INTO DW_Metadata.dbo.DW_Subject_Area_Contents
SELECT d.Subject_Area_Key, c.Object_Key, cols.name, c.Database_Key
FROM sys.objects a  /* subject area */
JOIN sys.extended_properties b  /* to find the FK columns */
on a.object_id = b.major_id
JOIN DW_Metadata.dbo.DW_Objects c  /* to look up the FK objects in a subject area */
ON (LEFT(CAST(b.value AS nvarchar(2000)), ABS(CHARINDEX(''.'',CAST(b.value AS nvarchar(2000)))-1))) = c.Object_Physical_Name  
  /* have to join by name because that is all we have in the extended properties */
JOIN DW_Metadata.dbo.DW_Subject_Areas d
ON a.object_ID = d.Primary_Fact_Table_ID
JOIN sys.columns cols on a.object_ID = cols.object_ID
   AND cols.column_ID = b.minor_id
where b.name = ''FK To''
AND c.Database_Key = d.Database_Key
AND d.Database_Key = ' + @DtbKeyString + ' 
ORDER BY 1'

IF @Debug = 'TRUE' select @SQLString
EXECUTE(@SQLString)

/* Insert the Audit and Utility tables into the DW_Subject_Area_Content.    
   NOTE: This code will miss any Audit or Utility tables that are marked   
   as Dimensions in the extended properties.  If they are not really   
   dimensions, in other words, if they are not foreign keys to a Fact table,
   you should set their Table Type to Utility if you want them to show up
   in the Metadata database.
*/

SET @SQLString = 'USE ' + @DBName + ' INSERT INTO 
 DW_Metadata..DW_Subject_Area_Contents
SELECT DISTINCT d.Subject_Area_Key, c.Object_Key, c.Object_Physical_Name, d.Database_Key
FROM sys.extended_properties b  -- to find the Tables in each Subject Area
JOIN DW_Metadata..DW_Subject_Areas d
ON b.value = d.Subject_Area_Name
JOIN DW_Metadata..DW_Objects c
ON c.Object_ID = b.Major_ID
   AND c.Database_Key = d.Database_Key
where 
d.Database_Key = ' + @DtbKeyString + '
AND b.name = ''Table Type''
AND b.value IN (''Audit'', ''Utility'', ''Maintenance'', ''Bridge'') -- add any other table types as needed
order by 1'

EXECUTE(@SQLString)

IF @Debug = 'TRUE' SELECT 'At end of Subject_Area_Contents for ' + @DBName

/* NOTE: This code does not include Bridge tables and their associated  
 dimensions in the appropriate subject areas.  You will need to manually 
 remap them in the Metadata Database.
*/

/* Now set the Join_Column to a zero length string if the relationship is not a role-
   playing relationship.  You can then concatenate the Object Name with its Join_Column
   in the reporting process, although you might as well put a display name column in 
   every table that would pre-join these columns.  
*/

Update DW_Subject_Area_Contents
  Set Join_Column = '' 
  From (Select Subject_Area_Key, Object_Key, count(*) As Row_Count 
        from DW_Subject_Area_Contents 
        WHERE Database_Key = @DtbKey
        Group BY Subject_Area_Key, Object_Key) Non_Role_Tables
  JOIN DW_Subject_Area_Contents SAC
    ON SAC.Subject_Area_Key = Non_Role_Tables.Subject_Area_Key
    AND SAC.Object_Key = Non_Role_Tables.Object_Key
  AND Row_Count=1

IF @Debug = 'TRUE' select * from DW_Subject_Area_Contents

/* Populate the Attributes table so the Object Contents table  */
/* won't fail RI checks when we insert  */

/* Add in all the Attributes for the objects in the current database */
SET @SQLString = 'USE ' + @DBName + ' INSERT INTO 
 DW_Metadata..DW_Attributes
SELECT
(''' + @DtbKeyString + ''' + ''-'' + CAST(c.object_id AS nvarchar(30)) + ''-'' + CAST(c.column_id AS nvarchar(30))) AS Attribute_ID
, ' + @DtbKeyString + ' AS Database_Key
, a.object_id AS Object_ID
, c.column_id AS Attribute_Sequence
, CONVERT(nvarchar(255),MAX(CASE WHEN b.name=''Display Name'' THEN b.value ELSE '''' END)) AS Attribute_Display_Name
, c.name AS Attribute_Physical_Name
, ''Default'' AS Attribute_Group_Name
, d.Data_Type AS Datatype
, ISNULL(Character_Maximum_Length,0) + ISNULL(Numeric_Precision,0) + ISNULL(DATETIME_PRECISION,0) AS Attribute_Length
, CONVERT(nvarchar(255),MAX(CASE WHEN b.name=''Description'' THEN b.value ELSE '''' END)) AS Attribute_Short_Descr
, CONVERT(nvarchar(2000),MAX(CASE WHEN b.name=''Description'' THEN b.value ELSE '''' END)) AS Attribute_Long_Descr
, CONVERT(nvarchar(512),MAX(CASE WHEN b.name=''Example Values'' THEN b.value ELSE '''' END)) AS Attribute_Example_Values
, CONVERT(nvarchar(2000),MAX(CASE WHEN b.name=''Comment'' THEN b.value ELSE '''' END)) AS Attribute_Comment
, d.COLUMN_DEFAULT AS Attribute_Default_Value
, CONVERT(nvarchar(2000),MAX(CASE WHEN b.name=''ETL Rules'' THEN b.value ELSE '''' END)) AS Attribute_ETL_Rules
, CONVERT(nvarchar(255),MAX(CASE WHEN b.name=''Source System'' THEN b.value ELSE '''' END)) AS Source_System
, ''To be filled in...'' AS Attribute_Usage_Tips
, ''To be filled in...'' AS Attribute_Steward_Contact
, ''Active'' AS Attribute_Status
from sys.tables a
JOIN sys.columns c
on a.object_id = c.object_id 
JOIN sys.schemas e
ON a.schema_id = e.schema_id
JOIN INFORMATION_SCHEMA.COLUMNS d
ON d.COLUMN_NAME = c.name
AND d.TABLE_NAME = a.name
AND d.TABLE_SCHEMA = e.name
LEFT OUTER JOIN sys.extended_properties b
on a.object_id = b.major_id
and b.minor_id = c.column_id
group by a.object_id, a.name, c.object_id, c.column_id, c.name, 
d.DATA_TYPE, ISNULL(Character_Maximum_Length,0) + ISNULL(Numeric_Precision,0) + ISNULL(DATETIME_PRECISION,0),
d.COLUMN_DEFAULT
order by a.name, c.column_id'
IF @Debug = 'TRUE' SELECT @SQLString
EXECUTE(@SQLString)

/* Set all the Attribute Display Names to be the same as the physical names if the display name is blank */

Update DW_Attributes set Attribute_Display_Name = Attribute_Physical_Name
       WHERE LEN(Attribute_Display_Name) = 0

/* 
Finally, populate the Object_Content info to map Attributes to Objects.  
The schema allows for multiple mappings.  This code loads all 
attributes for each object into the Default mapping.  Note that 
there are probably some objects that are not in the             
Subject_Area_Content table.  This allows you to use the mapping  
tool you will create to add new Subject Areas and map the objects 
to them.  Please keep us posted of your progress in creating this tool. 
*/

INSERT INTO DW_Object_Contents
SELECT
a.Object_Key, c.Attribute_Key, 
'Default' Content_Map_Name
, @DtbKey
from DW_Objects a
JOIN DW_Attributes c
on a.object_id = c.object_id 
   AND a.Database_Key = c.Database_Key
   AND a.Database_Key = @DtbKey


-- Clean up

IF @Debug = 'TRUE' 
BEGIN
  Select * from DW_Databases
  Select * from DW_Subject_Areas
  Select * from DW_Database_Contents
  Select * from DW_Objects
  Select Subject_Area_Key, Object_Key, count(*) from DW_Subject_Area_Contents group by Subject_Area_Key, Object_Key
  Select * from DW_Object_Contents
  Select * from DW_Attributes
END

IF @Debug = 'False' SET NOCOUNT OFF

END
GO


/****** Object:  StoredProcedure [dbo].[LoadAllDtbs] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LoadAllDtbs]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[LoadAllDtbs]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[LoadAllDtbs]
/*
This stored procedure loads the metadata for all databases whose Metadata_Load_Ind = 'Y'
*/
@Debug bit = 'False'
--, @SrvName nvarchar(100) 
AS
BEGIN

IF @Debug = 'False' SET NOCOUNT ON

EXECUTE updDtbList		-- Update the list of databases
DECLARE @DtbKey INT

DECLARE AllDtbs_Cursor CURSOR FOR
SELECT Database_Key FROM DW_Databases
WHERE Gen_Metadata_Ind = 'Y'

OPEN AllDtbs_Cursor

-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
FETCH NEXT FROM AllDtbs_Cursor INTO @DtbKey
   EXECUTE DtbLoad @DtbKey
   
WHILE @@FETCH_STATUS = 0
BEGIN
   FETCH NEXT FROM AllDtbs_Cursor INTO @DtbKey
   EXECUTE DtbLoad @DtbKey
END

CLOSE AllDtbs_Cursor
DEALLOCATE AllDtbs_Cursor

END		-- Stored Proc LoadAllDtbs

GO