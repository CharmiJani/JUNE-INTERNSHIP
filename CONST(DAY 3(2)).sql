CREATE DATABASE CONST;
USE CONST;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50) NOT NULL
);
      
CREATE TABLE Orders(
    CustomerID INT,
    OrderID INT PRIMARY KEY,
    OrderNumber INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers
VALUES( 1 , 'John' ),
	  ( 2 , 'Jane' ),
      ( 3 , 'Bob' );
INSERT INTO Customers
VALUES( 4 , 'Joshua' ),
	  ( 5 , 'Jennie' ),
      ( 6 , 'Bibi' );
      
INSERT INTO Orders
VALUES( 1 , 101 , 1 ),
	  ( 2 , 102 , 2 ),
      ( 3 , 103 , 3 );
      
DELETE FROM Customers 
WHERE CustomerID = '3';

CREATE TABLE Emp1(
    EmpID INT,
    Name VARCHAR(50),
    Country VARCHAR(50)
);

CREATE TABLE Emp2(
    EmpID INT,
    Name VARCHAR(50),
    Country VARCHAR(50)
);

INSERT INTO Emp1
VALUES(1 , 'Shubham' , 'India'),
      (2 , 'Aman' , 'Australia'),
	  (3, 'Naveen' , 'Sri Lanka'),
      (4 , 'Aditya' , 'Austria'),
      (5 , 'Nishant' , 'Spain');
      
INSERT INTO Emp2
VALUES(1 , 'Tommy' , 'England'),
      (2 , 'Allon' , 'France'),
	  (3, 'Nancy' , 'India'),
      (4 , 'Adi' , 'Ireland'),
      (5 , 'Sandy' , 'Spain');
      
SELECT Country FROM Emp1
UNION
SELECT Country FROM Emp2
ORDER BY Country;

SELECT Country FROM Emp1
UNION ALL
SELECT Country FROM Emp2
ORDER BY Country;

SELECT Country FROM Emp1
INTERSECT
SELECT Country FROM Emp2
ORDER BY Country;

SELECT Country FROM Emp1
EXCEPT
SELECT Country FROM Emp2
ORDER BY Country;

SELECT * FROM Customers
INNER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

SELECT * FROM Customers AS c
INNER JOIN Orders AS o
ON c.CustomerID = o.CustomerID;

SELECT * FROM Customers
LEFT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

SELECT * FROM Customers
RIGHT JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;

SELECT * FROM Customers
OUTER JOIN Orders 
ON Customers.CustomerID = Orders.CustomerID;	

CREATE TABLE test_data(
   new_id INT,
   new_cat VARCHAR(50)
);

INSERT INTO test_data
VALUES(100 , 'Agni'),
      (200 , 'Agni'),
      (500 , 'Dharti'),
      (700 , 'Dharti'),
      (200 , 'Vayu'),
      (300 , 'Vayu'),
      (500 , 'Vayu');

SELECT new_id,new_cat,
SUM(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Total",
AVG(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Average",
COUNT(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Count",
MIN(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Min",
MAX(new_id) OVER(PARTITION BY new_cat ORDER BY new_id) AS "Max"
FROM test_data;

SELECT new_id,new_cat,
SUM(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Total",
AVG(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Average",
COUNT(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Count",
MIN(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Min",
MAX(new_id) OVER(ORDER BY new_id ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "Max"
FROM test_data;

CREATE TABLE test_data1(

SELECT new_id,
ROW_NUMBER() OVER(ORDER BY new_id) AS "ROW NUMBER",
RANK() OVER(ORDER BY new_id) AS "RANK",
DENSE_RANK() OVER(ORDER BY new_id) AS "DENSE RANK",
PERCENT_RANK() OVER(ORDER BY new_id) AS "PERCENT RANK"
FROM test_data1;

-- ANALYTICS
SELECT new_id,
FIRST_VALUE(new_id) OVER(ORDER BY new_id) AS "FIRST_VALUES",
LAST_VALUE(new_id) OVER(ORDER BY new_id) AS "LAST_VALUE",
LEAD(new_id) over(ORDER BY new_id) AS "LEAD",
LAG(new_id) over(ORDER BY new_id) AS "LAG"
FROM example_table;