![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL

## Introduction

Run your first SQL commands! In this lab, we will practice selecting and projecting data. You can finish all questions with only those clauses:
- `SELECT`
- `SELECT DISTINCT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `LIMIT`

and aggregate functions:
- `COUNT`
- `SUM`
- `MIN`
- `MAX`

Please submit your solutions in a text file `solutions.sql`.

### 1. From the `order_items` table, find the price of the highest priced order item and lowest price order item.

Result:
```
6735
0.85
```
Solution:
```sql
SELECT
    MIN(price)  AS min_price,
    MAX(price) AS max_price
FROM olist.order_items;
```

### 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?
Result:
```
2016-09-19 02:15:34 to 2020-04-10 00:35:08
```
Solution:
```sql
SELECT
    MIN(shipping_limit_date)  AS min_shipping_date,
    MAX(shipping_limit_date) AS max_shipping_date
FROM olist.order_items;
```

### 3. From the `customers` table, find the 3 states with the greatest number of customers.
Result:
```
SP, RJ, MG
```
Solution:
```sql
SELECT
    customer_state, COUNT(customer_state) as num_cust_state
FROM olist.customers
GROUP BY customer_state
ORDER BY num_cust_state DESC
LIMIT 3;
```

### 4. From the `customers` table, within the state with the greatest number of customers, find the 3 cities with the greatest number of customers.
Result:
```
sao paulo, campinas and guarulhos
```
Solution:
```sql
SELECT
    customer_state,
    customer_city, COUNT(customer_city)
FROM olist.customers
WHERE customer_state = 'SP'
GROUP BY customer_state,
         customer_city
ORDER BY COUNT(customer_city) DESC
LIMIT 3;
```

### 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?
Result:
```
33
```
Solution:
```sql
SELECT COUNT(DISTINCT business_segment) AS unique_business_segment
FROM olist.closed_deals;
```

### 6. From the `closed_deals` table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
Result:
```
construction_tools_house_garden, phone_mobile and home_decor
```
Solution:
```sql
SELECT business_segment,
   SUM(declared_monthly_revenue) AS total_declared_monthly_revenue
FROM olist.closed_deals
GROUP BY business_segment
ORDER BY total_declared_monthly_revenue DESC
LIMIT 3;
```

### 7. From the `order_reviews` table, find the total number of distinct review score values.
Result:
```
5
```
Solution:
```sql
SELECT COUNT(DISTINCT review_score) AS unique_review_score
FROM olist.order_reviews;
```

### 8. In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5.
Solution:
```sql
SELECT
       review_score,
    IF(review_score = 1, 'very dissatisfied',
    IF(review_score = 2, 'moderately dissatisfied',
    IF(review_score = 3, 'neutral',
    IF(review_score = 4, 'moderately satisfied',
    IF(review_score = 5, 'very satisfied','undefined'))))) AS review_category
FROM olist.order_reviews;

SELECT
	review_score,
	CASE
		WHEN review_score = 1 THEN 'very dissatisfied'
        WHEN review_score = 2 THEN 'moderately dissatisfied'
        WHEN review_score = 3 THEN 'neutral'
        WHEN review_score = 4 THEN 'moderately satisfied'
        WHEN review_score = 5 THEN 'very satisfied'
        ELSE 'undefined'
	END 										AS review_category
FROM olist.order_reviews;
```

### 9. From the `order_reviews` table, find the review score occurring most frequently and how many times it occurs.
Result:
```
5, 57420
```
Solution:
```sql
SELECT COUNT(review_id), review_score
FROM olist.order_reviews
GROUP BY review_score
ORDER BY COUNT(review_id) DESC
LIMIT 1;
```
