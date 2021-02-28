/***************************************************************************************************
File: RestoreDBAdventureWorks2019.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Restore SQL DB AdventureWorks2019 
****************************************************************************************************/
USE [master]
RESTORE DATABASE [AdventureWorks2019] FROM  DISK = N'C:\SQL\BAK\AdventureWorks2019.bak' WITH  FILE = 1,
MOVE N'AdventureWorks2017' TO N'C:\SQL\DATA\AdventureWorks2019.mdf',
MOVE N'AdventureWorks2017_log' TO N'C:\SQL\DATA\AdventureWorks2019_log.ldf',
NOUNLOAD,  STATS = 5
