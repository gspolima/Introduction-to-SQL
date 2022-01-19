/* 	Creating the other tables and 
	seeding data for the JOIN module */
CREATE TABLE address (
	address_id INTEGER NOT NULL,
    address_building_number VARCHAR(55) NOT NULL,
    address_street VARCHAR(55) NOT NULL,
    address_locality VARCHAR(55),
    address_city VARCHAR(55) NOT NULL,
    address_zip_postal VARCHAR(55) NOT NULL,
    address_state_province_county VARCHAR(55) NOT NULL,
    address_country VARCHAR(55) NOT NULL,
    CONSTRAINT PK_Address PRIMARY KEY (address_id)
);
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (1, '7000', 'Hollywood Blvd', NULL, 'Los Angeles', '90028', 'California', 'US');
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (2, '5299', 'Los Caballeros Way', NULL, 'Los Angeles', '90027', 'California', 'US');
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (3, '5299', 'Los Caballeros Way', NULL, 'Los Angeles', '90027', 'California', 'US');
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (4, '2016', 'Canyon Dr', NULL, 'Los Angeles', '90068', 'California', 'US');
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (5, '5983', 'Franklin Ave', NULL, 'Los Angeles', '90028', 'California', 'US');
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (6, '755', 'Pine St', NULL, 'San Francisco', '94108', 'California', 'US');
INSERT INTO address (
	address_id,
    address_building_number,
    address_street, 
	address_locality,
    address_city,
    address_zip_postal,
    address_state_province_county,
    address_country)
VALUES (7, '528', 'Lombard St', NULL, 'San Francisco', '94133', 'California', 'US');

CREATE TABLE email_address (
	email_address_id INTEGER NOT NULL,
    email_address_person_id INTEGER,
    email_address VARCHAR(55) NOT NULL,
    CONSTRAINT PK_email_address PRIMARY KEY (email_address_id)
);
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (1, 1, 'jon.flanders@eyefind.info');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (2, 1, 'flandersj@gmail.com');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (3, 2, 'shannon.ahern@eyefind.info');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (4, 2, 'aherns@outlook.com');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (5, 3, 'fritz.onion@eyefind.info');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (6, 4, 'sampaioglima@gmail.com');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (7, 4, 'gustavo.sampaio@eyefind.info');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (8, 5, 'jon.galloway@eyefind.info');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (9, 6, 'motagustavo@hotmail.com');
INSERT INTO email_address (
	email_address_id,
    email_address_person_id,
    email_address)
VALUES (10, NULL, 'thomas.yorke@umg.com');

CREATE TABLE person_address (
	person_address_id INTEGER NOT NULL,
    person_address_person_id INTEGER NOT NULL,
    person_address_address_id INTEGER NOT NULL,
    CONSTRAINT PK_person_address PRIMARY KEY (person_address_id)
);
CREATE TABLE phone_number (
	phone_number_id INTEGER NOT NULL,
    phone_number_person_id INTEGER NOT NULL,
    phone_number VARCHAR(55) NOT NULL,
    CONSTRAINT PK_phone_number PRIMARY KEY (phone_number_id)
);
/* -------------------------- */
/* BAD! DON'T DO IT
SELECT
	p.person_id,
    p.person_first_name,
    ea.email_address
FROM
	person p
CROSS JOIN
    email_address ea;
*/

SELECT
	p.person_id,
    CONCAT(p.person_first_name, ' ', p.person_last_name) AS FullName,
    ea.email_address
FROM
	person p
INNER JOIN
	email_address ea
	ON ea.email_address_person_id = p.person_id
ORDER BY
	p.person_first_name;
  

SELECT
	CONCAT(p.person_first_name, ' ', p.person_last_name) AS FullName,
	COUNT(ea.email_address) AS EmailCount
FROM
	person p
INNER JOIN
	email_address ea 
    ON ea.email_address_person_id = p.person_id
GROUP BY
	p.person_id
HAVING
	EmailCount > 1
ORDER BY
	FullName;


SELECT
	p.person_id,
    p.person_first_name,
    p.person_last_name,
    ea.email_address
FROM
	person p
LEFT OUTER JOIN
	email_address ea
	ON ea.email_address_person_id = p.person_id
WHERE
	p.person_contacted_number > 2
ORDER BY
	p.person_id;
  
  
SELECT
	p.person_id,
    p.person_first_name,
    p.person_last_name,
    ea.email_address_id,
    ea.email_address
FROM
	person p
RIGHT OUTER JOIN
    email_address ea
	ON p.person_id = ea.email_address_person_id
ORDER BY
	p.person_id;
    

/* 	A workaround to MySQL's lack of 
	support for FULL OUTER JOIN's, 
	using UNION DISTINCT */
SELECT
	p.person_id,
    p.person_first_name,
    p.person_last_name,
    ea.email_address_id,
    ea.email_address
FROM
	person p
LEFT JOIN
    email_address ea
	ON p.person_id = ea.email_address_person_id
UNION DISTINCT
SELECT
	p.person_id,
    p.person_first_name,
    p.person_last_name,
    ea.email_address_id,
    ea.email_address
FROM
	person p
RIGHT JOIN
	email_address ea
	ON ea.email_address_person_id = p.person_id