CREATE DATABASE AUG27
USE AUG27

--assignment-7
select * from Studies
select * from Programmer
select *from Software 
--1.Find out the selling cost average for packages developed in pascal.
SELECT avg(SCOST) FROM software WHERE DEVELOPIN = 'pascal';
--2. Display the names and ages of all programmers.SELECT PNAME,DOB FROM PROGRAMMER;-- 3 : Display the names of those who have done the dap course.
SELECT PNAME FROM STUDIES WHERE COURSE = 'DAP';
-- 4  Display the names and date of births of all programmers born in january
SELECT DOB, PNAME FROM PROGRAMMER WHERE MONTH(DOB) = '01';
-- 5  What is the highest number of copies sold by a package
SELECT MAX(SOLD) AS HIGHEST_NUMBER_OF_COPIES FROM SOFTWARE;
-- 6  Display the lowest course fee
SELECT MIN(COURSE) AS LOWEST_COURSEFEE FROM STUDIES;
--7 How many programmers have done the PGDCA Course?

SELECT COUNT(PNAME) FROM STUDIES WHERE COURSE = 'PGDCA';
--8.How much revenue has been earned through sales of packages developed in C?
	SELECT SUM(SCOST*SOLD) FROM SOFTWARE WHERE DEVELOPIN LIKE 'C';
--9.Display the details of the software developed by Ramesh.
    SELECT * FROM SOFTWARE WHERE PNAME = 'RAMESH';
--10.How many programmers studied at Sabhari?
     SELECT COUNT(PNAME) FROM STUDIES WHERE INSTITUTE = 'SABHARI';
--11.Display details of packages whose sales crossed the 2000 mark.
     SELECT * FROM SOFTWARE WHERE (DCOST*SOLD) > 2000;
--12.Display the details of packages for which development costs have been recovered.
     SELECT * FROM SOFTWARE where SCOST*SOLD >= DCOST;
--13.What is the cost of the costliest software development in Basic?
     SELECT MAX(DCOST) FROM SOFTWARE WHERE  DEVELOPIN = 'BASIC';
--14.How many packages have been developed in dBase?
    SELECT COUNT(TITLE) FROM SOFTWARE WHERE DEVELOPIN = 'DBASE';
--15.How many programmers studied in Pragathi?
     SELECT COUNT(PNAME) FROM STUDIES WHERE INSTITUTE = 'PRAGATHI';
--16.What is the average course fee?
     SELECT AVG(COURSE) AS [AVG COURSE FEE] FROM STUDIES; 
--17.Display the details of the programmers knowing C.
     SELECT * FROM PROGRAMMER WHERE PROF1 = 'C' OR PROF2 = 'C'; 
--18.How many programmers know either COBOL or Pascal?
     SELECT COUNT(PNAME) AS PROGRAMMERS FROM PROGRAMMER WHERE PROF1 = 'COBOL' OR PROF2 = 'PASCAL' OR PROF1 = 'PASCAL' OR PROF2 = 'COBOL';
--19.How many programmers don’t know Pascal and C?
     SELECT COUNT(PNAME) AS PROGRAMMERS FROM PROGRAMMER WHERE PROF1 != 'PASCAL' AND PROF2 != 'C' AND PROF1 != 'C' AND PROF2 != 'PASCAL';
--20.How old is the oldest male programmer?
    SELECT COUNT(PNAME) AS OLDEST_MALE_PROGRAMMER FROM PROGRAMMER WHERE GENDER = 'M';
--21.What is the average age of female programmers?
    SELECT COUNT(PNAME) AS FEMALE_PROGRAMMERS FROM PROGRAMMER WHERE GENDER = 'F';
--22.Calculate the experience in years for each programmer and display with their names in descending order.
     SELECT COUNT(PNAME) FROM PROGRAMMER  ORDER BY COUNT(PNAME) DESC;
--23.Who are the programmers who celebrate their birthdays during the current month?
    SELECT PNAME,DOB FROM PROGRAMMER WHERE MONTH(DOB) = '02';
--25.How many female programmers are there?
    SELECT COUNT(PNAME) AS FEMALE_PROGRAMMERS FROM PROGRAMMER WHERE GENDER = 'F';
