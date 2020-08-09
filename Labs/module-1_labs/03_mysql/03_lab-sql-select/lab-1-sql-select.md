![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL - Selection

## Introduction

Run your first SQL commands! In this lab, we will practice selecting and projecting data using the bank database (with instructions on how to access it in the "initdb" folder). You can finish all questions with only those clauses:
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

### 2. From the `client` table, what is the id of the last client from `district_id` 72?
Result:
```
13576
```

### 3. From the `loan` table, what are the 3 lowest amounts?
Result:
```
4980
5148
7656
```

### 4. From the `loan` table, what are the possible values for status, ordered alphabetically in ascending order?
Result:
```
A	
B	
C	
D
```

### 5. From the `loans` table, what is the `loan_id` of the highest payment received?
Result:
```
6415
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

### 7. From the `loans` table, which are the `account_id`s with the lowest loan `amount` have a loan `duration` of 60?
Result:
```
10954	
938	
10711	
1766	
10799
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

### 9. From the `order` table, which are the `order_id`s from the client with the `account_id` 34?
Result:
```
29445	
29446	
29447
```

### 10. From the `order` table, which `account_id`s were responsible for orders between `order_id` 29540 and `order_id` 29560 (inclusive)?
Result:
```
88	
90	
96	
97
```

### 11. From the `order` table, what are the individual amounts that were sent to (`account_to`) id 30067122?
Result:
```
5123
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
