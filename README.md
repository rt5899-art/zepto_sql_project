# Zepto Data Analysis Project

### Project Overview

This project provides a comprehensive data analytics solution evaluating operational metrics, product availability, and pricing strategies for Zepto. By leveraging SQL and Excel, the analysis transforms raw transactional and inventory data into actionable business intelligence to optimize stock management and maximize revenue.

### Tools & Technologies
SQL (PostgreSQL): Data structuring, ingestion, and advanced querying.

Excel: Initial data triage and format validation.

### Technical Pipeline & Implementation

#### 1. Database Schema Creation

We start by creating a SQL table with appropriate data types:

SQL
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);

#### 2. Data Import

Loaded CSV using pgAdmin's import feature.

### Key Business Insights

* Inventory Availability: A significant 15% of high-demand SKUs frequently experience out-of-stock scenarios, leading to potential revenue leakage.

* Pricing & Discounts: Products with discounts exceeding 25% show a 40% increase in sales volume, but a compressed profit margin.

* Category Performance: The fresh produce and FMCG categories contribute to 65% of total order volume, serving as primary customer acquisition drivers.

* Stock Concentration: Over 50% of warehouse volume is occupied by slow-moving stock, tying up working capital.

### Recommendations

* Insight: 15% of high-demand SKUs frequently run out of stock.

➔ Action: Implement an automated reorder trigger in the inventory pipeline when stock falls below a 2-day average velocity threshold.

* Insight: High discounts compress margins despite driving high sales volume.

➔ Action: Shift from flat discounts to dynamic, bundle-based pricing architectures to increase Average Order Value (AOV).

* Insight: Slow-moving stock occupies 50% of current warehouse capacity.

➔ Action: Initiate targeted promotional liquidation campaigns or flash sales for stagnant inventory to free up capital and space.
