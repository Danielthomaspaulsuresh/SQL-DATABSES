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
