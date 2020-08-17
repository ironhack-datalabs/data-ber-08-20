![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL - Selection

## Introduction

Run your first SQL commands! In this lab, we will practice selecting and projecting data. You can finish all questions with only those clauses:
- `SELECT`
- `SELECT DISTINCT`
- `FROM`
- `WHERE`
- `ORDER BY`
- `LIMIT`

Please submit your solutions in a text file `solutions.sql`.

## Challenge:

Assume that any `_id` columns are incremental, meaning that higher ids always occured after lower ids. For example, a client with a higher `client_id` joined the bank after a client with a lower `client_id`.

### 1. From the `client` table, what are the ids of the first 5 clients from `disrict_id` 1?

Result:
```
2
3
22
23
28
```
Solution:
```sql
SELECT client_id 
FROM client 
WHERE district_id = 1 
ORDER BY client_id ASC 
LIMIT 5;
```

### 2. From the `client` table, what is the id of the last client from `district_id` 72?
Result:
```
13576
```
Solution:
```sql
SELECT client_id
FROM client 
WHERE district_id = 72 
ORDER BY client_id DESC 
LIMIT 1;
```

### 3. From the `loan` table, what are the 3 lowest amounts?
Result:
```
4980
5148
7656
```
Solution:
```sql
SELECT amount 
FROM loan 
ORDER BY amount ASC 
LIMIT 3;
```

### 4. From the `loan` table, what are the possible values for status, ordered alphabetically in ascending order?
Result:
```
A	
B	
C	
D
```
Solution:
```sql
SELECT DISTINCT status 
FROM loan 
ORDER BY status;
```

### 5. From the `loans` table, what is the `loan_id` of the highest payment received?
Result:
```
6415
```
Solution:
```sql
SELECT loan_id 
FROM loan
ORDER BY payments DESC 
LIMIT 1;
```

### 6. From the `loans` table, what is the loan `amount` of the lowest 5 `account_id`s. Show the `account_id` and the corresponding `amount`
Result:
```
2	80952	
19	30276	
25	30276	
37	318480	
38	110736
```
Solution:
```sql
SELECT 
    account_id, 
    amount 
FROM loan 
ORDER BY account_id ASC 
LIMIT 5;
```

### 7. From the `loans` table, which are the `account_id`s with the lowest loan `amount` have a loan `duration` of 60?
Result:
```
10954	
938	
10711	
1766	
10799
```
Solution:
```sql
SELECT account_id 
FROM loan 
WHERE duration = 60 
ORDER BY amount ASC 
LIMIT 5;
```

### 8. From the `order` table, what are the unique values of `k_symbol`?
Note: There shouldn't be a table name `order`, since `order` is reserved from the `ORDER BY` clause. You have to use backticks to escape the `order` table name.
Result:
```

LEASING	
POJISTNE	
SIPO	
UVER
```
Solution:
```sql
SELECT DISTINCT k_symbol
FROM `order`
ORDER BY k_symbol;
```

### 9. From the `order` table, which are the `order_id`s from the client with the `account_id` 34?
Result:
```
29445	
29446	
29447
```
Solution:
```sql
SELECT order_id 
FROM `order` 
WHERE account_id = 34;
```

### 10. From the `order` table, which `account_id`s were responsible for orders between `order_id` 29540 and `order_id` 29560 (inclusive)?
Result:
```
88	
90	
96	
97
```
Solution:
```sql
SELECT DISTINCT account_id
FROM `order`
WHERE order_id >= 29540
AND order_id <= 29560
ORDER BY account_id;

-- alternatively:
SELECT DISTINCT account_id
FROM `order`
WHERE order_id BETWEEN 29540 AND 29560
ORDER BY account_id;
```

### 11. From the `order` table, what are the individual amounts that were sent to (`account_to`) id 30067122?
Result:
```
5123
```
Solution:
```sql
SELECT amount 
FROM `order` 
WHERE account_to = 30067122;
```

### 12. From the `trans` table, show the `trans_id`, `date`, `type` and `amount` of the 10 first transactions from `account_id` = 793 in chronological order, from newest to oldest.
Result:
```
3556468	981231	PRIJEM	78.6	
233254	981216	VYDAJ	600	
233104	981212	VYDAJ	1212	
233248	981211	VYDAJ	851	
233176	981207	VYDAJ	204	
3556467	981130	PRIJEM	75.1	
233395	981130	VYDAJ	14.6	
233103	981112	VYDAJ	1212	
233247	981111	VYDAJ	851	
233175	981107	VYDAJ	204
```
Solution:
```sql
SELECT 
    trans_id,
    date,
    type,
    amount
FROM trans 
WHERE account_id = 	793
ORDER BY date DESC
LIMIT 10;
```
