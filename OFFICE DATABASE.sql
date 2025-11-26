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

ALTER TABLE workers MODIFY country_id INT NULL; -- modify the data type inside the table 

 
drop table workers;

select * from workers where email = 'danny2250197@gmail.com';

INSERT INTO workers(first_name,last_name,email,gender,contact,salary,date_of_join,department_id,country_id)
VALUES ('AKIL','kumaran','akilikil@gmail.com','male','4124512415','3000','2027-12-12','4',NULL);

DELETE FROM workers where first_name ='AKIL';
SELECT * FROM workers where first_name = 'dhatchu' and last_name = 'daniel'; ---AND statement shows the first and last name
SELECT * FROM workers where first_name = 'dhatchu' or last_name = 'dani'; --- the (or) statement shows that the either this or that inside the table is correct

SELECT first_name,last_name, salary from workers;
SELECT concat(first_name,' ',last_name) as full_name, salary from workers; -- concat helps to join the colum and AS statemnentb helps to potray the name in the show table not the main one

--JOINS & TYPES -

USE office;
select * from workers;

SELECT e.id, e.first_name,e.last_name, e.salary, e.country_id from workers as e;

--INNER JOIN--

SELECT e.id, e.first_name,e.last_name, e.salary, e.country_id, c.id,c.ctry_name,c.short_name
FROM workers AS e INNER JOIN country AS c ON e.country_id = c.id;



SELECT e.country_id,c.id,c.ctry_name,c.short_name
from workers as e inner join country as c on e.country_id = c.id;
--LKEFT JOIN
SELECT e.country_id,c.id,c.ctry_name,c.short_name
from workers as e LEFT join country as c on e.country_id = c.id;

--right join
SELECT e.country_id,c.id,c.ctry_name,c.short_name
from workers as e RIGHT join country as c on e.country_id = c.id;


SELECT e.country_id,c.id,c.ctry_name,c.short_name
from workers as e CROSS join country as c;
select department as d;

select distinct (e.department_id),d.dept_name from workers as e inner join department as d on e.department_id = d.id;

use office;
select * from workers order by (salary);

select * from workers order by (salary) desc;

select concat(first_name, ' ' , last_name) as full_name, salary from workers;
select concat(first_name, ' ' , last_name) as full_name, format(salary, 0)as salary from workers;

--view

SELECT * FROM workers;

SELECT first_name, last_name,email,gender, salary from workers;

CREATE VIEW workerview as 
SELECT first_name, last_name,email,gender, salary from workers;

CREATE VIEW workerview as 
SELECT first_name, last_name,email,gender, salary from workers;

SELECT * from workerview;

--store procedure--
DELIMITER //

CREATE PROCEDURE workersid(IN w_id int)
BEGIN

SELECt * FROM workers where id = w_id;

END

DELIMITER ;

CALL workersid(3);

SELECT * from workers;

DELIMITER //

CREATE PROCEDURE genders(IN g_id varchar(50))
BEGIN 

select * from workers where gender = g_id;

END //

DELIMITER ;
DRop procedure genders;

CALL genders('male');

DELIMITER //

CREATE PROCEDURE GMAILNAME(IN G_ID varchar(50))
BEGIN 
SELECT * FROM workers where email = G_ID;

END //
DELIMITER ;
CALL GMAILNAME('danny2250197@gmail.com');

DELIMITER // 
CREATE PROCEDURE workersdetails(IN w_first_name varchar(50), IN w_last_name varchar(50))
BEGIN
INSERT INTO workers (first_name,last_name) values (w_first_name,w_last_name);
END
DELIMITER ;

DELIMITER //

CREATE PROCEDURE InsertWorkerDetails(
    IN w_first_name VARCHAR(50),
    IN w_last_name VARCHAR(50),
    IN w_email VARCHAR(50),
    IN w_gender VARCHAR(10),
    IN w_contact VARCHAR(20),
    IN w_salary DECIMAL(10,2),
    IN w_date_of_join DATE,
    IN w_department_id INT,
    IN w_country_id INT
)
BEGIN
    INSERT INTO workers(
        first_name, last_name, email, gender, contact, salary, date_of_join, department_id, country_id
    )
    VALUES(
        w_first_name, w_last_name, w_email, w_gender, w_contact, w_salary, w_date_of_join, w_department_id, w_country_id
    );
END //

DELIMITER ;
 
Call InsertWorkerDetails('john','cena','cena@gmail.com','male','null','400000','26-11-14','1','1')

SELECT*from workers
use office;
---string FUNCTION 

SELECT concat(first_name,' ',last_name,' ',salary) from workers;
select UPPER(first_name) as caps from workers;
select LOWER(first_name) as caps from workers;
select substring(first_name , 2 ) as full_name from workers;

select first_name,length(first_name) as length from workers;

