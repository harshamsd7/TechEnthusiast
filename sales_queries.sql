USE SalesDB;
SELECT SUM(s.Quantity * p.Price) AS TotalRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID;

-- Top 5 Products by Revenue
SELECT p.ProductName, SUM(s.Quantity * p.Price) AS ProductRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY ProductRevenue DESC
LIMIT 5;

-- Sales by Region
SELECT c.Region, SUM(s.Quantity * p.Price) AS RegionRevenue
FROM Sales s
JOIN Customers c ON s.CustomerID = c.CustomerID
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY c.Region
ORDER BY RegionRevenue DESC;

-- Monthly Sales Trend
SELECT DATE_FORMAT(SaleDate, '%Y-%m') AS Month, SUM(s.Quantity * p.Price) AS MonthlyRevenue
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY DATE_FORMAT(SaleDate, '%Y-%m')
ORDER BY Month;