Name: Ekugo Chinedu Daniel

Matric number: VUG/SEN/24/12276


<ins>CONSTRAINT TESTS</ins>


Test 1 (NOT NULL)

INSERT INTO Department (dept_name) VALUES (NULL);

Error Code: 1048. Column 'dept_name' cannot be null


Test 2 (CHECK)

INSERT INTO Course (course_code, course_title, credit_units) VALUES ('TST101', 'Test', 9);

Error Code: 3819. Check constraint 'chk_credit_units' is violated.


Test 3 (FOREIGN KEY)

INSERT INTO Student (matric_no, full_name, dept_id) VALUES ('TEST001', 'Test', 999);

Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sen307_2412276`.`student`, CONSTRAINT `student_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`))


Test 4 (ENUM)

INSERT INTO Student (matric_no, full_name, gender) VALUES ('TEST002', 'Test', 'X');

Error Code: 1265. Data truncated for column 'gender' at row 1


<ins>MY OWN UNIQUE TEST</ins>


INSERT INTO Department (dept_name) VALUES ('Software Engineering');

1 row(s) affected


INSERT INTO Department (dept_name) VALUES ('Software Engineering');

Error Code: 1062. Duplicate entry 'Software Engineering' for key 'department.dept_name'


<ins>WEEK 4 VS REVERSE-ENGINEERED DIAGRAM</ins>


The Week 5 diagram renames Teaching to courseallocation (with primary key allocation_id) and session to academic_session. It also adds new columns: phone, gender and date_of_birth in student, staff_no and email in lecturer, credit_units, description and dept_id in course, and semester and enrolled_on in enrolment. The new dept_id in course adds a Course to Department relationship, giving 7 relationships instead of 6, and the new columns bring in the data types ENUM, TINYINT, TEXT and DATE.