SELECT
	p.person_first_name,
	p.person_last_name
FROM
	person p
WHERE
	p.person_last_name IS NOT NULL
ORDER BY
	p.person_last_name;

SELECT
	COUNT(p.person_last_name)
FROM
	person p;

SELECT
	SUM(p.person_contacted_number) AS times_contact_was_made_overall
FROM 
	person p;
    
SELECT
	MAX(p.person_date_last_contacted) AS most_recent_contact
FROM
	person p;

SELECT 
	MIN(p.person_date_added) AS oldest_customer_since
FROM
	person p
WHERE
	p.person_date_last_contacted <> '0000-00-00 00:00:00';
    
SELECT
	COUNT(p.person_id) AS customers,
	AVG(p.person_contacted_number) AS average_of_contacts_per_customer
FROM
	person p
WHERE
	p.person_date_last_contacted <> '0000-00-00 00:00:00';
    
SELECT
	(SUM(p.person_contacted_number)) / (COUNT(p.person_id)) AS average_of_contacts_without_AVG
FROM
	person p;

/* 	Will ignore the NULL values 
	regardless of what the WHERE says */
SELECT COUNT(p.person_last_name)
FROM person p
WHERE p.person_last_name IS NULL;

SELECT 
	COUNT(DISTINCT p.person_first_name) AS 'unique_first_names'
FROM
	person p;