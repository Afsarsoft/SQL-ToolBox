/***************************************************************************************************
File: DropPKs.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Drop All Table PKs from a SQL DB 
****************************************************************************************************/
DECLARE @SQL NVARCHAR(MAX);
SET @SQL = N'';

SELECT @SQL = @SQL + N'
  ALTER TABLE ' + QUOTENAME(s.name) + N'.'
  + QUOTENAME(t.name) + N' DROP PKs '
  + QUOTENAME(c.name) + ';'
FROM sys.objects AS c
  INNER JOIN sys.tables AS t
  ON c.parent_object_id = t.[object_id]
  INNER JOIN sys.schemas AS s
  ON t.[schema_id] = s.[schema_id]
WHERE c.[type] = 'PK'
ORDER BY c.[type];

RAISERROR(@SQL, 0,1) WITH NOWAIT;

-- https://stackoverflow.com/questions/14722201/stored-procedure-exec-vs-sp-executesql-difference
-- https://www.sqlindia.com/difference-between-sp_execute-sp_executesql-exec/
EXEC sys.sp_executesql @SQL;
