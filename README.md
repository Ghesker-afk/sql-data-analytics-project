--------------------------------------------------------------------------------
SQL Data Analytics Project
📌 Project Overview
This repository contains a suite of advanced SQL analytical queries designed to extract actionable business insights from a modern Data Warehouse. The project focuses on transforming raw data into strategic information, focusing on Sales Performance, Customer Behavior, and Product Trends.
The analytics layer is built on top of the sql-data-warehouse-project, which integrates data from ERP and CRM systems into a unified SQL Server environment.
🎯 Business Objectives
The primary goal is to empower stakeholders with data-driven insights through:
Sales Intelligence: Identifying top-performing regions and revenue drivers.
Customer Insights: Analyzing purchasing patterns and demographics to improve engagement.
Product Performance: Evaluating which products yield the highest margins and volume.
🏗️ Data Architecture
The project utilizes a structured Data Warehouse following industry best practices:
Source Systems: Integration of ERP and CRM data.
Environment: SQL Server (T-SQL).
Data Modeling: Queries are optimized to run against a consolidated analytical model, ensuring data quality and consistency.
📊 Sample Analytics: Top Countries by Sales
One of the core analyses included in this repository is the evaluation of geographic performance. This allows the business to identify high-value markets and optimize resource allocation.
Key Question: Which countries are driving the highest sales volume?
/*
Analysis: Top Countries by Sales
Description: Identifies the top 5 countries based on total sales amount.
*/

SELECT TOP 5
    cust.country,
    SUM(sales.sales_amount) AS total_sales,
    COUNT(sales.order_number) AS total_orders
FROM gold.fact_sales sales
JOIN gold.dim_customers cust ON sales.customer_key = cust.customer_key
GROUP BY cust.country
ORDER BY total_sales DESC;
🛠️ Technologies Used
Language: T-SQL (Transact-SQL)
Database: Microsoft SQL Server
Version Control: Git & GitHub
📂 Project Structure
/scripts: Contains the SQL analytical queries organized by business domain (Sales, Customers, Products).
/docs: Supplementary documentation regarding the data model and business logic.
👤 Author
Giovanni Emiliato (Ghesker-afk)
GitHub Profile
📄 License
This project is licensed under the MIT License.

--------------------------------------------------------------------------------