--26.What are the languages studied by male programmers?
    SELECT PROF1 FROM PROGRAMMER WHERE GENDER = 'M' UNION  SELECT PROF2 FROM PROGRAMMER WHERE GENDER = 'M';
--27.What is the average salary?
    SELECT AVG (SALARY) AS AVGSAL FROM PROGRAMMER;
--28.How many people draw a salary between 2000 to 4000?
  SELECT COUNT(PNAME) AS DRAW_SALARY FROM PROGRAMMER WHERE SALARY >= 2000 AND SALARY <= 4000;
--29.Display the details of those who don’t know Clipper, COBOL or Pascal.
   SELECT * FROM PROGRAMMER WHERE PROF1!= 'COBOL' AND PROF2!= 'COBOL' AND PROF1!= 'CLIPPER' AND PROF2!= 'CLIPPER' AND PROF1!= 'PASCAL' AND PROF2!= 'PASCAL';
--30.Display the cost of packages developed by each programmer. 
    SELECT PNAME,SUM(DCOST) FROM SOFTWARE GROUP BY PNAME;

--31.Display the	sales	value of	the	packagesdeveloped	by	each programmer.
   SELECT PNAME,SUM(SCOST*SOLD) FROM SOFTWARE GROUP BY PNAME;
-- Q33 :  Display the sales cost of the packages developed by each programmer
SELECT PNAME,SUM(SCOST) FROM SOFTWARE GROUP BY PNAME;
-- Q32 :  Display the number of packages sold by each programmer
SELECT PNAME,SUM(SOLD) FROM SOFTWARE GROUP BY PNAME;

