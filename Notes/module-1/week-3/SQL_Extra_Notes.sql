USE olist;
/*
| seller_state | avg_review | no_of_reviews|
---------------------------------------------
|    SP		   | 3.9        | 12039809     |
|    PA		   | 3.5        | 1203         |
*/

-- seller_ids unique?
SELECT 
	COUNT(*),
 	COUNT(DISTINCT seller_id)
FROM sellers;
-- yes

SELECT *
FROM order_items oi 
LIMIT 100;

-- get a unique list of seller id <-> order_id relations, use order by to double check
SELECT DISTINCT 
	seller_id, 
	order_id
FROM order_items
ORDER BY seller_id;

-- using Common Table Expression (CTE)
WITH seller_order_links AS (
	SELECT DISTINCT 
		seller_id, 
		order_id
	FROM order_items)
SELECT 
	sol.seller_id,
	sol.order_id,
	s.seller_state
FROM sellers s
	INNER JOIN seller_order_links sol
	ON s.seller_id = sol.seller_id;
-- Will put this side of the query on pause to investigate what the 
-- order_review table looks like
SELECT *
FROM order_reviews
LIMIT 100;

-- check and see how many reviews you can have per order
SELECT 
	COUNT(*),
	COUNT(DISTINCT(order_id))
FROM order_reviews;

-- check why those numbers don't match: there have to be some order ids that have
-- more than one review
-- 1. get a list of all order_ids and the number of reviews
SELECT 
	order_id,
	COUNT(order_id)	AS no_of_reviews
FROM order_reviews 
GROUP BY order_id 
HAVING no_of_reviews > 1;

-- 2. inspect a small sample
SELECT *
FROM order_reviews 
WHERE order_id IN ('cf73e2cb1f4a9480ed70c154da3d954a', '169d7e0fd71d624d306f132acd791cbe', '1c308eca3f339414a92e518e2a2e5ee9')
ORDER BY order_id;
-- there are a few orders that have more than 1 rating, in that case use the most recent
-- assumtion: review_answer_timestamp are unique for each order_id
SELECT 
	COUNT(*),
	COUNT(DISTINCT CONCAT(order_id, review_answer_timestamp))
FROM order_reviews;

-- get max (newest) review_answer_timestamp for each order_id
SELECT 
	order_id, 
	MAX(review_answer_timestamp)	AS latest_review_timestamp
FROM order_reviews
GROUP BY order_id;

-- want to use a join filter

WITH reviews_to_keep AS(
	SELECT 
		order_id, 
		MAX(review_answer_timestamp)	AS latest_review_timestamp
	FROM order_reviews
	GROUP BY order_id),
	
latest_review_score AS(
	SELECT 
		ore.order_id,
		ore.review_score
	FROM order_reviews ore
		INNER JOIN reviews_to_keep rtk
		ON ore.order_id = rtk.order_id
		AND ore.review_answer_timestamp = rtk.latest_review_timestamp),
		
seller_order_links AS (
	SELECT DISTINCT 
		seller_id, 
		order_id
	FROM order_items),
	
seller_order_relations AS (
SELECT 
	sol.seller_id,
	sol.order_id,
	s.seller_state
FROM sellers s
	INNER JOIN seller_order_links sol
	ON s.seller_id = sol.seller_id)	

SELECT 
	sor.seller_state,
	AVG(lrs.review_score)		AS avg_review_score,
	COUNT(*)					AS no_of_reviews
FROM seller_order_relations sor
	INNER JOIN latest_review_score lrs
	ON sor.order_id = lrs.order_id
GROUP BY sor.seller_state
ORDER BY 2 DESC;

-- Weekend Question
-- Monthly Revenue for each state in 2018


