--------------------------------------------------------------------------------
## SQL Data Analytics Project 📊

## 📋 Overview

This repository contains the **Advanced Analytics Layer** of a modern data warehousing solution. While the foundational data engineering is handled in my other personal project, **sql-data-warehouse-project**, this one focuses on extracting high-level business intelligence from the consolidated data.
The project transforms raw, multi-source transactional data into strategic insights using T-SQL, focusing on sales performance, customer demographics, and product trends.

---

## 🏗️ The Data Ecosystem
The analytics are built upon a structured environment that integrates data from two primary sources:
- **ERP (Enterprise Resource Planning)**: Sales and operational data.
- **CRM (Customer Relationship Management)**: Detailed customer profiles and interaction history.

Before analysis, the data undergoes a rigorous **Data Quality** process to cleanse and resolve inconsistencies, ensuring that every insight is based on a single, reliable "source of truth".

---

## 🎯 Objective
This project aims to help us on how to understand and cover insights about the datasets. We will divide the columns in Measures and Dimensions. If the values are numeric and makes sense to aggregate, then we are talking about Measures; otherwise, if isn't numeric nor makes sense to aggregate, then it is a Dimension.

- **Part-to-Whole Analysis**: Analyze how an individual part is performing compared to the overall, allowing to understand which category has the greatest
impact on the business.
- **Ranking Analysis**: Order the values of Dimensions based on Measures in order to identify the top performers and as well, the bottom performers.
- **Magnitude Analysis**: Compare the measures values across different categories and dimensions in order to help us understand the importance of different categories.

---

### Objective
Develop SQL-based analytics to deliver detailed insights into:
- **Customer Behavior**
- **Product Performance**
- **Sales Trends**
- **Country Performance**

**And So On**

---

## 🛠️ Technologies & Skills
- **Languag**e: SQL, T-SQL (Transact-SQL)
- **Database Engine**: Microsoft SQL Server
- **Data Modeling**: Fact & Dimension Tables (Star Schema)
- **Tooling**: SQL Server Management Studio (SSMS)

---

## 📂 Project Structure
├── scripts/             # T-SQL analytical scripts [6]
│   ├── 01_part_to_whole.sql
│   └── product_performance.sql
├── LICENSE              # MIT License information [7]
└── README.md            # Project documentation

---

## 🚀 How to Use

To get started, you need to have Microsoft SQL Server installed. Then, you must clone the Data Warehouse that I 
have built as another Personal Project in this link [here](https://github.com/Ghesker-afk/sql-data-warehouse-project.git).

Read the documents of the project. Then, clone the scripts of the project.

```bash
git clone https://github.com/Ghesker-afk/sql-data-analytics.git
```

- Open your Microsoft SQL Server**
- Navigate to the scripts directory
- Execute the T-SQl files in your SQL Server environment to generate the analytical reports.

---

## License

This project is licensed under MIT License. You are free to use, modify, and share this project with proper attribution.
