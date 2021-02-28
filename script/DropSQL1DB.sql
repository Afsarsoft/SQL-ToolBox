/***************************************************************************************************
File: DropSQL1DB.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Drop SQL DB SQL1 
****************************************************************************************************/
USE [master]
GO

/* Query to Get Exclusive Access of SQL Server Database before Dropping the Database  */
ALTER DATABASE [SQL1] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

DROP DATABASE [SQL1]
GO
