SHOW TABLES;

DESCRIBE `retail_sales_______2`;

SET SQL_SAFE_UPDATES = 0;

UPDATE `retail_sales_______2`
SET Num_Sales = CAST(REPLACE(REPLACE(Sales,'$',''),',','') AS DECIMAL(10,2));

DESCRIBE `retail_sales_______2`;

RENAME TABLE `retail_sales_______2`
TO retail__sales;

-- KPI queries
SELECT * FROM retail__sales;

-- Sales by Region
SELECT SUM(Num_Sales) AS Total_sales
FROM retail__sales;


SELECT Profit
FROM retail__sales
LIMIT 10;

DESCRIBE retail_sales;

-- discount hurting profit
SELECT Discount, AVG(Num_Profit) AS Avg_Profit, SUM(Num_Sales) AS Total_Sales
FROM retail__sales
GROUP BY Discount
ORDER BY AVG(Num_Profit) DESC;


ALTER TABLE retail__sales
ADD COLUMN Num_Profit DECIMAL(10,2);

UPDATE retail__sales
SET Num_Profit = CAST(REPLACE(Profit,'$','') AS DECIMAL(10,2));

-- Total Profit
SELECT SUM(Num_Profit) AS Total_Profit
FROM retail__sales;

-- Total Orders
SELECT COUNT(Order_ID) AS Total_Orders
FROM retail__sales;

-- Total Sales By Region
SELECT Region, SUM(Num_Sales) AS Total_Sales
FROM retail__sales
GROUP BY Region
ORDER BY Total_Sales DESC;

-- Sales by Category
SELECT Category, SUM(Num_Sales) AS Total_Sales
FROM retail__sales
GROUP BY Category
ORDER BY Total_Sales DESC;

-- Profit by Region
SELECT Region, SUM(Num_Profit) AS Total_Profit
FROM retail__sales
GROUP BY Region
ORDER BY Total_Profit DESC;

-- Top 5 Products
SELECT Product, SUM(Num_Sales) AS Total_Sales
FROM retail__sales
GROUP BY Product
ORDER BY Total_Sales DESC
LIMIT 5;

-- 5 most profitable products
SELECT Product, SUM(Num_Profit) AS Total_Profit
FROM retail__sales
GROUP BY Product
ORDER BY Total_Profit DESC
LIMIT 5;



