# End-to-End E-Commerce Supply Chain & Customer Retention Analytics
**Tech Stack:** Databricks (Unity Catalog & Delta Lake) • Databricks SQL • Power BI • DAX • Star Schema Modeling

## Project Overview
This repository documents a **10-Day End-to-End Analytics Engineering & BI Sprint** analyzing **100,000+ real e-commerce orders** across 9 relational tables (Olist Brazilian E-Commerce dataset). 

Rather than building isolated queries on flat files, this project implements a production-style **Medallion Architecture (Bronze → Silver → Gold)** inside Databricks and connects the curated Gold Star Schema directly to Power BI to answer three core business questions:
1. **Revenue & Growth Drivers:** Which product categories and payment installment behaviors drive sustainable Gross Merchandise Value (GMV)?
2. **Logistics & SLA Bottlenecks:** Where are delivery delays and high freight-to-price ratios eroding margins across regions?
3. **Customer Retention & Sentiment:** How severely do late deliveries impact 1-to-5-star review scores and repeat purchase behavior?

---

## Architecture Flow
`Raw CSVs (9 Relational Tables)` ➔ `Databricks Bronze (Raw Delta Ingestion)` ➔ `Databricks Silver (SQL Cleaning & Deduplication)` ➔ `Gold Star Schema (Fact & Dimension Tables)` ➔ `Power BI Executive Dashboard`

---

## Repository Structure
```text
├── 01_diagrams/          # Architecture & Star Schema ERD visuals (.png & .excalidraw)
├── 02_bronze_sql/        # Unity Catalog setup & raw CSV-to-Delta ingestion scripts
├── 03_silver_sql/        # Data profiling, timestamp standardization, deduplication & reconciliation
├── 04_gold_sql/          # Star Schema DDL (fact_sales, dim_customers, dim_products, dim_sellers, dim_date)
├── 05_analytics_sql/     # MoM growth, Pareto 80/20, RFM segmentation & SLA impact queries
└── 06_powerbi/           # DAX measures documentation & final dashboard screenshots
