USE bank;
SELECT 
	client_id
FROM bank.client 
ORDER BY district_id 
LIMIT 5;
