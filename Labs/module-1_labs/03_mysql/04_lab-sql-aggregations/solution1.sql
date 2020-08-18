SELECT
	district_id,
    COUNT(client_id)
from bank.client
where district_id < 10
group by district_id
order by district_id
limit 10;