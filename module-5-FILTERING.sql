SELECT
	p.person_first_name,
	p.person_last_name
FROM person as p
WHERE
	p.person_first_name = 'Jon'
	AND p.person_contacted_number > 1;

SELECT 
	p.person_first_name,
	p.person_last_name 
FROM person as p
WHERE
	p.person_first_name = 'Jon'
	OR p.person_last_name = 'Flanders';
    
SELECT 
	CONCAT(p.person_first_name, ' ', p.person_last_name) AS customer
FROM person AS p
WHERE 
	p.person_contacted_number BETWEEN 1 AND 20;
    
