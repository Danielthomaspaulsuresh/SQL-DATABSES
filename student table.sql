CREATE DATABASE students;

SHOW databases;
DROP DATABASE students;
use students;

CREATE TABLE student
(
    id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    adress VARCHAR(50),
    conatct VARCHAR(50),
    gender VARCHAR(50),
    date_of_join DATE
 );
 
 
 CREATE DATABASE employee;
 USE employee;
 
 CREATE TABLE employees
 (
  id INT,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  phone_number VARCHAR(50),
  avalaible_date DATE,
  country VARCHAR(50),
  avalablites VARCHAR(50)
  
  
  );
  use employee;
  SELECT * FROM employees;
 DESC employees;
 INSERT INTO employees(id,first_name,last_name,phone_number,avalaible_date,country,avalablites) 
    VALUES(1,'daniel','Thomas','7305421399','2025-11-14','australia','yes'),
           (2, 'Sarah', 'Johnson', '0487123456', '2025-10-05', 'Canada', 'no'),
           (3, 'Michael', 'Lee', '0423987654', '2025-12-20', 'USA', 'yes'),
           (5, 'Liam', 'Brown', '0478956210', '2026-01-10', 'New Zealand', 'no');

UPDATE employees set last_name='louie' where id= 3;

           
use employee;

update employees set first_name = 'danny' where id =1;
           
SELECT * FROM employees;

delete from employees where id = 3;