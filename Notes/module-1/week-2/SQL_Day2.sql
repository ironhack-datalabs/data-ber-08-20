USE olist;
/*
--------
-- Joins
-- Subqueries 
-- Temp tables
-- CTE (common table expressions)
-- Analytical Query Example
-------
*/ 

-- looking at the order of clauses
SELECT 
	SUM(customer_zip_code_prefix)		AS tst_sum
FROM olist.customers
GROUP BY customer_city
HAVING tst_sum > 10
ORDER BY tst_sum 
LIMIT 10;

-- Manually: get the english product_catagory name of the most expensive item sold

-- 1. get the product_id for the most expensive item sold
SELECT 
	product_id, 
	price
FROM order_items
ORDER BY price DESC
LIMIT 1;
-- product id: 489ae2aa008f021502940f251d4cce7f


-- 2. get the portugeuese product_catagory of that product_id
SELECT 
	product_id, 
	product_category_name 		AS portugeuese_product_cat_name
FROM products 
WHERE product_id = '489ae2aa008f021502940f251d4cce7f';
-- product catagory name in portugeuese: utilidades_domesticas

-- 3. get the english translation 
SELECT *
FROM product_category_name_translation
WHERE product_category_name = 'utilidades_domesticas';

-- 
-- Doing it all using inner joins
--

SELECT 
	oi.product_id,
	oi.price, 
	p.product_category_name 		AS portugeuese_product_cat_name,
	pcnt.product_category_name_english 
FROM order_items oi 
	INNER JOIN products p
	ON oi.product_id = p.product_id
	INNER JOIN product_category_name_translation pcnt
	ON p.product_category_name = pcnt.product_category_name 
ORDER BY oi.price DESC
LIMIT 1;
	
-- remove some columns
SELECT 
	oi.price, 
	pcnt.product_category_name_english 
FROM order_items oi 
	INNER JOIN products p
	ON oi.product_id = p.product_id
	INNER JOIN product_category_name_translation pcnt
	ON p.product_category_name = pcnt.product_category_name 
ORDER BY oi.price DESC
LIMIT 1; 

-- For each product catagory in english, get the number of items sold, total revenue (sum of price), and the revenue per item
-- sold (revenue/numer of items sold)
/*
 | product_catagory | num_items_sold | total_revenue | revenue_per_item_sold |
 |------------------|----------------|---------------|-----------------------|
 | toiletries       | 10284739       | 1286485657.09 | 1286485657.09/10284739|
 
 */

-- 1. get items_sold and total_reveune for each unique product_id
SELECT 
	oi.product_id, 
	COUNT(*) 		AS items_sold,
	SUM(oi.price)	AS total_revenue
FROM order_items oi
GROUP BY oi.product_id;

-- 2. for each unique product_id, get the product catagory in port

SELECT 
	p.product_category_name, 
	COUNT(*) 		AS items_sold,
	SUM(oi.price)	AS total_revenue
FROM order_items oi
	INNER JOIN products p
	ON oi.product_id = p.product_id
GROUP BY p.product_category_name;

-- 3. translate product_catagory_name_portugeuese to english

SELECT 
	COALESCE(pcnt.product_category_name_english, 'uncatagorized')		AS product_name_english, 
	COUNT(*) 															AS items_sold,
	SUM(oi.price)														AS total_revenue,
	SUM(oi.price)/COUNT(*)												AS revenue_per_item_sold
FROM order_items oi
	INNER JOIN products p
	ON oi.product_id = p.product_id
	LEFT JOIN product_category_name_translation pcnt 
	ON p.product_category_name  = pcnt.product_category_name 
GROUP BY 1
ORDER BY 4;

-- PART 2

-- 
-- Subqueries 
-- Temp tables
-- CTE (common table expressions)
-- 

-- Average review rating, grouped by seller state

/*
| seller_state | avg_review | no_of_reviews|
|--------------|------------|--------------|
|SP            | 3.9        | 192837       |
|BA            | 3.3        | 809          |

*/ 
 
SELECT *
FROM sellers 
LIMIT 1000;

-- are seller_ids unique in the sellers table?
SELECT
	COUNT(*), 
	COUNT(DISTINCT seller_id)
FROM sellers;

SELECT *
FROM order_items
ORDER BY order_id 
LIMIT 1000;

-- get a unique list of seller_id <-> order_id relations
SELECT DISTINCT 
	seller_id, 
	order_id
FROM order_items;

-- Combine both data sets
-- Approach 1: nest subquery

SELECT 
	s.seller_state, 
	s.seller_id, 
	so.order_id
FROM sellers s
	INNER JOIN (SELECT DISTINCT 
					seller_id, 
					order_id
				FROM order_items) so
	ON s.seller_id = so.seller_id
LIMIT 1000;

-- Approach 2: create a temporary table

CREATE TABLE temp_seller_order_links AS
	SELECT DISTINCT 
		seller_id, 
		order_id
	FROM order_items;


SELECT 
	s.seller_state,
	s.seller_id,
	sol.order_id
FROM sellers s
	INNER JOIN seller_order_links sol
	ON s.seller_id = sol.seller_id
LIMIT 1000;

-- Approach 3: Common Table Expression (CTE) aka WITH table
WITH seller_order_links2 AS (
	SELECT DISTINCT 
			seller_id, 
			order_id
		FROM order_items) 
		
-- an_addition_table AS (
-- 	SELECT 1)

SELECT 
	s.seller_state, 
	s.seller_id, 
	sol.order_id
FROM sellers s
	INNER JOIN seller_order_links2 sol
	ON s.seller_id = sol.seller_id
LIMIT 1000; 

