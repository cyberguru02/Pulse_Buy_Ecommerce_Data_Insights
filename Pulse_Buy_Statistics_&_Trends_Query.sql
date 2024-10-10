/* 
For each month, calculating main sales metrics: order count, total sales, and aov
Filtering to only North America and Portable Solar Charger
Rounding numbers for readability
*/
WITH sales_trends_monthly_cte AS (
    SELECT 
        DATE_TRUNC(orders.purchase_date, MONTH) AS purchase_month,
        COUNT(orders.id) AS total_orders,
        ROUND(SUM(orders.price_usd), 2) AS total_sales,
        ROUND(AVG(orders.price_usd), 2) AS avg_sales
    FROM 
        pulse-415501.pulsebuy.orders AS orders
    JOIN 
        pulse-415501.pulsebuy.customers AS customers 
    ON 
        orders.customer_id = customers.id
    JOIN 
        pulse-415501.pulsebuy.geo_lookup AS geo_lookup 
    ON 
        customers.country_code = geo_lookup.country
    WHERE 
        geo_lookup.region = 'NA' AND LOWER(orders.product_name) LIKE '%portable%'
    GROUP BY 
        1
)
SELECT 
    ROUND(AVG(total_orders)) AS avg_total_orders,
    ROUND(AVG(total_sales)) AS avg_monthly_sales,
    ROUND(AVG(avg_sales)) AS avg_price
FROM 
    sales_trends_monthly_cte;

/* 
For each quarter, calculating main sales metrics: order count, total sales, and aov
Filtering to only North America and Portable Solar Charger
Rounding numbers for readability
*/
WITH sales_trends_quarterly_cte AS (
    SELECT 
        DATE_TRUNC(orders.purchase_date, QUARTER) AS purchase_quarter,
        COUNT(orders.id) AS total_orders,
        ROUND(SUM(orders.price_usd), 2) AS total_sales,
        ROUND(AVG(orders.price_usd), 2) AS avg_sales
    FROM 
        pulse-415501.pulsebuy.orders AS orders
    JOIN 
        pulse-415501.pulsebuy.customers AS customers 
    ON 
        orders.customer_id = customers.id
    JOIN 
        pulse-415501.pulsebuy.geo_lookup AS geo_lookup 
    ON 
        customers.country_code = geo_lookup.country
    WHERE 
        geo_lookup.region = 'NA' AND LOWER(orders.product_name) LIKE '%portable%'
    GROUP BY 
        1
)
SELECT 
    ROUND(AVG(total_orders)) AS avg_total_orders,
    ROUND(AVG(total_sales)) AS avg_quarterly_sales,
    ROUND(AVG(avg_sales)) AS avg_price
FROM 
    sales_trends_quarterly_cte;

/*
Counting the number of refunds per month (non-null values in return_date represent refunds)
Calculating the refund rate
*/
WITH monthly_refunds_cte AS (
    SELECT 
        DATE_TRUNC(order_status.return_date, MONTH) AS month,
        SUM(CASE WHEN order_status.return_date IS NOT NULL THEN 1 ELSE 0 END) AS refunds,
        SUM(CASE WHEN order_status.return_date IS NOT NULL THEN 1 ELSE 0 END) / COUNT(DISTINCT orders.id) AS refund_rate
    FROM 
        pulse-415501.pulsebuy.order_status AS order_status
    JOIN 
        pulse-415501.pulsebuy.orders AS orders
    ON 
        orders.id = order_status.transaction_id
    WHERE 
        EXTRACT(YEAR FROM orders.purchase_date) = 2021
    GROUP BY 
        1
    ORDER BY 
        1
)
SELECT 
    ROUND(AVG(refund_rate), 3) AS monthly_refunds
FROM 
    monthly_refunds_cte;

/*
Counting the number of refunds, filtered to 2022
Only including Portable and Eco-Friendly products, using lowercase to account for any differences in capitalization
*/
SELECT 
    DATE_TRUNC(order_status.return_date, MONTH) AS month,
    SUM(CASE WHEN order_status.return_date IS NOT NULL THEN 1 ELSE 0 END) AS refunds
FROM 
    pulse-415501.pulsebuy.orders AS orders
LEFT JOIN 
    pulse-415501.pulsebuy.order_status AS order_status
ON 
    orders.id = order_status.transaction_id
WHERE 
    EXTRACT(YEAR FROM order_status.return_date) = 2022
    AND (LOWER(orders.product_name) LIKE '%portable%' OR LOWER(orders.product_name) LIKE '%eco%')
GROUP BY 
    1
ORDER BY 
    1;

/* 
Cleaning up product names and calculating refund rates for each product
*/
WITH refunds_cte AS (
    SELECT 
        CASE 
orders.product_name 
        END AS product_name_clean,
        COUNT(order_status.return_date) AS refunds,
        ROUND(COUNT(order_status.return_date) / COUNT(DISTINCT orders.id), 3) AS refund_rate
    FROM 
        pulse-415501.pulsebuy.orders AS orders
    LEFT JOIN 
        pulse-415501.pulsebuy.order_status AS order_status 
    ON 
        orders.id = order_status.transaction_id
    GROUP BY 
        1
)
/* 
Highlighting the 3 products with the highest refund rate 
*/
SELECT 
    product_name_clean, 
    refund_rate
FROM 
    refunds_cte
ORDER BY 
    2 DESC
LIMIT 
    3;
