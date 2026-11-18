-- ============================================
-- VUA-SEN307 Lab 5: SELECT, Filtering and Joins
-- Name: Ekugo Chinedu Daniel   Matric: VUG/SEN/24/12276
-- ============================================

USE sen307_2412276;

-- Task 1: Students in one department, sorted A-Z
SELECT s.matric_no, s.full_name, d.dept_name
FROM Student s
JOIN Department d ON s.dept_id = d.dept_id
WHERE d.dept_name = 'Software Engineering'
ORDER BY s.full_name ASC;
-- Explanation: This query joins Student to Department on dept_id so I can
-- filter by department name. WHERE keeps only Software Engineering students,
-- and ORDER BY full_name ASC sorts them alphabetically.

-- Task 2: Courses with their lecturers (INNER JOIN)
SELECT c.course_code, c.course_title, l.full_name AS lecturer
FROM Course c
JOIN CourseAllocation ca ON c.course_id = ca.course_id
JOIN Lecturer l ON ca.lecturer_id = l.lecturer_id
ORDER BY c.course_code;
-- Explanation: Course and Lecturer are not linked directly, so I joined
-- Course to CourseAllocation and then to Lecturer. INNER JOIN returns only
-- rows that match in every table. Courses taught by two lecturers, such as
-- SEN307 and CYB301, appear twice, once per lecturer.


-- Task 3: Students and their courses (LEFT JOIN)
SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
ORDER BY s.full_name;

SELECT s.full_name, c.course_title
FROM Student s
LEFT JOIN Enrolment e ON s.student_id = e.student_id
LEFT JOIN Course c ON e.course_id = c.course_id
WHERE c.course_title IS NULL
ORDER BY s.full_name;
-- Explanation: LEFT JOIN keeps every student, even those with no enrolment.
-- Where there is no matching course, course_title is NULL. The second query
-- adds WHERE c.course_title IS NULL to show only the students with no
-- courses, which are Esther Adewale, Transfer Student and Victor Anyanwu.

-- Challenge: Task 3 rewritten with RIGHT JOIN
SELECT s.full_name, c.course_title
FROM Course c
RIGHT JOIN Enrolment e ON c.course_id = e.course_id
RIGHT JOIN Student s ON e.student_id = s.student_id
ORDER BY s.full_name;
-- Explanation: Starting from Course and using RIGHT JOIN to Enrolment and
-- then Student keeps every student, so the result is the same as Task 3.
-- The LEFT JOIN version is easier to read because it starts with Student,
-- the table I want everything from, and reads left to right.

-- Task 4: Filtering with AND / OR / IN / BETWEEN
SELECT matric_no, full_name, gender, date_of_birth, dept_id
FROM Student
WHERE gender = 'F'
  AND dept_id IN (1, 3)
  AND date_of_birth BETWEEN '2004-01-01' AND '2005-12-31';
-- Explanation: This query combines AND, IN and BETWEEN. It returns female
-- students in Software Engineering or Artificial Intelligence (dept_id IN
-- (1, 3)) who were born between 2004-01-01 and 2005-12-31. All three
-- conditions must be true, because they are joined with AND.


-- Task 5: Paginating enrolments with LIMIT and OFFSET
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 0;
SELECT * FROM Enrolment ORDER BY enrolment_id LIMIT 10 OFFSET 10;
-- Explanation: LIMIT 10 returns 10 rows at a time. OFFSET 0 gives page 1
-- (rows 1-10) and OFFSET 10 gives page 2 (rows 11-20). ORDER BY must be
-- used with LIMIT because without it MySQL does not guarantee any row order,
-- so the same page could show different rows each time, or rows could repeat
-- or be skipped between pages.