/* SQL to demonstrate SCD processing using the MERGE        */
/* statement to compare the full source table with the      */
/* current rows in the Master dimension, and the OUTPUT     */
/* statement to INSERT the new changed rows                 */
/*                                                          */
/* It takes two MERGE passes: one to do the Type 1 updates  */
/* and one to do the new row inserts and the Type 2         */
/* updates.                                                 */
/*                                                          */
/* Note: the date should be a parameter, not based on       */
/* the system date.                                         */
/* Note: You need to run the                                */
/* Customer_SCD_Example_Create_Tables_script.sql to         */
/* set up the tables and data before you run this example   */
/* Copyright 2008 Kimball Group                             */
/* v 2008-10-22 - First release                             */

Select * from Customer_Master

-- Do the Type 1 Updates first (but not the new row inserts)
MERGE INTO  dbo.Customer_Master AS CM
USING Customer_Source AS CS
ON (CM.Source_Cust_ID = CS.Source_Cust_ID) 
WHEN MATCHED AND -- Update all existing rows for Type 1 changes 
	CM.First_Name <> CS.First_Name
	THEN UPDATE SET CM.First_Name = CS.First_Name
;
-- Handle the new rows and the Type 2 inserts, using the MERGE to do the new rows and expire
-- the old Type 2 rows.  Nest the MERGE inside an INSERT to insert the new Type 2 rows.
-- You have to have the INSERT because the MERGE will let you do two different ON MATCH clauses,
-- but it won't let you do a different INSERT in each one.  One has to be a DELETE
-- 

INSERT INTO Customer_Master
	(Source_Cust_ID, First_Name, Last_Name, Address, City, State, Zip, Eff_Date, 
	End_Date, Current_Flag, Change_Reason)
SELECT MERGE_OUT.Source_Cust_ID, MERGE_OUT.First_Name, MERGE_OUT.Last_Name, 
	MERGE_OUT.Address, MERGE_OUT.City, MERGE_OUT.State, MERGE_OUT.Zip, 
	MERGE_OUT.Eff_Date, MERGE_OUT.End_Date, MERGE_OUT.Current_Flag, MERGE_OUT.Change_Reason
FROM
(  MERGE Customer_Master CM
   USING Customer_Source CS
   ON (CM.Source_Cust_ID = CS.Source_Cust_ID) 
   WHEN NOT MATCHED THEN  -- Insert the new rows
	   INSERT VALUES(CS.Source_Cust_ID, CS.First_Name, CS.Last_Name, CS.Address, 
       CS.City, CS.State, CS.Zip, convert(char(10), getdate()-1, 101), 
       '12/31/2199', 'y', 'NW' )
    WHEN MATCHED AND CM.Current_Flag = 'y'
	AND  -- Compare the Type 2 columns to see if we have a change
	(CM.Last_Name <> CS.Last_Name OR
	CM.Address <> CS.Address OR
	CM.City <> CS.City OR
	CM.State <> CS.State OR
	CM.Zip <> CS.Zip )
	THEN  -- If it's a Type 2 change, expire the old row here
		UPDATE SET CM.Current_Flag = 'n',
			CM.End_date = convert(char(10), getdate()-2, 101)
    -- Output the changed rows which will feed into the INSERT statement
    OUTPUT $Action Out_Action, CS.Source_Cust_ID, CS.First_Name, CS.Last_Name, 
           CS.Address, CS.City, CS.State, CS.Zip, convert(char(10), 
           getdate()-1, 101) Eff_Date, '12/31/2199' End_Date, 'y' Current_Flag,	
           ((case when INSERTED.Address <> CS.Address then 'AD ' else '' end) +
		   (case when INSERTED.Last_Name <> CS.Last_Name then 'LN ' else '' end) + 
           (case when INSERTED.City <> CS.City then 'CT ' else '' end) +
           (case when INSERTED.State <> CS.State then 'ST ' else '' end) +
           (case when INSERTED.Zip <> CS.Zip then 'ZP ' else '' end)) Row_Change_Reason
 ) AS MERGE_OUT (Action_Out, Source_Cust_ID, First_Name, Last_Name, Address, 
                 City, State, Zip, Eff_Date, End_Date, Current_Flag, Change_Reason)
WHERE
MERGE_OUT.Action_Out = 'UPDATE'  -- this limits the output row set to only the Type 2 rows
;

select * from Customer_Master -- to see the results

-- Restore the tables to their original state
truncate table Customer_Master 
insert into Customer_Master 
Select * from Customer_Master_Temp

