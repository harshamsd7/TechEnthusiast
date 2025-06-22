-- Create Database
CREATE DATABASE SalesDB;
USE SalesDB;

-- Create Tables
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Region VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Insert Sample Data
INSERT INTO Customers (CustomerID, CustomerName, Region) VALUES
(1, 'Acme Corp', 'North'),
(2, 'Beta LLC', 'South'),
(3, 'Gamma Inc', 'West');

INSERT INTO Products (ProductID, ProductName, Price) VALUES
(101, 'Laptop', 999.99),
(102, 'Mouse', 29.99),
(103, 'Keyboard', 59.99);

INSERT INTO Sales (CustomerID, ProductID, SaleDate, Quantity) VALUES
(1, 101, '2025-01-15', 2),
(2, 102, '2025-02-10', 5),
(3, 103, '2025-03-05', 3),
(1, 102, '2025-04-20', 10),
(2, 101, '2025-05-12', 1);