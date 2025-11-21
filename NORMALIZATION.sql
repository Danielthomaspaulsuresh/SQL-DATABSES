CREATE DATABASE NORMALIZATION;
CREATE TABLE student_courses ( 
student_id INT,
student_name VARCHAR(50),
courses VARCHAR(50)
);

INSERT INTO student_courses (student_id,student_name,courses)
values (1,'daniel','maths,english'),
(2,'saran','science'),
(3,'ragul','maths,science');

SELECT * FROM student_courses;

 -- 1nf
 
 CREATE TABLE student_1nf (
 student_id int,
 student_name VARCHAR(50),
 course_split VARCHAR(20)
 );
 
 INSERT INTO student_1nf(student_id,student_name,course_split)
 values (1,'daniel','maths'),
 (1,'daniel','english'),
 (2,'saran','science'),
 (3,'ragul','maths'),
 (3,'ragul','science');
 
 SELECT * FROM student_1nf;
 
  -- 1nf completed all the values are atomic
  

-- 2nf --

CREATE TABLE students_2nf (
student_id int,
student_name varchar(50)
);
 
INSERT INTO students_2nf(student_id,student_name)
values (1,'daniel'),
(2,'saran'),
(3,'ragul') 
 
 select*from students_2nf;
 
 CREATE TABLE student_id_courses (
 student_id int,
 courses varchar(50)
 );
 
 INSERT INTO student_id_courses (student_id,courses)
 values (1,'maths'),
 (1,'englis'),
 (2,'science'),
 (3,'maths'),
 (3,'science')

 select*from students_2nf;
 select*from student_id_courses;
 
 -- 2nf completed
 
  -- 3nf --
  
  
 CREATE TABLE student_courses_Dept (student_id int,
 courses varchar(50),
 courses_dept varchar(50)
 );
 
 INSERT INTO student_courses_dept (student_id,courses,courses_dept)
 values (1,'math','math department'),
 (2,'english','english department'),
 (3,'science','science department')
 
 CREATE TABLE courses_dept_id (courses varchar(50),
 courses_dept varchar(50)
 );
 
 INSERT INTO courses_dept_id (courses,courses_dept)
 values ('math','math department'),
 ('english','english department'),
 ('science','science department')
 
 create table student_id_and_courses (student_id int,
 courses varchar(50));
 
 INSERT INTO student_id_and_courses(student_id, courses)
VALUES
(1,'maths'),
(1,'english'),
(2,'science'),
(3,'maths'),
(3,'science');
 

 
 
 
 
 
