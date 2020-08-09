![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL 2

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

Please submit your solutions in a text file `lab-2-olist-solutions.sql`.

### 1. From the `marketing_qualified_leads` table, find the earliest and latest first_contact_date.

Result:
```
2017-06-14 and 2018-05-31
```

### 2. From the `marketing_qualified_leads` table, find the top 3 most frequent origin types for all first_contact_date entries in 2018.
Result:
```
organic_search, paid_search and social
```

### 3. From the `marketing_qualified_leads` table, find the first_contact_date with the highest number of mql_id entries and state the number of entries on that date.
Result:
```
2018-05-02 02:00:00 with 93 mql_id entries
```

### 4. From the `products` table, find the name and count of the top 2 product category names.
Result:
```
cama_mesa_banho 3029 and esporte_lazer 2867
```

### 5. From the `products` table, find the product_category_name with the highest recorded product weight in grams.
Result:
```
cama_mesa_banho at 40425 grams
```

### 6. From the `products` table, find the product_category_name with the greatest sum of dimensions including length, height and width in centimeters.
Result:
```
cama_mesa_banho at 234 cm
```

### 7. From the `order_payments table`, find the payment_type with the greatest number of order_id entries and the count of that payment type.
Result:
```
credit_card was used for 76795 order_id entries
```

### 8. From the `order_payments table`, find the highest payment value for an individual order_id.
Result:
```
13664.1
```

### 9. From the `sellers` table, find the 3 seller states with the greatest number of distinct seller cities.
Result:
```
SP has 260 distinct seller cities, MG has 82 distinct seller cities and PR has 67 distinct seller cities.
```
