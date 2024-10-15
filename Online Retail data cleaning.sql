
-- DATA EXPLORATION
-- MAKING a MODIFICATION TABLE
SELECT *
FROM o_retail;

CREATE TABLE o_retail_staging
LIKE o_retail;

SELECT *
FROM o_retail_staging;

INSERT o_retail_staging
SELECT *
FROM o_retail;


-- CHECKING FOR DUPLICATES

SELECT *,
ROW_NUMBER() OVER(PARTITION BY InvoiceNO,StockCode,Country,CustomerID) AS row_num
FROM o_retail_staging;

-- CHECK ROWS THAT WAS MENTIONED MORE THAN ONCE
WITH dupilicate_CTE AS 
(SELECT *,
ROW_NUMBER() OVER(PARTITION BY InvoiceNO,StockCode,Country,CustomerID,Quantity) AS row_num
FROM o_retail_staging)
SELECT *
FROM dupilicate_CTE
WHERE row_num > 1;





-- DOUBLE CHECKING IF THEY ARE ACTUALLY DUPLICATES
SELECT *
FROM o_retail_staging
WHERE InvoiceNo = '536409' AND InvoiceDate = '12/1/2010 11:45' AND `Description` = 'UNION JACK FLAG LUGGAGE TAG';


-- CREATING A COLUMN WHERE I CAN THE NUMBER OF ROWS THAT WAS DUPLICATED
DROP TABLE IF EXISTS `o_retail_staging2`;
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

-- DELETING ROWS THAT ARE DUPLICATED
DELETE
FROM o_retail_staging2
WHERE row_num > 1;


SELECT *
FROM o_retail_staging2;

-- TRIMIMG TEXT COLUMNS
UPDATE o_retail_staging2
SET `Description` = TRIM(`Description`);

SELECT DISTINCT `Description`
FROM o_retail_staging2;

SELECT *
FROM o_retail_staging2;

-- STANDARDRIZING INVOICE DATE COLUMN

UPDATE o_retail_staging2
SET InvoiceDate = STR_TO_DATE(InvoiceDate, '%d/%m/%Y %H:%i');

ALTER TABLE o_retail_staging2
MODIFY COLUMN InvoiceDate DATE;

-- STANDARDRIZING UNIT PRICE COLUMN
UPDATE o_retail_staging2
SET `UnitPrice` = CONVERT(`UnitPrice`, FLOAT);

ALTER TABLE o_retail_staging2
MODIFY COLUMN UnitPrice FLOAT;


-- STANDARDRIZING QUANITITY COLUMN

UPDATE o_retail_staging2
SET Quantity = ABS(Quantity);

DELETE FROM o_retail_staging2
WHERE Quantity REGEXP '[a-zA-Z]';

UPDATE o_retail_staging2
SET `Quantity` = CONVERT(`Quantity`, UNSIGNED);

ALTER TABLE o_retail_staging2
MODIFY COLUMN Quantity INT;


-- STANDARDRIZING STOCKCODE COLUMN
DELETE FROM o_retail_staging2
WHERE StockCode REGEXP '[a-zA-Z]';

UPDATE o_retail_staging2
SET `StockCode` = TRIM(`StockCode`);


UPDATE o_retail_staging2
SET StockCode = CONVERT(StockCode , UNSIGNED);

ALTER TABLE o_retail_staging2
MODIFY COLUMN StockCode INT;


SELECT * 
FROM o_retail_staging2
WHERE CustomerID= "";

SELECT * 
FROM o_retail_staging2
WHERE Description= "";

DELETE FROM o_retail_staging2
WHERE CustomerID ="";

UPDATE o_retail_staging2
SET CustomerID = CONVERT(CustomerID , UNSIGNED);

ALTER TABLE o_retail_staging2
MODIFY COLUMN CustomerID INT;


SELECT *
FROM o_retail_staging2
WHERE `Description` IS NULL OR `Description` = ""
   OR Quantity IS NULL OR Quantity = ""
   OR CustomerID IS NULL OR CustomerID=""
   OR InvoiceDate IS NULL
   OR InvoiceNo IS NULL OR InvoiceNo = ""
   OR StockCode IS NULL OR StockCode = ""
   OR UnitPrice IS NULL OR UnitPrice = "";

-- SEEING IF I CAN REPOPULATE THE DATA BUT SADLY NOTHING MATCH
SELECT *
FROM o_retail_staging2 o1
JOIN o_retail_staging2 o2
	ON o1.InvoiceNo = o2.InvoiceNo
WHERE o1.`CustomerID` IS NULL
AND o2.`CustomerID` IS NOT NULL;

-- DELETING NULL VALUES THAT ARE MOSTLY FROM STOCK CODE AND CUSTOMERID WHICH I NEED TO GET MY INSIGHTS

DELETE
FROM o_retail_staging2
WHERE `Description` IS NULL OR `Description` = ""
   OR Quantity IS NULL OR Quantity = ""
   OR CustomerID IS NULL OR CustomerID=""
   OR InvoiceDate IS NULL
   OR InvoiceNo IS NULL OR InvoiceNo = ""
   OR StockCode IS NULL OR StockCode = ""
   OR UnitPrice IS NULL OR UnitPrice = "";
   
-- DROPPING ROW_NUM COLUMN BECAUSE I NO LONGER NEED IT   
ALTER TABLE o_retail_staging2
DROP COLUMN row_num;

-- DROPPING THE TABLE WE DID INTIALLY AND NEVER USED XD
DROP TABLE o_retail_staging;

-- RENAMING THE TABLE

ALTER TABLE o_retail_staging2 RENAME TO o_retail_cleaned;