# 📊 US Superstore Sales & Profit Advanced Analysis

An end-to-end data analysis project exploring the US Superstore dataset using **SQL Server 2022** for data transformation and business queries, combined with an interactive, dark-themed **Excel Dashboard** for executive decision-making.

---

## 🛠️ Project Architecture & Workflow
1. **Extract & Clean (SQL Server):** 
   - Loaded raw dataset into SQL Server.
   - Handled null values and performed data-type conversions (`ALTER TABLE`) to ensure data integrity[cite: 13].
2. **Business Analysis (SQL Queries):** 
   - Created complex aggregations, KPIs, and regional profit evaluations.
   - Segmented customers into VIP vs. Regular using `CASE` statements[cite: 10].
3. **Interactive Visualization (Excel Dashboard):** 
   - Built dynamic Pivot Tables and Pivot Charts.
   - Designed a modern, executive **Dark Theme UI** with interactive Slicers (Segment, Category, Region, and Years).

---

## 📈 Dashboard Preview
Here is a sneak peek of the final interactive dark-themed dashboard:

![Superstore Dashboard](Superstore_dashboard
)
---

## 📂 Repository Structure
- `01_rowdata_Extract.sql`: Scripts for database creation, data cleaning, and type casting[cite: 13].
- `02_data_Load.sql`: Advanced SQL queries for KPIs, category performance, and customer segmentation[cite: 10].
- `Superstore_Dashboard.xlsx`: The final multi-tab Excel workbook containing cleaned data, pivot tables, and the interactive dashboard.

---
