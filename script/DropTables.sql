/***************************************************************************************************
File: DropTables.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Drop All Tables from a SQL DB 
****************************************************************************************************/

-- https://stackoverflow.com/questions/27606518/how-to-drop-all-tables-from-a-database-with-one-sql-query
DECLARE @SQL NVARCHAR(max) = SPACE(0);

SELECT @SQL += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE';

RAISERROR(@SQL, 0,1) WITH NOWAIT;

EXECUTE Sp_executesql @SQL

