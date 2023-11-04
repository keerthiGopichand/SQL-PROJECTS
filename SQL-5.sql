--assignment-5

--You have successfully cleared your fourth semester. In the fifth semester you will
--work with GROUP BY, having BY clauses and SET operators.
SELECT *
FROM Orders
ORDER BY Amount DESC;
Create Table employee (Emp_id int, Emp_Name Varchar(20), Emp_salary DECIMAL(10,2))
 
 -- 2.Create a table with the name ‘Employee_details1’ consisting of these
--columns: ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with
--the name ‘Employee_details2’ consisting of the same columns as the first
--table

Insert into employee values
(100,'GOPICHAND',20000),
(102,'SANGAM',23500),
(103,'OM PRAKASH',45000),
(104,'RAJASEKAR',12000),
(105,'SIVARANJINI',34600),
(106,'ASMITHA',760000),
(107,'rahul',860000)

select * from employee

Create Table employee_detail2 (Emp_id int, Emp_Name Varchar(20), Emp_salary DECIMAL(10,2))

Insert into employee_detail2 values
(100,'rahul2',20000),
(102,'ASMITHA2',23500),
(103,'OM PRAKASH2',45000),
(104,'RAJASEKAR2',12000),
(105,'SIVARANJINI2',34600),
(106,'GOPICHAND2',760000),
(107,'SANGAM2',860000)

--Apply the UNION operator on these two tables
select * from employee_detail2

SELECT Emp_id, Emp_name, Emp_salary
FROM Employee
UNION
SELECT Emp_id, Emp_name, Emp_salary
FROM Employee_detail2

--Apply the intersect operator on these two tables
SELECT Emp_id, Emp_name, Emp_salary
FROM Employee
INTERSECT
SELECT Emp_id, Emp_name, Emp_salary
FROM Employee_detail2

--Apply the expect operator on these two tables.
SELECT Emp_id, Emp_name, Emp_salary
FROM Employee
EXPECT
SELECT Emp_id, Emp_name, Emp_salary
FROM Employee_detail2