-- Q34 : Display the sales cost of the packages developed by each programmer language wise
SELECT DEVELOPIN,SUM(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;

-- Q35 : Display each language name with average development cost, average selling cost and average price per copy.
SELECT DEVELOPIN, AVG(DCOST), AVG(SCOST) ,AVG(SCOST) FROM SOFTWARE GROUP BY DEVELOPIN;

-- Q36 : Display each programmers name costliest and cheapest packages developed. 
SELECT PNAME,MAX(DCOST),MIN(DCOST) FROM SOFTWARE GROUP BY PNAME;

-- Q37 : Display each institute name with number of courses average cost per course.

SELECT INSTITUTE,COUNT(COURSE),AVG(COURSE) FROM STUDIES GROUP BY INSTITUTE;

-- Q38 : Display each institute name with number of students.
SELECT COUNT(PNAME) AS NUMBER_OF_STUDENTS, INSTITUTE FROM STUDIES GROUP BY INSTITUTE;

-- Q39 : Display names of male and female programmers name and sex also 
SELECT GENDER,PNAME FROM PROGRAMMER WHERE GENDER= 'F'UNION SELECT GENDER,PNAME FROM PROGRAMMER WHERE GENDER = 'M';

-- Q40 : Display the name of programmers and their packages
SELECT PNAME,SALARY FROM PROGRAMMER ORDER BY SALARY DESC; 

-- Q41:  Display the number of packages in each languages except c and c++
SELECT COUNT(DCOST) FROM SOFTWARE WHERE DEVELOPIN != 'C' AND DEVELOPIN != 'CPP';

-- Q42: Display the number of packages in each language for which development cost is less than 1000.
SELECT DEVELOPIN AS LANGUAGE, COUNT(TITLE) As NUMBER_OF_PACKAGES 
FROM SOFTWARE WHERE DCOST<1000 GROUP BY DEVELOPIN;


-- Q43:  Display the average difference between Scost and Dcost for each package
SELECT AVG(DCOST - SCOST) FROM SOFTWARE; 

-- Q44: Display the total Scost, Dcost and amount to be recovered for each programmer for those whose Dcost has not yet been recovered.
SELECT SUM(SCOST), SUM(DCOST), SUM(DCOST-(SOLD*SCOST)) FROM SOFTWARE GROUP BY pname HAVING SUM(DCOST)>SUM(SOLD*SCOST);

-- Q45: Display highest, lowest and average salaries for those earning more than 2000.
SELECT MAX(SALARY) AS HIGHEST_SALARY,MIN(SALARY) AS LOWEST_SALARY,AVG(SALARY) AS AVERAGE_SALARY FROM PROGRAMMER WHERE SALARY > 2000;

-- Q46:  Who is the highest paid in c programmers.
SELECT * FROM PROGRAMMER WHERE SALARY =(SELECT MAX(SALARY) FROM PROGRAMMER WHERE PROF1 LIKE 'C' OR PROF2 LIKE 'C');

-- Q47. Who is the highest paid female Cobol programmer
SELECT * FROM PROGRAMMER WHERE SALARY=(SELECT MAX(SALARY) FROM PROGRAMMER WHERE (PROF1 LIKE 'COBOL' OR PROF2 LIKE 'COBOL')) AND GENDER LIKE 'F';

-- 48. Display the names of the highest paid programmer for each language 
SELECT  MAX(SALARY) AS Highest_paid_programmers from PROGRAMMER group by PROF1,PROF2;
 
 -- 49. Who is the least experienced programmer
SELECT min(DOB)AS LEAST_EXPERIENCE FROM PROGRAMMER;

-- 50. Who is the most experienced male programmer knowing Pascal
SELECT MAX(DOB)AS MOST_EXPERIENCE FROM PROGRAMMER WHERE GENDER= 'M' AND PROF2 = 'PASCAL';

-- 51. Which language is known by only one programmer.
SELECT PROF1 FROM PROGRAMMER
GROUP BY PROF1
HAVING PROF1 NOT IN
(SELECT PROF2 FROM PROGRAMMER)
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2
HAVING PROF2 NOT IN
(SELECT PROF1 FROM PROGRAMMER)
AND COUNT(PROF2)=1;

-- 52. Who is the Above Programmer Referred in 51? 
SELECT P.PNAME, P.PROF1
FROM programmer P
JOIN (
  SELECT PROF1, COUNT(*) as count
  FROM PROGRAMmER
  GROUP BY PROF1
  
) sub
ON P.PROF1 = sub.PROF1; 

-- 53. Who is the Youngest Programmer knowing DBASE? 
select min(2023-year(DOB)) as GENDER from programmer where (prof1='DBASE' or prof2='DBASE' ) 

-- 54. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE? 
SELECT * FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY >3000 AND 
prof1<>'c' and prof1<>'c++' and prof1<>'oracle'and prof1<>'dbase' and prof2<>'c' and prof2<>'c++' and prof2<>'oracle' and prof2<>'dbase' ;

-- 55. Which Institute has most number of Students? 
select institute from studies group by INSTITUTE order by count(*) desc 

-- 56. What is the Costliest course? 


SELECT* (COURSE_FEE) AS [COSTLIST_COURSE]FROM STUDIES);

-- 57 & 58. Which course has been done by the most of the Students? 
select course,count(pname) as cpname from studies group by course order by cpname desc;

-- 59. Which Institute conducts costliest course. 
SELECT institute, COURSE FROM STUDIES WHERE course = (SELECT MAX(course) FROM STUDIES);

-- 60. Display the name of the Institute and Course, which has below AVG course fee.
select institute, course from studies where course  < (SELECT AVG(course) FROM STUDIES);

-- 61. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee, 
SELECT COURSE FROM STUDIES WHERE course< (SELECT AVG(course)+1000 FROM STUDIES) AND course > (SELECT AVG(course)-1000 FROM STUDIES);

-- 62. Which package has the Highest Development cost? 
SELECT TITLE,DCOST FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST) FROM SOFTWARE);

-- 63. Which course has below AVG number of Students? 
SELECT COURSE, COUNT(*) AS num_students
FROM studies
GROUP BY COURSE
 num_students > (SELECT AVG(num_students) FROM (SELECT COURSE, COUNT(*) AS num_students FROM studies GROUP BY COURSE) AS course_counts);

-- 64. Which Package has the lowest selling cost? 
SELECT TITLE,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MIN(SCOST) FROM SOFTWARE);

-- 65. Who Developed the Package that has sold the least number of copies? 
SELECT PNAME,SOLD FROM SOFTWARE WHERE SOLD = (SELECT MIN(SOLD) FROM SOFTWARE);

