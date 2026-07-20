-- Delete old tables
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS instructors;
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS departments;


-- =========================
-- Departments Table
-- =========================

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);



-- =========================
-- Students Table
-- =========================

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    
    gpa DECIMAL(3,2)
    CHECK (gpa >= 0 AND gpa <= 4),

    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
);



-- =========================
-- Instructors Table
-- =========================

CREATE TABLE instructors (
    instructor_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,

    department_id INT NOT NULL,

    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
);



-- =========================
-- Courses Table
-- =========================

CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,

    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,

    instructor_id INT,
    department_id INT NOT NULL,


    FOREIGN KEY (instructor_id)
    REFERENCES instructors(instructor_id)
    ON DELETE SET NULL,


    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
    ON DELETE CASCADE
);



-- =========================
-- Enrollments Table
-- =========================

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,

    student_id INT NOT NULL,
    course_id INT NOT NULL,

    enrollment_date DATE NOT NULL,
    grade VARCHAR(10),


    FOREIGN KEY (student_id)
    REFERENCES students(student_id)
    ON DELETE CASCADE,


    FOREIGN KEY (course_id)
    REFERENCES courses(course_id)
    ON DELETE CASCADE,


    -- Prevent duplicate registration
    UNIQUE(student_id, course_id)
);


