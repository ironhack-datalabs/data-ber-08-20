USE olist;
/*
SQL Day 1
overview
<- SQL Basics
<- Database Structure
<- ER Diagrams and Schemas
<- Syntax
<- My First Queries 
---------------------- BREAK
<- Aggregate Functions 
<- Group Bys
*/

/* 
Notes

SQL
<- only supports tables
< - no 'list-like' or 'dict-like' objects
<- very restrictive 

Structured Query Language 
<- a language to access and manipulate data in relational database management systems (RDBMS)

SQL comes in many different flavors:
- Postgres
- MS SQL
- MySQL

SQL - 1986
- no style guide! 
- hasn't changed much - will probably be around for a long time
- underlying tech has changed, but SQL remains the interface

MySQL (1995) - open source
- 80% of flavors are similar, just need to figure out the 20% that is different

Every table has schema
- schema something that describes the tables
- where you can see the column type
	 - column_1    INT,
	 - column_2    text (VARCHAR) 
Syntax
SELECT - projection (display) Python<- return
FROM - where is the data coming from (table, database)
JOIN ON
WHERE - filter 
ORDER BY - sort 
GROUP BY
HAVING 
LIMIT 
*/ 

SELECT 1; -- smallest query possible

-- I am a comment
/*
 I am a comment block
*/

/*
--------
-- Selecting a sample
--
-- Clauses:
-- SELECT
-- FROM
-- LIMIT
----------
*/

SELECT *
FROM olist.customers;

/*
SELECT * FROM olist.customers;
select * from olist.customers;
sELect * fRoM olist.customers;
*/

-- The SELECT clause is just a projection of the table. YOU can select any columns, in any order, as many times are you want

SELECT 
	customer_state,
	customer_state,
	customer_state,
	customer_id,
	customer_unique_id
From olist.customers;

-- Selecting Columns
SELECT 
	customer_state,
	customer_city
FROM olist.customers
LIMIT 10;

-- Use the ORDER BY clause to sort output
SELECT *
FROM olist.orders 
LIMIT 1000;

SELECT *
FROM olist.orders
ORDER BY order_purchase_timestamp ASC -- ASC for ascending order, default is also ASC
LIMIT 1000; 

SELECT *
FROM olist.orders
ORDER BY order_purchase_timestamp DESC -- DESC for descending order
LIMIT 1000;

-- Retrieve the most expensive product
SELECT 
	product_id, 
	price
FROM olist.order_items
ORDER BY price DESC
LIMIT 1;
-- most expensive product
SELECT 
	product_id
FROM olist.order_items 
ORDER BY price DESC 
LIMIT 1;

-- name of most expensive product
SELECT 
	product_category_name 
FROM olist.products
WHERE product_id = '489ae2aa008f021502940f251d4cce7f';

-- translation to english 
SELECT 
	product_category_name, 
	product_category_name_english 
FROM olist.product_category_name_translation
WHERE product_category_name = 'utilidades_domesticas'
LIMIT 100;

-- Because the SELECT clause is just a projection, you don't even need to add the column you are ordering by in the SELECT
-- It will sort based on the underlying data (which is what the FROM and WHERE clause specify)
SELECT 
	order_id 			AS order_identification, -- use as to specify column aliases
	product_id 			AS product_identification, 
	seller_id 			AS seller_identification
FROM olist.order_items oi
ORDER BY price DESC
LIMIT 100;

-- as is not required but the convention is to add AS for columns, not for tables

/*
------------
-- Filtering Rows
--
-- Clauses:
-- WHERE
--
------------
 */
-- select only those orders that were placed in Feb 2018
SELECT * 
FROM olist.orders
WHERE order_purchase_timestamp >= '2018-02-01'
	AND order_purchase_timestamp < '2018-03-01'
LIMIT 1000;

-- only want customers from 'BA' - accounting for case differences
SELECT *
FROM olist.customers
WHERE customer_state = 'BA'
	AND (customer_city = 'salvador' OR customer_city = 'Salvador')
LIMIT 100;

SELECT *
FROM olist.customers
WHERE customer_state = 'BA'
	AND LOWER(customer_city) = 'salvador'
LIMIT 100;

-- only customers from 'BA' and 'salvador' that have a customer_id that starts with 'a'
SELECT *
FROM olist.customers
WHERE customer_state = 'BA'
	AND LOWER(customer_city) = 'salvador'
	AND customer_id LIKE 'a%'
LIMIT 100;

-- only customers from states 'BA' OR 'GO' that have a customer id that starts with 'a'
SELECT *
FROM olist.customers
WHERE (customer_state = 'BA'
	OR customer_state = 'GO')
	AND customer_id LIKE 'a%'
LIMIT 100;

SELECT *
FROM olist.customers
WHERE customer_state IN ('BA', 'GO')
	AND customer_id LIKE 'a%'
LIMIT 100;

/*
 ----------
 -- Column Transforamtions
 ----------
 */

SELECT *
FROM olist.order_items
LIMIT 1000;

-- Transform the price column into price catagories ('cheap', 'expensive')
SELECT 
	order_id, 
	product_id, 
	price,
	IF(price < 100, 'cheap', 'expensive') AS price_catagory
FROM olist.order_items; 

-- Transform the price column into price catagories ('cheap', 'medium', 'expensive)

SELECT 
	order_id, 
	product_id, 
	price,
	IF(price < 100, 'cheap', IF(price < 350, 'medium', 'expensive')) AS price_catagory
FROM olist.order_items; 

-- rewrite as case statement
SELECT 
	order_id, 
	product_id,
	CASE 
		WHEN price < 100 THEN 'cheap'
		WHEN price < 350 THEN 'medium'
		ELSE 'expensive'
	END 								AS price_catagory
FROM olist.order_items;

-- add values of two columns row by row
SELECT 
	order_id, 
	product_id,
	price,
	freight_value,
	price + freight_value AS total_price
FROM olist.order_items
LIMIT 100;

-- looking at SELECT DISTINCT
-- deduplication 
SELECT *
FROM olist.order_items;

SELECT DISTINCT 
	order_id
FROM olist.order_items;

SELECT 
	seller_id
FROM olist.order_items
WHERE DATE(shipping_limit_date) = DATE('2018-08-05');

SELECT DISTINCT
	seller_id
FROM olist.order_items
WHERE DATE(shipping_limit_date) = DATE('2018-08-05');

-- equivilant: You can use a GROUP BY on the only column you are select to deduplicate as well
SELECT
	seller_id
FROM olist.order_items
WHERE DATE(shipping_limit_date) = DATE('2018-08-05')
GROUP BY seller_id;

