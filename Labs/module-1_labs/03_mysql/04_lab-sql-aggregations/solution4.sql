SELECT
	date,
    COUNT(loan_id) AS sum
from bank.loan
where date < 930907
group by date
order by date DESC
limit 10;