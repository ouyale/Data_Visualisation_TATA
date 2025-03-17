# 🛒 Retail Data Analysis and Visualisation: MySQL + Power BI  

## Project Overview  
This project is focused on **structuring, cleaning, and analyzing** an **online retail dataset** with over **540,000 transactions**. My goal is to **efficiently store and manage the data in MySQL**, clean and process it using Python, and finally **visualize insights in Power BI**.  

By the end of this project, I will be able to analyze:  
- ✅ **Customer purchasing behavior**  
- ✅ **Best-selling products**  
- ✅ **Order trends and seasonality**  
- ✅ **Revenue insights** (calculated in Power BI)  

---

## **📂 Repository Structure**  
This repository contains:  
📌 **SQL File (`TATA_script.sql`)** – Creates the database schema and tables in MySQL  
📌 **Jupyter Notebook (`Project_TATA_JupyterNB.ipynb`)** – Cleans the dataset and loads it into MySQL  
📌 **Dataset (`Online Retail.xlsx`)** – The raw retail data used for analysis  

---

## **⚙️ Step 1: Setting Up the Database in MySQL**  
Before loading any data, I **designed a relational database** with the following tables:  

- **Customers** → Stores unique customer IDs and their country  
- **Orders** → Stores order details (InvoiceNo, InvoiceDate, CustomerID)  
- **Products** → Stores product details (StockCode, Description, UnitPrice)  
- **OrderDetails** → Links Orders and Products (Quantity, UnitPrice)  

I manually created these tables in MySQL using the script in `TATA_script.sql`.  

---

## **🐍 Step 2: Connecting & Loading Data with Python**  
Instead of manually inserting **540,000+ rows**, I used **Python in Jupyter Notebooks** to:  
- ✅ **Connect to MySQL** using `mysql-connector-python`  
- ✅ **Pre-process the data** (handling missing values, duplicates, etc.)  
- ✅ **Batch-load the cleaned data** into MySQL  

The full **Jupyter Notebook (`Project_TATA_JupyterNB.ipynb`)** walks through the data-cleaning process and data insertion.

---

## **🔍 Step 3: Debugging & Fixing Common Issues**  
This part took the most time! I ran into:  
❌ **Foreign key errors** – Some `StockCode`s in `OrderDetails` didn’t exist in `Products`  
❌ **Duplicate records** – Needed to be removed before loading  
❌ **Lost connections** – MySQL kept dropping during large inserts  
❌ **Revenue column issues** – Initially planned to store `Revenue = Quantity * UnitPrice` in MySQL, but it caused persistent errors  

💡 **Solution?** I decided to **skip storing revenue in MySQL** and instead **calculate it dynamically in Power BI**, where I have more flexibility.  

---

## **📊 Step 4: Moving to Power BI**  
Now that the data is fully structured in MySQL, the next steps are:  
- ✅ **Building interactive dashboards**  
- ✅ **Exploring customer trends & revenue insights**  
- ✅ **Creating KPIs for business decision-making**  

---

## **📥 How to Replicate This Project**  
### **1️⃣ Set Up MySQL Database**  
1. Install MySQL and create a new database:  
   ```sql
   CREATE DATABASE RetailDB;
   ```
2. Run the SQL script (`TATA_script.sql`) to create tables.
3. Load Data Using Jupyter Notebook
   Open (`Retail_Data_Loading.ipynb`) in Jupyter Notebook
   Update the MySQL connection credentials in the script
   Run the notebook to clean and insert the data
 3. Move to Power BI for Visualization
    Connect Power BI to MySQL
    Import the cleaned tables
    Create calculated columns and interactive visuals
