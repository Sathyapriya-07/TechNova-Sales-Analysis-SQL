CREATE DATABASE IF NOT EXISTS TechNova_Sales_DB;

USE TechNova_Sales_DB;
CREATE TABLE IF NOT EXISTS Sales_Data
(
    Order_ID INT PRIMARY KEY,
    Order_Date DATE,
    Month VARCHAR(20),
    Customer_ID VARCHAR(20),
    Product_ID VARCHAR(20),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Total_Sales DECIMAL(10,2),
    Cost_Price DECIMAL(10,2),
    Profit DECIMAL(10,2),
    Payment_Mode VARCHAR(30),
    Discount DECIMAL(5,2),
    Net_Sales DECIMAL(10,2),
    Salesperson VARCHAR(100),
    Branch VARCHAR(50)
);
SELECT *
FROM Sales_Data;
SELECT Order_ID,
       Product_ID,
       Net_Sales
FROM Sales_Data;
SELECT *
FROM Sales_Data
WHERE Net_Sales > 50000;
SELECT *
FROM Sales_Data
WHERE Branch='Chennai';
SELECT *
FROM Sales_Data
ORDER BY Net_Sales DESC;
SELECT SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data;
SELECT COUNT(*) AS Total_Orders
FROM Sales_Data;
SELECT AVG(Net_Sales) AS Average_Net_Sales
FROM Sales_Data;
SELECT MAX(Net_Sales) AS Highest_Net_Sale
FROM Sales_Data;
SELECT MIN(Net_Sales) AS Lowest_Net_Sale
FROM Sales_Data;
SELECT Branch,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Branch;
SELECT Payment_Mode,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Payment_Mode;
SELECT Salesperson,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Salesperson;
SELECT Branch,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Branch
ORDER BY Total_Net_Sales DESC;
SELECT Branch,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Branch
HAVING SUM(Net_Sales) > 300000;

SELECT Salesperson,
       COUNT(*) AS Total_Orders
FROM Sales_Data
GROUP BY Salesperson
HAVING COUNT(*) > 5;

SELECT Payment_Mode,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Payment_Mode
HAVING SUM(Net_Sales) > 200000;
SELECT *
FROM Sales_Data
LIMIT 5;
SELECT DISTINCT Branch
FROM Sales_Data;
SELECT *
FROM Sales_Data
WHERE Net_Sales BETWEEN 30000 AND 60000;
SELECT *
FROM Sales_Data
WHERE Branch IN ('Chennai','Coimbatore');
SELECT *
FROM Sales_Data
WHERE Salesperson LIKE 'A%';
SELECT Branch,
       SUM(Net_Sales) AS Total_Sales
FROM Sales_Data
GROUP BY Branch;
SELECT Branch,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Branch
ORDER BY Total_Net_Sales DESC
LIMIT 5;
SELECT Salesperson,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Salesperson
ORDER BY Total_Net_Sales DESC
LIMIT 5;
SELECT Payment_Mode,
       COUNT(*) AS Total_Transactions
FROM Sales_Data
GROUP BY Payment_Mode
ORDER BY Total_Transactions DESC;
SELECT Month,
       SUM(Net_Sales) AS Total_Net_Sales
FROM Sales_Data
GROUP BY Month
ORDER BY Total_Net_Sales DESC;
SELECT Branch,
       AVG(Net_Sales) AS Average_Net_Sales
FROM Sales_Data
GROUP BY Branch
ORDER BY Average_Net_Sales DESC;
SELECT Branch,
       SUM(Profit) AS Total_Profit
FROM Sales_Data
GROUP BY Branch
ORDER BY Total_Profit DESC;
SELECT Order_ID,
       Net_Sales,
       CASE
           WHEN Net_Sales >= 60000 THEN 'High Sales'
           WHEN Net_Sales >= 40000 THEN 'Medium Sales'
           ELSE 'Low Sales'
       END AS Sales_Category
FROM Sales_Data;
CREATE VIEW Branch_Sales_Report AS
SELECT Branch,
       SUM(Net_Sales) AS Total_Net_Sales,
       SUM(Profit) AS Total_Profit
FROM Sales_Data
GROUP BY Branch;
SELECT *
FROM Branch_Sales_Report;
CREATE TABLE Product_List
(
    Product_ID VARCHAR(20) PRIMARY KEY,
    Product_Name VARCHAR(100),
    Category VARCHAR(50)
);
INSERT INTO Product_List VALUES
('P001','Dell Inspiron 15','Laptop'),
('P002','HP Pavilion','Laptop'),
('P003','Lenovo ThinkPad','Laptop'),
('P004','Samsung Galaxy Tab','Tablet'),
('P005','Apple iPad Air','Tablet'),
('P006','Logitech Mouse','Accessories'),
('P007','HP Keyboard','Accessories'),
('P008','Dell Monitor','Monitor'),
('P009','Canon Printer','Printer'),
('P010','Sony Headphones','Accessories');
SELECT
    s.Order_ID,
    s.Product_ID,
    p.Product_Name,
    p.Category,
    s.Net_Sales
FROM Sales_Data s
INNER JOIN Product_List p
ON s.Product_ID = p.Product_ID;
SELECT
    p.Category,
    SUM(s.Net_Sales) AS Total_Net_Sales
FROM Sales_Data s
INNER JOIN Product_List p
ON s.Product_ID = p.Product_ID
GROUP BY p.Category
ORDER BY Total_Net_Sales DESC;
SELECT
    p.Product_Name,
    SUM(s.Net_Sales) AS Total_Net_Sales
FROM Sales_Data s
INNER JOIN Product_List p
ON s.Product_ID = p.Product_ID
GROUP BY p.Product_Name
ORDER BY Total_Net_Sales DESC
LIMIT 1;
SELECT
    p.Category,
    COUNT(*) AS Total_Orders
FROM Sales_Data s
INNER JOIN Product_List p
ON s.Product_ID = p.Product_ID
GROUP BY p.Category;
SELECT
    COUNT(*) AS Total_Orders,
    SUM(Net_Sales) AS Total_Net_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Net_Sales) AS Average_Order_Value
FROM Sales_Data;