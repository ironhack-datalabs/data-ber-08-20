SELECT
	account_id,
    type,
    SUM(amount) AS total
from bank.trans 
where account_id = '396'
group by type
order by type;
