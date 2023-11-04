create database casestudy2
use casestudy2
select *from continent
select *from customer
select* from transactions
--1.Display the count of customers in each region who have done the transaction in the year 2020.
SELECT 
COUNT(CUSTOMER_ID) NO_OF_CUSTOMERS,
REGION_NAME
FROM
CONTINENT, CUSTOMER, TRANSACTIONS
WHERE
CUSTOMER_ID = CUSTOMER_ID AND
REGION_ID = REGION_ID AND
TXN_DATE LIKE ('2020%')
GROUP BY
REGION_NAME;
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CONTINENT'
INTERSECT
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CUSTOMERS'
INTERSECT
SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TRANSACTIONS'

--2.Display the maximum and minimum transaction amount of each transaction type
SELECT
TXN_TYPE,
MIN(TXN_AMOUNT) MIN_TRANSACTION,
MAX(TXN_AMOUNT) MAX_TRANSACTION
FROM
TRANSACTIONS
GROUP BY
TXN_TYPE;

--3.Display the customer id, region name and transaction amount where transaction type is deposit and transaction amount > 2000.
 

select 
  customer_id,
  REGION_NAME,
  TXN_AMOUNT,
  TXN_TYPE
  FROM
   CONTINENT,CUSTOMER,TRANSACTIONS
   WHERE
   REGION_ID = REGION_ID AND
   CUSTOMER_ID = CUSTOMER_ID AND
   TXN_AMOUNT >2000 AND
   TXN_TYPE = 'DEPOSIT'

   --4.	Find duplicate records in the Customer table.
   select 
   CUSTOMER_ID,
   count(*) as duplicates 
   from
    customer
	group by
	CUSTOMER_ID
	having 
	count(CUSTOMER_ID) > 1
	order by CUSTOMER_ID asc;

--5.	Display the customer id, region name, transaction type and transaction amount for the minimum transaction amount in deposit.
	select 
  customer_id,
  REGION_NAME,
  TXN_AMOUNT,
  TXN_TYPE
  FROM
   CONTINENT,CUSTOMER,TRANSACTIONS
   WHERE
   REGION_ID = REGION_ID AND
   CUSTOMER_ID = CUSTOMER_ID AND
   TXN_AMOUNT = (SELECT MIN(TXN_AMOUNT) FROM TRANSACTIONS);
  
--  6.	Create a stored procedure to display details of customers in the Transaction table where the transaction date is greater than Jun 2020.
  create procedure  sp_customer as 
  begin
  select *from transactions inner join customer on customer_id = customer_id 
  where 
  year(txn_date) > 2020 and month(txn_date) > 6
  end;
 sp_customer;

 --7.	Create a stored procedure to insert a record in the Continent table.
 create procedure sp_new_record as begin
 insert into continent values (6,'india')
 end;
  --8.	Create a stored procedure to display the details of transactions that happened on a specific day.
  create procedure sp_details_of_customer_date @date date
  as begin select customer
   
  from customer
   inner join transactions
  on customer_id = customer_id
  where txn_date=@date
  end;
  

  sp_details_of_customer_date;

  --9.	Create a user defined function to add 10% of the transaction amount in a table.

  create function user_defined(@value money)
  returns money as begin
  return @value *1.1
  end;
  select txn_amount[user_define],(txn_amount) as increased from transactions

  --10.	Create a user defined function to find the total transaction amount for a
--given transaction type.

create function fn_transactions(@value varchar(25))
returns table 
as return
select
txn_type,
sum(txn_amount) as tot_amt
from
transactions
where
txn_type = @value
group by
txn_type; 

select * from [dbo].[fn_transactions] ('purchase')
select * from [dbo].[fn_transactions] ('deposit')
select * from [dbo].[fn_transactions] ('withdrawal')

--11.Create a table value function which comprises the columns customer_id, value of table
create funaction fn_all_detailes()
returns table as 
return
select 
customer_id,
region_id,
txn_amount,
txn_type
from
customer inner join transactions
on customer_id = customer_id;

 

--create a try...catch block to print a region id and region id and region name in single column.
begin try
select (region_id+' '+region_name) as id_name from CONTINENT

end try
begin catch
select error_message()
end catch

--create a try....catch block to insert a value in continent table.
begin try
insert into continent  values
(6,'india')

end try
begin catch
select error_message()
end catch
select * from continent value


    
 --14. Check if the table is the one you want to prevent from deleting
	DELIMITER //
CREATE TRIGGER prevent_table_deletion
drop on
continent

BEGIN
    DECLARE continent varchar(10)
    
    
    SET continent value
 
   
--15.create a trigger to audit the data in a table    
END
//
DELIMITER;

DELIMITER //
CREATE TRIGGER audit_insert

drop on
customer
BEGIN
    INSERT INTO customers date
    ('2020-01-29')
END;
//
DELIMITER ;

--16. create trigger to prevent login of the same user id in multiple page.
DELIMITER //
CREATE TRIGGER prevent_login_user_id

drop on 
customers
BEGIN
    INSERT INTO customers  page
    (3)
END;
//
DELIMITER ;

--17.display top n customer on the basis of transaction type.
SELECT customer_id, COUNT(*) AS transaction_count
FROM transactions
WHERE txn_type = 'purchase' -- Replace 'puraches' with your desired transaction type
GROUP BY customer_id
ORDER BY transaction_count DESC

select * from customer


 --18 create a pivot tabel to display the total purchase, withdrawel and deposite for all the customers.

 select customer_id, purchase, withdrawal,deposit from transactions
 pivot(
 sum(txn_amount)
 for txn_type
 in ([purchase],[withdrawal],[deposit])
 ) as pivot_table 
 order by customer_id asc




	


   










