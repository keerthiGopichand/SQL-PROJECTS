create database casestudy3
use casestudy3

SELECT * FROM LOCATIONS  -- I SELECTED FROM CONTINENT HERE CSV FILE. NOT AT WRITTEN TPYE
SELECT * FROM JOB
SELECT * FROM DEPARTMENT
SELECT * FROM EMPLOYEE

--Simple Queries:

--1. List all the employee details. 
SELECT * FROM EMPLOYEE
--2. List all the department details.
SELECT * FROM DEPARTMENT
--3. List all job details.
SELECT * FROM JOB
--4. List all the locations.
SELECT * FROM LOCATIONS
--5. List out the First Name, Last Name, Salary, Commission for allEmployees.

SELECT * FROM EMPLOYEE
SELECT FIRST_NAME, LAST_NAME, SALARY,COMM FROM EMPLOYEE;
--6. List out the Employee ID, Last Name, Department ID for all employees and alias

--Employee ID as "ID of the Employee", Last Name as "Name of the
--Employee", Department ID as "Dep_id".

SELECT EMPLOYE_ID AS ID, LAST_NAME AS NAME, DEPARTMENT_ID AS DEP_ID FROM EMPLOYEE
--7. List out the annual salary of the employees with their names only.
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME,' ', MIDDLE_NAME) AS FULL_NAME, SALARY AS ANNUAL_SALARY FROM EMPLOYEE


--WHERE Condition:

--1. List the details about "Smith".
SELECT * FROM EMPLOYEE WHERE LAST_NAME ='SMITH'
--2. List out the employees who are working in department 20.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID  = '20'
--3. List out the employees who are earning salaries between 3000 and4500. 
SELECT * FROM EMPLOYEE WHERE SALARY BETWEEN 3000 AND 4500;
--4. List out the employees who are working in department 10 or 20.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID IN (10,20)
--5. Find out the employees who are not working in department 10 or 30.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID NOT IN (10,30)
--6. List out the employees whose name starts with 'S'
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'S%'
--7. List out the employees whose name starts with 'S' and ends with 'H'. 
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE 'S%' AND LAST_NAME LIKE '%H'
--8. List out the employees whose name length is 4 and start with 'S'.
SELECT * FROM EMPLOYEE WHERE LAST_NAME LIKE ('S%') AND LEN(LAST_NAME) = 4
--9. List out employees who are working in department 10 and draw salaries more than 3500.
SELECT * FROM EMPLOYEE WHERE DEPARTMENT_ID = 10 AND SALARY < 3500
--10. List out the employees who are not receiving commission.
SELECT * FROM EMPLOYEE WHERE COMM = 'NULL'

--ORDER BY Clause:

--1. List out the Employee ID and Last Name in ascending order based on the Employee ID.
SELECT EMPLOYE_ID ,LAST_NAME FROM EMPLOYEE ORDER BY EMPLOYE_ID 
--2. List out the Employee ID and Name in descending order based onsalary.
SELECT EMPLOYE_ID ,LAST_NAME FROM EMPLOYEE ORDER BY SALARY DESC;
--3. List out the employee details according to their Last Name in ascending-order. 
SELECT *FROM EMPLOYEE ORDER BY LAST_NAME
--4. List out the employee details according to their Last Name in ascending order and then Department ID in descending order
SELECT *FROM EMPLOYEE ORDER BY LAST_NAME ,DEPARTMENT_ID  DESC;

--GROUP BY and HAVING Clause:

--1. How many employees are in different departments in the organization?
SELECT NAME DEPARTMENT, COUNT(EMPLOYE_ID) NO_OF_EMP
FROM EMPLOYEE 
JOIN DEPARTMENT
ON  DEPARTMENT_ID = DEPARTMENT_ID
GROUP BY NAME
SELECT NAME, COUNT(DEPARTMENT_ID) FROM DEPARTMENT GROUP BY NAME
--2. List out the department wise maximum salary, minimum salary and average salary of the employees.
SELECT NAME DEPARTMENT, MAX(SALARY)MAX_SAL,MIN(SALARY)MIN_SAL, AVG(SALARY) AVG_SAL FROM EMPLOYEE JOIN DEPARTMENT
ON DEPARTMENT_ID = DEPARTMENT_ID 
GROUP BY NAME
 
--3. List out the job wise maximum salary, minimum salary and average salary of the employees.
SELECT * FROM EMPLOYEE
SELECT * FROM JOB
SELECT * FROM DEPARTMENT
SELECT DESIGNATION, MAX(SALARY)MAX_SAL,MIN(SALARY)MIN_SAL, AVG(SALARY) AVG_SAL FROM EMPLOYEE JOIN JOB
ON JOB_ID = JOB_ID 
GROUP BY DESIGNATION;
-- 4. List out the number of employees who joined each month in ascendingorder.
SELECT MONTH(HIRE_DATE) MONTH_JOIN, COUNT(EMPLOYE_ID) NO_OF_EMP
FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
ORDER BY MONTH(HIRE_DATE);
--5. List out the number of employees for each month and year in ascending order based on the year and month.
SELECT MONTH(HIRE_DATE) MONTH_JOIN, YEAR(HIRE_DATE) YEAR_JOIN, COUNT(EMPLOYE_ID) NO_OF_EMP
FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE),YEAR(HIRE_DATE)
ORDER BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
--6. List out the Department ID having at least four employees.
SELECT DEPARTMENT_ID , COUNT(*) NOF_OF_EMP FROM EMPLOYEE
GROUP BY DEPARTMENT_ID
HAVING COUNT(*)=4
--7. How many employees joined in the month of January?
SELECT MONTH(HIRE_DATE) MONTH, COUNT(*) NO_OF_EMP FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
HAVING MONTH(HIRE_DATE) > 1

