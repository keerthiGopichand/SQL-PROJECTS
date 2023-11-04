-- Assignmnet 3


--1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’.
	Create Table Orders (Order_Id int, Order_Date Date, Amount Decimal(8,2), Cus_id int)

--2. Insert 5 new records.
	Insert into Orders values
		(100,'2022-07-23',20000,1),
		(102,'2023-04-15',23500,3),
		(103,'2022-11-14',45000,6),
		(104,'2023-07-23',12000,5),
		(105,'2021-09-26',34600,2),
		(106,'2019-10-21',7600,9)

		Select * from Orders
		Select * from Customer

--3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column.
	Select * from Customer C
	Join Orders O
	on C.Cus_id=O.Cus_id

--4. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column.
	Select * from Customer C
	Left Join Orders O
	on C.Cus_id=O.Cus_id

	Select * from Customer C
	Right Join Orders o
	on C.Cus_id=O.Cus_id

--5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column.
	Select * from Customer C
	full outer Join Orders O
	on C.Cus_id=O.Cus_id

--6. Update the ‘Orders’ table and set the amount to be 100 where ‘customer_id’ is 3.
	
	Update Orders
	set Amount=23500
	Where Cus_id=3

	select o1.order_id 
from Orders o1
join Orders o2
on o1.Amount=o2.Amount And o1.Order_Id<>o2.Order_Id

