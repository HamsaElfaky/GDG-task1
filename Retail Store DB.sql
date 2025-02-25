IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'RetailStoreDB')
BEGIN
    CREATE DATABASE RetailStoreDB;
END

USE RetailStoreDB  ;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Customers')
BEGIN
Create TABLE customers 
(
customerID INT PRIMARY  KEY IDENTITY (1,1),
firstname VARCHAR(50),
lastname VARCHAR(50),
email VARCHAR (50),
registrationdate DATE ,
); END

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'Products')
BEGIN
CREATE TABLE products 
(
productsID INT PRIMARY KEY IDENTITY (1,1),
productname  VARCHAR (50),
category Varchar (50),
price DECIMAL(20,2),
stockquantity  INT ,
); END 

IF NOT EXISTS (SELECT*FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME ='orders')
BEGIN 
CREATE TABLE orders 
(
orderID INT PRIMARY KEY IDENTITY (1,1),
 CustomerID INT,
 ProductID INT,
 OrderDate DATE,
 Quantity INT,
   FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
        FOREIGN KEY (ProductID) REFERENCES Products(productsID)
); END 

INSERT INTO customers (firstname , lastname , email , registrationdate ) VALUES 
('hamsa' , 'elfakky' , 'hamsa@gmail.com' , '2025-02-23' ),
('ahmed' , 'elfaky' , 'ahmed@gmail.com' , '2025-02-22'),
('gad' , 'elfaky' , 'gad@gmail.com' , '2025-02-21' ) ,
('hany' ,  'amin' , 'hany@gmail.com' , '2025-02-20' ) ,
('amr' , 'amin' , 'amr@gmail.com' , '2025-02-19') ;

INSERT INTO products (productname , category , price ,stockquantity) VALUES 
('Laptop', 'Electronics', 1000.00, 10),
('Smartphone', 'Electronics', 800.00, 20),
('Headphones', 'Accessories', 150.00, 50),
('Backpack', 'Bags', 75.00, 30),
('Smartwatch', 'Wearable', 200.00, 15);

INSERT INTO orders (CustomerID , ProductID , OrderDate , Quantity) VALUES 
(1, 1, '2024-03-10', 1),
(2, 2, '2024-03-12', 2),
(3, 3, '2024-03-15', 1),
(4, 4, '2024-03-18', 3),
(5, 5, '2024-03-20', 1);



SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;

SELECT * FROM Customers WHERE RegistrationDate > '2025-02-19';
SELECT TOP 3 * FROM Products ORDER BY Price DESC;




