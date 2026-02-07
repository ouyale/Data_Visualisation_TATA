# Retail Data Pipeline & Visualization 🛒 &nbsp; [![View Code](https://img.shields.io/badge/Jupyter-View_Notebook-orange?logo=jupyter)](Project_TATA_JupyterNB.ipynb)

![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?logo=mysql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-Dashboard-F2C811?logo=powerbi&logoColor=black)
![Pandas](https://img.shields.io/badge/Pandas-2.x-150458?logo=pandas&logoColor=white)
![Status](https://img.shields.io/badge/Status-Complete-success)

> **End-to-end data pipeline: cleaning 540,000+ retail transactions with Python, storing in a relational MySQL database, and visualizing business insights in Power BI.**

<br>

<p align="center">
  <img src="https://img.shields.io/badge/📦_Transactions-540K+-green?style=for-the-badge" alt="Transactions"/>
  &nbsp;&nbsp;
  <img src="https://img.shields.io/badge/👥_Customers-4,373-blue?style=for-the-badge" alt="Customers"/>
  &nbsp;&nbsp;
  <img src="https://img.shields.io/badge/🛍️_Products-3,958-orange?style=for-the-badge" alt="Products"/>
  &nbsp;&nbsp;
  <img src="https://img.shields.io/badge/📊_Orders-25,900-purple?style=for-the-badge" alt="Orders"/>
</p>

<br>

## Table of Contents

- [Problem Statement](#problem-statement)
- [Dataset](#dataset)
- [Architecture](#architecture)
- [Methodology](#methodology)
- [Key Metrics](#key-metrics)
- [Technologies Used](#technologies-used)
- [How to Replicate](#how-to-replicate)
- [Author](#author)

<br>

## Problem Statement

How do you transform a messy Excel file with 540,000+ retail transactions into a clean, queryable database powering business intelligence dashboards? This project builds a **complete ETL pipeline** — from raw data cleaning in Python, through relational database design in MySQL, to interactive dashboards in Power BI — enabling analysis of customer purchasing behavior, product performance, seasonality trends, and revenue insights.

<br>

## Dataset

| Property | Detail |
|----------|--------|
| **Source** | `Online Retail.xlsx` (23.7 MB) |
| **Raw Size** | 540,000+ rows, 8 columns |
| **Time Period** | Starting December 2010 |
| **Columns** | InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country |

<br>

## Architecture

```
Online Retail.xlsx  →  Python (Pandas)  →  MySQL  →  Power BI
     Raw Data           Cleaning           Storage     Visualization
                     • Deduplication       4 tables    • Revenue KPIs
                     • Missing values      • Customers • Seasonality
                     • Validation          • Products  • Top products
                                           • Orders    • Customer trends
                                           • OrderDetails
```

### Database Schema
| Table | Records | Description |
|-------|---------|-------------|
| **Customers** | 4,373 | Unique customers with country |
| **Products** | 3,958 | Products with descriptions & prices |
| **Orders** | 25,900 | Order headers with dates |
| **OrderDetails** | 531,091 | Line items linking orders to products |

<br>

## Methodology

### 1. Database Design (MySQL)
- Designed a **normalized relational schema** with 4 tables
- Foreign key relationships: `Customers → Orders → OrderDetails ← Products`
- Created via `TATA_script.sql`

### 2. Data Cleaning (Python + Pandas)
- Removed products with missing/invalid descriptions
- Filtered out zero-priced products
- **Deduplicated** — removed 516,009 duplicate order detail rows
- Resolved 132 missing StockCodes with placeholder products
- Removed 134 invalid OrderDetails with non-existent foreign keys

```python
# Batch load cleaned data into MySQL
import mysql.connector

conn = mysql.connector.connect(host='localhost', database='RetailDB', ...)
cursor = conn.cursor()

cursor.executemany(
    "INSERT IGNORE INTO OrderDetails (InvoiceNo, StockCode, Quantity, UnitPrice) "
    "VALUES (%s, %s, %s, %s)", batch_data
)
```

### 3. Debugging & Problem Solving
- **Foreign key errors** — StockCodes in OrderDetails not existing in Products
- **Duplicate records** — needed removal before batch loading
- **Lost connections** — MySQL dropping during large inserts
- **Revenue calculation** — moved from MySQL to Power BI for flexibility

### 4. Visualization (Power BI)
- Connected Power BI directly to MySQL database
- Revenue calculated dynamically as `Quantity × UnitPrice`
- Interactive dashboards for customer behavior, product analysis, and trends

<br>

## Key Metrics

| Metric | Value |
|--------|-------|
| **Raw Transactions** | 540,000+ |
| **Unique Customers** | 4,373 |
| **Unique Products** | 3,958 |
| **Unique Orders** | 25,900 |
| **Order Details** | 531,091 |
| **Duplicates Removed** | 516,009 |

<br>

## Technologies Used

| Tool | Purpose |
|------|---------|
| Python 3.x | Data cleaning & ETL scripting |
| Pandas | Data manipulation & transformation |
| MySQL 8.0 | Relational database storage |
| mysql-connector-python | Python-MySQL connectivity |
| openpyxl | Excel file reading |
| Power BI | Business intelligence dashboards |
| Jupyter Notebook | Interactive development |

<br>

## How to Replicate

```bash
# Clone the repository
git clone https://github.com/ouyale/Data_Visualisation_TATA.git
cd Data_Visualisation_TATA

# 1. Set up MySQL database
mysql -u root -p < TATA_script.sql

# 2. Install Python dependencies
pip install pandas mysql-connector-python openpyxl jupyter

# 3. Run the data cleaning & loading notebook
jupyter notebook Project_TATA_JupyterNB.ipynb

# 4. Connect Power BI to MySQL and build dashboards
```

<br>

## Author

**Barbara Obayi** — Machine Learning Engineer

[![GitHub](https://img.shields.io/badge/GitHub-ouyale-181717?logo=github)](https://github.com/ouyale)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Barbara_Obayi-0A66C2?logo=linkedin)](https://www.linkedin.com/in/barbara-weroba-obayi31/)
[![Portfolio](https://img.shields.io/badge/Portfolio-ouyale.github.io-4fc3f7)](https://ouyale.github.io)

---
