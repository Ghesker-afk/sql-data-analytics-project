/* Change-Over-Time
	Description:

	Analyze how a measure evolves over the time.
	It is important in order to track the trends and
	identify seasonality in our data.
	[Aggregated Measure] By [Date Dimension]
*/

-- Analyze sales performance over time.
SELECT
	YEAR(order_date) AS order_year,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date) ASC;

-- Changes Over Years: A high-level overview insights
-- that helps with strategic decision-making.

SELECT
	MONTH(order_date) AS order_month,
	SUM(sales_amount) AS total_sales,
	COUNT(DISTINCT customer_key) AS total_customers,
	SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY MONTH(order_date)
ORDER BY MONTH(order_date) ASC;

-- Changes Over Months: Detailed insight to discover
-- the seasonality in our data.
