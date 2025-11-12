CREATE DATABASE office;
USE office;
CREATE TABLE workers
( id INT,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 country VARCHAR(50),
 email VARCHAR(50),
 gender VARCHAR(50),
 contact VARCHAR(50),
 salary decimal,
 date_of_join DATE

);

SHOW DATABASES;
SELECT * FROM workers;

INSERT INTO workers(id,first_name,last_name,country,email,gender,contact,salary,date_of_join)
VALUES(1,'daniel','thomas','australia','danny2250197@gmail.com','male','7305421399','40000','2025-06-28'),
      (2,'dhatchu','daniel',NULL,'dhatchu@gmail.com','female','8072327933','5000','2002-11-14'),
      (3,'ragul',null,'ireland','ragul@gmail.com','male','9788574112','2999','2025-05-07'),
      (4,'saran','velu','india','saran@gmail.com','male','8079854123','144222','2025-04-12'),
      (5,'nikil','kumaran','india','nikil@gmail.com',NULL,'4124512415','-3000','2027-12-12');
	
      
UPDATE workers SET last_name = 'coolip' where id = 3;

DELETE FROM workers where id = 5;
DELETE from workers;
SHOW TABLES;
DROP TABLE workers;
--- NORMALIZATION ----
CREATE TABLE workers
( id INT PRIMARY KEY auto_increment,
 first_name VARCHAR(50)not null,
 last_name VARCHAR(50) not null,
 department VARCHAR(50) not null,
 country VARCHAR(50)not null,
 email VARCHAR(50)not null unique,
 gender VARCHAR(50)not null,
 contact VARCHAR(50) not null,
 salary decimal(10,2) default 0.00,
 date_of_join DATE,
 check(salary >=0)

);

INSERT INTO workers(first_name,last_name,department,country,email,gender,contact,salary,date_of_join)
VALUES('daniel','thomas','IT','aus','danny2250197@gmail.com','male','7305421399','40000','2025-06-28'),
      ('dhatchu','daniel','HR','america','dhatchu@gmail.com','female','8072327933','5000','2002-11-14'),
      ('ragul','pandey','crew','usa','ragul@gmail.com','male','9788574112','2999','2025-05-07'),
      ('saran','velu','HR','india','saran@gmail.com','male','8079854123','144222','2025-04-12'),
      ('nikil','kumaran','INFORMATION TECHNOLOGY','IND','nikil@gmail.com','male','4124512415','3000','2027-12-12');

SELECT * from workers;

DROP TABLE workers;
CREATE TABLE department 
(
 id INT PRIMARY KEY auto_increment,
 dept_name VARCHAR(100) NOT NULL
 );
 
INSERT INTO department(dept_name)
values ('INFORMATION TECHNOLOGY'),
        ('HR'),
        ('CREW MEMBER'),
        ('HIRING MANAGER'),
        ('IT');

SELECT * FROM department;

CREATE TABLE country
(id int primary key auto_increment,
  ctry_name VARCHAR(100) not null,
  short_name char(3) not null

);

INSERT INTO country (ctry_name,short_name) 
values
 ('australia','aus'),
('america','USA'),
('america','USA'),
('america','USA'),
('india','IND');

SELECT * FROM department;
SELECT * FROM country;

CREATE TABLE workers
( id INT PRIMARY KEY auto_increment,
 first_name VARCHAR(50)not null,
 last_name VARCHAR(50) not null,
 email VARCHAR(50)not null unique,
 gender VARCHAR(50)not null,
 contact VARCHAR(50) not null,
 salary decimal(10,2) default 0.00,
 date_of_join DATE,
 department VARCHAR(50) not null,
 department_id INT not null,
 foreign key(department_id) references department(id),
 country VARCHAR(50)not null,
 country_id int not null,
 foreign key(country_id) references country(id),
 check(salary >=0)

);

INSERT INTO workers(first_name,last_name,email,gender,contact,salary,date_of_join,department,country,department_id,country_id)
VALUES('daniel','thomas','danny2250197@gmail.com','male','7305421399','40000','2025-06-28','INFORMATION TECHNOLOGY','australia','1','1'),
      ('dhatchu','daniel','dhatchu@gmail.com','female','8072327933','5000','2002-11-14','HR','america','1','2'),
      ('ragul','pandey','ragul@gmail.com','male','9788574112','2999','2025-05-07','HR','america','3','1'),
      ('saran','velu','saran@gmail.com','male','8079854123','144222','2025-04-12','IT','australia','5','5'),
      ('nikil','kumaran','nikil@gmail.com','male','4124512415','3000','2027-12-12','HIRING MANAGER','america','4','4');



select * from workers;

ALTER TABLE workers DROP column department, DROP column country;
select * from workers;
desc workers;
use office;

ALTER TABLE workers MODIFY country_id INT NULL;

 
drop table workers;

select * from workers where email = 'danny2250197@gmail.com';

INSERT INTO workers(first_name,last_name,email,gender,contact,salary,date_of_join,department_id,country_id)
VALUES ('AKIL','kumaran','akilikil@gmail.com','male','4124512415','3000','2027-12-12','4',NULL);

DELETE FROM workers where first_name ='AKIL';
SELECT * FROM workers where first_name = 'dhatchu' and last_name = 'daniel';
SELECT * FROM workers where first_name = 'dhatchu' or last_name = 'dani';

SELECT first_name,last_name, salary from workers;
SELECT concat(first_name,' ',last_name) as full_name, salary from workers;

--JOINS & TYPES -