CREATE DATABASE VCET;
USE VCET;

CREATE TABLE STUDENT(
   STU_NAME VARCHAR(50),
   ID INT PRIMARY KEY,
   DOB DATE,
   AGE INT,
   ADDRESS VARCHAR(70),
   CONTACT INT,
   MAIL VARCHAR(50)
);

INSERT INTO STUDENT 
VALUES('RAHUL' , 12300 , '2001-01-10' , 24 , 'ROSE VILLA' , 98765 , 'RAHUL@GMAIL.COM'),
	  ('SAKINA' , 54500 , '1999-06-23' , 26 , 'SUNSHINE APT' , 98760 , 'SAKINA@GMAIL.COM'),
      ('JOSHUA' , 21200 , '2002-09-27' , 22 , 'HONEY VILLA' , 76899 , 'JOSHUA@GMAIL.COM'),
      ('NEZUKO' , 23200 , '2002-07-27' , 22 , 'HONEY VILLA' , 76865 , 'NEZUKO@GMAIL.COM'),
      ('ZENITSU' , 18920 , '2001-10-02' , 23 , 'RAJ HEIGHTS' , 87544 , 'ZENITSU@GMAIL.COM');
      
      
SELECT * FROM STUDENT;

SELECT STU_NAME FROM STUDENT
WHERE STU_NAME = 'RAHUL';

CREATE TABLE STU AS
SELECT * FROM STUDENT;

CREATE TEMPORARY TABLE STUDENTDETAILS(
ID INT,
NAME VARCHAR(20)
);

INSERT INTO STUDENTDETAILS
VALUES(90877,'JOSH'),
      (92334,'USHA');
      
SELECT * FROM STUDENTDETAILS;

SELECT COUNT(STU_NAME) FROM STUDENT; 
SELECT SUM(ID) FROM STUDENT;
SELECT AVG(ID) FROM STUDENT;
SELECT MIN(ID) FROM STUDENT;
SELECT MAX(ID) FROM STUDENT;

SELECT * FROM STUDENT 
WHERE ID BETWEEN 10000 AND 25000 
AND CONTACT BETWEEN 70000 AND 80000;

SELECT * FROM STUDENT 
WHERE STU_NAME LIKE 'Z%';

SELECT * FROM STUDENT 
WHERE STU_NAME LIKE 'JOSHUA' OR STU_NAME LIKE 'ZENITSU';

SELECT * FROM STUDENT 
WHERE STU_NAME IN('JOSHUA','ZENITSU');

SELECT * FROM STUDENT 
WHERE STU_NAME LIKE 'JOSHUA' OR STU_NAME LIKE 'ZENITSU'
OR ID LIKE 12300 OR ID LIKE 21200;

SELECT * FROM STUDENT 
WHERE NOT AGE = 22 AND NOT AGE = 24;

SELECT * FROM STUDENT 
WHERE AGE < 25 AND AGE > 20;

SELECT * FROM STUDENT 
ORDER BY AGE DESC;

SELECT ADDRESS,COUNT(STU_NAME) FROM STUDENT 
GROUP BY ADDRESS;

CREATE TABLE PAYMENT(
    ID INT,
    AMOUNT INT,
    MODE VARCHAR(50),
    PAYMENT_DATE DATE
);

INSERT INTO PAYMENT
VALUES(1 , 60 , 'CASH' , '2024-04-02'),
	  (2 , 30 , 'CREDIT CARD' , '2024-04-05'),
      (3 , 90 , 'CREDIT CARD' , '2024-04-10'),
      (4 , 40 , 'DEBIT CARD' , '2024-04-20'),
      (5 , 70 , 'MOBILE PAYMENT' , '2024-04-29'),
      (6 , 20 , 'CASH' , '2024-05-05');
      
SELECT * FROM PAYMENT;
      
SELECT MODE , SUM(AMOUNT) AS TOTAL
FROM PAYMENT
GROUP BY MODE
HAVING SUM(AMOUNT) >= 80
ORDER BY MODE DESC;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender CHAR(1),
    Department VARCHAR(50),
    Education VARCHAR(50),
    MonthOfJoining VARCHAR(50),
    Salary INT
);

INSERT INTO Employees (EmployeeID, Name, Gender, Department, Education, MonthOfJoining, Salary) VALUES
(1001, 'Ajay', 'M', 'Engineering', 'Doctoral', 'January', 25),
(1002, 'Babloo', 'M', 'Engineering', 'UG', 'February', 23),
(1003, 'Chhavi', 'F', 'HR', 'PG', 'March', 15),
(1004, 'Dheeraj', 'M', 'HR', 'UG', 'January', 12),
(1005, 'Evina', 'F', 'Marketing', 'UG', 'March', 16),
(1006, 'Fredy', 'M', 'Sales', 'UG', 'December', 10),
(1007, 'Garima', 'F', 'Sales', 'PG', 'March', 10),
(1008, 'Hans', 'M', 'Admin', 'PG', 'November', 8),
(1009, 'Nanika', 'F', 'Admin', 'Intermediate', 'April', 7),
(1010, 'Jai', 'M', 'Peon', 'High School', 'December', 4);

SELECT DEPARTMENT , SUM(SALARY) AS TOTAL
FROM EMPLOYEES
WHERE  EDUCATION<>'UG'
GROUP BY DEPARTMENT
HAVING SUM(SALARY) >= 20;

SELECT DEPARTMENT , SUM(SALARY) AS TOTAL
FROM EMPLOYEES
GROUP BY DEPARTMENT
HAVING SUM(SALARY) >= 15
ORDER BY SUM(SALARY) DESC;

SELECT Name,Salary +5 FROM EMPLOYEES; 
