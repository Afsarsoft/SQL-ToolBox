/***************************************************************************************************
File: CheckRI.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Check RI/Diff between to tables 
****************************************************************************************************/
SELECT *
FROM Zagros.Customer
WHERE CountryID
NOT IN (SELECT CountryID
FROM Zagros.Country);

    SELECT CountryID
    FROM Zagros.Country
EXCEPT
    SELECT CountryID
    FROM Zagros.Customer

SELECT distinct CountryID
FROM Zagros.Customer

SELECT distinct CountryID
FROM Zagros.Country

