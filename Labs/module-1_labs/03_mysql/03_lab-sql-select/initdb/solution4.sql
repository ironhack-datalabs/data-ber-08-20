SELECT 
	status
from bank.loan
group by status
order by status 
limit 4;