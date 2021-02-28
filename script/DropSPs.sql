/***************************************************************************************************
File: DropSPs.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Drop All SPs from a SQL DB 
****************************************************************************************************/
DECLARE @SQL NVARCHAR(MAX);
SET @SQL = SPACE(0);

SELECT @SQL = @SQL + N'
	DROP PROCEDURE [' + SCHEMA_NAME(schema_id) + '].[' + NAME + '];'
FROM sys.procedures

RAISERROR(@SQL, 0,1) WITH NOWAIT;

EXEC sys.sp_executesql @SQL;
