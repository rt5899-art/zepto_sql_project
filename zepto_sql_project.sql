DROP TABLE IF EXISTS Zepto;

CREATE TABLE zepto(
sKu_id SERIAL PRIMARY KEY,
category VARCHAR(120),
Name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discount_percent NUMERIC(5,2),
available_quantity INTEGER,
discount_selling_price NUMERIC(8,2),
wt_in_grm INTEGER,
outof_stock BOOLEAN,
quantity INTEGER
);

-- data exploration
-- count of rows
SELECT COUNT(*) FROM zepto;

--sample data
SELECT * FROM zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR category IS NULL
OR mrp IS NULL
OR discount_percent IS NULL
OR available_quantity IS NULL
OR discount_selling_price IS NULL
OR wt_in_grm IS NULL
OR outof_stock IS NULL
OR quantity IS NULL;

-- diff product categories
SELECT DISTINCT category FROM zepto
ORDER BY category;

--products in stock v/s out of stock
SELECT outof_stock, COUNT(sku_id)
FROM zepto
GROUP BY outof_stock;

-- product name present multiple times
SELECT name , COUNT(sku_id) AS "Number of SKU" FROM zepto
GROUP BY name
HAVING COUNT(sku_id) >1
ORDER BY COUNT(sku_id) DESC;

-- data cleaning
-- product name where price is zero
SELECT * FROM zepto
WHERE mrp = 0 OR discount_selling_price =0;

-- delete row as it is impossible to have prod with mrp=0
DELETE FROM zepto
WHERE mrp = 0 OR discount_selling_price =0;

-- cnvert paise to rupees
UPDATE zepto 
SET mrp = mrp/100.0,
discount_selling_price =discount_selling_price/100.0;

SELECT mrp, discount_selling_price FROM zepto;

--Q1 find top 10 best value prod based onn the discount percentage
SELECT DISTINCT name, discount_percent FROM zepto
ORDER BY discount_percent  DESC
LIMIT 10;

-- 50% discount . customers can bargain and buinesses are heavily promoting these product

--Q2. what are the products with high MRP but out of stock
SELECT DISTINCT name,  mrp FROM zepto
WHERE outof_stock = true AND mrp >300
ORDER BY mrp DESC;

-- Q3. calculate estimated revenue for each category
SELECT category, SUM(discount_selling_price * available_quantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;

-- Q4. Find all the prod where MRP is greater than Rs 500 and discount <10%
SELECT DISTINCT name, mrp, discount_percent
FROM zepto
WHERE mrp >500 AND discount_percent< 10
ORDER BY mrp DESC;
-- NOT A PREMUM PROD, prod are popular enough to be sold without any discount

-- Q5. Identify the top 5 categories offering the highest avg discount %
SELECT category, ROUND(AVG(discount_percent),2) AS discount_offer
FROM zepto
GROUP BY category
ORDER BY discount_offer DESC
LIMIT 5;

--Q6 Find the price per gram for products above 100gm and sort by best value
SELECT DISTINCT name, wt_in_grm, discount_selling_price, ROUND((discount_selling_price/wt_in_grm),2) AS price_per_grm
FROM zepto
WHERE wt_in_grm >= 100
ORDER BY price_per_grm;

-- Q7. Group the product into categories as low medium , bulk based on their weight in grams.
SELECT DISTINCT name, wt_in_grm,
CASE WHEN wt_in_grm < 1000 THEN 'Low'
 	 WHEN wt_in_grm <5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
	 FROM zepto;
-- helpful for packaging, delivery planning and also bulk order strategy

--Q8. What is the total inventory weight per category
SELECT category, SUM(wt_in_grm * available_quantity) AS total_weight
FROM zepto
GROUP BY category
ORDER BY total_weight;
-- helpful for category planning and identify bulky product category