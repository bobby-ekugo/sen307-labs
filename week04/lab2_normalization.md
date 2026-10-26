# Lab 2: Database Design and Normalization (VUA-SEN307, Week 4)

Name: Ekugo Chinedu Daniel Matric number: VUG/SEN/24/12276

## 1. Unnormalized table

| matric_no | student_name | student_dept | course_codes | course_titles | lecturers | lecturer_depts | session |
|---|---|---|---|---|---|---|---|
| 20231234 | Ada Obi | Software Engineering | SEN307, SEN301 | Database Systems, Software Architecture | Dr A. Okafor, Dr M. Bello | Software Eng., Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307, COS301 | Database Systems, Operating Systems | Dr A. Okafor, Mrs F. Eze | Software Eng., Computer Sci. | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

## 2. First Normal Form (1NF)

Primary key: **(matric_no, course_code)**

| matric_no | student_name | student_dept | course_code | course_title | lecturer | lecturer_dept | session |
|---|---|---|---|---|---|---|---|
| 20231234 | Ada Obi | Software Engineering | SEN307 | Database Systems | Dr A. Okafor | Software Eng. | 2026/2027 |
| 20231234 | Ada Obi | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | SEN307 | Database Systems | Dr A. Okafor | Software Eng. | 2026/2027 |
| 20231235 | John Musa | Computer Science | COS301 | Operating Systems | Mrs F. Eze | Computer Sci. | 2026/2027 |
| 20231236 | Grace Okon | Software Engineering | SEN301 | Software Architecture | Dr M. Bello | Software Eng. | 2026/2027 |

**Explanation:** I split the multi-valued cells into separate rows so each cell holds one value, and used (matric_no, course_code) as the primary key.

## 3. Second Normal Form (2NF)

**Student** (PK: matric_no)

| matric_no | student_name | student_dept |
|---|---|---|
| 20231234 | Ada Obi | Software Engineering |
| 20231235 | John Musa | Computer Science |
| 20231236 | Grace Okon | Software Engineering |

**Course** (PK: course_code)

| course_code | course_title |
|---|---|
| SEN307 | Database Systems |
| SEN301 | Software Architecture |
| COS301 | Operating Systems |

**Enrolment** (PK: matric_no, course_code, session)

| matric_no | course_code | session |
|---|---|---|
| 20231234 | SEN307 | 2026/2027 |
| 20231234 | SEN301 | 2026/2027 |
| 20231235 | SEN307 | 2026/2027 |
| 20231235 | COS301 | 2026/2027 |
| 20231236 | SEN301 | 2026/2027 |

**Teaching** (PK: course_code, session, lecturer)

| course_code | session | lecturer | lecturer_dept |
|---|---|---|---|
| SEN307 | 2026/2027 | Dr A. Okafor | Software Eng. |
| SEN301 | 2026/2027 | Dr M. Bello | Software Eng. |
| COS301 | 2026/2027 | Mrs F. Eze | Computer Sci. |

**Explanation:** I moved columns that depended on only part of the composite key (student, course and lecturer details) into their own tables.

## 4. Third Normal Form (3NF)

**Department**

| dept_id (PK) | dept_name |
|---|---|
| 1 | Software Engineering |
| 2 | Computer Science |

**Student**

| student_id (PK) | matric_no | full_name | dept_id (FK) |
|---|---|---|---|
| 1 | 20231234 | Ada Obi | 1 |
| 2 | 20231235 | John Musa | 2 |
| 3 | 20231236 | Grace Okon | 1 |

**Lecturer**

| lecturer_id (PK) | full_name | dept_id (FK) |
|---|---|---|
| 1 | Dr A. Okafor | 1 |
| 2 | Dr M. Bello | 1 |
| 3 | Mrs F. Eze | 2 |

**Course**

| course_id (PK) | course_code | course_title |
|---|---|---|
| 1 | SEN307 | Database Systems |
| 2 | SEN301 | Software Architecture |
| 3 | COS301 | Operating Systems |

**Enrolment**

| enrolment_id (PK) | student_id (FK) | course_id (FK) | session |
|---|---|---|---|
| 1 | 1 | 1 | 2026/2027 |
| 2 | 1 | 2 | 2026/2027 |
| 3 | 2 | 1 | 2026/2027 |
| 4 | 2 | 3 | 2026/2027 |
| 5 | 3 | 2 | 2026/2027 |

**Teaching**

| teaching_id (PK) | course_id (FK) | lecturer_id (FK) | session |
|---|---|---|---|
| 1 | 1 | 1 | 2026/2027 |
| 2 | 2 | 2 | 2026/2027 |
| 3 | 3 | 3 | 2026/2027 |

**Explanation:** I moved department details into their own Department table and linked Student and Lecturer to it with foreign keys, so renaming a department only means changing one row.

## 5. Final schema

```
Department (dept_id PK, dept_name)
Student    (student_id PK, matric_no UNIQUE, full_name, dept_id FK → Department)
Lecturer   (lecturer_id PK, full_name, dept_id FK → Department)
Course     (course_id PK, course_code UNIQUE, course_title)
Enrolment  (enrolment_id PK, student_id FK → Student, course_id FK → Course, session)
Teaching   (teaching_id PK, course_id FK → Course, lecturer_id FK → Lecturer, session)
```