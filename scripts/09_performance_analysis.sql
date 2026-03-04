/*
	Performance Analysis: It is the process of comparing the current value
	with a target value, to compare the performance of a specific category. 
	It helps measure the success and compare the performances.
	
	Formula: Current [Measure] - Target [Measure]
*/

-- Analyze the yearly performance of products by comparing each product's
-- sales to both its average sales performance and the previous year's sales.

WITH yearly_product_sales AS (
	SELECT
		YEAR(fs.order_date) AS order_year,
		p.product_name,
		SUM(fs.sales_amount) AS current_sales
	FROM gold.fact_sales fs
	LEFT JOIN gold.dim_products p
	ON fs.product_key = p.product_key
	WHERE fs.order_date IS NOT NULL
	GROUP BY 
	YEAR(fs.order_date),
	p.product_name
)
SELECT 
	order_year,
	product_name,
	current_sales,
	AVG(current_sales) OVER (PARTITION BY product_name) avg_sales,
	current_sales - AVG(current_sales) OVER (PARTITION BY product_name) AS diff_avg,
	CASE WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Average'
		 WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Average'
		 ELSE 'Average'
	END AS avg_change,
	LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year ASC) previous_year_sales,
	current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year ASC) AS diff_py,
	CASE WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year ASC) > 0 THEN 'Increase'
		 WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year ASC) < 0 THEN 'Decrease'
		 ELSE 'No Change'
	END AS py_change
FROM yearly_product_sales
ORDER BY product_name, order_year
