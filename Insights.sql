
-- Checking to see which customer made the biggest order
SELECT MAX(Quantity) AS max_p, CustomerID, StockCode, UnitPrice, Country, `Description`
FROM o_retail_cleaned
GROUP BY Country,CustomerID, StockCode, UnitPrice,`Description`
ORDER BY max_p DESC;

-- Checking out the top countries that buys stuff online
SELECT COUNT(Country) AS int_p, AVG(Quantity), Country
FROM o_retail_cleaned
GROUP BY Country
ORDER BY int_p DESC;


-- insights about who bought the most items
SELECT CustomerID, SUM(Quantity) AS total_units_purchased 
FROM o_retail_cleaned
GROUP BY CustomerID
ORDER BY total_units_purchased DESC;


-- checking which item sells the most ordered by quantity
SELECT `Description`, SUM(Quantity) AS total_quantity ,UnitPrice, SUM(Quantity * UnitPrice) AS total_price
FROM o_retail_cleaned
GROUP BY `Description`,UnitPrice
ORDER BY total_quantity DESC;

-- checking which item sells the most ordered by total price
SELECT `Description`, SUM(Quantity) AS total_quantity ,UnitPrice, SUM(Quantity * UnitPrice) AS total_price
FROM o_retail_cleaned
GROUP BY `Description`,UnitPrice
ORDER BY total_price DESC;

-- Checking which country buys the most ranked by total price paid 
SELECT Country, SUM(Quantity) AS total_quantity , SUM(Quantity * UnitPrice) AS total_price
FROM o_retail_cleaned
GROUP BY Country
ORDER BY total_price DESC;


-- Checking the earnings and items ranked by month
SELECT MONTH(InvoiceDate), SUM(Quantity) AS total_quantity, SUM(Quantity * UnitPrice) AS total_price
FROM o_retail_cleaned
GROUP BY MONTH(InvoiceDate)
ORDER BY MONTH(InvoiceDate);

-- Checking the earnings and items ranked by month
SELECT SUBSTRING(InvoiceDate, 6,2) AS `Month` ,  SUM(Quantity * UnitPrice) AS total_price
FROM o_retail_cleaned
GROUP BY `Month`
ORDER BY `Month`;


-- Rolling total of 3 first quarters of 2010
wITH rolling_total AS(
SELECT SUBSTRING(InvoiceDate, 6,2) AS `Month` ,  SUM(Quantity * UnitPrice) AS total_price
FROM o_retail_cleaned
GROUP BY `Month`
)
SELECT `Month`, total_price,SUM(total_price) OVER(ORDER BY `Month`) AS rolling_total_price
FROM rolling_total
;



