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