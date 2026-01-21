CREATE DATABASE sales_performance;
USE sales_performance;
CREATE TABLE superstore_sales (
    row_id INT,

    order_id VARCHAR(20),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(20),

    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),

    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),

    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),

    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2)
);
SHOW Tables;
DESCRIBE superstore_sales;
DROP TABLE IF EXISTS superstore_sales; 
CREATE TABLE superstore_sales (
    row_id INT,

    order_id VARCHAR(20),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(20),

    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(50),

    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),

    product_id VARCHAR(20),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(150),

    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(4,2),
    profit DECIMAL(10,2)
);
DROP DATABASE IF EXISTS sales_performance;
CREATE DATABASE sales_performance;
USE sales_performance;
CREATE TABLE superstore_sales (
    row_id INT,
    order_id VARCHAR(30),
    order_date VARCHAR(20),
    ship_date VARCHAR(20),
    ship_mode VARCHAR(20),

    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    segment VARCHAR(30),

    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(10),
    region VARCHAR(20),

    product_id VARCHAR(30),
    category VARCHAR(30),
    sub_category VARCHAR(30),
    product_name VARCHAR(200),

    sales DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),
    profit DECIMAL(10,2)
);

SELECT COUNT(*) FROM superstore_sales;

SELECT ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales;
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore_sales;
SELECT COUNT(DISTINCT ORDER_ID) AS TOTAL_ORDERS
FROM SUPERSTORE_SALES;
SELECT COUNT(distinct CUSTOMER_ID) AS TOTAL_CUSTOMERS
FROM superstore_sales;
-- catgeory and region analysis
-- sales and profit by category 
SELECT CATEGORY, 
	   ROUND(SUM(sales), 2)  AS sales,
       ROUND(SUM(profit), 2) AS profit
FROM SUPERSTORE_SALES
GROUP BY CATEGORY
ORDER BY SALES DESC;
-- Region-wise Sales & Profit
SELECT REGION,
ROUND(SUM(SALES), 2) as sales, 
round(sum(profit), 2) as profit
from superstore_sales
group by region
order by sales desc;
-- monthly sales trends
SELECT 
YEAR(ORDER_DATE) AS YEAR,
MONTH(ORDER_DATE) AS MONTH,
ROUND(SUM(SALES), 2) AS MONTHLY_SALES
FROM SUPERSTORE_SALES
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH;
-- TOP 10 PRODUCTS
SELECT PRODUCT_NAME, 
ROUND(SUM(SALES), 2) AS SALES
FROM SUPERSTORE_SALES
GROUP BY PRODUCT_NAME
ORDER BY SALES DESC
LIMIT 10;
-- LOSS MAKING PRODUCTS
SELECT PRODUCT_NAME, 
ROUND(SUM(PROFIT), 2) AS PROFIT
FROM SUPERSTORE_SALES
GROUP BY PRODUCT_NAME
HAVING PROFIT < 0
ORDER BY PROFIT;