-- 66. Which language has used to develop the package, which has the highest sales amount? 
SELECT DEVELOPIN,SCOST FROM SOFTWARE WHERE SCOST = (SELECT MAX(SCOST) FROM SOFTWARE);

-- 67. How many copies of package that has the least difference between development and selling cost where sold. 
SELECT SOLD,TITLE FROM SOFTWARE 
WHERE TITLE = (SELECT TITLE FROM SOFTWARE
WHERE (DCOST-SCOST)=(SELECT MIN(DCOST-SCOST) FROM SOFTWARE));

-- 68. Which is the costliest package developed in PASCAL. 
SELECT TITLE FROM SOFTWARE WHERE DCOST = (SELECT MAX(DCOST)FROM SOFTWARE WHERE DEVELOPIN LIKE 'PASCAL');

-- 69. Which language was used to develop the most number of Packages. 
SELECT DEVELOPIN FROM SOFTWARE GROUP BY DEVELOPIN  HAVING DEVELOPIN = (SELECT MAX(DEVELOPIN) FROM SOFTWARE);

-- 70. Which programmer has developed the highest number of Packages
SELECT PNAME FROM SOFTWARE GROUP BY PNAME HAVING PNAME = (SELECT MAX(PNAME) FROM SOFTWARE);

-- 71. Display the names of the packages, which have sold less than the AVG number of copies. 
SELECT TITLE FROM SOFTWARE WHERE SOLD < (SELECT AVG(SOLD) FROM SOFTWARE);

-- 72. Who are the authors of the Packages, which have recovered more than double the Development cost? 
SELECT  distinct PNAME FROM SOFTWARE WHERE SOLD*SCOST > 2*DCOST;

-- 73. Display the programmer Name and the cheapest packages developed by them in each language. 
SELECT PNAME,TITLE FROM SOFTWARE WHERE DCOST IN (SELECT MIN(DCOST) FROM SOFTWARE GROUP BY DEVELOPIN);

-- 74. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package. 
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MAX(SOLD) FROM SOFTWARE GROUP BY PNAME)
UNION
SELECT PNAME, DEVELOPIN FROM SOFTWARE WHERE SOLD IN (SELECT MIN(SOLD) FROM SOFTWARE GROUP BY PNAME);

-- 75. Who is the youngest male Programmer born in 1965? 
select pname,(DOB)/365 as age from programmer where year(dob)='1965' and GENDER='M' 

-- 76. Who is the oldest Female Programmer who joined in 1992?
select pname, 2023-year(dob) as age from programmer where year(doj)='1992' and GENDER='F' order by age desc 

-- 77. In which year was the most number of Programmers born. 
select year(dob) ,count(year(dob)) as count from programmer group by year(dob) order by count(*) desc 

-- 78. In which month did most number of programmers join? 
select month(doj) as month,count(month(doj)) as count from programmer group by month(doj) order by count(*) desc 

-- 79. In which language are most of the programmer’s proficient. 
select prof1,prof2,count(pname) as count from programmer group by prof1,prof2 order by count desc 

-- 80. Who are the male programmers earning below the AVG salary of Female Programmers? 
SELECT PNAME FROM PROGRAMMER WHERE GENDER LIKE 'M'
AND SALARY < (SELECT(AVG(SALARY)) FROM PROGRAMMER WHERE GENDER LIKE 'F');

-- 81. Who are the Female Programmers earning more than the Highest Paid? 
SELECT PNAME FROM PROGRAMMER WHERE GENDER = 'F' AND SALARY > (SELECT(MAX(SALARY)) FROM PROGRAMMER WHERE GENDER = 'M');

-- 82. Display the details of those who are drawing the same salary. 
SELECT * FROM PROGRAMMER WHERE Salary IN
(SELECT SALARY FROM PROGRAMMER GROUP BY SALARY HAVING Count(SALARY) > 1);

-- 83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
SELECT * FROM PROGRAMMER p,SOFTWARE s
where p.pname=s.pname and SALARY>3000 and GENDER='m';

-- 84. Display the details of the packages developed in Pascal by the Female Programmers. 
SELECT s.* FROM PROGRAMMER p,SOFTWARE s
WHERE p.pname=s.pname AND GENDER ='f' and DEVELOPIN ='pascal';

