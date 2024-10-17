# Online Retail SQL Project

## Project Overview

This project involved cleaning and analyzing a dataset describing online purchases. The dataset includes various columns such as:

- **InvoiceNo**: Unique identifier for each transaction
- **StockCode**: Unique identifier for each product
- **Description**: Description of the product
- **Quantity**: Number of products purchased
- **InvoiceDate**: Date of the transaction
- **UnitPrice**: Price per unit of the product
- **CustomerID**: Unique identifier for each customer
- **Country**: Country where the order was placed

The goal was to clean the data and extract meaningful insights. Only MySQL was used for this project.

## Data Cleaning Process

1. **Initial Discovery**: The dataset was explored to understand its structure and quality.
2. **Removing Duplicates**: Duplicate records were identified and removed.
3. **Standardizing Data Types**: Many columns were incorrectly formatted as text. These were converted to appropriate data types like integers, floats, and dates.
4. **Cleaning Invalid Data**: Invalid data (e.g., letters in numeric fields) was identified and removed.
5. **Handling Null Values**: Null and blank values were removed to ensure data consistency.

No external setup is required for this project aside from MySQL. The cleaned data has been exported to a CSV file for easy import.

## Key Insights

Here are some of the most interesting insights gathered from the cleaned dataset:

1. **Which Customer Made the Biggest Order?**
    
    - **CustomerID**: 15838
    - **Items Ordered**: 9360
    - **Item Description**: ROTATING SILVER ANGELS T-LIGHT HLDR
    - **StockCode**: 84347
    - **Unit Price**: $0.03
    - **Country**: United Kingdom
2. **Which Country Buys the Most?**
    
    - **United Kingdom**: 11,216 items purchased
    - **Germany**: 223 items purchased (second place)
3. **Which Item is Sold the Most?**
    
    - **Item Description**: ROTATING SILVER ANGELS T-LIGHT HLDR
    - **Quantity Sold**: 9360 times
4. **Which Item Brought the Most Revenue?**
    
    - **Item Description**: VINTAGE UNION JACK MEMOBOARD
    - **Quantity Sold**: 1008
    - **Unit Price**: $6.38
5. **Which Country Paid the Most Revenue?**
    
    - **United Kingdom**: $246,976.47
    - **Germany**: $4,783.20 (second place)
6. **Which Month Brought the Most Revenue?**
    
    - **Month**: July
    - **Total Items Sold**: 18,195
    - **Total Revenue**: $51,113.01

## Conclusion

This project allowed for a deep dive into cleaning and analyzing a dataset focused on online retail. The insights gathered show clear trends in customer behavior, country-based purchasing habits, and top-performing products.