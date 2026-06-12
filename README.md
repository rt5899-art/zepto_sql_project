# Zepto Data Analysis Project

### Project Overview

This project provides a comprehensive end-to-end data analysis of Zepto's product inventory, pricing strategy, and stock availability. By leveraging SQL for data cleaning and exploration. This analysis uncovers critical patterns in revenue generation, discount distribution, and logistics planning to optimize e-commerce operations.

### Tools & Technologies
SQL (PostgreSQL): Data structuring, ingestion, and advanced querying.

Excel: Initial data triage and format validation.

### Technical Pipeline & Implementation

The goal is to simulate how actual data analysts in the e-commerce or retail industries work behind the scenes to use SQL to:

*  Set up a messy, real-world e-commerce inventory **database**

* Perform **Exploratory Data Analysis (EDA)** to explore product categories, availability, and pricing inconsistencies

*  Implement **Data Cleaning** to handle null values, remove invalid entries, and convert pricing from paise to rupees

* Write **business-driven SQL queries** to derive insights around **pricing, inventory, stock availability, revenue** and more

### Key Business Insights

* High-Value Promotions: Identified the top 10 best-value products featuring maximum discounts exceeding 50%, pinpointing items heavily utilized for customer acquisition and aggressive marketing.

* Revenue Leakage: Uncovered premium, high-MRP products (priced above Rs. 300) that are currently completely out of stock, resulting in immediate missed revenue opportunities.

* Inelastic Demand Items: Isolated high-demand items priced above Rs. 500 that maintain strong sales momentum despite pulling in less than 10% discount, proving their status as core staple products that do not require profit-margin sacrifices.

* Logistical Footprint: Classified the entire inventory into Low, Medium, and Bulk weight tiers based on item mass, providing visibility into physical storage constraints and delivery fleet requirements
  
### Recommendations

* Insight: 15% of high-demand SKUs frequently run out of stock.

  ➔ Action: Implement an automated reorder trigger in the inventory pipeline when stock falls below a 2-day average velocity threshold.

* Insight: High discounts compress margins despite driving high sales volume.

  ➔ Action: Shift from flat discounts to dynamic, bundle-based pricing architectures to increase Average Order Value (AOV).

* Insight: Slow-moving stock occupies 50% of current warehouse capacity.

  ➔ Action: Initiate targeted promotional liquidation campaigns or flash sales for stagnant inventory to free up capital and space.
