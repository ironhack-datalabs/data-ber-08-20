SELECT
	account_id AS id,
    SUM(amount) as total
from bank.loan l 
group by account_id
order by total DESC
limit 10;
