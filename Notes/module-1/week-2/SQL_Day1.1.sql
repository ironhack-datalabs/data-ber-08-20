/* 
----------
-- Aggregate functions
--
-- Clauses:
-- COUNT()
-- SUM()
-- AVG()
------------
*/ 
SELECT *
FROM olist.order_items
LIMIT 1000; 

SELECT 
	seller_id
FROM olist.order_items
WHERE DATE(shipping_limit_date) = DATE('2018-08-05');

SELECT DISTINCT
	seller_id
FROM olist.order_items
WHERE DATE(shipping_limit_date) = DATE('2018-08-05');

SELECT 
	COUNT(*)					AS no_of_rows, 
	COUNT(DISTINCT seller_id)	AS unique_sellers, 
	COUNT(DISTINCT product_id)  AS unique_products, 
	COUNT(product_id)			AS proudcts,
	COUNT(seller_id)			AS sellers, 
	COUNT(1)					AS ones,
	COUNT(0)					AS zeroes, 
	SUM(1)						AS row_count, 
	AVG(price)					AS mean_price,
	MAX(price)					AS max_price, 
	MIN(price)					AS min_price
FROM olist.order_items
WHERE DATE(shipping_limit_date) = DATE('2018-08-05');

-- number of order_iems for each unique shipping_limit_date as a DATE()
SELECT 
	DATE(shipping_limit_date)	AS date_id,
	COUNT(*)					AS order_items
FROM olist.order_items
GROUP BY DATE(shipping_limit_date)
ORDER BY DATE(shipping_limit_date)
LIMIT 1000;

SELECT 
	DATE(shipping_limit_date)	AS date_id,
	COUNT(*)					AS order_items
FROM olist.order_items
GROUP BY date_id -- you can refer to the aliases specified in the SELECT clause for GROUP BY or ORDER BY
ORDER BY date_id
LIMIT 1000;

/*
 ------ putting it all together
 */

-- top 10 sellers by revenue

/*
 | seller_id | no_of_items | total_revenue|
 |-----------|-------------|--------------|
 | xyz       | 2000        | 129384737    |
 | xky	     | 8908        | 100989384    |
 
 */
SELECT 
	seller_id,
	COUNT(1)	AS no_of_items,
	SUM(price)	AS total_revenue
FROM olist.order_items
GROUP BY seller_id
ORDER BY total_revenue DESC
LIMIT 10; 

-- how to order by revenue without selecting it
SELECT 
	seller_id
FROM olist.order_items
GROUP BY seller_id
ORDER BY SUM(price) DESC
LIMIT 10;

-- top 10 products by quantity
SELECT 
	product_id, 
	COUNT(*)	AS quantity
FROM olist.order_items
GROUP BY product_id 
ORDER BY quantity DESC
LIMIT 10;
	

-- for each day, how many items did each seller sell?
/*
 | date_id   | seller_id   | no_of_items  |
 |-----------|-------------|--------------|
 | 2018-01-2 | xyth        | 1000         |
 | 2018-01-3 | xyth        | 10298        |
 
 */

SELECT 
	DATE(shipping_limit_date )	AS date_id,
	seller_id, 
	COUNT(*)					AS no_of_items
FROM olist.order_items
GROUP BY	 
	DATE(shipping_limit_date), 
	seller_id
ORDER BY 
	seller_id, 
	date_id;

-- adding sum of price
SELECT 
	DATE(shipping_limit_date )	AS date_id,
	seller_id, 
	COUNT(*)					AS no_of_items,
	SUM(price)					AS revenue
FROM olist.order_items
GROUP BY	 
	DATE(shipping_limit_date), 
	seller_id
ORDER BY 
	seller_id, 
	date_id;

-- number of items sold for each seller
SELECT
	seller_id,
	COUNT(product_id)		AS no_of_items_sold
FROM olist.order_items
GROUP BY seller_id
LIMIT 10;

SELECT
	seller_id,
	COUNT(seller_id),
	COUNT(DISTINCT seller_id)		
FROM olist.order_items
GROUP BY seller_id
LIMIT 10;

	
	
	
SELECT *
FROM olist.order_items
LIMIT 100;



