select 
	date AS day,
    duration,
	COUNT(loan_id) AS count
from bank.loan
where (date <= 971225 AND date >= 971206)
group by 
	duration,
    day
order by
	date,
    duration;
    

