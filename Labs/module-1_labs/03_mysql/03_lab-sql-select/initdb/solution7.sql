SELECT 
	account_id
from bank.loan
where duration = 60
group by account_id
order by amount
limit 5;