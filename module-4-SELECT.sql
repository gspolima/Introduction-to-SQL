SELECT 'Hello' as Greeting, 'World' as Subject;

CREATE DATABASE contacts;
USE contacts;

CREATE TABLE IF NOT EXISTS person(
	person_id INT NOT NULL AUTO_INCREMENT,
	person_first_name VARCHAR(30) NOT NULL,
	person_last_name VARCHAR(40) NOT NULL,
    person_contacted_number INTEGER NOT NULL,
    person_date_last_contacted DATETIME NOT NULL,
    person_date_added DATETIME NOT NULL,
    
	PRIMARY KEY (person_id)
);

INSERT INTO person 
	(person_id, person_first_name, person_last_name, 
    person_contacted_number,person_date_last_contacted,person_date_added )
VALUES 
	(1, 'Jon', 'Flanders', 5,'2021-09-14 14:40:00','2013-01-14 11:43:31');
INSERT INTO person 
	(person_id, person_first_name, person_last_name, 
    person_contacted_number,person_date_last_contacted,person_date_added)
VALUES
	(2, 'Shannon', 'Ahern', 0,'2022-01-14 17:12:31','2017-02-25 08:19:32');
INSERT INTO person 
	(person_id, person_first_name, person_last_name, 
    person_contacted_number,person_date_last_contacted,person_date_added)
VALUES
	(3, 'Fritz', 'Onion', 1,'2021-12-23 10:53:57','2015-08-12 15:37:08');
INSERT INTO person 
	(person_id, person_first_name, person_last_name,
    person_contacted_number,person_date_last_contacted,person_date_added)
VALUES
	(4, 'Gustavo', 'Sampaio', 3,'2020-03-01 17:30:31','2019-05-29 13:27:46');
INSERT INTO person 
	(person_id, person_first_name, person_last_name, 
    person_contacted_number,person_date_last_contacted,person_date_added)
VALUES
	(5, 'Jon', 'Galloway', 1,'2021-10-15 16:20:35','2019-09-07 14:37:58');
INSERT INTO person 
	(person_id, person_first_name, person_last_name, 
    person_contacted_number,person_date_last_contacted,person_date_added)
VALUES
	(6, 'Gustavo', 'Mota', 1,'2020-07-01 08:20:05','2018-08-13 13:00:12');
    

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