# Online Retail SQL Project

## Project Overview

This project involves cleaning and standardizing a dataset that contains information on online purchases. The dataset includes several key columns such as `InvoiceNo`, `StockCode`, `Description`, `Quantity`, `InvoiceDate`, `UnitPrice`, `CustomerID`, and `Country`. The main goal of this project is to prepare the data for further analysis or use by removing incorrect entries, handling null values, and ensuring proper data types.

## Technologies Used

- **MySQL**: The entire data-cleaning process was performed using MySQL queries.

## Dataset

The dataset describes online purchases, and it includes the following columns:

- **InvoiceNo**: The invoice number, representing each transaction.
- **StockCode**: A unique code identifying the product.
- **Description**: A brief description of the product.
- **Quantity**: The quantity of each product per transaction.
- **InvoiceDate**: The date when the transaction occurred.
- **UnitPrice**: The price of the product per unit.
- **CustomerID**: A unique identifier for each customer.
- **Country**: The customer's country.

## Project Steps

### 1. Data Discovery

I began by exploring the data to understand its structure and identify potential issues such as missing values, duplicates, and incorrect data types.

### 2. Removing Duplicates

The dataset contained duplicates, which were removed using MySQL queries to ensure the integrity of the data.

### 3. Standardizing Data Types

Many of the columns were incorrectly formatted as text (e.g., numbers stored as strings). I converted the data types to their appropriate formats:

- **InvoiceNo**, **StockCode**, and **CustomerID** were converted to integers.
- **Quantity** was also converted to an integer, ensuring no negative values were present.
- **InvoiceDate** was converted to the correct date format.
- **UnitPrice** was converted to a floating-point number to reflect prices accurately.

### 4. Removing Incorrect Inputs

I identified and removed incorrect entries where columns contained values that didn’t make sense. For example, any letters in columns expected to hold numbers (like **StockCode** and **CustomerID**) were removed.

### 5. Handling Null Values

All rows with null values in any important column were removed to ensure a complete and clean dataset.

## How to Set Up the Project

To set up this project, all you need is MySQL and the dataset, which is provided in CSV format for easy import.

1. Install MySQL if it’s not already installed.
2. Import the dataset into a MySQL database using the `LOAD DATA INFILE` or MySQL Workbench's import feature.
3. Run the SQL scripts provided in this repository to clean and standardize the dataset.
    

## License

This project is open-source and available under the MIT License.

## Contact Information

For any questions or feedback, feel free to reach out via abdelrahmanabushady5@gmail.com