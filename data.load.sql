-- KPIs

USE sample_superstore_db;
GO

-- 1.  إجمالي المبيعات، إجمالي الأرباح، إجمالي الكميات، ومتوسط الخصم
SELECT 
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(AVG(Discount) * 100, 2) AS Avg_Discount_Percentage
FROM cleaned_orders;


-- 2.  (Categories): إجمالي المبيعات والأرباح لكل قسم
SELECT 
    Category,
    ROUND(SUM(Sales), 2) AS Category_Sales,
    ROUND(SUM(Profit), 2) AS Category_Profit
FROM cleaned_orders
GROUP BY Category
ORDER BY Category_Sales DESC;


-- 3.  المنتجات التي تحقق مبيعات ولكن أرباحها بالسالب بسبب الخصومات المبالغ فيها
SELECT TOP 10
    Product_Name,
    Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Loss,
    ROUND(AVG(Discount), 2) AS Avg_Discount
FROM cleaned_orders
GROUP BY Product_Name, Category
HAVING SUM(Profit) < 0
ORDER BY Total_Loss ASC; 


-- 4. تحليل وتسجيل شرائح العملاء (Customer Segmentation / VIP vs Regular)
-- بناءً على إجمالي حجم مشتريات العميل
SELECT 
    Customer_ID,
    Customer_Name,
    Segment,
    ROUND(SUM(Sales), 2) AS Total_Customer_Spent,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    CASE 
        WHEN SUM(Sales) > 5000 THEN 'VIP Customer'
        WHEN SUM(Sales) BETWEEN 2000 AND 5000 THEN 'Gold Customer'
        ELSE 'Regular Customer'
    END AS Customer_Tier
FROM cleaned_orders
GROUP BY Customer_ID, Customer_Name, Segment
ORDER BY Total_Customer_Spent DESC;


-- 5. حساب متوسط وقت الشحن 
SELECT 
    Ship_Mode,
    ROUND(AVG(CAST(DATEDIFF(day, Order_Date, Ship_Date) AS FLOAT)), 1) AS Avg_Shipping_Days
FROM cleaned_orders
GROUP BY Ship_Mode
ORDER BY Avg_Shipping_Days ASC;


-- 6. التحليل الزمني: نمو المبيعات الشهرية 
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Order_Month,
    ROUND(SUM(Sales), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM cleaned_orders
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Order_Month ASC;