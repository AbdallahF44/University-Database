SELECT
    *
FROM
    students
WHERE
    gpa > (
        SELECT
            AVG (gpa)
        FROM
            students
    );
--  **************
select s.name from students s
where s.student_id in
(select e.student_id from enrollments e 
join courses c on c.course_id=e.course_id
where e.enrollment_date BETWEEN '2000-1-1' and '2020-1-1');

select s.name, c.course_name from students s
join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id
where e.enrollment_date BETWEEN '2000-1-1' and '2020-1-1';
--  **************
WITH excellent_students AS
(
    SELECT *
    FROM students
    WHERE gpa>3
)
SELECT *
FROM excellent_students
WHERE age>20;

select * from students
where age>20 and gpa>3;

-- ****************
create view students_in_cources as
select s.name, c.course_name from students s
join enrollments e on s.student_id=e.student_id
join courses c on c.course_id=e.course_id;

select * from students_in_cources;

drop view students_in_cources;
-- ****************************
-- supquery training
select s.name from students s
where gpa > (select avg(gpa) from students );
--
select department_name from departments
where department_id = (select department_id 
from students group by department_id 
order by count(department_id) desc limit 1
);
--
select c.course_name, c.credits from courses c
where c.credits > (select avg(credits) from courses );
--
select name from instructors 
where instructor_id in (select i.instructor_id from
instructors i join courses c on i.instructor_id = c.instructor_id
group by i.instructor_id having count(i.instructor_id) >1
);
--
select name from students where student_id not in
(select e.student_id from enrollments e);
-- CTE training
with high_gpa_students as (
	select * 
	from students
	where gpa >3.5
)
select name, gpa, age from high_gpa_students;
--
with number_of_students as (
	select d.department_name as "DEPTName",
	count(s.student_id) as "NumberOFStudents"
	from students s join departments d
	on s.department_id = d.department_id
	group by "DEPTName"
)
select * from number_of_students
where "NumberOFStudents" >=2;
--
with avg_gpa_for_departments as(
	select d.department_name as "DEPTName",
	avg(s.gpa) as "AvgGPA"
	from students s join departments d
	on s.department_id = d.department_id
	group by "DEPTName"
)
select "DEPTName", "AvgGPA"
from avg_gpa_for_departments;
--
with courses_credits as(
	select * from courses
	where credits >=3
)
select course_name
from courses_credits
order by course_name;
--
with number_of_students_in_course as (
	select c.course_name as "course_name",
	count(s.student_id) as "number_of_students"
	from students s 
	join enrollments e on e.student_id = s.student_id 
	join courses c on c.course_id = e.course_id
	group by "course_name"
)
select "course_name" from number_of_students_in_course
order by "number_of_students" desc limit 1;
-- Views training
create view excellent_students as 
select name, email, gpa from students
where gpa > 3.5;
select * from excellent_students;
--
create view course_details as 
select c.course_name, i.name, d.department_name
from departments d 
join courses c on c.department_id = d.department_id
join instructors i on i.instructor_id = c.instructor_id;
select * from course_details;
-- Indexes
create UNIQUE index unique_index_email
on students(email); -- create index
--
create index course_name
on courses(course_name);
--
explain
select * from students where email = 'asds'; -- explain the time
drop index unique_index_email; -- droping the index
INSERT INTO students (name,email,department_id)
SELECT 'name','user_' || g || '@test.com',1
FROM generate_series(1, 10000) g; -- insert a lot of value, g is the number generated, || is concating
select * from students;
delete from students where gpa is null; -- delete generated data
-- Transactions
begin;
--
commit;