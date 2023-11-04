Create database MW

Use MW

-- Assignment 1

--1. Install MS SQL Server 
	--Add ScreenShot SSMS

--2. Give the difference between Char and Varchar data type.
Declare @v1 Char(30)
--ans:
--CHAR: The CHAR data type stores fixed-length character strings. This means that if you define a CHAR column with a length of, say, 10 characters, every value 
--stored in that column will be padded with spaces to fill up the entire 10 characters, even if the actual value is shorter.


Declare @v2 VarChar(30)
--ans:
--VARCHAR: The VARCHAR (variable-length character) data type stores variable-length character strings. It only uses as much storage as needed to store the actual
--value, without any padding. This can lead to more efficient storage utilization when dealing with strings of varying lengths.

--3. Explain the types of SQL Commands.
	--DQL
	--ans) DQL commands are designed to interact with the database in a read-only manner, meaning they retrieve data without altering the structure or
	--content of the database. Some common DQL commands include:

	--SELECT: The primary DQL command used to retrieve data from one or more database tables. 
	--The SELECT statement allows you to specify the columns you want to retrieve, the tables to retrieve data from, and optional conditions to filter the results.
	--FROM: Used in conjunction with the SELECT statement to specify the table(s) from which to retrieve data.
	--WHERE: Used to specify conditions that filter the rows returned by a SELECT statement.
	--ORDER: BY: Used to sort the result set based on one or more columns in ascending or descending order.
	--GROUP BY: Used to group the result set based on one or more columns. Often used in combination with aggregate functions like SUM, COUNT, etc.
	--HAVING: Used with the GROUP BY clause to specify conditions that filter the groups created by the GROUP BY clause.
	--LIMIT: Used to limit the number of rows returned by a SELECT statement.
	--JOIN: Used to combine data from multiple tables based on a related column between them.

	--examples:
	--SELECT first_name, last_name
--FROM employees
--WHERE department = 'Sales'
--ORDER BY last_name;


	--DDL
	--ans:
	--DDL stands for "Data Definition Language." It's a subset of SQL (Structured Query Language) that is used to define and manage the structure of a database and 
	--its objects. DDL commands are responsible for creating, altering, and dropping database objects such as tables, indexes, views, and more.

	--CREATE: Used to create new database objects, such as tables, indexes, views, and schemas.
	--ALTER: Used to modify the structure of existing database objects. It can be used to add, modify, or drop columns, constraints, or other attributes.
	--DROP: Used to delete database objects, including tables, indexes, views, and more.
	--TRUNCATE: Used to quickly delete all rows from a table, effectively emptying the table's contents while retaining its structure.
	--COMMENT: Used to add comments to database objects, providing additional information for documentation purposes.
	--RENAME: Used to rename existing database objects, such as tables or columns.


	--DML
	--ans
	--DML stands for "Data Manipulation Language." It's a subset of SQL (Structured Query Language) .
	--that is used to interact with and manipulate data within a relational database. 

		--INSERT: Used to add new rows or records into a table, along with the data values for each column.
		--UPDATE: Used to modify existing data in one or more rows of a table. It allows you to change the values of specific columns based on specified conditions.
		--DELETE: Used to remove rows from a table based on specified conditions. It deletes the entire row from the table.
		--MERGE: Combines the INSERT, UPDATE, and DELETE operations into a single statement. It can be used to synchronize data between source and target tables.

	--DCL
	--ans
	--DCL stands for "Data Control Language." 
	--It's a subset of SQL (Structured Query Language) that is used to manage the permissions, security, and access rights for database objects.

		--GRANT:Used to give specific privileges or permissions to users or roles. 
		--Privileges might include the ability to execute certain DDL, DML, or DQL operations on specific database objects. 
		--REVOKE:Used to revoke or remove previously granted privileges from users or roles.
	--TCL
	--ans:
	--TCL stands for "Transaction Control Language." It's a subset of SQL (Structured Query Language) that is used to manage transactions within a relational database. 
		--COMMIT:This command is used to permanently save the changes made during the current transaction. When a COMMIT command is executed, 
		--all the changes made within the transaction are saved to the database, and the transaction is completed. The changes become visible to other transactions.
		--ROLLBACK:This command is used to permanently save the changes made during the current transaction. When a COMMIT command is executed, 
		--all the changes made within the transaction are saved to the database, and the transaction is completed. The changes become visible to other transactions.
		--SAVEPOINT: The SAVEPOINT command allows you to set a point within a transaction to which you can later roll back if needed. It's useful for
		--creating intermediate points in a transaction to perform partial rollbacks without affecting the entire transaction.

	----4. Explain NVarchar and Nchar.
	--ans
	      --NCHAR: stands for "National Character." It is used to store fixed-length Unicode character strings.
		  --NVARCHAR stands for "National Variable Character." It is used to store variable-length Unicode character strings.
