# Database Capstone Project: Little Lemon Restaurant

## Project Overview
This repository contains the end-to-end database design, query optimization, analytics pipeline, and visualization dashboards for the **Little Lemon Restaurant** database capstone project. The objective of this project is to model relational database architecture, optimize query execution, implement data management logic, and build visual sales analytics for operational decision-making.

---

# Repository Structure

```text
├── dashboard/
│   └── sales_customer.twb     # Tableau workbook with customer & sales analytics
├── data/                      # Dataset files and supporting documentation
├── LittleLemon2DB.png         # Database Entity-Relationship Diagram (v2)
├── LittleLemon2DB.sql         # SQL schema script (v2)
├── LittleLemon3DB.png         # Database Entity-Relationship Diagram (v3)
├── LittleLemon3DB.sql         # Complete SQL schema and data creation script (v3)
├── LittleLemonDB.png          # Initial Entity-Relationship Diagram
├── LittleLemonDM.sql          # SQL Data Manipulation & Model scripts
├── ViewTableSummary.sql       # Virtual tables and SQL views for sales reporting
├── optimized.sql              # Stored procedures, prepared statements & query optimization
├── project.ipynb              # Jupyter Notebook for data pipeline & database interaction
└── README.md                  # Project documentation
```


# Key Features & Deliverables
## 1. Data Modeling & Relational Schema
Designed and normalized relational database schemas to model bookings, orders, delivery statuses, menu items, customer details, and staff roles.

Generated Entity-Relationship Diagrams (ERDs) stored in LittleLemon3DB.png to document table relationships and key constraints.

## 2. SQL Views & Analytical Reports
Developed SQL views in ViewTableSummary.sql to simplify reporting on high-value orders, sales summary matrices, and customer purchasing history.

## 3. Query Optimization & Stored Procedures
Implemented optimized SQL queries, prepared statements, and stored procedures in optimized.sql to perform parameterized data retrieval, order cancellation, and transaction handling efficiently.

## 4. Interactive Dashboards & Data Pipelines
Built interactive Tableau visual analytics in dashboard/sales_customer.twb to analyze customer purchasing behavior, top-selling menu items, and revenue trends over time.

Authored a Python pipeline in project.ipynb to handle database connections, data transformations, and custom query executions.

## Getting Started
Prerequisites
Database: MySQL Server 8.0+ / MySQL Workbench (or PostgreSQL)

Analytics: Tableau Desktop / Tableau Public

Python Environment: Python 3.8+ with Jupyter Notebook and standard SQL database connectors (mysql-connector-python or SQLAlchemy)

# Installation & Setup
## 1 Clone the repository:

git clone https://github.com/emonte9/db-capstone-project.git

## 2 Set up the Database:
Set up the Database:
Import LittleLemon3DB.sql into your database management system to instantiate the schema and populate initial records:

mysql -u <username> -p < LittleLemon3DB.sql

## 3 Run Query Optimizations & Views:
Execute ViewTableSummary.sql and optimized.sql in your database client to create the necessary virtual views, functions, and stored procedures.

## 4 Explore Visualizations & Notebook:

# Open dashboard/sales_customer.twb in Tableau to explore interactive sales dashboards.

# Launch project.ipynb in Jupyter Notebook to test database interactions via Python.



