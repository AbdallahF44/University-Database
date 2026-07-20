-- =========================
-- Insert Departments
-- =========================

INSERT INTO departments (department_name)
VALUES
('Computer Science'),
('Information Technology'),
('Business Administration'),
('Engineering'),
('Mathematics'),
('Physics'),
('Chemistry'),
('Medicine'),
('Law'),
('Education');



-- =========================
-- Insert Students
-- =========================

INSERT INTO students
(name, age, email, phone, gpa, department_id)
VALUES

('Abdallah',24,'abdallah@gmail.com','0599000001',3.94,1),
('Ahmad',22,'ahmad@gmail.com','0599000002',3.50,1),
('Sara',21,'sara@gmail.com','0599000003',3.80,2),
('Omar',23,'omar@gmail.com','0599000004',3.20,3),
('Lina',20,'lina@gmail.com','0599000005',3.70,4),
('Yousef',25,'yousef@gmail.com','0599000006',3.10,5),
('Mona',22,'mona@gmail.com','0599000007',3.60,6),
('Khaled',24,'khaled@gmail.com','0599000008',3.30,7),
('Rana',21,'rana@gmail.com','0599000009',3.90,8),
('Ali',23,'ali@gmail.com','0599000010',3.40,9);



-- =========================
-- Insert Instructors
-- =========================

INSERT INTO instructors
(name,email,department_id)
VALUES

('Dr. Mohammed','mohammed@uni.com',1),
('Dr. Ahmed','ahmed@uni.com',2),
('Dr. Sara','sara@uni.com',3),
('Dr. Omar','omar@uni.com',4),
('Dr. Lina','lina@uni.com',5),
('Dr. Khaled','khaled@uni.com',6),
('Dr. Noor','noor@uni.com',7),
('Dr. Huda','huda@uni.com',8),
('Dr. Samer','samer@uni.com',9),
('Dr. Rami','rami@uni.com',10);



-- =========================
-- Insert Courses
-- =========================

INSERT INTO courses
(course_name, credits, instructor_id, department_id)
VALUES

('Database Systems',3,1,1),
('Programming 1',3,1,1),
('Web Development',3,2,2),
('Business Management',3,3,3),
('Engineering Basics',4,4,4),
('Calculus',3,5,5),
('Physics 1',3,6,6),
('Chemistry Lab',2,7,7),
('Medical Ethics',2,8,8),
('Introduction to Law',3,9,9);



-- =========================
-- Insert Enrollments
-- =========================

INSERT INTO enrollments
(student_id, course_id, enrollment_date, grade)
VALUES

(1,1,'2026-01-10','A'),
(1,2,'2026-01-10','A-'),
(2,1,'2026-01-11','B+'),
(3,3,'2026-01-12','A'),
(4,4,'2026-01-13','B'),
(5,5,'2026-01-14','A-'),
(6,6,'2026-01-15','C+'),
(7,7,'2026-01-16','B+'),
(8,8,'2026-01-17','A'),
(9,9,'2026-01-18','B');



-- Check Data

SELECT * FROM departments;

SELECT * FROM students;

SELECT * FROM instructors;

SELECT * FROM courses;

SELECT * FROM enrollments;
