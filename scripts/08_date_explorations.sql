-- Find the date of the first and last order
SELECT 
	MIN(order_date) first_order_date,
	MAX(order_date) last_order_date
FROM gold.fact_sales;

-- How many years of sales are avaliable
SELECT 
	DATEDIFF(month, MIN(order_date), MAX(order_date)) AS order_range_months,
	DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales;

-- Find the youngest and the oldest customer
SELECT
	MIN(birthdate) AS oldest_birthdate,
	DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age, 
	MAX(birthdate) AS youngest_birthdate,
	DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;
