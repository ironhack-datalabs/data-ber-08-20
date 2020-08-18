SELECT 
	loan_id
from bank.loan
group by loan_id
order by payments DESC
limit 1;