SELECT concat(first_name,' ',last_name) as full_name ,length(concat(first_name,last_name))as length from workers;

CREATE TABLE orders (
ID int primary key,
customer_id int,
order_date date,
total_amount decimal(10,2)
);

INSERT INTO orders (ID,customer_id,order_date,total_amount)
values(1, 101, '2024-11-14', 200.89),
(2,102,'2024-04-12',90.23),
(3,103,'2023-12-07',555.96),
(4,102,'2022-01-23',908.45),
(5,103,'2021-01-21',9876.34);

select * from orders;

---AGGREGATE FUNCTION

SELECt count(*) as total_records from orders;

SELECT SUM(total_amount) as total_value from orders;

select max(total_amount) from orders;

select MIN(total_amount) from orders;

SELECT AVG(total_amount) from orders;

- - date function :

SELECT NOW() AS cureent_time;

select * from orders;

SELECT DATE_FORMAT(order_date,"%Y-%m-%d") as not_updated from orders;
SELECT DATE_FORMAT(order_date,"%d-%m-%Y") as FORMATED from orders;

---MATH FUNCTIOM

SELECT ID,customer_id,total_amount from orders;

SELECT ID,customer_id,round(total_amount) from orders;

SELECT ID,customer_id,ceil(total_amount) from orders;

SELECT ID,customer_id,floor(total_amount) from orders; -- decrement

--group -by

SELECT* from orders;

select customer_id, count(*) as total_orders
from orders
group by customer_id;

select customer_id, sum(total_amount) as total_spend
from orders
group by customer_id;

SELECT customer_id, count(*) as total_orders, sum(total_amount) as total_spent
from orders
group by customer_id;

use office;


CREATE TABLE Orders_Bad (
    order_id INT,
    customer_name VARCHAR(50),
    customer_phone VARCHAR(15),
    product1 VARCHAR(50),
    product2 VARCHAR(50),
    product3 VARCHAR(50),
    total_amount DECIMAL(10,2)
);
INSERT INTO Orders_Bad 
(order_id, customer_name, customer_phone, product1, product2, product3, total_amount)
VALUES
(101, 'Daniel Thomas', '0456781234', 'Shoes', 'Socks', NULL, 60.00),
(102, 'Sarah Lee', '0487623344', 'T-Shirt', 'Cap', 'Socks', 50.00),
(103, 'Michael Brown', '0471239988', 'Shoes', NULL, NULL, 50.00);


CREATE TABLE  orders_1nf

( order_id INT,
customer_name varchar(50),
customer_phone varchar(50),
product varchar(50),
price decimal(10,2)

);

INSERT INTO Orders_1NF 
(order_id, customer_name, customer_phone, product, price)
VALUES
(101, 'Daniel Thomas', '0456781234', 'Shoes', 50.00),
(101, 'Daniel Thomas', '0456781234', 'Socks', 10.00),

(102, 'Sarah Lee', '0487623344', 'T-Shirt', 25.00),
(102, 'Sarah Lee', '0487623344', 'Cap', 15.00),
(102, 'Sarah Lee', '0487623344', 'Socks', 10.00),

(103, 'Michael Brown', '0471239988', 'Shoes', 50.00);

SELECT * FROM Orders_1nf;
---2nf
CREATE TABLE Orders_2nf (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    customer_phone VARCHAR(15)
);
INSERT INTO Orders_2nf (order_id, customer_name, customer_phone) VALUES
(101, 'Daniel Thomas', '0456781234'),
(102, 'Sarah Lee', '0487623344'),
(103, 'Michael Brown', '0471239988');

SELECT*FROM Orders_2nf;

CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO Order_Items (item_id, order_id, product, price) VALUES
(1, 101, 'Shoes', 50.00),
(2, 101, 'Socks', 10.00),
(3, 102, 'T-Shirt', 25.00),
(4, 102, 'Cap', 15.00),
(5, 102, 'Socks', 10.00),
(6, 103, 'Shoes', 50.00);

SELECT * FROM Orders_2nf;
select*from Order_Items;
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO Products (product_id, product_name, price) VALUES
(1, 'Shoes', 50.00),
(2, 'Socks', 10.00),
(3, 'T-Shirt', 25.00),
(4, 'Cap', 15.00);

CREATE TABLE Order_Items_Final (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT
);

INSERT INTO Order_Items_Final (item_id, order_id, product_id) VALUES
(1, 101, 1),
(2, 101, 2),
(3, 102, 3),
(4, 102, 4),
(5, 102, 2),
(6, 103, 1);

DROP TABLE Orders_bad;
SELECT * FROM Orders_bad;
select * FROm orders_1nf;
Select* from Orders_2nf;
SELECT * FROM Order_Items;
SELECT * FROM Products;
select *from Order_Items_Final;

