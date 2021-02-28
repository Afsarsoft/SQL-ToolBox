/***************************************************************************************************
File: Duplicates.sql
----------------------------------------------------------------------------------------------------
Create Date:    2021-03-01 (yyyy-mm-dd)
Description:    Check for Duplicates
****************************************************************************************************/
-- Check for duplicate emails.
SELECT Email
FROM Zagros.Customer WITH (NOLOCK)
Group BY Email
Having Count(*) > 1

-- To get the number of duplicate email
SELECT Email, COUNT(*) TotalEmailCount
FROM Zagros.Customer WITH (NOLOCK)
Group BY Email
Having Count(*) > 1