--8. How many employees joined in the month of January orSeptember?
SELECT MONTH(HIRE_DATE) MONTH, COUNT(*) NO_OF_EMP FROM EMPLOYEE
GROUP BY MONTH(HIRE_DATE)
HAVING MONTH(HIRE_DATE) IN(1,9)
--9. How many employees joined in 1985?
SELECT YEAR(HIRE_DATE) YEAR, COUNT(*) NO_OF_EMP FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = 1985 
--10. How many employees joined each month in 1985?
SELECT YEAR(HIRE_DATE) YEAR, MONTH(HIRE_DATE) MONTH,COUNT(*) NO_OF_EMP FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE), MONTH(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = 1985 
--11. How many employees joined in March 1985?
SELECT YEAR(HIRE_DATE) YEAR, MONTH(HIRE_DATE) MONTH, COUNT(*) NO_OF_EMP FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE) , MONTH(HIRE_DATE)
HAVING YEAR(HIRE_DATE) = 1985 AND MONTH(HIRE_DATE) = 3

--12. Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
SELECT DEPARTMENT_ID, YEAR(HIRE_DATE) YEAR, DATENAME(MONTH,HIRE_DATE) MONTH, COUNT(*) NO_OF_EMP FROM EMPLOYEE
GROUP BY YEAR(HIRE_DATE) , DATENAME(MONTH,HIRE_DATE), DEPARTMENT_ID
HAVING YEAR(HIRE_DATE) = 1985 AND  MONTH(HIRE_DATE) = 3 AND COUNT(*) >=3;

--Joins:

--1. List out employees with their department names.
SELECT LAST_NAME, NAME FROM EMPLOYEE INNER JOIN DEPARTMENT ON DEPARTMENT_ID = DEPARTMENT_ID;
--2. Display employees with their designations. 
SELECT LAST_NAME, NAME FROM EMPLOYEE INNER JOIN DEPARTMENT ON DEPARTMENT_ID = DEPARTMENT_ID; 
--3. Display the employees with their department names and regional groups.
SELECT E.LAST_NAME,D.NAME, L.CITY
FROM EMPLOYEE E
JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID
JOIN LOCATIONS L ON LOCATION_ID_PK = LOCATION_ID_PK
SELECT * FROM LOCATIONS
--4. How many employees are working in different departments? Display with department names order.
SELECT COUNT(E.DEPARTMENT_ID) NO_OF_EMP, D.NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID
GROUP BY
 DEPARTMENT_ID, D.NAME

--5. How many employees are working in the sales department?
SELECT COUNT(E.DEPARTMENT_ID) NO_OF_EMP,D.NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID 
GROUP BY
E.DEPARTMENT_ID, D.NAME
HAVING D.NAME = 'SALES'
--6. Which is the department having greater than or equal to 5 employees? Display the department names in ascending
SELECT COUNT(E.DEPARTMENT_ID) NO_OF_EMP,D.NAME
FROM EMPLOYEE E
JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID 
GROUP BY
E.DEPARTMENT_ID, D.NAME
HAVING COUNT(E.DEPARTMENT_ID)<=5
ORDER BY D.NAME ASC;
--7. How many jobs are there in the organization? Display with designations.
SELECT COUNT(J.DESIGNATION) DES_ORGANSATION 
FROM JOB J

--8. How many employees are working in "New York"?
SELECT COUNT(E.DEPARTMENT_ID) NO_OF_EMP
FROM EMPLOYEE E 
INNER JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID 
JOIN LOCATIONS L ON LOCATION_ID_PK = LOCATION_ID_PK
WHERE CITY = 'NEW YORK'
--9. Display the employee details with salary grades. Use conditional statementto create a grade column.
SELECT  DENSE_RANK() OVER (ORDER BY SALARY DESC) SAL_GRADE FROM EMPLOYEE
--10. List out the number of employees grade wise. Use conditional statementto create a grade column.
SELECT 
LAST_NAME,SALARY,COUNT(*) NO_OF_EMP,

DENSE_RANK() OVER (ORDER BY SALARY ASC) AS GRADE FROM EMPLOYEE
GROUP BY SALARY,LAST_NAME

--11.Display the employee salary grades and the number of employees between 2000 to 5000 range of salary.
SELECT
LAST_NAME,
SALARY,
DENSE_RANK()OVER (ORDER BY SALARY DESC) SAL_GRADES
FROM EMPLOYEE WHERE SALARY BETWEEN 2000 AND 5000
--12. Display all employees in sales or operation departments.

