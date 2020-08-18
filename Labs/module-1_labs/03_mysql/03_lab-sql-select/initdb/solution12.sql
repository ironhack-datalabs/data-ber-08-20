SELECT 
	trans_id,
    date,
    type,
    amount
from bank.trans
where account_id = 793
order by date DESC
limit 10;