SELECT 'Hello' as Greeting, 'World' as Subject;

CREATE DATABASE contacts;
USE contacts;

CREATE TABLE IF NOT EXISTS person(
	person_id INT NOT NULL AUTO_INCREMENT,
	person_first_name VARCHAR(30) NOT NULL,
	person_last_name VARCHAR(40) NOT NULL,
    
	PRIMARY KEY (person_id)
);

INSERT INTO person 
	(person_first_name, person_last_name)
VALUES
	('Jon', 'Flanders');
    
INSERT INTO person 
	(person_first_name, person_last_name)
VALUES
	('Gustavo', 'Sampaio');
    
INSERT INTO person 
	(person_first_name, person_last_name)
VALUES
	('Jon', 'Galloway');

SELECT 
	p.person_first_name, 
	p.person_last_name
FROM person as p;

SELECT DISTINCT 
	p.person_first_name
FROM person as p;

/* DISTINCT won't work if the 
combination of columns is not unique */
SELECT DISTINCT 
	p.person_first_name,
    p.person_last_name
FROM person as p;