CREATE DATABASE RetailDB;
USE RetailDB;

CREATE TABLE Customers (
	CustomerId INT PRIMARY KEY,
	Country varchar(255)
);
CREATE TABLE Products (
    StockCode VARCHAR(20) PRIMARY KEY,
    Description VARCHAR(255),
    UnitPrice DECIMAL(10,2)
);
CREATE TABLE Orders (
    InvoiceNo VARCHAR(20) PRIMARY KEY,
    InvoiceDate DATETIME,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Quantity INT,
    UnitPrice DECIMAL(10,2),  -- Add UnitPrice here
    FOREIGN KEY (InvoiceNo) REFERENCES Orders(InvoiceNo),
    FOREIGN KEY (StockCode) REFERENCES Products(StockCode)
);

SHOW DATABASES;
USE RetailDB;
SHOW TABLES;
SELECT * FROM Customers LIMIT 5;
SELECT * FROM Products LIMIT 5;
SELECT * FROM Orders LIMIT 5;
SELECT * FROM OrderDetails LIMIT 5;


DESC OrderDetails;
SET GLOBAL wait_timeout = 600;
SET GLOBAL interactive_timeout = 600;
SET GLOBAL net_read_timeout = 300;
SET GLOBAL net_write_timeout = 300;
SET SESSION max_execution_time = 300000;

SELECT table_name, round(data_length/1024/1024, 2) AS Size_MB 
FROM information_schema.tables 
WHERE table_schema = 'RetailDB' AND table_name = 'OrderDetails';




