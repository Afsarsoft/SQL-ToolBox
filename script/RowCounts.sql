/***************************************************************************************************
File: RowCounts.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Displays total row counts of all tables in a SQL DB
****************************************************************************************************/
SELECT SCHEMA_NAME(t.schema_id) SchemaName,
    t.[name] TableName,
    SUM(p.row_count) TotalRows
FROM sys.tables t
    INNER JOIN sys.dm_db_partition_stats p
    ON t.object_id = p.object_id
        AND t.type_desc = 'USER_TABLE'
        AND p.index_id IN (0,1)
-- WHERE t.[name] = 'Invoices'
GROUP BY t.schema_id, t.[name]
ORDER BY TotalRows DESC

-- OR
SELECT
    QUOTENAME(SCHEMA_NAME(sOBJ.schema_id)) + '.' + QUOTENAME(sOBJ.name) AS [TableName]
      , SUM(sPTN.Rows) AS [RowCount]
FROM
    sys.objects AS sOBJ
    INNER JOIN sys.partitions AS sPTN
    ON sOBJ.object_id = sPTN.object_id
WHERE
      sOBJ.type = 'U'
    AND sOBJ.is_ms_shipped = 0x0
    AND index_id < 2
-- 0:Heap, 1:Clustered
GROUP BY 
      sOBJ.schema_id
      , sOBJ.name
ORDER BY [TableName]
GO
