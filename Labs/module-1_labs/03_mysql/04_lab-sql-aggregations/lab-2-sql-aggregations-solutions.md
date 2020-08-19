![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL - Aggregation

## Introduction

In this lab, we are adding the `GROUP BY` clause and aggregations to our SQL vocabulary.

Please submit your solutions in a text file `solutions.sql`.

## Challenge:

Assume that any `_id` columns are incremental, meaning that higher ids always occured after lower ids. For example, a client with a higher `client_id` joined the bank after a client with a lower `client_id`.

### 1. From the `client` table, of all districts with a `district_id` lower than 10, how many clients are from each `district_id`? Show the results sorted by district_id in ascending order.
Result:
```
1	663	
2	46	
3	63	
4	50	
5	71	
6	53	
7	45	
8	69	
9	60
```
Solution:
```sql
SELECT 
    district_id,
    COUNT(*) AS clients
FROM client
WHERE district_id < 10
GROUP BY district_id
ORDER BY district_id;
```

### 2. From the `card` table, how many cards exist for each `type`? Rank the result starting with the most frequent `type`.
Result:
```
classic	659	
junior	145	
gold	88
```
Solution:
```sql
SELECT
    type, 
    COUNT(1) AS cards 
FROM card 
GROUP BY type
ORDER BY cards DESC;
```

### 3. Using the `loan` table, print the top 10 `account_id`s based on the sum of all of their loan amounts.
Result:
```
7542	590820	
8926	566640	
2335	541200	
817	538500	
2936	504000	
7049	495180	
10451	482940	
6950	475680	
7966	473280	
339	468060
```
Solution:
```sql
SELECT 
    account_id,
    SUM(amount) AS total_amount
FROM bank.loan
GROUP BY account_id
ORDER BY total_amount DESC
LIMIT 10;
```

### 4. From the `loan` table, retrieve the number of loans issued for each day, before (excl) 930907, ordered by date in descending order
Result:
```
930906	1	
930803	1	
930728	1	
930711	1	
930705	1
```
Solution:
```sql
SELECT
    date,
    COUNT(*) AS loans_issued
FROM loan
WHERE date < 930907
GROUP BY date
ORDER BY date DESC;
```

### 5. From the `loan` table, for each day in December 1997, count the number of loans issued for each unique loan duration, ordered by date and duration, both in ascending order. You can ignore days without any loans in your output.
Result:
```
971206	24	1	
971206	36	1	
971208	12	3	
971209	12	1	
971209	24	1	
971210	12	1	
971211	24	1	
971211	48	1	
971213	24	1	
971220	36	1	
971221	36	1	
971224	60	1	
971225	24	1	
971225	60	1	
```
Solution:
```sql
SELECT 
    date,
    duration,
    COUNT(*) AS loans_issed
FROM loan
WHERE 
    date >= 971201
    AND date < 980101
GROUP BY 
    date,
    duration
ORDER BY 
    date,
    duration;
```

### 6. From the `trans` table, for account_id 396, sum the amount of transactions for each type (VYDAJ = Outgoing, PRIJEM = Incoming). Your output should have the account_id, the type and the sum of amount, named as `total_amount`. Sort alphabetically by type.
Result:
```
396	PRIJEM	1028138.6999740601	
396	VYDAJ	1485814.400024414
```
Solution:
```sql
SELECT
    account_id,
    type,
    SUM(amount) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY
    account_id,
    type
ORDER BY type;
```

### 7. From the previous output, translate the values for `type` to English, rename the column to `transaction_type`, round `total_amount` down to an integer
Result:
```
396	INCOMING	1028138	
396	OUTGOING	1485814
```
Solution:
```sql
SELECT
    account_id,
    IF(type = 'PRIJEM', 'INCOMING', 'OUTGOING') AS transaction_type,
    FLOOR(SUM(amount)) AS total_amount
FROM trans
WHERE account_id = 396
GROUP BY 1, 2
ORDER BY 2;
```

### 8. From the previous result, modify you query so that it returns only one row, with a column for incoming amount, outgoing amount and the difference
Result:
```
396	1028138	1485814	-457676
```
Solution:
```sql
SELECT
    account_id,
    FLOOR(SUM(IF(type = 'PRIJEM', amount, 0))) AS incoming_amount,
    FLOOR(SUM(IF(type = 'VYDAJ', amount, 0))) AS outgoing_amount,
    FLOOR(SUM(IF(type = 'PRIJEM', amount, 0))) - FLOOR(SUM(IF(type = 'VYDAJ', amount, 0))) AS difference
FROM trans
WHERE account_id = 396
GROUP BY 1;
```

### 9. Continuing with the previous example, rank the top 10 account_ids based on their difference
Result:
```
9707	869527	
3424	816372	
3260	803055	
2486	735219	
1801	725382	
4470	707243	
3674	703531	
9656	702786	
2227	696564	
6473	692580
```

Solution:
```sql
SELECT 
    account_id,
    FLOOR(SUM(IF(type = 'PRIJEM', amount, 0))) - FLOOR(SUM(IF(type = 'VYDAJ', amount, 0))) AS difference
FROM trans
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```
