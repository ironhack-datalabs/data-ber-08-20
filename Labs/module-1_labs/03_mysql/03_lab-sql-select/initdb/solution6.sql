SELECT 
	account_id,
    amount
FROM bank.loan
group by account_id
order by account_id
limit 5;