--assignment-4
Create Table Orders (Order_Id int, Order_Date Date, Amount Decimal(8,2), 
Cus_id int)
--2. Insert 5 new records.
Insert into Orders values
(100,'2022-07-23',20000,1),
(102,'2023-04-15',23500,3),
(103,'2022-11-14',45000,6),
(104,'2023-07-23',12000,5),
(105,'2021-09-26',34600,2),
(106,'2019-10-21',7600,9)select * from orders-- Minimum amount
SELECT MIN(amount) AS min_amount FROM orders;

-- Maximum amount
SELECT MAX(amount) AS max_amount FROM orders;

-- Average amount
SELECT AVG(amount) AS avg_amount FROM orders;

--To create a user-defined function in SQL that multiplies a given number 