SELECT (E.DEPARTMENT_ID) NO_OF_EMP,D.NAME,D.LOCATION_ID_FK
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID
JOIN LOCATIONS L ON  LOCATION_ID_PK = LOCATION_ID_PK
GROUP BY
E.DEPARTMENT_ID, D.NAME,D.LOCATION_ID_FK
HAVING D.NAME = 'SALES'


SELECT * FROM DEPARTMENT
--1. List out the distinct jobs in sales and accounting departments.
SELECT NAME DESIGNATION 
FROM DEPARTMENT D, EMPLOYEE E, JOB J
WHERE 
DEPARTMENT_ID = DEPARTMENT_ID AND
JOB_ID_PK = JOB_ID_PK AND
NAME IN ('SALES' ,'ACCOUNTING');
--2. List out all the jobs in sales and accounting departments. 
SELECT (E.DEPARTMENT_ID) NO_OF_EMP, D.NAME
FROM DEPARTMENT D
INNER JOIN EMPLOYEE E
ON DEPARTMENT_ID = DEPARTMENT_ID
WHERE D.NAME = 'SALES'
--3. List out the common jobs in research and accounting departments in ascending order.
SELECT NAME DESIGNATION 
FROM DEPARTMENT D, EMPLOYEE E, JOB J
WHERE 
DEPARTMENT_ID = DEPARTMENT_ID AND
JOB_ID_PK = JOB_ID_PK AND
NAME = ('ACCOUNTING')
INTERSECT
SELECT NAME DESIGNATION 
FROM DEPARTMENT D, EMPLOYEE E, JOB J
WHERE 
DEPARTMENT_ID = DEPARTMENT_ID AND
JOB_ID_PK = JOB_ID_PK AND
NAME = ('RESEARCH')

--Subqueries:

--1. Display the employees list who got the maximum salary.
SELECT * FROM EMPLOYEE WHERE SALARY = (SELECT MAX(SALARY)FROM EMPLOYEE);
--2. Display the employees who are working in the sales department.

SELECT (E.DEPARTMENT_ID) NO_OF_EMP, D.NAME
FROM EMPLOYEE E INNER JOIN DEPARTMENT D  ON DEPARTMENT_ID = DEPARTMENT_ID
WHERE D.NAME = 'SALES'
--3. Display the employees who are working as 'Clerk'. 
SELECT LAST_NAME FROM EMPLOYEE WHERE JOB_ID =(SELECT JOB_ID_PK FROM JOB WHERE DESIGNATION = 'CLEARK');
--4. Display the list of employees who are living in "New York". 
SELECT * FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON DEPARTMENT_ID = DEPARTMENT_ID INNER JOIN LOCATIONS L ON LOCATION_ID_PK = LOCATION_ID_PK
WHERE CITY ='NEWYORK';
--5. Find out the number of employees working in the sales department.
SELECT (E.DEPARTMENT_ID) NO_OF_EMP, D.NAME
FROM EMPLOYEE E INNER JOIN DEPARTMENT D  ON DEPARTMENT_ID = DEPARTMENT_ID
WHERE D.NAME = 'SALES'
--6. Update the salaries of employees who are working as clerks on the basis of 10%.
UPDATE EMPLOYEE
SET SALARY = SALARY *1.1
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEE INNER JOIN JOB ON JOB_ID = JOB_ID WHERE DESIGNATION = 'CLERK');
-- 7. Delete the employees who are working in the accounting department.
DELETE EMPLOYEE 
WHERE DEPARTMENT_ID >(SELECT DEPARTMENT_ID FROM EMPLOYEE INNER JOIN DEPARTMENT D
ON DEPARTMENT_ID < DEPARTMENT_ID  WHERE NAME = 'ACCOUNTING');
--8. Display the second highest salary drawing employee details.
SELECT *
FROM EMPLOYEE 
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE WHERE SALARY<(SELECT MAX(SALARY) FROM EMPLOYEE));
--9. Display the nth highest salary drawing employee details.
SELECT * FROM EMPLOYEE WHERE SALARY >(SELECT MAX(SALARY) FROM EMPLOYEE WHERE LAST_NAME = 'SMITH');
--10. List out the employees who earn more than every employee in department 30.
SELECT * FROM EMPLOYEE WHERE SALARY > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID > 30);
--11. List out the employees who earn more than the lowest salary in department.Find out whose department has no employees.
SELECT * FROM EMPLOYEE WHERE SALARY > (SELECT MIN(SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID < 20);
-- 12.Find out which department has no employees.
SELECT (E.DEPARTMENT_ID) NO_OF_EMP, D.NAME
FROM EMPLOYEE E INNER JOIN DEPARTMENT D  ON DEPARTMENT_ID = DEPARTMENT_ID
WHERE D.NAME = 'NULL'

--13. Find out the employees who earn greater than the average salary for their department.
SELECT * FROM EMPLOYEE WHERE SALARY > (SELECT AVG (SALARY) FROM EMPLOYEE WHERE DEPARTMENT_ID = DEPARTMENT_ID ) AND DEPARTMENT_ID > 20



