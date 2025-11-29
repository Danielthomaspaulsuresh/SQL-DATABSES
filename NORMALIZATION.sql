use normalization;
CREATE TABLE student_marks_unf (
    Student_ID VARCHAR(10),
    Student_Name VARCHAR(100),
    Subjects VARCHAR(255),   -- repeating group
    Marks VARCHAR(255)       -- repeating group
);

INSERT INTO student_marks_unf VALUES
('S001', 'Daniel Thomas', 'Maths,Science,English', '85,90,88'),
('S002', 'Ragul Kumar', 'Maths,Science', '78,82'),
('S003', 'Saran Kumar', 'English,Computer', '88,91');

-- 1nf

CREATE TABLE student_seprate (
student_id INT ,
student_name varchar(50),
subjects varchar(50),
marks varchar(50)

);

INSERT INTO student_seprate values(5001,'Daniel Thomas','Maths','85'),
(5001,'Daniel Thomas','Science','90'),
(5001,'Daniel Thomas','English','88'),
(5002,'Ragul Kumar','Maths','78'),
(5002,'Ragul Kumar','Science','82'),
(5003,'Saran Kumar','English','88'),
(5003,'Saran Kumar','Computer','91')

SELECT * FROM student_seprate;

-- 2NF

CREATE TABLE student_seprate_1 (
student_id INT ,
student_name VARCHAR(50)
);

INSERT INTO student_seprate_1(student_id,student_name)
 VALUES(5001,'Daniel Thomas'),
 (5002,'Ragul Kumar'),
 (5003,'Saran Kumar')
 
select * from student_seprate_1;

CREATE TABLE student_seprate_2 (
student_id int,
subjects VARCHAR(50),
marks VARCHAR(50)
);


INSERT INTO student_seprate_2 (student_id,subjects,marks)
values (5001,'Maths','85'),
(5001,'Science','90'),
(5001,'English','88'),
(5002,'Maths','78'),
(5002,'Science','82'),
(5003,'English','88'),
(5003,'Computer','91')

-- 3nf

CREATE TABLE student_seprate_3 (
student_id varchar(50) PRIMARY KEY,
student_name varchar(50)
);

INSERT INTO student_seprate_3 (student_id,student_name)
VALUES('5001','Daniel Thomas'),
('5002','Ragul Kumar'),
('5003','Saran Kumar')

CREATE TABLE student_seprate_4 (
student_id varchar(50),
subjects varchar(50),
marks varchar(50),
-- PRIMARY KEY (student_id,subjects),
FOREIGN KEY (student_id) REFERENCES student_seprate_3(student_id)

);

INSERT INTO student_seprate_4 (student_id,subjects,marks) VALUES
('S001', 'Maths', 85),
('S001', 'Science', 90),
('S001', 'English', 88),
('S002', 'Maths', 78),
('S002', 'Science', 82),
('S003', 'English', 88),
('S003', 'Computer', 91);

-- JOINS --

CREATE TABLE branch (
branch_id INT PRIMARY KEY auto_increment,
br_name VARCHAR(50) NOT null,
addr VARCHAR(300) 
);

INSERT INTO branch VALUES(1,"Chennai","16 ABC Road"),
(2,"Coimbatore","120 15th Block"),
(3,"Mumbai","25 XYZ Road"),
(4,"Hydrabad","32 10th Street");

CREATE TABLE employee (
emp_id INT PRIMARY KEY AUTO_increment,
enmae varchar(30) NOT NULL,
job_desc VARCHAR(30),
salary INT,
branch_id INT,
FOREIGN KEY (branch_id) REFERENCES branch(branch_id)


);

INSERT INTO employee VALUES(1,'Ram','ADMIN',1000000,2);
INSERT INTO employee VALUES(2,'Harini','MANAGER',2500000,2);
INSERT INTO employee VALUES(3,'George','SALES',2000000,1);
INSERT INTO employee VALUES(4,'Ramya','SALES',1300000,2);
INSERT INTO employee VALUES(5,'Meena','HR',2000000,3);
INSERT INTO employee VALUES(6,'Ashok','MANAGER',3000000,1);
INSERT INTO employee VALUES(7,'Abdul','HR',2000000,1);
INSERT INTO employee VALUES(8,'Ramya','ENGINEER',1000000,2);
INSERT INTO employee VALUES(9,'Raghu','CEO',8000000,3);
INSERT INTO employee VALUES(10,'Arvind','MANAGER',2800000,3);
INSERT INTO employee VALUES(11,'Akshay','ENGINEER',1000000,1);
INSERT INTO employee VALUES(12,'John','ADMIN',2200000,1);
INSERT INTO employee VALUES(13,'Abinaya','ENGINEER',2100000,2);
INSERT INTO employee VALUES(14,'Vidya','ADMIN',2200000,NULL);
INSERT INTO employee VALUES(15,'Ranjani','ENGINEER',2100000,NULL);

SELECT * FROM employee;
SELECT * FROM branch;

-- INNER JOIN

select  e.emp_id,e.enmae,e.job_desc,b.br_name
from employee as e
inner join branch as b
on e.branch_id = b.branch_id
order by e.emp_id;

-- LEFT JOIN

SELECT e.emp_id,e.enmae,e.job_desc,b.br_name
from employee as e
left join branch as b
on e.branch_id = b.branch_id
order by e.emp_id;

SELECT * FROM employee;
SELECT * FROM branch;

SELECT e.emp_id,e.enmae,e.job_desc,b.br_name
from employee as e
RIGHT join branch as b
on e.branch_id = b.branch_id
order by e.emp_id;

-- br_name emp_count
-- br_name emp_count

SELECT b.br_name, count(e.emp_id)
from branch as b
join employee as e
on b.branch_id = e.branch_id
group by e.branch_id;

-- UNION 

CREATE TABLE clients (
client_id INT PRIMARY KEY AUTO_INCREMENT,
location VARCHAR(30) NOT NULL,
addr VARCHAR(200) );

INSERT INTO clients VALUES(1,"NewYork","25 10th Block");
INSERT INTO clients VALUES(2,"Coimbatore","120 15th Block");
INSERT INTO clients VALUES(3,"London","21 ABC Road");

-- combines the two tables removing duplicates

SELECT * FROM branch
UNION 
SELECT * FROM clients;

 