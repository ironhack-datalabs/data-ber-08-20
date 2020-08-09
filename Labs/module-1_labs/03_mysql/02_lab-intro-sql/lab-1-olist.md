![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL

## Introduction

Run your first SQL commands! In this lab, we will practice selecting and projecting data using the olist database (details on initiating the database found in the "initdb" folder). You can finish all questions with only those clauses:
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

### 2. From the `order_items` table, what is range of the shipping_limit_date of the orders?
Result:
```
2016-09-19 02:15:34 to 2020-04-10 00:35:08
```

### 3. From the `customers` table, find the 3 states with the greatest number of customers.
Result:
```
SP, RJ, MG
```

### 4. From the `customers` table, within the state with the greatest number of customers, find the 3 cities with the greatest number of customers.
Result:
```
sao paulo, campinas and guarulhos
```

### 5. From the `closed_deals` table, how many distinct business segments are there (not including null)?
Result:
```
33
```

### 6. From the `closed_deals` table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
Result:
```
construction_tools_house_garden, phone_mobile and home_decor
```

### 7. From the `order_reviews` table, find the total number of distinct review score values.
Result:
```
5
```

### 8. In the `order_reviews` table, create a new column with a description that corresponds to each number category for each review score from 1 - 5.


### 9. From the `order_reviews` table, find the review score occurring most frequently and how many times it occurs.
Result:
```
5, 57420
```
