USE sample_superstore_db

SELECT 
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    City,
    State,
    Postal_Code,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Product_Name,
    Sales,
    Quantity,
    Discount,
    Profit
INTO cleaned_orders
FROM raw_orders
WHERE Order_ID IS NOT NULL;

-- تحويل نوع بيانات الأرقام من نصوص (nvarchar) إلى أرقام عشرية (float)
ALTER TABLE cleaned_orders 
ALTER COLUMN Sales FLOAT;

ALTER TABLE cleaned_orders 
ALTER COLUMN Profit FLOAT;

ALTER TABLE cleaned_orders 
ALTER COLUMN Discount FLOAT;

ALTER TABLE cleaned_orders 
ALTER COLUMN Quantity INT;
----------test------------
SELECT TOP 10 * FROM cleaned_orders;