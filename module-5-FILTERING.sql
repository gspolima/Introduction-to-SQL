SELECT
	p.person_first_name,
	p.person_last_name
FROM 
	person AS p
WHERE 
	p.person_first_name = 'Jon'
	AND p.person_contacted_number > 1;

SELECT 
	p.person_first_name,
	p.person_last_name 
FROM 
	person AS p
WHERE
	p.person_first_name = 'Jon'
	OR p.person_last_name = 'Flanders';
    
SELECT 
	p.person_first_name,
    p.person_last_name
FROM 
	person AS p
WHERE 
	p.person_contacted_number BETWEEN 1 AND 20;
    
SELECT 
	p.person_first_name,
    p.person_last_name
FROM 
	person AS p
WHERE 
	p.person_first_name LIKE '%n%';

SELECT 
	p.person_first_name,
    p.person_last_name
FROM 
	person AS p
WHERE 
	LENGTH(p.person_last_name) > 5
	AND p.person_last_name LIKE '%a%';

SELECT 
	CONCAT(p.person_first_name, ' ', p.person_last_name) AS Customer
FROM 
	person AS p
WHERE 
	p.person_first_name LIKE 'F____';
    
SELECT
	p.person_first_name, 
    p.person_last_name
FROM
	person AS p
WHERE
	p.person_first_name IN ('Jon', 'Fritz');

SELECT 
	p.person_id,
    p.person_first_name
FROM 
	person AS p
WHERE
	p.person_last_name IS NULL;
    
SELECT 
	p.person_id,
    p.person_first_name,
    p.person_last_name
FROM 
	person AS p
WHERE
	p.person_last_name IS NOT NULL;