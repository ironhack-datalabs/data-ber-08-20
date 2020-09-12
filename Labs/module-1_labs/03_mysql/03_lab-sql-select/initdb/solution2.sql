SELECT 
	client_id
FROM bank.client
where district_id = 72
order by client_id DESC
LIMIT 1;
