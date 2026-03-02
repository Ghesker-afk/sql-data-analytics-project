-- Explore all countries our customers come from
SELECT DISTINCT country FROM gold.dim_customers;

-- Explore all products inside our business
SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
ORDER BY 1, 2, 3;

-- Explore the product lines of our business
SELECT DISTINCT product_line FROM gold.dim_products;