/*
Finding AOV and new customers by account_creation_method for accounts created in the first 2 months of 2023
*/
WITH account_creation_method_cte AS (
    SELECT 
        customers.account_creation_method AS account_creation_method, 
        ROUND(AVG(orders.price_usd), 2) AS aov, 
        COUNT(DISTINCT customers.customer_id) AS new_customers
    FROM 
        pulse-415501.pulsebuy.customers AS customers
    INNER JOIN 
        pulse-415501.pulsebuy.orders AS orders 
    ON 
        customers.customer_id = orders.customer_id
    WHERE 
        EXTRACT(YEAR FROM customers.account_creation_date) = 2024 AND EXTRACT(MONTH FROM customers.account_creation_date) IN (1, 2)
    GROUP BY 
        1
)
/* 
Comparing AOV for each account creation method 
*/
SELECT 
    account_creation_method, 
    aov
FROM 
    account_creation_method_cte
ORDER BY 
    2 DESC;

/*
Finding AOV and new customers by account_creation_method for accounts created in the first 2 months of 2023 
*/
WITH account_creation_method_cte AS (
    SELECT 
        customers.account_creation_method AS account_creation_method, 
        ROUND(AVG(orders.price_usd), 2) AS aov, 
        COUNT(DISTINCT customers.customer_id) AS new_customers
    FROM 
        pulse-415501.pulsebuy.customers AS customers
    INNER JOIN 
        pulse-415501.pulsebuy.orders AS orders 
    ON 
        customers.customer_id = orders.customer_id
    WHERE 
        EXTRACT(YEAR FROM customers.account_creation_date) = 2023 AND EXTRACT(MONTH FROM customers.account_creation_date) IN (1, 2)
    GROUP BY 
        1
)
/* 
Comparing total new customers for each account creation method 
*/
SELECT 
    account_creation_method, 
    new_customers
FROM 
    account_creation_method_cte
ORDER BY 
    new_customers DESC;

/*
Avg amount of time between customer registration and initial purchase
Averaging the amount of days to purchase for all customers
*/
WITH initial_order_cte AS (
    SELECT 
        orders.customer_id AS customer_id, 
        MIN(orders.purchase_date) AS initial_order
    FROM 
        pulse-415501.pulsebuy.orders AS orders
    GROUP BY 
        1 
)
SELECT 
    ROUND(AVG(DATE_DIFF(initial_order_cte.initial_order, customers.account_creation_date, DAY)), 2) AS days_to_purchase
FROM 
    pulse-415501.pulsebuy.customers AS customers
INNER JOIN 
    initial_order_cte 
ON 
    customers.customer_id = initial_order_cte.customer_id;

/*
Avg time between customer registration and all orders made by customers
Averaging the amount of days to purchase for all customers
*/
WITH time_to_order_cte AS (
    SELECT 
        orders.customer_id, 
        orders.purchase_date,
        customers.account_creation_date,
        DATE_DIFF(orders.purchase_date, customers.account_creation_date, DAY) AS days_to_purchase
    FROM 
        pulse-415501.pulsebuy.customers AS customers
    LEFT JOIN 
        pulse-415501.pulsebuy.orders AS orders 
    ON 
        customers.customer_id = orders.customer_id
)
SELECT 
    ROUND(AVG(days_to_purchase), 2) AS avg_days_to_order
FROM 
    time_to_order_cte;

/*
Total sales by each product type
*/
SELECT 
    product_type,
    ROUND(SUM(price_usd), 2) AS total_sales
FROM 
    pulse-415501.pulsebuy.orders 
GROUP BY 
    product_type
ORDER BY 
    total_sales DESC;

/*
Average order value by each product type
*/
SELECT 
    product_type,
    ROUND(AVG(price_usd), 2) AS avg_order_value
FROM 
    pulse-415501.pulsebuy.orders 
GROUP BY 
    product_type
ORDER BY 
    avg_order_value DESC;

/*
Count of total customers for each account_creation_method 
*/
SELECT 
    account_creation_method,
    COUNT(DISTINCT customer_id) AS total_customers
FROM 
    pulse-415501.pulsebuy.customers
GROUP BY 
    account_creation_method
ORDER BY 
    total_customers DESC;

/*
Count of customers that made a purchase during 2022
*/
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM 
    pulse-415501.pulsebuy.orders
WHERE 
    EXTRACT(YEAR FROM purchase_date) = 2022;

/*
Count of customers that made a purchase during 2023
*/
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM 
    pulse-415501.pulsebuy.orders
WHERE 
    EXTRACT(YEAR FROM purchase_date) = 2023;

/*
Count of customers that made a purchase during 2024 
*/
SELECT 
    COUNT(DISTINCT customer_id) AS total_customers
FROM 
    pulse-415501.pulsebuy.orders
WHERE 
    EXTRACT(YEAR FROM purchase_date) = 2024;

/*
Count of products sold, filtered by product type
*/
SELECT 
    product_type,
    COUNT(id) AS products_sold
FROM 
    pulse-415501.pulsebuy.orders 
GROUP BY 
    product_type
ORDER BY 
    products_sold DESC;

/*
Sales performance by region, calculating total sales and order count
*/
SELECT 
    geo_lookup.region,
    COUNT(orders.id) AS total_orders,
    ROUND(SUM(orders.price_usd), 2) AS total_sales
FROM 
    pulse-415501.pulsebuy.orders AS orders
JOIN 
    pulse-415501.pulsebuy.customers AS customers 
ON 
    orders.customer_id = customers.id
JOIN 
    pulse-415501.pulsebuy.geo_lookup AS geo_lookup 
ON 
    customers.country_code = geo_lookup.country
GROUP BY 
    geo_lookup.region
ORDER BY 
    total_sales DESC;

/*
Count of total orders made in the first quarter of 2023
*/
SELECT 
    COUNT(id) AS total_orders
FROM 
    pulse-415501.pulsebuy.orders
WHERE 
    EXTRACT(YEAR FROM purchase_date) = 2023
    AND EXTRACT(QUARTER FROM purchase_date) = 1;
