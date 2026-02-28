/*
Ranking Analysis: We will go and order the value of our
Dimension based on a Measure in order to identify the top
performers, and as well the bottom performers.

Formula: Rank [Dimension] By [Aggregated Measure]
Rank Countries By Total Sales
Top 5 Products By Quantity
Bottom 3 Customers By Total Orders
*/

-- Which 5 products generate the highest revenue?
SELECT TOP 5
	p.product_key,
	p.product_name,
	p.category,
	fs.sales_amount
FROM gold.fact_sales fs
LEFT JOIN gold.dim_products p
ON fs.product_key = p.product_key
ORDER BY sales_amount DESC;

SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- What are the 5 worst-performing products in terms of sales?
SELECT TOP 5
	p.product_name,
	SUM(f.sales_amount) total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;


-- If we are generating reports for things that are more complex,
-- we should use the Window Functios instead of GROUP BY + TOP.
SELECT *
FROM (
	SELECT 
		p.product_name,
		SUM(f.sales_amount) total_revenue,
		ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS rank_products
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON p.product_key = f.product_key
	GROUP BY p.product_name
)t WHERE rank_products <= 5;


-- Find the Top-10 Customers who have generated the highest revenue
-- and 3 customers with the fewest orders placed.
SELECT 
	*
FROM (
	SELECT 
		c.customer_key,
		c.first_name,
		c.last_name,
		SUM(sales_amount) AS total_sales_by_customer,
		ROW_NUMBER() OVER (ORDER BY SUM(sales_amount) DESC) AS rank_customers
	FROM gold.fact_sales fs
	LEFT JOIN gold.dim_customers c
	ON fs.customer_key = c.customer_key
	GROUP BY c.customer_key, c.first_name, c.last_name
)t WHERE t.rank_customers <= 10;

-- What are the 5 best-performing countries in terms of sales?
SELECT *
FROM (
	SELECT 
		c.country,
		SUM(fs.sales_amount) AS total_sales_by_country,
		ROW_NUMBER() OVER (ORDER BY SUM(fs.sales_amount) DESC) AS rank_country
	FROM gold.fact_sales fs
	LEFT JOIN gold.dim_customers c
	ON c.customer_key = fs.customer_key
	GROUP BY c.country
)t WHERE rank_country <= 5;
