SELECT *
FROM o_retail;

CREATE TABLE o_retail_staging
LIKE o_retail;

SELECT *
FROM o_retail_staging;

INSERT o_retail_staging
SELECT *
FROM o_retail;


SELECT *,
ROW_NUMBER() OVER(PARTITION BY InvoiceNO,StockCode,Country,CustomerID) AS row_num
FROM o_retail_staging;

WITH dupilicate_CTE AS 
(SELECT *,
ROW_NUMBER() OVER(PARTITION BY InvoiceNO,StockCode,Country,CustomerID,Quantity) AS row_num
FROM o_retail_staging)
SELECT *
FROM dupilicate_CTE
WHERE row_num > 1;

WITH dupilicate_CTE AS 
(SELECT *,
ROW_NUMBER() OVER(PARTITION BY InvoiceNO,StockCode,Country,CustomerID,Quantity) AS row_num
FROM o_retail_staging)
DELETE
FROM dupilicate_CTE
WHERE row_num > 1;


SELECT *
FROM o_retail_staging
WHERE InvoiceNo = '536409' AND InvoiceDate = '12/1/2010 11:45' AND `Description` = 'UNION JACK FLAG LUGGAGE TAG';

CREATE TABLE `o_retail_staging2` (
  `InvoiceNo` text,
  `StockCode` text,
  `Description` text,
  `Quantity` text,
  `InvoiceDate` text,
  `UnitPrice` text,
  `CustomerID` text,
  `Country` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


SELECT *
FROM o_retail_staging2;

INSERT INTO o_retail_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY InvoiceNO,StockCode,Country,CustomerID,Quantity) AS row_num
FROM o_retail_staging;


SELECT *
FROM o_retail_staging2;


UPDATE o_retail_staging2
SET `Description` = TRIM(`Description`);

SELECT DISTINCT `Description`
FROM o_retail_staging2;

SELECT InvoiceDate
FROM o_retail_staging2;

UPDATE o_retail_staging2
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i');


ALTER TABLE o_retail_staging2
MODIFY COLUMN InvoiceDate DATE;



SELECT *
FROM o_retail_staging2
WHERE `Description` IS NULL
OR Quantity IS NULL
OR InvoiceDate IS NULL
OR CustomerID IS NULL
OR InvoiceNo IS NULL
OR StockCode IS NULL
OR UnitPrice IS NULL;