-- 85. Display the details of the Programmers who joined before 1990. 
select * from PROGRAMMER where year(doj)< 1990;

-- 86. Display the details of the Software Developed in C By female programmers of Pragathi. 
select s.* from SOFTWARE s,STUDIES st,PROGRAMMER p where s.pname=st.pname and p.pname=s.pname and GENDER='f' and INSTITUTE='pragathi';

-- 87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
Select studies.institute, count(software.developin) AS developin, count(software.sold) As Sold, sum(software.sold*software.scost) AS sales from software,studies
where software.pname =studies.pname group by studies.institute;

-- 88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.
CREATE TABLE INST (INS VARCHAR(20), CNT INT);

INSERT INTO INST
SELECT INSTITUTE, COUNT(PNAME) FROM studies GROUP BY INSTITUTE;

SELECT distinct SW.* FROM software AS SW, programmer AS PG, studies AS ST, INST
WHERE DEVELOPIN='DBASE' AND GENDER ='M' AND SW.PNAME = PG.PNAME 
AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM INST);


-- 89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. 
SELECT S.*, YEAR(DOB),GENDER FROM Programmer p,Software s 
WHERE s.PNAME=p.PNAME AND 
((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975));


-- 90. Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. 
select s.* from programmer p,software s
where s.pname=p.pname and (developin <> prof1 and developin <> prof2);

-- 91. Display the details of the software developed by the male students of Sabhari. 
select s.* from software s,studies st,programmer p where s.pname=st.pname and p.pname=s.pname and GENDER='m' and institute='Sabhari';

-- 92. Display the names of the programmers who have not developed any packages. 
select pname from programmer
where pname not in(select pname from software);

-- 93. What is the total cost of the Software developed by the programmers of Apple? 
select sum(scost) from software s,studies st
where s.pname=st.pname and institute='apple';

-- 94. Display the names of the programmers who have not developed any packages’
-- same as 92


-- 95. Display the total sales value of the software, institute wise. 
select studies.institute,sum(software.sold*software.scost) from software,studies
where studies.pname=software.pname group by studies.institute;

-- 96. In which institute does the person who developed the costliest package studied.
select institute from software st,studies s
where s.pname=st.pname group by institute,dcost having dcost=(select max(dcost) from software);

-- 97. Which language listed in prof1, prof2 has not been used to develop any package. 
select prof1 from programmer where prof1 not in(select developin from software) 
union
select prof2 from programmer where prof2 not in(select developin from software);

-- 98. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 
select p1.salary,s2.course from programmer p1,software s1,studies s2
where p1.pname=s1.pname and s1.pname=s2.pname and scost=(select max(scost) from software);

-- 99. How many months will it take for each programmer to recover the cost of the course under went
select st.pname,floor(st.COURSE/p.SALARY) as months from studies as st inner join programmer as p on st.pname=p.PNAME ;

-- 100. Which is the costliest package by a person with under 3 years experience
select p.pname, max(st.SCOST) as scost,2023-year(DOJ) as years from software as st inner join programmer as p on st.PNAME=p.PNAME group by p.pname,years having years=3;

-- 101. What is the AVG salary for those whose software sales is more than 50,000/-. 
select avg(salary) from programmer p,software s
where p .pname=s.pname and sold*scost>50000;

-- 102. How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? 
select count(developin) from programmer p,software s
where s .pname=p.pname group by developin having min(dcost)=(select min(dcost) from software);

-- 103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 
select count(developin) from programmer p,software s
where s.pname=p.pname and GENDER='f' and salary>(select max(salary) from programmer p,software s
where s.pname=p.pname and GENDER ='m');

-- 104. How many packages are developed by the most experienced programmer form BDPS. 
select count(*) from software s,programmer p
where p.pname=s.pname group by doj having min(doj)=(select min(doj)
from studies st,programmer p, software s
where p.pname=s.pname and st.pname=p.pname and (institute='bdps'));

-- 105. List the programmers (form the software table) and the institutes they studied, including those WHO DIDN'T develop any package.
select pname,institute from studies
where pname not in(select pname from software);

-- 106. List the programmer names (from the programmer table) and No. Of Packages each has developed.
select s.pname,count(developin) from programmer p1,software s
where p1.pname=s.pname group by s.pname;