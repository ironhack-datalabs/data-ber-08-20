![IronHack Logo](https://s3-eu-west-1.amazonaws.com/ih-materials/uploads/upload_d5c5793015fec3be28a63c4fa3dd4d55.png)

# Lab | SQL - Additional exercises

### 1. What's the gender split among clients?

Solution:
```sql
SELECT 
    CASE
        WHEN SUBSTRING(birth_number, 3, 2) > 12
            THEN 'F'
        ELSE 'M'
    END AS gender
    ,COUNT(1) / (SELECT COUNT(1) FROM bank.client) AS ratio
FROM bank.client
GROUP BY 1;
```

### 2. Are there any accounts that have more than 2 linked clients? If yes, how many?

Solution:
```sql
WITH multiple_clients AS (
    SELECT 
        a.account_id,
        COUNT(1) AS linked_clients
    FROM bank.account a
        LEFT JOIN bank.disp d
        ON a.account_id = d.account_id
    GROUP BY 1
    HAVING COUNT(1) > 1)

SELECT COUNT(1)
FROM multiple_clients;

```


### 3. What is the average transaction amount for each region?

Solution:
```sql
SELECT
    g.A3 AS region,
    ROUND(AVG(t.amount),2) AS avg_amount
FROM bank.trans t
    LEFT JOIN bank.account a
    ON t.account_id = a.account_id
        LEFT JOIN bank.district g
        ON a.district_id = g.A1
GROUP BY 1;
```

### 4. Based on the entire transaction volume (total amount), what's the percentage that was sent to another bank?

Solution:
```sql
WITH volume_by_bank AS (
    SELECT
        CASE
            WHEN bank = ''
                THEN 'internal'
            ELSE 'external'
        END AS recipient,
        SUM(amount) AS total_volumne
    FROM trans
    GROUP BY 1)

SELECT 
    recipient,
    total_volumne / (SELECT SUM(amount) FROM trans) AS perc_volume
FROM volume_by_bank;
```

### 5. From which region do most of the clients that are account owners come from, that either have finished loan contracts that haven't been paid, or have running contracts but are in debt? Show the top 10 regions including the number of clients that are owners.

Solution:
```sql
SELECT
    di.A3                       AS region,
    COUNT(DISTINCT d.client_id)  AS loan_owners
FROM bank.disp d
    JOIN bank.account a
    ON d.account_id = a.account_id
        JOIN bank.district di
        ON a.district_id = di.A1
        JOIN bank.loan l
        ON a.account_id = l.account_id
WHERE 
    d.type = 'OWNER'
    AND l.status IN ('B', 'D') 
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;
```