-- 1 
select * from students;
-- 2
select name, email, gpa from students;
-- 3
select department_name from departments;
-- 4
select course_name from courses;
-- 5
select name, email, gpa from students where age>22;
-- 6
select name, email, gpa from students where gpa>3.5;
-- 7
select name, email, gpa from students where gpa BETWEEN 3.5 and 4;
-- 8
select s.name, d.department_name from students s 
join departments d on s.department_id = d.department_id 
where department_name in ('Information Technology','Computer Science');
-- 9
select name, email, gpa from students where name like 'A%';
-- 10
select name, email, gpa from students order by gpa desc;
-- 11
select name, email, gpa from students order by gpa desc limit 3;
-- 12
select name, email, gpa, age from students order by age asc limit 5;
-- 13
select DISTINCT department_id from students;
-- 14
select * from courses limit 5;
-- 15
select * from courses where credits = 3;
-- 16
select count(*) from students;
-- 17
select avg(gpa) from students;
-- 18
select max(gpa) from students;
-- 19
select min(gpa) from students;
-- 20
select count(*) from courses;
-- 21
select sum(credits) from courses;
-- 22
select count(s), d.department_name from students s 
join departments d on s.department_id = d.department_id 
where department_name in ('Computer Science')
group by department_name;
-- 23
select avg(s.gpa), d.department_name from students s 
join departments d on s.department_id = d.department_id 
where department_name in ('Computer Science')
group by department_name;
-- 24
select i.name, count(c.course_name) from instructors i
join courses c on i.instructor_id = c.instructor_id 
group by i.instructor_id, i.name;
-- 25
select count(e.student_id), c.course_name from enrollments e
join courses c on c.course_id = e.course_id 
group by c.course_name;
-- 26
select count(s.student_id), d.department_name from students s
join departments d on d.department_id = s.department_id 
group by d.department_name;
-- 27
select avg(s.gpa), d.department_name from students s
join departments d on d.department_id = s.department_id 
group by d.department_name;
-- 28
select count(s.student_id) as "num_of_students", d.department_name from students s
join departments d on d.department_id = s.department_id 
group by d.department_name having count(s.student_id)>1;
-- 29
select count(c.course_id) as "num_of_courses", i.name from instructors i
join courses c on i.instructor_id = c.instructor_id
group by i.name having count(c.course_id)>1;
-- 30
select count(e.student_id), c.course_name from enrollments e
join courses c on c.course_id = e.course_id 
group by c.course_name having count(e.student_id)>1;
-- 31
select * from students where 20<=age<=25 order by