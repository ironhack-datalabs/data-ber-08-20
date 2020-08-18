SELECT 
	account_id
from bank.order
where (order_id >= 29540 AND order_id <= 29560)
group by order_id;