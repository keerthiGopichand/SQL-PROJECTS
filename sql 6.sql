--Problem Statement:
--assignment 6
--You have successfully cleared your fifth semester. In the final semester you will
--work with views, transactions and exception handling.

Create Table customer_san_jose (Cus_id int, First_Name Varchar(10), Last_Name Varchar
(15), Email Varchar(15), [Address] Varchar(25), City Varchar(30),
[State] Varchar(10), Zip int)Insert Into customer_san_jose Values(1, 'Kumar', 'A', 'KA@Gmail.com', 'South India', 
'Bengaluru', 'Karnataka', 560401)
Insert Into customer_san_jose Values(2, 'Shujan', 'Chakraborty', 'SC@xyz.com', 'Nort East
 India', 'Guhati', 'Assam', 570601)
Insert Into customer_san_jose Values(3, 'Ritu', 'M', 'RM@xyz.com', 'North America', 'LA',
'California', 570602)
Insert Into customer_san_jose Values(4, 'Sayan', 'Chandra', 'SC@xyz.com', 'South 
America', 'San Jose', 'California', 570603)
Insert Into customer_san_jose Values(5, 'Gita', 'Lao', 'GL@xyz.com', 'North America', 
'San Jose', 'California', 570604)select * from customer_san_jose

SELECT *
FROM customer_san_jose
WHERE City = 'San Jose'; 

--2. Inside a transaction, update the first name of the customer to ritu iswhere the last name is m:
--a. Rollback the transaction
--b. Set the first name of customer to gita, where the last nameis lao
BEGIN TRANSACTION;
update customer_san_jose
SET First_Name = 'Ritu'
WHERE Last_Name = 'M';

update customer_san_jose
SET First_Name = 'Gita'
WHERE Last_Name = 'Lao';

ROLLBACK;
-- 3.Inside a TRY... CATCH block, divide 100 with 0, print the default error message.

BEGIN Try
    -- Attempt to divide 100 by 0
    SELECT 100 / 0;
END Try
BEGIN CATCH
    -- Print the default error message
    PRINT ERROR_MESSAGE();
END CATCH;


--4. Create a transaction to insert a new record to Orders table and saveit.
BEGIN TRANSACTION;

BEGIN TRY
    -- Insert a new record into the Orders table
    Insert Into customer_san_jose Values(1, 'Kumar', 'A', 'KA@Gmail.com', 'South India', 
'Bengaluru', 'Karnataka', 560401)
Insert Into customer_san_jose Values(2, 'Shujan', 'Chakraborty', 'SC@xyz.com', 'Nort East
 India', 'Guhati', 'Assam', 570601)
Insert Into customer_san_jose Values(3, 'Ritu', 'M', 'RM@xyz.com', 'North America', 'LA',
'California', 570602)
Insert Into customer_san_jose Values(4, 'Sayan', 'Chandra', 'SC@xyz.com', 'South 
America', 'San Jose', 'California', 570603)
Insert Into customer_san_jose Values(5, 'Gita', 'Lao', 'GL@xyz.com', 'North America', 
'San Jose', 'California', 570604)

    -- Commit the transaction if everything is successful
    COMMIT;
END TRY
BEGIN CATCH
    -- Rollback the transaction if an error occurs
    ROLLBACK;
    PRINT 'Error occurred. Transaction rolled back.';
END CATCH;