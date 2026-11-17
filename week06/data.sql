USE sen307_2412276;

INSERT INTO Department (dept_name) VALUES
('Software Engineering'),
('Computer Science'),
('Artificial Intelligence'),
('Data Science'),
('Cybersecurity');

INSERT INTO Course (course_code, course_title, credit_units, description, dept_id) VALUES
('SEN307', 'Database Systems', 3,
 'Relational database design, SQL queries, normalization, transactions and indexing using MySQL.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('SEN301', 'Software Architecture', 3,
 'Architectural styles, design patterns, microservices and how to structure large software systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')),
('COS301', 'Operating Systems', 3,
 'Processes, threads, CPU scheduling, memory management and file systems.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('COS305', 'Computer Networks', 3,
 'TCP/IP, routing, switching, LAN and WAN design and network protocols.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Computer Science')),
('AIN301', 'Introduction to Artificial Intelligence', 3,
 'Intelligent agents, search algorithms, knowledge representation and reasoning.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN305', 'Machine Learning', 3,
 'Supervised and unsupervised learning, neural networks, deep learning and model evaluation.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('AIN307', 'Natural Language Processing', 3,
 'Text processing, word embeddings, language models, sentiment analysis and chatbots.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Artificial Intelligence')),
('DTS301', 'Data Visualization and Analytics', 2,
 'Exploratory data analysis, charts, dashboards and telling stories with data.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('DTS305', 'Big Data Technologies', 3,
 'Distributed storage and processing of very large datasets with Hadoop and Spark.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Data Science')),
('CYB301', 'Network Security', 3,
 'Firewalls, cryptography, intrusion detection and protecting networks from attacks.',
 (SELECT dept_id FROM Department WHERE dept_name = 'Cybersecurity'));

SELECT d.dept_name, COUNT(c.course_id) AS courses
FROM Department d LEFT JOIN Course c ON d.dept_id = c.dept_id
GROUP BY d.dept_name;

INSERT INTO Lecturer (staff_no, full_name, email, dept_id) VALUES
('VUA/ST/101', 'Dr Amaka Okafor',     'a.okafor@vua.edu.ng',     1),
('VUA/ST/102', 'Dr Musa Bello',       'm.bello@vua.edu.ng',      1),
('VUA/ST/103', 'Dr Ngozi Eze',        'n.eze@vua.edu.ng',        2),
('VUA/ST/104', 'Mr Ibrahim Danjuma',  'i.danjuma@vua.edu.ng',    2),
('VUA/ST/105', 'Dr Chinwe Nwosu',     'c.nwosu@vua.edu.ng',      3),
('VUA/ST/106', 'Dr Yusuf Abdullahi',  'y.abdullahi@vua.edu.ng',  3),
('VUA/ST/107', 'Mrs Folake Adeyemi',  'f.adeyemi@vua.edu.ng',    4),
('VUA/ST/108', 'Dr Emeka Obiora',     'e.obiora@vua.edu.ng',     4),
('VUA/ST/109', 'Dr Hauwa Suleiman',   'h.suleiman@vua.edu.ng',   5),
('VUA/ST/110', 'Mr Tunde Balogun',    't.balogun@vua.edu.ng',    5);

INSERT INTO Student (matric_no, full_name, gender, date_of_birth, dept_id) VALUES
('20231234', 'Ada Obi',            'F', '2005-03-14', 1),
('20231235', 'John Musa',          'M', '2004-11-02', 2),
('20231236', 'Grace Okon',         'F', '2004-06-21', 1),
('20231237', 'Emeka Nwankwo',      'M', '2003-09-09', 3),
('20231238', 'Fatima Yusuf',       'F', '2005-01-30', 4),
('20231239', 'Tunde Adebayo',      'M', '2006-07-18', 5),
('20231240', 'Blessing Eze',       'F', '2004-12-05', 3),
('20231241', 'Ibrahim Lawal',      'M', '2003-04-25', 2),
('20231242', 'Chiamaka Okeke',     'F', '2006-02-11', 1),
('20231243', 'Samuel Ogunleye',    'M', '2005-08-27', 4),
('20231244', 'Zainab Bello',       'F', '2007-05-03', 5),
('20231245', 'Daniel Okoro',       'M', '2004-03-16', 3),
('20231246', 'Aisha Mohammed',     'F', '2005-10-12', 2),
('20231247', 'Peter Eke',          'M', '2006-11-29', 1),
('20231248', 'Ngozi Ibe',          'F', '2003-12-19', 4),
('20231249', 'Chinedu Okafor',     'M', '2004-08-08', 5),
('20231250', 'Hadiza Garba',       'F', '2007-01-22', 2),
('20231251', 'Victor Anyanwu',     'M', '2005-06-06', 3),
('20231252', 'Esther Adewale',     'F', '2006-09-14', 4),
('202412276', 'Ekugo Chinedu Daniel', 'M', '2002-04-07', 1);

INSERT INTO Enrolment (student_id, course_id) VALUES
(1, 1), (1, 2), (1, 5),
(2, 1), (2, 3), (2, 4),
(3, 1), (3, 2), (3, 6),
(4, 5), (4, 6), (4, 7),
(5, 8), (5, 9),
(6, 10), (6, 4),
(7, 5), (7, 6), (7, 7),
(8, 3), (8, 4), (8, 1),
(9, 1), (9, 2),
(10, 8), (10, 9), (10, 6),
(11, 10), (11, 4),
(12, 5), (12, 7), (12, 6),
(13, 1),
(14, 1),
(15, 8), (15, 9),
(16, 10),
(17, 4),
(20, 1), (20, 3);

INSERT INTO CourseAllocation (course_id, lecturer_id) VALUES
(1, 1), (1, 2),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 5),
(8, 7),
(9, 8),
(10, 9), (10, 10);

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

SET SQL_SAFE_UPDATES = 0;
UPDATE Student SET dept_id = 2 WHERE matric_no = '20231234';
SET SQL_SAFE_UPDATES = 1;

SELECT matric_no, full_name, dept_id FROM Student WHERE matric_no = '20231234';

INSERT INTO Department (dept_name) VALUES ('Library and Information Science');

INSERT INTO Student (matric_no, full_name, dept_id)
VALUES ('20239999', 'Transfer Student',
  (SELECT dept_id FROM Department WHERE dept_name = 'Library and Information Science'));
  
-- Fails with Error 1451: a student still references this department
-- DELETE FROM Department WHERE dept_name = 'Library and Information Science';

SET SQL_SAFE_UPDATES = 0;
UPDATE Student
SET dept_id = (SELECT dept_id FROM Department WHERE dept_name = 'Software Engineering')
WHERE matric_no = '20239999';
DELETE FROM Department WHERE dept_name = 'Library and Information Science';
SET SQL_SAFE_UPDATES = 1;